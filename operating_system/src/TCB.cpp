//
// Created by os on 7/17/23.
//

#include "../h/TCB.h"

TCB *TCB::running = nullptr;

TCB *TCB::createThread(Body body, uint64* stack, void* arg)
{
    if(running == nullptr){
        running = new TCB(nullptr, nullptr, nullptr, DEFAULT_TIME_SLICE);
    }

    return new TCB(body, stack, arg, DEFAULT_TIME_SLICE);
}

void TCB::dispatch()
{
    TCB *old = running;
    running->resTimeSlice();
    if (old->state == TCB::READY) { Scheduler::put(old); }
    if(running->state == TCB::IDLE) {
        /*running->stack -= (DEFAULT_STACK_SIZE - 1);
        MemoryAllocator::mem_free(running->stack);*/
        delete running;
    }
    running = Scheduler::get();
    if(running == nullptr){
        uint64* stack = (uint64*) mem_alloc(DEFAULT_STACK_SIZE);
        stack+=DEFAULT_STACK_SIZE - 1;
        running = new TCB(idleThread, stack, nullptr, DEFAULT_TIME_SLICE);
        running->setState(TCB::IDLE);
    }

    TCB::contextSwitch(&old->context, &running->context);
}

void TCB::threadWrapper()
{
    Riscv::popSppSpie();
    running->body(running->arg);
    thread_exit();
}

void TCB::contextSwitch(TCB::Context *oldContext, TCB::Context *runningContext) {
    __asm__ volatile("sd ra, 0 * 8(a0)");
    __asm__ volatile("sd sp, 1 * 8(a0)");
    __asm__ volatile("ld ra, 0 * 8(a1)");
    __asm__ volatile("ld sp, 1 * 8(a1)");
}

int TCB::exit() {
    if(running == nullptr) return -1;
    running->setState(STATE::FINISHED);
    //running->stack -= DEFAULT_STACK_SIZE + 1;
    //MemoryAllocator::mem_free(running->stack);
    //dodajj ovo
    //mozes u destruktor da stavis
    running->notifayAllJoinSem();
    dispatch();
    return 0;
}

void TCB::pushJoinSem(Sem *data) {
    Node *cur = new Node();
    cur->data = data;
    cur->next = head;

    head = cur;
}

void TCB::notifayAllJoinSem() {
    while(head != nullptr){
        Node* prev = head;
        head->data->signal();
        head = head->next;
        delete prev;
    }
}

void TCB::join(TCB *thread) {
    if(!thread->isFinished()) {
        Sem* sem = Sem::createSem(0);

        thread->pushJoinSem(sem);
        sem->wait();
        delete sem;
    }
}

void TCB::idleThread(void *) {
    while(true);
}

void TCB::operator delete(void *ptr) {
    MemoryAllocator::mem_free(ptr);
}

void *TCB::operator new(size_t size) {
    return MemoryAllocator::mem_alloc(size);
}

void *TCB::Node::operator new(size_t size) {
    return MemoryAllocator::mem_alloc(size);
}

void TCB::Node::operator delete(void *ptr) {
    MemoryAllocator::mem_free(ptr);
}


