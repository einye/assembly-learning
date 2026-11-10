extern printf

section .data
    num dd 2.0
    output db "%f", 10, 0

section .bss
    result resd 1

section .text
global _start
_start:
    fld dword [num]       ; Load num into st(0)
    fsqrt                 ; Compute the square root, result in st(0)
    sub esp, 8            ; Make space on the stack
    fstp qword [esp]      ; Store the result on the stack
    
    push output           ; Push the format string
    call printf           ; Call printf
    add esp, 12           ; Clean up the stack (8 bytes for the float + 4 bytes for the format string)

    ; Exit the program
    mov eax, 1            ; sys_exit
    xor ebx, ebx          ; Exit code 0
    int 0x80

