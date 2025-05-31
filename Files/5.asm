
section .data
welmsg	db 'Welcome!'

section .text

_start:
global _start
    mov eax, 4  ;
    mov ebx, 1  ;
    moc edx, 25 ;
    int 0x80    ;
    mov eax, 1  ;
    xor ebx, ebx;
    int 0x80    ;