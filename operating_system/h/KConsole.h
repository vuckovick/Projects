//
// Created by os on 8/14/23.
//

#ifndef PROJECT_BASE_KCONSOLE_H
#define PROJECT_BASE_KCONSOLE_H

#include "KBuffer.h"
#include "Sem.h"

class KBuffer;

class KConsole {
public:
    KConsole() = delete;

    static void putchar(char c);
    static char getchar();
    static void init();

    static KBuffer* inputBuffer, *outputBuffer;
    friend class Riscv;
};


#endif //PROJECT_BASE_KCONSOLE_H
