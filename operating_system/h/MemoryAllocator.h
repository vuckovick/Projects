//
// Created by os on 6/2/23.
//

#ifndef PROJECT_BASE_MEMORYALLOCATOR_H
#define PROJECT_BASE_MEMORYALLOCATOR_H

#include "../lib/hw.h"

class MemoryAllocator {
private:
    MemoryAllocator() = delete;
    static void* mem_alloc (size_t size);
    static int mem_free (void*);

    struct FreeMem{
        FreeMem *next;
        FreeMem *prev;
        size_t size;
    };

    static void tryToJoin(FreeMem* cur);

    static FreeMem* head;
    static bool start;

    friend class Riscv;
    friend class Scheduler;
    friend class Sem;
    friend class TimerSleep;
    friend class TCB;
    friend class KBuffer;
};

#endif //PROJECT_BASE_MEMORYALLOCATOR_H
