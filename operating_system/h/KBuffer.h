//
// Created by os on 8/14/23.
//

#ifndef PROJECT_BASE_KBUFFER_H
#define PROJECT_BASE_KBUFFER_H

#include "Sem.h"

class Sem;

class KBuffer {
public:
    int cap;
    int *buffer;
    int head, tail;

    Sem* spaceAvailable;
    Sem* itemAvailable;
    Sem* mutexHead;
    Sem* mutexTail;

    KBuffer(int _cap);
    ~KBuffer();

    void put(int val);
    int get();

    int getCnt();
    bool isFull();
    bool isEmpty();

    void *operator new(size_t size);
    void operator delete(void *ptr);

    friend class KConsole;
    friend class Riscv;
};


#endif //PROJECT_BASE_KBUFFER_H
