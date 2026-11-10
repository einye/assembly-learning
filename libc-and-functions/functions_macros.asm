%macro write_number 2
      push eax
      push edx
      push ebx
      push ecx				
      mov   eax, 4 ; sys_write
      mov   ebx, %2
      mov   ecx, %1
      add [ecx], byte 48
      mov   edx, 1
      int   80h
     sub [ecx], byte 48
      pop ecx
      pop ebx
      pop edx
      pop eax 
 %endmacro
%macro write_string 2
      push eax
      push edx
      push ebx
      push ecx				
      mov   eax, 4 ; sys_write
      mov   ebx, 1
      mov   ecx, %1
      mov   edx, %2
      int   80h
      pop ecx
      pop ebx
      pop edx
      pop eax 
 %endmacro
 
%macro exiting 0
   ;exit the program    			
   mov	eax,1       ;system call number (sys_exit)
   mov ebx, 0
   int	0x80        ;call kernel
%endmacro

	

