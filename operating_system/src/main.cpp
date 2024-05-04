//
// Created by os on 6/2/23.
//

#include "../h/Riscv.h"
#include "../h/syscall_c.hpp"
#include "../h/KConsole.h"

extern "C" void SuperVisorTrap();
void userMain();

void mainWrapper(void*){
    userMain();
}

int main(){

    Riscv::w_stvec((uint64)SuperVisorTrap | 1);

    KConsole::init();
    thread_t t;
    thread_create(&t, mainWrapper, nullptr);

    thread_join(t);

    return 0;
}

