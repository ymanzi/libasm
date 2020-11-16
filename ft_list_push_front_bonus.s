
extern _malloc

	section .text
	global	_ft_list_push_front


_ft_list_push_front:		;rdi = t_list **begin_list / rsi = void *data
	push	rsp		; align stack
	push	rdi
	push	rsi
	mov	rdi, 16         ; sizeof(t_list) = 16
	call	_malloc
	pop	rsi
	pop	rdi
	cmp	rax, 0
	je	_fin
	mov	[rax], rsi
	mov	rcx, [rdi]
	mov	[rax + 8], rcx
	mov	[rdi], rax

_fin:
	pop	rsp
	ret
