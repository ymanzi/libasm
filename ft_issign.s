
	section .text
	global	_ft_issign

_ft_issign:			; rdi = char
	xor	rax, rax
	cmp	dil, 43
	je	_plus
	cmp	dil, 45
	je	_moins
	ret

_plus:
	mov	rax, 1
	ret

_moins:
	mov	rax, -1
	ret
