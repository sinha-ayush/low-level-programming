; > Program One 
; > Author: Ayush Kumar Sinha
; The only interface an asm programmer has above the actual hardware is the kernel itself. 
; In order to build useful programs in assembly we need to use the linux system calls provided by the kernel. These system calls are a library built into the operating system to provide functions such as reading input from a keyboard and writing output to the screen.
; When you invoke a system call the kernel will immediately suspend execution of your program. It will then contact the necessary drivers needed to perform the task you requested on the hardware and then return control back to your program.
; Note: Drivers are called drivers because the kernel literally uses them to drive the hardware.
; We can accomplish this all in assembly by loading EAX with the function number (operation code OPCODE) we want to execute and filling the remaining registers with the arguments we want to pass to the system call. A software interrupt is requested with the INT instruction and the kernel takes over and calls the function from the library with our arguments. Simple.
; For example requesting an interrupt when EAX=1 will call sys_exit and requesting an interrupt when EAX=4 will call sys_write instead. EBX, ECX & EDX will be passed as arguments if the function requires them.

section .text
	global _start
	_start:
		mov eax,4 	;invoking system call sys_write
		mov ebx,1 	;argument one: write to the stdout file
		mov ecx,message	;argument two: memory address of string 
		mov edx,13      ;argument three: length of the string
		int 80h		;interrupt
section .data
		message	db 'HELLO WORLD!',0Ah 	;assigning the string in message identifier
						;here, 0Ah is the line feed character
section .bss
