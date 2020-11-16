
	section .text
	global	_ft_strcmp

_ft_strcmp:				; rdi = s1  , rsi = s2
	xor	rax, rax
	xor rbx, rbx
	push	 rcx
	xor	rcx, rcx		; i = 0

_compare:
	mov		al, BYTE [rdi + rcx]
	mov		bl, BYTE [rsi + rcx]
	cmp		al, 0
	jz		_is_null
	cmp		bl, 0
	jz		_is_null
	cmp		al, bl 
	jnz		_is_null
	inc		rcx
	jmp		_compare

_is_null:
	pop		rcx
	sub		rax, rbx
	ret
