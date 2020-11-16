extern _ft_issign
extern _ft_isspace

	section .text
	global	_ft_check_base

_ft_check_base:			; rdi: base
	push	rdx
	push	rbx
	push	rcx
	push	r8		; rdi = base
	xor	rdx, rdx		; i = 0	
	mov	rax, 1      ;VERIFIER
	mov	r8, rdi
	cmp	r8, 0
	jz	_rep_found

_check_char:
	mov	rcx, rdx	; j = i
	inc	rcx		; j = i + 1
	mov	bl, BYTE[r8 + rdx]
	cmp	bl, 0
	je	_fin
	xor	rdi, rdi
	mov	dil, bl
	call	_ft_issign
	cmp	rax, 0
	jnz	_rep_found
	call	_ft_isspace
	cmp	rax, 0
	jnz	_rep_found

_check_rep:
	cmp	BYTE[r8 + rcx], 0
	je	_incre
	cmp	bl, BYTE[r8 + rcx]
	je	_rep_found
	inc	rcx
	jmp	_check_rep

_incre:
	inc	rdx
	jmp	_check_char

_rep_found:
	mov	rax, 0
	pop	r8
	pop	rcx
	pop	rbx
	pop	rdx
	ret

_fin:
	mov	rax, 1
	pop	r8
	pop	rcx
	pop	rbx
	pop	rdx
	ret
		
