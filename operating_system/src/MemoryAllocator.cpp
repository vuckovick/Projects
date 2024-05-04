//
// Created by os on 6/2/23.
//

#include "../h/MemoryAllocator.h"

MemoryAllocator::FreeMem* MemoryAllocator::head = nullptr;
bool MemoryAllocator::start = true;

void *MemoryAllocator::mem_alloc(size_t size) {
    if(start) {
        head = (FreeMem*) HEAP_START_ADDR;
        head->next = head->prev = nullptr;
        head->size = (uint64)HEAP_END_ADDR - (uint64)HEAP_START_ADDR;
        start = false;
    }

    if(!head) return nullptr;

    FreeMem *cur = head;
    size = (size + sizeof(FreeMem) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE * MEM_BLOCK_SIZE;
    while(cur->size < size) {
        cur = cur->next;
        if(!cur) return nullptr;
    }


    if(cur->size - size > 0){
        FreeMem * newFree = (FreeMem*)((uint64)cur + size);
        newFree->size = cur->size - size;
        newFree->prev = cur;
        newFree->next = cur->next;
        if(cur->next != nullptr)
            cur->next->prev = newFree;
        cur->next = newFree;
    }

    if(cur->prev == nullptr){
        head = cur->next;
        head->prev = nullptr;
    }
    else{
        cur->prev->next = cur->next;
        cur->next->prev = cur->prev;
    }

    cur->size = size;
    cur->next = cur->prev = nullptr;

    return (void*)((uint64)cur + sizeof(FreeMem));
}

int MemoryAllocator::mem_free(void * ptr) {
    if(start) return -3;
    ptr = (void *)((uint64) ptr - sizeof(FreeMem));
    if((uint64*) ptr < (uint64*) HEAP_START_ADDR || (uint64*) ptr >= (uint64*) HEAP_END_ADDR) return -1;

    FreeMem* cur = nullptr;
    if(head && (uint64*)ptr >= (uint64*) head){
        for(cur = head; cur->next != nullptr && (uint64*) ptr > (uint64*) cur->next; cur = cur->next);
        if((uint64) cur + cur->size >= (uint64) ptr) return -2;
    }

    FreeMem* newFree = (FreeMem*) ptr;
    newFree->prev = cur;

    if(cur)
        newFree->next = cur->next;
    else
        newFree->next = head;

    if(newFree->next)
        newFree->next->prev = newFree;

    if(cur)
        cur->next = newFree;
    else
        head = newFree;

    tryToJoin(newFree);
    return 0;
}

void MemoryAllocator::tryToJoin(FreeMem *cur) {
    if(cur->prev && (uint64) cur->prev + cur->prev->size == (uint64) cur){
        cur->prev->size += cur->size;
        cur->prev->next = cur->next;
        if(cur->next)
            cur->next->prev = cur->prev;
        cur = cur->prev;
    }

    if(cur->next && (uint64) cur + cur->size == (uint64) cur->next){
        cur->size += cur->next->size;
        cur->next = cur->next->next;
        if(cur->next)
            cur->next->prev = cur;
    }
}