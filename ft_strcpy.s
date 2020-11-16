
	section .text
	global _ft_strcpy

_ft_strcpy:				; dst = rdi,  src = rsi
	cmp rsi, 0			; !src
	jz	_null
	push	rcx
	push	rdx
	xor	rcx, rcx 		; i = 0
	xor	rdx, rdx		; buffer

_start_loop:
	mov	dl , byte [rsi + rcx]
	mov	byte [rdi + rcx], dl
	cmp	dl, 0
	jz	_null
	inc	rcx
	jmp	_start_loop;

_null:
	mov	rax, rdi
	pop	rdx
	pop	rcx
	ret

