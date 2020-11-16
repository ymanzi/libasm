	section .text
	global	_ft_is_in_str		; rdi = char, rsi = *str
	
_ft_is_in_str:
	push	rdx
	xor	rdx, rdx   ; i = 0
	mov	rax, -1

_compare:
	cmp	BYTE[rsi + rdx], dil
	je	_found
	inc	rdx
	cmp	BYTE[rsi + rdx], 0
	jne	_compare
	pop	rdx
	ret
	
_found:
	mov rax, rdx
	pop rdx
	ret
	
