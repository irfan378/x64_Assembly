global _start
section .text
_start:
    jmp main
main:
    mov rax,0
    mov rdi,0
    mov rsi,user_key
    mov rdx,64
    syscall
cmp_key:
    cmp rax,original_key_length
    jne access_denied
    mov rsi,original_key
    mov rdi,user_key
    mov rcx,original_key_length
    repe cmpsb
    je access_granted
    jne access_denied
access_granted:
    mov rax,1
    mov rdi,1
    mov rsi,acess_granted_message
    mov rdx,acess_granted_message_length
    syscall
    jmp exiting_program
access_denied:
    mov rax,1
    mov rdi,1
    mov rsi,acess_denied_message
    mov rdx,acess_denied_message_length
    syscall
exiting_program:
    mov rax,60
    mov rdi,0
    syscall
section .data
    acess_granted_message: db "Access granted!",10;10 represents new line in ascii
    acess_granted_message_length: equ $-acess_granted_message

    acess_denied_message: db "Access denied!",10
    acess_denied_message_length: equ $-acess_denied_message

    original_key: db "3940-dsif-4kfd"
    original_key_length: equ $-original_key
section .bss
    user_key:resb 64