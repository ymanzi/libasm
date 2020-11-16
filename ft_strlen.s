	section .text
	global _ft_strlen

_ft_strlen:
	xor	rax, rax ; rax = 0 
_loop_check:
	cmp	byte [rdi + rax], 0
	je	_endloop
	inc	rax
	jmp	_loop_check
_endloop:
	ret
