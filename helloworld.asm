global _start
section .text
_start:
    ; print hello world
    mov rax,1 ;write syscall
    mov rdi,1 ;file descriptor->1(output)
    mov rsi,hello ;buf->hello
    mov rdx,11;count ->11(size)
    syscall 
    ;exit
    mov rax,60;exit syscall
    mov rdi,22;status code 22
    syscall
section .data
    hello: db 'hello world'