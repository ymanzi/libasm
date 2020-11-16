
;int ft_list_size(t_list *begin_list)
	section	.text
	global	_ft_list_size

_ft_list_size:			
	xor	rax, rax	;i = 0
	push	rdx
	mov	rdx, rdi	; save begin_list


_inc_loop:	
	cmp	rdi, 0		; if begin_list == NULL 
	jz	_fin
	inc	rax		; i += 1
	mov	rdi, [rdi + 8]	; begin_list = begin_list.next
	jmp	_inc_loop

_fin:
	mov	rdi, rdx
	pop	rdx
	ret
