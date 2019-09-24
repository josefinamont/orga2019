# ejercicio: main que llama a una función para que sume 2 numeros

#include <mips/regdef.h>
#include <sys/syscall.h>

	.text			# segmento de texto del programa

	.abicalls
	.align 2		# alineacion 2^2

	.globl	suma
	.ent	suma

suma:
	.frame	$fp, 40, ra

	.set	noreorder	# apaga reordenamiento de instrucciones
	.cpload t9		# directiva usada para codigo PIC
	.set	reorder	

	subu	sp, sp, 40	# 4 (SRA) + 2 (LTA) + 4 (ABA)

	.cprestore 24		# inserta aqui "sw gp, 24(sp)",
						# mas "lw gp, 24(sp)" luego de cada jal.
						# salvado de callee-saved regs en SRA	
	sw	$fp, 28(sp)
	move	$fp, sp

	sw	a0, 40($fp)	
	sw	a1, 44($fp)	

	addu t0, a0, a1
	sw t0, 16($fp)

	li	v0, t0

	lw	$fp, 28(sp)
	addu	sp,sp,40
	jr	ra

	.end suma