section .data
format_in db "%d", 0       ; Format string for scanf
format_out db "You entered: %d", 10, 0 ; Format string for printf (includes newline)
number dd 0                ; Variable to store the number

section .bss

section .text
global _start

extern scanf
extern printf

_start:
    ; Call scanf
    push number            ; Address of number
    push format_in         ; Address of format string
    call scanf
    add esp, 8             ; Clean up the stack (2 arguments * 4 bytes)

    ; Call printf
    push dword [number]    ; Value of number
    push format_out        ; Address of format string
    call printf
    add esp, 8             ; Clean up the stack (2 arguments * 4 bytes)

    ; Exit program
    mov eax, 1             ; sys_exit
    xor ebx, ebx           ; Status 0
    int 0x80               ; Call kernel

