%include "stud_io.inc"
global	_start

section	.text
_start: mov	eax, 0
again:	PUTCHAR 65
	PUTCHAR 32
	inc	eax
	cmp	eax, 10
	jl	again
	PUTCHAR 10
	_syscall_exit 0
