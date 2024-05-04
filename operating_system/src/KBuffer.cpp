//
// Created by os on 8/14/23.
//

#include "../h/KBuffer.h"

KBuffer::KBuffer(int _cap) : cap(_cap+1), head(0), tail(0) {
    buffer = (int *)MemoryAllocator::mem_alloc(sizeof(int) * cap);
    itemAvailable = new Sem(0);
    spaceAvailable = new Sem(_cap);
    mutexHead = new Sem(1);
    mutexTail = new Sem(1);
}

void KBuffer::put(int val) {
    spaceAvailable->wait();

    mutexTail->wait();
    buffer[tail] = val;
    tail = (tail + 1) % cap;
    mutexTail->signal();

    itemAvailable->signal();
}

int KBuffer::get() {
    itemAvailable->wait();

    mutexHead->wait();

    int ret = buffer[head];
    head = (head + 1) % cap;
    mutexHead->signal();

    spaceAvailable->signal();

    return ret;
}

int KBuffer::getCnt() {
    int ret;

    mutexHead->wait();
    mutexTail->wait();

    if (tail >= head) {
        ret = tail - head;
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    mutexHead->signal();

    return ret;
}

bool KBuffer::isEmpty() {
    return getCnt() == 0;
}

bool KBuffer::isFull() {
    return getCnt() == cap-1;
}

KBuffer::~KBuffer() {
    delete spaceAvailable;
    delete itemAvailable;
    delete mutexHead;
    delete mutexTail;
}

void *KBuffer::operator new(size_t size) {
    return MemoryAllocator::mem_alloc(size);
}

void KBuffer::operator delete(void *ptr) {
    MemoryAllocator::mem_free(ptr);
}
