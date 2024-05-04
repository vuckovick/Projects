//
// Created by os on 7/18/23.
//

#ifndef PROJECT_BASE_SEM_H
#define PROJECT_BASE_SEM_H

#include "TCB.h"

class Sem {
private:
    Sem (int initValue=1) : val(initValue) {
        head = tail = 0;
    }

    ~Sem();
    void wait ();
    void signal ();
    void block ();
    void deblock ();

    void put(TCB* data);
    TCB* get();

    static Sem* createSem(int value){
        return new Sem(value);
    }

    void *operator new(size_t size);
    void operator delete(void *ptr);

    struct Node{
        TCB* data;
        Node* next;

        Node(){
            data = nullptr;
            next = nullptr;
        }

        void *operator new(size_t size);
        void operator delete(void *ptr);
    };

    Node* head, *tail;
    int val;

    friend class TCB;
    friend class Riscv;
    friend class KBuffer;
};


#endif //PROJECT_BASE_SEM_H
