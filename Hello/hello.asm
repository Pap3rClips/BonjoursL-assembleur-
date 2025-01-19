section .rodata
	helloworld db "Hello world !", 10, 0
	helloworld_len equ $-helloworld

global _start
section .text
	_start:
		mov rax, 1
		mov rdi, 1
		mov rsi, helloworld
		mov rdx, helloworld_len
		syscall
		jmp _exit
	_exit:
		mov rax, 60
		mov rdi, 0
		syscall
