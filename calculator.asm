%include "util.asm"
global _start
section .text
_start:
    mov rdi,first_number
    call printstr
    call readint
    mov [number_1],rax
    mov rdi,second_number
    call printstr
    call readint
    mov [number_2],rax
    mov rdi,operation
    call printstr
    mov rdi,operator
    mov rsi,2
    call readstr
cmp_operator:
    mov rdi,[operator]
    cmp rdi,43 ; here we are comparing + and rdi 
    je addition
    cmp rdi,45 ; -
    je subtraction
    cmp rdi,42 ; *
    je multiply
    cmp rdi,47 ; /
    je division
exception:
    mov rdi,error_msg
    call printstr
    call endl
    call exit0
addition:
    mov rdi,[number_1]
    add rdi,[number_2]
    call results
subtraction:
    mov rdi,[number_1]
    sub rdi,[number_2]
    call results
multiply:
    mov rdi,[number_1]
    imul rdi,[number_2]
    call results
division:
    mov rdx,0
    mov rax,[number_1]
    mov rbx,[number_2]
    idiv rbx
    mov rdi,rax
    call results
results:
    call printint
    call endl
    call exit0
section .data
    first_number: db "Enter First Number : ",0
    second_number: db "Enter Second Number : ",0
    operation: db "Enter operation to perform(+,-,*,/) : ",0
    error_msg: db "Cannot perform this operation : ",0
section .bss
    number_1: resb 8
    number_2: resb 8
    operator: resb 2