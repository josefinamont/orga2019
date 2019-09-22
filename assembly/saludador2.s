.file   1 "saludador.c"
        .section .mdebug.abi32
        .previous
        .abicalls
        .rdata
        .align  2
$LC0:
        .ascii  "Hello, World!\n\000"
        .text
        .align  2
        .globl  saludador
        .ent    saludador
saludador:
        .frame  $fp,40,$ra              # vars= 0, regs= 3/0, args= 16, extra= 8
        .mask   0xd0000000,-8
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $t9
        .set    reorder
        subu    $sp,$sp,40
        .cprestore 16
        sw      $ra,32($sp)
        sw      $fp,28($sp)
        sw      $gp,24($sp)
        move    $fp,$sp
        la      $a0,$LC0
        la      $t9,printf
        jal     $ra,$t9
        move    $v0,$zero
        move    $sp,$fp
        lw      $ra,32($sp)
        lw      $fp,28($sp)
        addu    $sp,$sp,40
        j       $ra
        .end    saludador
        .size   saludador, .-saludador
        .ident  "GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"