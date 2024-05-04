//
// Created by os on 8/14/23.
//

#include "../h/KConsole.h"

KBuffer* KConsole::inputBuffer = nullptr;
KBuffer* KConsole::outputBuffer = nullptr;

void KConsole::putchar(char c) {
    inputBuffer->put(c);
    while(((*(char*) CONSOLE_STATUS) & 0x20) && !KConsole::inputBuffer->isEmpty()){
        (*(char*) CONSOLE_TX_DATA) = KConsole::inputBuffer->get();
    }
}

char KConsole::getchar() {
    return outputBuffer->get();
}

void KConsole::init() {
    inputBuffer = new KBuffer(1000);
    outputBuffer = new KBuffer(1000);
}
