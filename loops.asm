%include "util.asm"
global _start

section .text
_start:
    mov rdi,mssg
    call printstr
    call readint
    mov [user_value],rax
    mov rbx,1
LOOP_START:    
    mov rcx,[user_value]
    imul rcx,rbx
    mov rdi,rcx
    call printint
    call endl
    add rbx,1
    cmp rbx,11
    jne LOOP_START
    call exit0
section .data
    mssg: db "Enter Your Number : ",10,0
section .bss
    user_value: resb 8