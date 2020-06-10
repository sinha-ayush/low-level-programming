section .data
	message db 'AYUSH SINHA',0Ah
section .bss
	;idhar meko kuch nahi karna
section .text
	global _start
	_start:
;============================================
;printing the message to the standard output
		mov eax,4
		mov ebx,1
		mov ecx,message
		mov edx,12
		int 80h
;=============================================
;termination
		mov eax,1
		mov ebx,0
		int 80h
