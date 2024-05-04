//
// Created by os on 7/17/23.
//

#ifndef PROJECT_BASE_TCB_H
#define PROJECT_BASE_TCB_H

#include "Scheduler.h"
#include "Riscv.h"
#include "Sem.h"
#include "syscall_c.hpp"

class Sem;

class TCB {
public:
    using Body = void (*)(void*);
    enum STATE{FINISHED, READY, BLOCKED, SLEEPING, IDLE};

    ~TCB(){
        running->stack -= (DEFAULT_STACK_SIZE - 1);
        MemoryAllocator::mem_free(running->stack);
        //mozda bi trebao syscall
    }

    void *operator new(size_t size);
    void operator delete(void *ptr);

private:
    TCB(Body body, uint64* stack, void* arg, uint64 timeSlice) :
        body(body),
        stack(stack),
        context({(uint64) threadWrapper,
                 (uint64) stack
                }),
        arg(arg),
        timeSlice(timeSlice),
        restimeSlice(timeSlice),
        state(READY)
    {
        head = nullptr;
        retFromClosedSem = false;
    }

    struct Context
    {
        uint64 ra;
        uint64 sp;
    };

    struct Node{
        Sem* data;
        Node* next;

        void *operator new(size_t size);
        void operator delete(void *ptr);
    };

    void pushJoinSem(Sem* data);
    void notifayAllJoinSem();
    void join(TCB* thread);

    static TCB *running;

    Body body;
    uint64 *stack;
    Context context;
    void* arg;
    uint64 timeSlice;
    uint64 restimeSlice;
    STATE state;
    Node * head;
    bool retFromClosedSem;

    bool isFinished() const { return state == STATE::FINISHED; }
    void setState(STATE value) { state = value; }
    uint64 getTimeSlice() const { return timeSlice; }
    void setTimeSlice(uint64 time) { restimeSlice = time; }
    void resTimeSlice() { timeSlice = restimeSlice; }
    void decTimeSlice() { timeSlice--; }

    static TCB *createThread(Body body, uint64* stack, void* arg);
    static void dispatch();
    static void idleThread(void*);
    static int exit();
    static void threadWrapper();
    static void contextSwitch(Context *oldContext, Context *runningContext);

    friend class Riscv;
    friend class Sem;
    friend class TimerSleep;
};


#endif //PROJECT_BASE_TCB_H
