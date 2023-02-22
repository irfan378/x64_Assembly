global _start
section .text
_start:
    mov rax,1
    mov rdi,1
    mov rsi,hello
    mov rdx,hello_length
    syscall
user_input:
    mov rax,0
    mov rdi,0
    mov rsi,input
    mov rdx,100
    syscall
    mov rbx,rax
printing_hello:
    mov rax,1
    mov rdi,1
    mov rsi,print
    mov rdx,print_length
    syscall
printing_user_input:
    mov rax,1
    mov rdi,1
    mov rsi,input
    mov rdx,rbx
    syscall
 exiting_program:
    mov rax,60
    mov rdi,20
    syscall

section .data
    hello: db 'Enter your name : '
    hello_length: equ $-hello
    print: db 'hello, '
    print_length:equ $-print

section .bss
    input: resb 100