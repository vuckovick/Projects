//
// Created by os on 7/4/23.
//
#include "../h/syscall_c.hpp"

void *mem_alloc(size_t size) {
    __asm__ volatile("mv a1, a0");
    __asm__ volatile("li a0, 0x01");
    __asm__ volatile("ecall");
    void * retval;
    __asm__ volatile("mv %[ret], a0" : [ret] "=r" (retval));
    return retval;
}

int mem_free(void * ptr) {
    __asm__ volatile("mv a1, a0");
    __asm__ volatile("li a0, 0x02");
    __asm__ volatile("ecall");
    int retval;
    __asm__ volatile("mv %[ret], a0" : [ret] "=r" (retval));
    return retval;
}

int thread_create(thread_t *handle, void (*start_routine)(void *), void *arg) {
    thread_t *hand = handle;
    uint64* body = (uint64*) start_routine;
    void* args = arg;
    uint64* stack = (uint64*) mem_alloc(DEFAULT_STACK_SIZE);
    if(stack == nullptr) return -1;
    stack+=DEFAULT_STACK_SIZE - 1;
    __asm__ volatile("mv a7, %[stack]" : : [stack] "r" (stack));
    __asm__ volatile("mv a6, %[args]" : : [args] "r" (args));
    __asm__ volatile("mv a2, %[body]" : : [body] "r" (body));
    __asm__ volatile("mv a1, %[hand]" : : [hand] "r" (hand));
    __asm__ volatile("li a0, 0x11");
    __asm__ volatile("ecall");
    int retval;
    __asm__ volatile("mv %[ret], a0" : [ret] "=r" (retval));
    return retval;
}

int thread_exit() {
    __asm__ volatile("li a0, 0x12");
    __asm__ volatile("ecall");
    int retval;
    __asm__ volatile("mv %[ret], a0" : [ret] "=r" (retval));
    return retval;
}

void thread_dispatch() {
    __asm__ volatile("li a0, 0x13");
    __asm__ volatile("ecall");
}

void thread_join(thread_t handle) {
    __asm__ volatile("mv a1, %[handle]" : : [handle] "r" (handle));
    __asm__ volatile("li a0, 0x14");
    __asm__ volatile("ecall");
}

int sem_open(sem_t *handle, unsigned int init) {
    __asm__ volatile("mv a7, %[init]" : : [init] "r" (init));
    __asm__ volatile("mv a1, %[handle]" : : [handle] "r" (handle));
    __asm__ volatile("li a0, 0x21");
    __asm__ volatile("ecall");
    int retval;
    __asm__ volatile("mv %[ret], a0" : [ret] "=r" (retval));
    return retval;
}

int sem_close(sem_t handle) {
    __asm__ volatile("mv a1, %[handle]" : : [handle] "r" (handle));
    __asm__ volatile("li a0, 0x22");
    __asm__ volatile("ecall");
    int retval;
    __asm__ volatile("mv %[ret], a0" : [ret] "=r" (retval));
    return retval;
}

int sem_wait(sem_t id) {
    __asm__ volatile("mv a1, %[id]" : : [id] "r" (id));
    __asm__ volatile("li a0, 0x23");
    __asm__ volatile("ecall");
    int retval;
    __asm__ volatile("mv %[ret], a0" : [ret] "=r" (retval));
    return retval;
}

int sem_signal(sem_t id) {
    __asm__ volatile("mv a1, %[id]" : : [id] "r" (id));
    __asm__ volatile("li a0, 0x24");
    __asm__ volatile("ecall");
    int retval;
    __asm__ volatile("mv %[ret], a0" : [ret] "=r" (retval));
    return retval;
}

int time_sleep(time_t time) {
    __asm__ volatile("mv a1, %[time]" : : [time] "r" (time));
    __asm__ volatile("li a0, 0x31");
    __asm__ volatile("ecall");
    int retval;
    __asm__ volatile("mv %[ret], a0" : [ret] "=r" (retval));
    return retval;
}

char getc() {
    __asm__ volatile("li a0, 0x41");
    __asm__ volatile("ecall");
    char retval;
    __asm__ volatile("mv %[ret], a0" : [ret] "=r" (retval));
    return retval;
}

void putc(char c) {
    __asm__ volatile("mv a1, %[c]" : : [c] "r" (c));
    __asm__ volatile("li a0, 0x42");
    __asm__ volatile("ecall");
}


