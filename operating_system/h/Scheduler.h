//
// Created by os on 7/4/23.
//

#ifndef PROJECT_BASE_SCHEDULER_H
#define PROJECT_BASE_SCHEDULER_H

#include "MemoryAllocator.h"

class TCB;

class Scheduler{
private:
    Scheduler() = delete;
    static void put(TCB *thread);
    static TCB* get();

    struct Node{
        TCB* data;
        Node* next;

        void *operator new(size_t size);
        void operator delete(void *ptr);
    };

    static Node* head, *tail;

    friend class TCB;
    friend class Riscv;
    friend class Sem;
    friend class TimerSleep;
};

#endif //PROJECT_BASE_SCHEDULER_H
