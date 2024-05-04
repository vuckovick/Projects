//
// Created by os on 7/18/23.
//

#ifndef PROJECT_BASE_TIMERSLEEP_H
#define PROJECT_BASE_TIMERSLEEP_H

#include "TCB.h"

class TimerSleep {
private:
    TimerSleep() = delete;

    static void put(TCB* data, uint64 time);
    static void get();

    struct Node{
        TCB* data;
        Node* next;
        uint64 time;

        void *operator new(size_t size);
        void operator delete(void *ptr);
    };

    static Node* head;

    friend class Riscv;
};


#endif //PROJECT_BASE_TIMERSLEEP_H
