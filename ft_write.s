extern ___error

;comment faire appel à errno
	section .text
	global	_ft_write

_ft_write:
	mov rax, 0x2000004
	syscall
	jc _fail
	ret

_fail:
	push 	rbx
	mov	rbx, rax
	call	___error
	mov	[rax], rbx
	pop	rbx
	mov rax, -1
	ret
