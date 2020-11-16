

extern _malloc
extern _ft_strlen
extern _ft_strcpy

	section .text
	global _ft_strdup

_ft_strdup:
	cmp	rdi, 0
	jz	_fail_err
	call	_ft_strlen
	inc	rax
	push	rdi
	mov	rdi, rax
	call	_malloc
	cmp	rax, 0
	jz	_fail_err
	mov	rdi, rax
	pop	rsi
	call	_ft_strcpy
	ret

_fail_err:
	xor rax, rax
	ret
