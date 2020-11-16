extern	_ft_isspace
extern	_ft_issign
extern	_ft_is_in_str
extern	_ft_strlen
extern	_ft_check_base

	section .text
	global _ft_atoi_base

_ft_atoi_base:			; rdi = *char, rsi = *base
	push	rbx
	push	rcx
	push	r8
	push	r9
	push	r10
	push	r11
	xor	rbx, rbx	; i = 0	
	xor	rcx, rcx	; len base
	xor	r9, r9		; somme = 0
	mov	r8, 1		; moins = 1
	mov	r10, rdi	; *char
	mov	r11, rsi	; *base

_init_fct:
	mov	rdi, r11
	call	_ft_strlen
	cmp	rax, 1        
	jle	_fini		 ; if len(bas) <= 1
;	mov	r11, rdi         verif si inutile
	mov	rcx, rax	; len(base)

_check_error:
	mov	rdi, r11
	call	_ft_check_base
	cmp	rax, 0
	jz	_fini

_check_space:
	xor	rdi, rdi
	mov	dil, BYTE[r10 + rbx]
	call	_ft_isspace
	cmp	rax, 0
	jz	_check_signe
	inc	rbx
	jmp	_check_space

_check_signe:
	xor	rdi, rdi
	mov	dil, BYTE[r10 + rbx]
	call	_ft_issign
	cmp	rax, 0
	je	_calcul_somme
	mul	r8
	mov	r8, rax
	inc	rbx
	jmp	_check_signe

_calcul_somme:
	xor	rdi, rdi
	mov	dil, BYTE[r10 + rbx]
	cmp	dil, 0
	jz	_fini
	mov	rsi, r11
	call	_ft_is_in_str
	cmp	rax, -1	
	je	_fini
	push	rax
	mov	rax, rcx
	mul	r9
	mov	r9, rax
	pop	rax
	add	r9, rax
	inc	rbx
	jmp	_calcul_somme
	
_fini:
	mov	rax, r9
	mul	r8
	pop	r11
	pop	r10
	pop	r9
	pop	r8
	pop	rcx
	pop	rbx
	ret

