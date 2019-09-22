#include <mips/regdef.h>
#include <sys/syscall.h>

	.text
	.abicalls
	.align 2
	.set noreorder
	.cpload t9
	.set reorder	
	.ent printHelloWorld
	.globl printHelloWorld

printHelloWorld:
		.frame $fp, 40, ra
		subu sp, sp, 40
		.cprestore 24
		sw ra, 32(sp)
		sw $fp, 28(sp)
		move $fp, sp

		li	a0, 1		
		la	a1, saludo	
		li	a2, 13
		li	v0, SYS_write
		syscall

		lw ra, 32(sp)
		lw $fp, 28(sp)
		addu sp, sp, 40
		jr ra
	.end printHelloWorld

.rdata
	.align 2
	saludo: .asciiz "Hello, World!"
