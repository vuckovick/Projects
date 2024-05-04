//
// Created by os on 7/4/23.
//
#include "../h/syscall_cpp.hpp"

void *operator new(size_t size) {
    return mem_alloc(size);
}

void operator delete(void *ptr) {
    mem_free(ptr);
}

Thread::~Thread() {
    //thread_exit();
    delete myHandle;
}

int Thread::start() {
    if(body)
        return thread_create(&myHandle, body, arg);
    else
        return thread_create(&myHandle, wrapper, this);
}


void Thread::wrapper(void* par){
    Thread* t = (Thread*) par;
    t->run();
}

void Thread::join() {
    thread_join(myHandle);
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t time) {
    return time_sleep(time);
}

Thread::Thread() {
    body = nullptr;
    arg = nullptr;
}

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    sem_close(myHandle);
}

int Semaphore::wait() {
    return sem_wait(myHandle);
}

int Semaphore::signal() {
    return sem_signal(myHandle);
}

void PeriodicThread::terminate() {
    period = 0;
}

void PeriodicThread::run() {
    while(period != 0){
        periodicActivation();
        sleep(period);
    }
}

char Console::getc() {
    return ::getc();
}

void Console::putc(char c) {
    ::putc(c);
}
