extern scanf,printf
%include 'functions_macros.asm'
section	.text
   global _start     ;must be declared for linker (ld)
	
_start:	            ;tells linker entry point
	write_string msg1, len1
	push num1
	push scan
	call scanf
	pop edx
	pop edx

	mov eax, [num1]	
	push eax

	call factorial; call the function the first time
	mov [result], eax ; store the result which is in eax into the result variable	
	
;popout the value(s) we stored in the stack
	pop edx
	
	
;;print out the result
	
	mov eax, [result]
	push eax
	push print
	call printf
	pop edx
	pop edx

	   ;;print end of line
	;  call endofline
	
	;exit the program    			
	exiting

	
factorial: ;define the  function
	push ebp ; store bp of the calling function so we will be able to restore it
	mov ebp, esp; set up its own base pointer from which we will access our local variables and parameters
	mov eax,[ebp+8] ; get the first  parameter passed  store it in eax
	mov edx, eax	
	mov ebx, eax
	mov ecx, eax
	dec ecx
	cmp eax, 0
	je zero
	multiply:
	
	dec ebx; - check if the multiplier is 0, then jump if it is
	cmp ebx, 0 ; - check to see if the multiplier is 0, then exit the loop if it is 
	je skip ; - exit the loop
	
	MUL  ebx ; multiply al by the value in ebx
    
	loop multiply
	
    jmp skip
	zero:
	 mov eax, 1
	skip:
;process of restoring bp
	mov esp,ebp ;deallocate the stack frame
	pop ebp ; restore bp for the calling function
	ret				;end of the function
   

section	.data
	msg1 db "Enter  Number: "
	len1 equ $-msg1	
	scan db "%d", 0x0
	print db "Result: %d", 0xa, 0x0

section .bss 
	num1 resd 1
	result resd 1
	

