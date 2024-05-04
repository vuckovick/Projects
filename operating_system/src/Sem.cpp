//
// Created by os on 7/18/23.
//

#include "../h/Sem.h"

Sem::~Sem () {
    TCB* t;
    while((t = get()) != nullptr){
        t->setState(TCB::STATE::READY);
        t->retFromClosedSem = true;
        Scheduler::put(t);
    }
}

void Sem::wait () {
    if (--val<0) {
        block();
    }
}

void Sem::signal () {
    if (val++<0)
        deblock();
}

void Sem::block () {
    put(TCB::running);
    TCB::running->setState(TCB::STATE::BLOCKED);
    TCB::dispatch();
}

void Sem::deblock () {
    TCB* t = get();
    t->setState(TCB::STATE::READY);
    Scheduler::put(t);
}

void Sem::put(TCB *data) {
    Node* cur = new Node();
    cur->data = data;
    cur->next = nullptr;

    if(!tail)
        head = tail = cur;
    else{
        tail->next = cur;
        tail = cur;
        tail->next = nullptr;
    }
}

TCB *Sem::get() {
    if(!head) return nullptr;
    TCB* data = head->data;
    Node* prev = head;

    head = head->next;
    delete prev;

    if(head == nullptr)
        tail = nullptr;
    return data;
}

void *Sem::operator new(size_t size) {
    return MemoryAllocator::mem_alloc(size);
}

void Sem::operator delete(void *ptr) {
    MemoryAllocator::mem_free(ptr);
}

void *Sem::Node::operator new(size_t size) {
    return MemoryAllocator::mem_alloc(size);
}

void Sem::Node::operator delete(void *ptr) {
    MemoryAllocator::mem_free(ptr);
}
