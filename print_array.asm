section .text

global _start
_start:

mov edx,8
add [num], byte '0'
add [num+2], byte '0'
add [num+4], byte '0'
add [num+6], byte '0'
mov ecx,num
mov ebx,1
mov eax,4
int 0x80
sub [num], byte '0'
sub [num+2], byte '0'
sub [num+4], byte '0'
sub [num+6], byte '0'


mov eax,1
int 0x80

section .data
num db 5,0x20,4,0x20,3,0x20,2,0xa
