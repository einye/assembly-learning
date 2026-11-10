%macro write_string 2 ; 2 arguments - string variable and its length
push eax
push ebx
push ecx 
push edx
mov ecx, %1 ; variable
mov ebx, 1 ; STDOUT
mov edx, 0
mov dl, [%2] ; output length
mov eax, 4 ; sys_write
int 0x80 ; kernel interupt 
pop edx
pop ecx
pop ebx
pop eax
%endmacro
%macro read_string 3 	; 3 arguments variable to store string, 
			;and a variable to store the number of characters read
			;maximum number of charactes to read
push eax
push ebx
push ecx
push edx
mov ecx, %1 ; variable
mov ebx, 2 ; STDIN
mov edx,0
mov dl, %3 ; max characters to read
mov eax, 3 ; sys_read
int 0x80 ; kernel interupt
DEC eax; remove end of line
mov [%2], al ; number of characters read 
pop edx
pop ecx
pop ebx
pop eax
%endmacro

section	.text
   global _start     ;must be declared for linker (ld)
_start:	            ;tells linker entry point
  mov [length], byte len1
  write_string msg1, length
  read_string firstname,fnlen, 30
  mov [length], byte len3
  write_string msg3, length
  read_string middlename,mnlen, 30
  mov [length], byte len2
  write_string msg2, length
  read_string surname,snlen, 30
  write_string firstname, fnlen
 mov [length], byte 1
 write_string space, length
 write_string middlename, mnlen
  mov [length], byte 1
 write_string space, length
 write_string surname, snlen
 write_string eol, length
   mov	eax,1       ;system call number (sys_exit)
   int	0x80        ;call kernel

section	.data
eol db 0xa
msg1 db "Enter your first name",0xa
len1 equ $-msg1
msg2 db "Enter your surname",0xa
len2 equ $-msg2
msg3 db "Enter your middle name",0xa
len3 equ $-msg3
space db ' '
section .bss
firstname  resb 30  
fnlen resb 1
surname  resb 30  
snlen resb 1
middlename resb 30
mnlen resb 1
length resb 1

