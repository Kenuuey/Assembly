section .bss
array	resb 256	; 256-byte array

section .text
; ...
	mov ecx, 256	; кол-во элементов -> в счётчик (ECX)
	mov edi, array	; array address to EDI
	mov al, '@'	; нужный код в однобайтовый AL
again:	mov [edi], al	; заносим код в очередной элемент
	inc edi		; увеличиваем адрес
	dec ecx		; уменьшаем счётчик
	jnz again	; если там не ноль, повторяем цикл
