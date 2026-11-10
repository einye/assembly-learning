%macro prompt 1
push %1
call printf
%endmacro

%macro get_input 2
push %1
push %2
call scanf
%endmacro

%macro print_sum 2
push %1
push %2
call printf
%endmacro

extern scanf
extern printf

section .bss
	num1 resd 1
	num2 resd 1
	sum resd 1
	
section .data
	msg db "Sum is %d.",10,0
	msg1 db "Enter a number: ",10,0
	input_format dd "%d",0
	
section .text

global _start
	_start:
	
	prompt msg1
	get_input num1, input_format 
	prompt msg1
	get_input num2, input_format
	
	mov eax, [num1]
	mov ebx, [num2]
	add eax, ebx
	mov [sum], eax
	print_sum dword [sum], msg
	
	mov eax, 1
	int 0x80
		
