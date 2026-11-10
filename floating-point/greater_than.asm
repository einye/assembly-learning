section .data
    format_scan db "%lf %lf", 0
    format_print db "%f is greater than %f", 10, 0

section .bss
    num1 resq 1
    num2 resq 1

section .text
    extern scanf, printf
    global _start

_start:
    ; Read two doubles from the user
    push num2
    push num1
    push format_scan
    call scanf
    add esp, 12

    ; Load the doubles into the FPU stack
    fld qword [num1]
    fld qword [num2]
    fucomip st0, st1
    fstp st0

    ; Compare the two numbers
    jbe num2_greater

num1_greater:
    ; num1 > num2
    sub esp, 8
    fld qword [num1]
    fstp qword [esp]
    sub esp, 8
    fld qword [num2]
    fstp qword [esp]
    push format_print
    call printf
    add esp, 24
    jmp exit

num2_greater:
    ; num2 >= num1
    sub esp, 8
    fld qword [num2]
    fstp qword [esp]
    sub esp, 8
    fld qword [num1]
    fstp qword [esp]
    push format_print
    call printf
    add esp, 24

exit:
    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80

