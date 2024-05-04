//
// Created by os on 7/18/23.
//
#include "../h/Scheduler.h"

Scheduler::Node* Scheduler::head = nullptr;
Scheduler::Node* Scheduler::tail = nullptr;

void Scheduler::put(TCB *data) {
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

TCB* Scheduler::get() {
    if(!head) return nullptr;
    TCB* data = head->data;
    Node* prev = head;

    head= head->next;
    delete prev;

    if(head == nullptr)
        tail = nullptr;
    return data;
}

void *Scheduler::Node::operator new(size_t size) {
    return MemoryAllocator::mem_alloc(size);
}

void Scheduler::Node::operator delete(void *ptr) {
    MemoryAllocator::mem_free(ptr);
}
