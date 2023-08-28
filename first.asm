section .data
	first:     db 'This is the first assembly languague!',    ; Just print the line
	firstLen:  equ $-first             ; Length of the 'first' string

section .text
	global _start

_start:
	mov eax,4            ; The system call for write (sys_write)
	mov ebx,1            ; File descriptor 1 - standard output
	mov ecx,first        ; Put the offset of first in ecx
	mov edx,firstLen     ; firstLen is a constant, so we don't need to say
	                     ;  mov edx,[firstLen] to get it's actual value
	int 80h              ; Call the kernel
	mov eax,1            ; The system call for exit (sys_exit)
	mov ebx,0            ; Exit with return "code" of 0 (no error)
	int 80h;
