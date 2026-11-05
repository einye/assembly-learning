section .data
    input_format db "%d", 0          
    output_format db "%d numbers are less than or equal to your number.", 10, 0  
    array db 3, 10, 8, 5, 7, 9, 2, 6, 1 
    array_size equ 9 
    msg db "Enter a number: ",0            

section .bss
    number resd 1                
    count resd 1                 

section .text
    global _start
    extern scanf
    extern printf

_start:
   
    push msg
    call printf
    add esp, 4
    
    push number
    push input_format
    call scanf
    add esp, 8                   

    
    mov dword [count], 0

    
    mov esi, array               
    mov ecx, array_size          

compare_loop:
   
    movzx eax, byte [esi]

    
    cmp eax, dword [number]
    jg skip_increment            
    
    inc dword [count]

skip_increment:
    
    inc esi

    
    loop compare_loop

    
    push dword [count]
    push output_format
    call printf
    add esp, 8                   

   
    mov eax, 1                   ; sys_exit
    xor ebx, ebx                 ; Status 0
    int 0x80                     ; Call kernel

