section .rodata
	equal_response db "Is equal", 10, 0
	equal_response_length equ $-equal_response
	above_response db "Is above", 10, 0
	above_response_length equ $-above_response
	below_response db "Is below", 10, 0
	below_response_length equ $-below_response

section .text
	global _start

_start:
	mov rax, 75
	cmp rax, 75
	je _is_equal
	ja _is_above
	jb _is_below

_is_equal:
	mov rax, 1
	mov rdi, 1
	mov rsi, equal_response
	mov rdx, equal_response_length
	syscall
	jmp _exit

_is_above:
	mov rax, 1
	mov rdi, 1
	mov rsi, above_response
	mov rdx, above_response_length
	syscall
	jmp _exit

_is_below:
	mov rax, 1
	mov rdi, 1
	mov rsi, below_response
	mov rdx, below_response_length
	syscall
	jmp _exit

_exit:
	mov rax, 60
	mov rdi, 0
	syscall