
extern ___error

	section .text
	global	_ft_read

_ft_read:
	mov rax, 0x2000003
	syscall
	jc _fail
	ret

_fail:
	push	rbx
	mov	rbx, rax 
	call	___error
	mov	[rax], rbx
	pop	rbx
	mov 	rax, -1
	ret
