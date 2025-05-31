section .data
    message db "Hello, world", 0xA  ; Properly terminated string

section .text
global _start

_start:
    ; Write "Hello, world" to stdout
    mov eax, 4            ; System call number for sys_write
    mov ebx, 1            ; File descriptor 1 (stdout)
    mov ecx, message      ; Address of the string
    mov edx, 13           ; Length of the string
    int 0x80              ; Call the kernel

    ; Exit the program
    mov eax, 1            ; System call number for sys_exit
    xor ebx, ebx          ; Exit code 0
    int 0x80              ; Call the kernel

