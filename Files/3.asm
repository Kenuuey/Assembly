%include "stud_io.inc"

section .data
welmsg	db 'Welcome to Cyberspace!'

section .text

_start:
global _start
	mov eax, 4	; sys_write
	mov ebx, 1	; stdout
	mov ecx, welmsg	;
	mov edx, 25	; length - 16 byte
	int 0x80	; system interruption
	mov eax, 1	; sys_exit
	xor ebx, ebx	; return code 0
	int 0x80	; system interruption
