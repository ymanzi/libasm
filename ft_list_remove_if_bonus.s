
; void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));

	section	.text
	global	_ft_list_remove_if

_ft_list_remove_if:		; rdi = t_list **begin_list/ rsi= void *data_ref / rdx = fct cmp / rcx =free
	push	r12
	push	r13
	push	rbp
	cmp		rdi, 0		; **begin != 0
	jz		_ret
	cmp		rdx, 0		; *cmp != 0
	jz		_ret
	cmp		rcx, 0		; *free != 0
	jz		_ret
	xor		rbp, rbp		; previous
	mov		r12, [rdi]  ; rbx = *begin

_init:
	cmp		QWORD [rdi], 0
	jz		_fin
	push	rdi
	push	rsi
	push	rdx
	push	rcx
	mov		r8, [rdi]		; r8 = *elem
	mov		rdi,[r8]		; rdi = (*begin)->data
	cmp		rdi, 0			;
	jz		_compare_null	;
	call	rdx				; strcmp

_init2:
	pop		rcx
	pop		rdx
	pop		rsi
	pop		rdi
	cmp		rax, 0
	jz		_free_elem

_inc:
	mov		r8, [rdi]
	mov		rbp, [rdi]
	mov		r9 , [r8 + 8]
	mov		[rdi], r9
	jmp		_init

_compare_null:
	xor		rdi, rsi
	mov		rax, rdi
	jmp		_init2

_free_elem:    
	push	rsi
	push	rdx
	push	rcx
	push	rdi
	mov		r8, [rdi]		; r8 = *elem
	mov     r13, [r8 + 8]   ; r13 = (*elem)->next
	mov		rdi, [r8]		; rdi = (*elem)->data
	call	rcx				; free(data)
	pop     rdi
	pop		rcx
	push	rcx
	push	rdi
	mov		r8, [rdi]
	mov		rdi, r8			; rdi = *elem
	call	rcx				; free(*elem)
	pop		rdi
	pop		rcx
	pop		rdx
	pop		rsi
	mov		[rdi], r13
	cmp		rbp, 0
	jz		_first
	mov		[rbp + 8], r13
	jmp		_init

_first:
	mov		r12, r13
	jmp		_init

_fin:
	mov		[rdi], r12

_ret:
	pop		rbp
	pop		r13
	pop		r12
	ret
	
