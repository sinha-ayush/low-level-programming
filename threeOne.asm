;Author : Ayush Kumar Sinha

segment .data
	one db "one",0xA
section .bss
segment .text
	global _start
	_start:
		mov eax,one
		mov ebx,one
		
		strlen:
		cmp byte [eax],0
		jz finished
		inc eax
		jmp strlen
		
		finished:
		sub eax,ebx
		
		loop:
		mov edx,eax
		mov eax,4
		mov ebx,1
		mov ecx,one
		int 0x80
		jmp loop
