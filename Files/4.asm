section .data
	num1	dd 5
	num2	dd 10
	result	dd 0
	output	db "Result: ", 0
	newline	db 10

section .bss
	result_str resb 10	; Buffer to hold result as string

section	.text
	global _start

_start:
	mov	eax, [num1]	; eax = num1 (5)
	add	eax, [num2]	; eax = eax + num2 (10), eax = 15
	mov	[result], eax	; result = eax (15)

	; Convert the result to string
	mov eax, [result]
	mov edi, result + 9	; Set EDI to point to the end of str
	mov byte [edi], 0	; Null-terminate the string
	dec edi			; Move EDI to the previous position
	call int_to_string	; call conversion function

	; Print "Result: "
	mov eax, 4		; sys_write
	mov ebx, 1		; stdout
	mov ecx, output		; message
	mov edx, 8		; length of "Result: "
	int 0x80

	; Print the result string
	mov eax, 4		; sys_write
	mov ebx, 1		; stdout
	mov ecx, edi		; Pointer to the start of the str
	mov edx, 10 - (result + 9 - edi)		; length 
	int 0x80		; kernel call
	
	; Print newline
	mov eax, 4
	mov ebx, 1
	mov ecx, newline
	mov edx, 1
	int 0x80

	; Exit the program
	mov	eax, 1		; sys_exit
	xor	ebx, ebx	; return code 0
	int 	0x80		; call kernel


; Function to convert integer in EAX to string in ECX
int_to_string:
	mov ecx, 0		; Digit counter
	
.convert_loop:
	mov edx, 0
	mov ebx, 10
	div ebx			; Divide EAX by 10, result in EAX, 				       remainder in EDX
	add dl, '0' 		; Convert remainder to ASCII char
	mov [edi], dl
	dec edi
	int ecx			; Increment counter
	test eax, eax		; Check if EAX is zero
	jnz .conver_loop	; Repeat if not zero

	; Reverse the string in-place
	ret
