section .rodata
	prompt db "Quel est votre nom ?", 10, 0
	prompt_len equ $-prompt
	response db "Bienvenue "
	response_len equ $-response

section .bss
	input_buffer resb 128

section .text
	global _start

_start:
	; print the prompt
	mov rax, 1
	mov rdi, 1
	mov rsi, prompt
	mov rdx, prompt_len
	syscall

	; get the input
	mov rax, 0
	mov rdi, 0
	mov rsi, input_buffer
	mov rdx, 128
	syscall

	mov rbx, rax ; save the input length

	; print the response
	mov rax, 1
	mov rdi, 1
	mov rsi, response
	mov rdx, response_len
	syscall
	mov rax, 1
	mov rdi, 1
	mov rsi, input_buffer
	mov rdx, rbx
	syscall

	; exit the program
	jmp _exit
_exit:
	mov rax, 60
	mov rdi, 0
	syscall