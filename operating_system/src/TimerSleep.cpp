//
// Created by os on 7/23/23.
//
#include "../h/TimerSleep.h"

TimerSleep::Node* TimerSleep::head = nullptr;

void TimerSleep::put(TCB *data, uint64 time) {
    Node *newNode = (Node*) MemoryAllocator::mem_alloc(sizeof(Node));
    newNode->data = data;
    newNode->next = nullptr;

    if(!head) {
        head = newNode;
        newNode->time = time;
    }
    else{
        Node* prev = nullptr, *cur = head;
        while(cur != nullptr){
            if(time <= cur->time){
                newNode->time = time;
                newNode->next = cur;
                cur->time -= time;
                if(!prev)
                    head = newNode;
                else
                    prev->next = newNode;
                return;
            }

            time-=cur->time;
            prev = cur;
            cur = cur->next;
        }

        newNode->time = time;
        prev->next = newNode;
    }
}

void TimerSleep::get() {
    if(!head) return;

    head->time--;
    while(head != nullptr && head->time <= 0){
        Node* prev = head;
        TCB* data = head->data;
        data->setState(TCB::READY);
        Scheduler::put(data);

        head = head->next;
        MemoryAllocator::mem_free(prev);
    }
}

void *TimerSleep::Node::operator new(size_t size) {
    return MemoryAllocator::mem_alloc(size);
}

void TimerSleep::Node::operator delete(void *ptr) {
    MemoryAllocator::mem_free(ptr);
}