; void ft_list_sort(t_list **begin_list, int (*cmp)());

	section .text
	global _ft_list_sort

_ft_list_sort:          ; rdi = **begin_list ; rsi = strcmp (char*, char*)
	cmp		rdi, 0		; **begin_list != 0
	je		_fin
	cmp		rsi, 0		; cmp != 0
	je		_fin
	mov		rdi, [rdi]	; rdi = *begin_list
	push	rbx
	mov		rbx, rdi	; save *begin_list

_init:
	cmp		rdi, 0
	je		_ret
	mov		r13, [rdi + 8]	; r13 = lst->next
	cmp		r13, 0
	je		_ret
	push	rdi
	push	r12
	mov		rdi, [rdi]		; rdi = lst->data
	mov		r12, rsi
	mov		rsi, [r13]		; rsi = lst->next->data
	call	r12
	mov		rsi, r12
	pop		r12
	pop		rdi
	cmp		rax, 0
	jg		_swap
	jmp		_sorted


_sorted:
	mov		rdi, [rdi + 8]	; rdi = lst->next
	jmp		_init

_swap:
	push	r12
	push	r14
	mov		r12, [rdi]		; r12 = lst->data
	mov		r14, [r13]		; list->data = list->next->data
	mov		[rdi], r14
	mov		[r13], r12      ; list->next->data = list->data
	pop		r14
	pop		r12
	mov		rdi, rbx
	jmp		_init

_ret:
	pop		rbx

_fin:
	ret
