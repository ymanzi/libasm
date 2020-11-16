
	section .text
	global	_ft_isspace


_ft_isspace:			; rdi = char
	xor	rax, rax
	
_check_space:
        cmp     dil, 32  ; space
        je      _yes
        cmp     dil, 9  ;  '\t'
        je      _yes
        cmp     dil, 10  ; '\n'
        je      _yes
        cmp     dil, 11  ; '\v'
        je      _yes
        cmp     dil, 12  ; '\f'
        je      _yes
        cmp     dil, 13  ; '\r'
        je      _yes
	ret

_yes:
	mov	rax, 1
	ret
