//
// Created by os on 6/30/23.
//

#include "../h/Riscv.h"

void Riscv::interruptHandler() {
    uint64 sepc = Riscv::r_sepc() + 4;
    uint64 sstatus = Riscv::r_sstatus();

    uint64 sys_code;
    __asm__ volatile("mv %[sys_code], a0" : [sys_code] "=r" (sys_code));

    uint64 scause = r_scause();

    uint64 a2;
    __asm__ volatile("mv %[sys_code], a2" : [sys_code] "=r" (a2));

    if(scause == 8 || scause == 9) {
        switch (sys_code) {
            case 0x01:
                uint64 size;
                __asm__ volatile("mv %[size], a1" : [size] "=r"(size));
                MemoryAllocator::mem_alloc(size);
                break;

            case 0x02:
                void *ptr;
                __asm__ volatile("mv %[ptr], a1" : [ptr] "=r"(ptr));
                MemoryAllocator::mem_free(ptr);
                break;

            case 0x11:
                TCB **thread, *tt;
                __asm__ volatile("mv %[thread], a1" : [thread] "=r"(thread));
                uint64 *body;
                body = (uint64*) a2;
                void *arg;
                __asm__ volatile("mv %[arg], a6" : [arg] "=r"(arg));
                uint64 *stack;
                __asm__ volatile("mv %[stack], a7" : [stack] "=r"(stack));
                tt = TCB::createThread((TCB::Body) body, stack, arg);
                *thread = tt;
                if (tt == nullptr)
                    __asm__ volatile("li a0, -1");
                else {
                    Scheduler::put(*thread);
                    __asm__ volatile("li a0, 0");
                }
                break;

            case 0x12:
                TCB::exit();
                break;

            case 0x13:
                TCB::running->resTimeSlice();
                TCB::dispatch();
                break;

            case 0x14:
                TCB *thr;
                __asm__ volatile("mv %[thr], a1" : [thr] "=r"(thr));
                TCB::running->join(thr);
                break;

            case 0x21:
                Sem **handle;
                __asm__ volatile("mv %[handle], a1" : [handle] "=r"(handle));
                uint64 init;
                __asm__ volatile("mv %[init], a7" : [init] "=r"(init));
                *handle = Sem::createSem(init);
                if (*handle == nullptr)
                    __asm__ volatile("li a0, -1");
                else {
                    __asm__ volatile("li a0, 0");
                }
                break;

            case 0x22:
                Sem *hand;
                __asm__ volatile("mv %[hand], a1" : [hand] "=r"(hand));
                if (hand == nullptr)
                    __asm__ volatile("li a0, -1");
                else {
                    delete hand;
                    __asm__ volatile("li a0, 0");
                }
                break;

            case 0x23:
                Sem *id;
                __asm__ volatile("mv %[id], a1" : [id] "=r"(id));
                id->wait();
                if(TCB::running->retFromClosedSem){
                    TCB::running->retFromClosedSem = false;
                    __asm__ volatile("li a0, -1");
                }
                else
                    __asm__ volatile("li a0, 0");
                break;

            case 0x24:
                Sem *idd;
                __asm__ volatile("mv %[idd], a1" : [idd] "=r"(idd));
                if (idd == nullptr)
                    __asm__ volatile("li a0, -1");
                else {
                    idd->signal();
                    __asm__ volatile("li a0, 0");
                }
                break;

            case 0x31:
                uint64 time;
                __asm__ volatile("mv %[time], a1" : [time] "=r"(time));
                if(time == 0){
                    TCB::dispatch();
                    __asm__ volatile("li a0, 0");
                    break;
                }

                if(TCB::running == nullptr)
                    __asm__ volatile("li a0, -1");
                else
                {
                    TimerSleep::put(TCB::running, time);
                    TCB::running->setState(TCB::SLEEPING);
                    TCB::dispatch();
                    __asm__ volatile("li a0, 0");
                }
                break;

            case 0x41:
                KConsole::getchar();
                break;

            case 0x42:
                char c;
                __asm__ volatile("mv %[c], a1" : [c] "=r"(c));
                KConsole::putchar(c);
                break;
        }

        Riscv::w_sstatus(sstatus);
        Riscv::w_sepc(sepc);
    }

    return;
}

void Riscv::timerHandler() {
    uint64 sepc = Riscv::r_sepc();
    uint64 sstatus = Riscv::r_sstatus();

    mc_sip(SIP_SSIE);
    TCB::running->decTimeSlice();
    TimerSleep::get();
    if(TCB::running->getTimeSlice() <= 0){
        TCB::dispatch();
    }

    Riscv::w_sstatus(sstatus);
    Riscv::w_sepc(sepc);
}

void Riscv::consoleHandler() {
    uint64 sepc = Riscv::r_sepc();
    uint64 sstatus = Riscv::r_sstatus();

    int cause = plic_claim();
    if(cause == 10){
        while(((*(char*) CONSOLE_STATUS) & 0x01) && !KConsole::outputBuffer->isFull()){
            KConsole::outputBuffer->put((*(char*) CONSOLE_RX_DATA));
        }
    }

    plic_complete(cause);
    Riscv::w_sstatus(sstatus);
    Riscv::w_sepc(sepc);
}

void Riscv::popSppSpie()
{
    __asm__ volatile("csrw sepc, ra");
    __asm__ volatile("li t0, 256");
    __asm__ volatile("csrc sstatus, t0");

    __asm__ volatile("ld s0, 8(sp)");
    __asm__ volatile("addi sp, sp, 16");

     __asm__ volatile("sret");
}
