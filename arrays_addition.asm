section .data
num db 1,2,3
num2 db 6,4,2
eol db 0xa

section .bss
counter_num resb 1
counter_num2 resb 1
print resb 1

section .text
global _start
_start:

mov edi, num
mov ecx, 3

.print_num:
mov esi, ecx
mov eax, [edi]
mov [print], eax
add [print], byte '0'
mov ecx, print
mov edx, 1
mov ebx, 1
mov eax, 4
int 0x80
sub [print], byte '0'
inc edi
mov ecx, esi
loop .print_num

mov ecx, eol
mov edx, 1
mov ebx, 1
mov eax, 4
int 0x80

mov ecx, 3
mov edi, num2

.print_num2:
mov esi, ecx
mov eax, [edi]
mov [print], eax
add [print], byte '0'
mov ecx, print
mov edx, 1
mov ebx, 1
mov eax, 4
int 0x80
sub [print], byte '0'
inc edi
mov ecx, esi
loop .print_num2

mov ecx, eol
mov edx, 1
mov ebx, 1
mov eax, 4
int 0x80

mov ecx, 3
mov edi, num
mov esi, num2

.print_sum:
mov ebp, ecx
mov eax, [edi]
mov ebx, [esi]
add eax, ebx
mov [print], eax
add [print], byte '0'
mov ecx, print
mov edx, 1
mov ebx, 1
mov eax, 4
int 0x80
sub [print], byte '0'
mov ecx, ebp
inc esi
inc edi
loop .print_sum

mov ecx, eol
mov edx, 1
mov ebx, 1
mov eax, 4
int 0x80

mov eax, 1
int 0x80
