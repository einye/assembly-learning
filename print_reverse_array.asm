section .text

global _start
_start:

mov edx,1
add [num+3], byte '0'
mov ecx,num+3
mov ebx,1
mov eax,4
int 0x80
sub [num+3], byte '0'

mov edx,1
mov ecx,space
mov ebx,1
mov eax,4
int 0x80

mov edx,1
add [num+2], byte '0'
mov ecx,num+2
mov ebx,1
mov eax,4
int 0x80
sub [num+2], byte '0'

mov edx,1
mov ecx,space
mov ebx,1
mov eax,4
int 0x80

mov edx,1
add [num+1], byte '0'
mov ecx,num+1
mov ebx,1
mov eax,4
int 0x80
sub [num+1], byte '0'

mov edx,1
mov ecx,space
mov ebx,1
mov eax,4
int 0x80

mov edx,1
add [num], byte '0'
mov ecx,num
mov ebx,1
mov eax,4
int 0x80
sub [num], byte '0'

mov edx,1
mov ecx,space
mov ebx,1
mov eax,4
int 0x80

mov edx,1
mov ecx,eol
mov ebx,1
mov eax,4
int 0x80

mov eax,1
int 0x80

section .data

num db 5,4,3,2
eol db 0xa
space db ' '
