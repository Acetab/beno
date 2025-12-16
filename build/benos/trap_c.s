	.file	"trap.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.type	get_current, @function
get_current:
.LFB35:
	.file 1 "include/asm/current.h"
	.loc 1 5 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	s0,8(sp)
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 7 9
	mv	a5,tp
	.loc 1 8 1
	mv	a0,a5
	ld	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE35:
	.size	get_current, .-get_current
	.section	.rodata
	.align	3
.LC0:
	.string	"Kernel panic\n"
	.text
	.align	2
	.globl	panic
	.type	panic, @function
panic:
.LFB43:
	.file 2 "src/trap.c"
	.loc 2 26 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 27 2
	lla	a0,.LC0
	call	printk
.L4:
	.loc 2 28 7 discriminator 1
	j	.L4
	.cfi_endproc
.LFE43:
	.size	panic, .-panic
	.section	.rodata
	.align	3
.LC1:
	.string	"sepc: %016lx ra : %016lx sp : %016lx\n"
	.align	3
.LC2:
	.string	" gp : %016lx tp : %016lx t0 : %016lx\n"
	.align	3
.LC3:
	.string	" t1 : %016lx t2 : %016lx t3 : %016lx\n"
	.align	3
.LC4:
	.string	" s1 : %016lx a0 : %016lx a1 : %016lx\n"
	.align	3
.LC5:
	.string	" a2 : %016lx a3 : %016lx a4 : %016lx\n"
	.align	3
.LC6:
	.string	" a5 : %016lx a6 : %016lx a7 : %016lx\n"
	.align	3
.LC7:
	.string	" s2 : %016lx s3 : %016lx s4 : %016lx\n"
	.align	3
.LC8:
	.string	" s5 : %016lx s6 : %016lx s7 : %016lx\n"
	.align	3
.LC9:
	.string	" s8 : %016lx s9 : %016lx s10: %016lx\n"
	.align	3
.LC10:
	.string	" s11: %016lx t3 : %016lx t4: %016lx\n"
	.align	3
.LC11:
	.string	" t5 : %016lx t6 : %016lx\n"
	.text
	.align	2
	.globl	show_regs
	.type	show_regs, @function
show_regs:
.LFB44:
	.loc 2 33 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 2 34 2
	ld	a5,-24(s0)
	ld	a4,0(a5)
	ld	a5,-24(s0)
	ld	a2,8(a5)
	ld	a5,-24(s0)
	ld	a5,16(a5)
	mv	a3,a5
	mv	a1,a4
	lla	a0,.LC1
	call	printk
	.loc 2 36 2
	ld	a5,-24(s0)
	ld	a4,24(a5)
	ld	a5,-24(s0)
	ld	a2,32(a5)
	ld	a5,-24(s0)
	ld	a5,40(a5)
	mv	a3,a5
	mv	a1,a4
	lla	a0,.LC2
	call	printk
	.loc 2 38 2
	ld	a5,-24(s0)
	ld	a4,48(a5)
	ld	a5,-24(s0)
	ld	a2,56(a5)
	ld	a5,-24(s0)
	ld	a5,64(a5)
	mv	a3,a5
	mv	a1,a4
	lla	a0,.LC3
	call	printk
	.loc 2 40 2
	ld	a5,-24(s0)
	ld	a4,72(a5)
	ld	a5,-24(s0)
	ld	a2,80(a5)
	ld	a5,-24(s0)
	ld	a5,88(a5)
	mv	a3,a5
	mv	a1,a4
	lla	a0,.LC4
	call	printk
	.loc 2 42 2
	ld	a5,-24(s0)
	ld	a4,96(a5)
	ld	a5,-24(s0)
	ld	a2,104(a5)
	ld	a5,-24(s0)
	ld	a5,112(a5)
	mv	a3,a5
	mv	a1,a4
	lla	a0,.LC5
	call	printk
	.loc 2 44 2
	ld	a5,-24(s0)
	ld	a4,120(a5)
	ld	a5,-24(s0)
	ld	a2,128(a5)
	ld	a5,-24(s0)
	ld	a5,136(a5)
	mv	a3,a5
	mv	a1,a4
	lla	a0,.LC6
	call	printk
	.loc 2 46 2
	ld	a5,-24(s0)
	ld	a4,144(a5)
	ld	a5,-24(s0)
	ld	a2,152(a5)
	ld	a5,-24(s0)
	ld	a5,160(a5)
	mv	a3,a5
	mv	a1,a4
	lla	a0,.LC7
	call	printk
	.loc 2 48 2
	ld	a5,-24(s0)
	ld	a4,168(a5)
	ld	a5,-24(s0)
	ld	a2,176(a5)
	ld	a5,-24(s0)
	ld	a5,184(a5)
	mv	a3,a5
	mv	a1,a4
	lla	a0,.LC8
	call	printk
	.loc 2 50 2
	ld	a5,-24(s0)
	ld	a4,192(a5)
	ld	a5,-24(s0)
	ld	a2,200(a5)
	ld	a5,-24(s0)
	ld	a5,208(a5)
	mv	a3,a5
	mv	a1,a4
	lla	a0,.LC9
	call	printk
	.loc 2 52 2
	ld	a5,-24(s0)
	ld	a4,216(a5)
	ld	a5,-24(s0)
	ld	a2,224(a5)
	ld	a5,-24(s0)
	ld	a5,232(a5)
	mv	a3,a5
	mv	a1,a4
	lla	a0,.LC10
	call	printk
	.loc 2 54 2
	ld	a5,-24(s0)
	ld	a4,240(a5)
	ld	a5,-24(s0)
	ld	a5,248(a5)
	mv	a2,a5
	mv	a1,a4
	lla	a0,.LC11
	call	printk
	.loc 2 56 1
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE44:
	.size	show_regs, .-show_regs
	.section	.rodata
	.align	3
.LC12:
	.string	"Oops - %s\n"
	.align	3
.LC13:
	.string	"sstatus:0x%016lx  sbadaddr:0x%016lx  scause:0x%016lx\n"
	.text
	.align	2
	.type	do_trap_error, @function
do_trap_error:
.LFB45:
	.loc 2 59 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	.loc 2 60 2
	ld	a1,-32(s0)
	lla	a0,.LC12
	call	printk
	.loc 2 61 2
	ld	a0,-24(s0)
	call	dump_stack
	.loc 2 62 2
	ld	a0,-24(s0)
	call	show_regs
	.loc 2 63 2
	ld	a5,-24(s0)
	ld	a4,256(a5)
	ld	a5,-24(s0)
	ld	a2,264(a5)
	ld	a5,-24(s0)
	ld	a5,272(a5)
	mv	a3,a5
	mv	a1,a4
	lla	a0,.LC13
	call	printk
	.loc 2 65 2
	call	panic
	.loc 2 66 1
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE45:
	.size	do_trap_error, .-do_trap_error
	.align	2
	.globl	do_trap_unknown
	.type	do_trap_unknown, @function
do_trap_unknown:
.LFB46:
	.loc 2 75 60
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	.loc 2 75 62
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	do_trap_error
	.loc 2 75 95
	li	a5,0
	.loc 2 75 98
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE46:
	.size	do_trap_unknown, .-do_trap_unknown
	.align	2
	.globl	do_trap_insn_misaligned
	.type	do_trap_insn_misaligned, @function
do_trap_insn_misaligned:
.LFB47:
	.loc 2 76 68
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	.loc 2 76 70
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	do_trap_error
	.loc 2 76 103
	li	a5,0
	.loc 2 76 106
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE47:
	.size	do_trap_insn_misaligned, .-do_trap_insn_misaligned
	.align	2
	.globl	do_trap_insn_fault
	.type	do_trap_insn_fault, @function
do_trap_insn_fault:
.LFB48:
	.loc 2 77 63
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	.loc 2 77 65
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	do_trap_error
	.loc 2 77 98
	li	a5,0
	.loc 2 77 101
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE48:
	.size	do_trap_insn_fault, .-do_trap_insn_fault
	.align	2
	.globl	do_trap_insn_illegal
	.type	do_trap_insn_illegal, @function
do_trap_insn_illegal:
.LFB49:
	.loc 2 78 65
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	.loc 2 78 67
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	do_trap_error
	.loc 2 78 100
	li	a5,0
	.loc 2 78 103
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE49:
	.size	do_trap_insn_illegal, .-do_trap_insn_illegal
	.align	2
	.globl	do_trap_load_misaligned
	.type	do_trap_load_misaligned, @function
do_trap_load_misaligned:
.LFB50:
	.loc 2 79 68
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	.loc 2 79 70
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	do_trap_error
	.loc 2 79 103
	li	a5,0
	.loc 2 79 106
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE50:
	.size	do_trap_load_misaligned, .-do_trap_load_misaligned
	.align	2
	.globl	do_trap_load_fault
	.type	do_trap_load_fault, @function
do_trap_load_fault:
.LFB51:
	.loc 2 80 63
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	.loc 2 80 65
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	do_trap_error
	.loc 2 80 98
	li	a5,0
	.loc 2 80 101
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE51:
	.size	do_trap_load_fault, .-do_trap_load_fault
	.align	2
	.globl	do_trap_store_misaligned
	.type	do_trap_store_misaligned, @function
do_trap_store_misaligned:
.LFB52:
	.loc 2 81 69
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	.loc 2 81 71
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	do_trap_error
	.loc 2 81 104
	li	a5,0
	.loc 2 81 107
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE52:
	.size	do_trap_store_misaligned, .-do_trap_store_misaligned
	.align	2
	.globl	do_trap_store_fault
	.type	do_trap_store_fault, @function
do_trap_store_fault:
.LFB53:
	.loc 2 82 64
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	.loc 2 82 66
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	do_trap_error
	.loc 2 82 99
	li	a5,0
	.loc 2 82 102
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE53:
	.size	do_trap_store_fault, .-do_trap_store_fault
	.align	2
	.globl	do_trap_ecall_u
	.type	do_trap_ecall_u, @function
do_trap_ecall_u:
.LFB54:
	.loc 2 83 60
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	.loc 2 83 62
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	do_trap_error
	.loc 2 83 95
	li	a5,0
	.loc 2 83 98
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE54:
	.size	do_trap_ecall_u, .-do_trap_ecall_u
	.align	2
	.globl	do_trap_ecall_s
	.type	do_trap_ecall_s, @function
do_trap_ecall_s:
.LFB55:
	.loc 2 84 60
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	.loc 2 84 62
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	do_trap_error
	.loc 2 84 95
	li	a5,0
	.loc 2 84 98
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE55:
	.size	do_trap_ecall_s, .-do_trap_ecall_s
	.align	2
	.globl	do_trap_break
	.type	do_trap_break, @function
do_trap_break:
.LFB56:
	.loc 2 85 58
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	.loc 2 85 60
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	do_trap_error
	.loc 2 85 93
	li	a5,0
	.loc 2 85 96
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE56:
	.size	do_trap_break, .-do_trap_break
	.align	2
	.globl	do_page_fault
	.type	do_page_fault, @function
do_page_fault:
.LFB57:
	.loc 2 86 58
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	.loc 2 86 60
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	do_trap_error
	.loc 2 86 93
	li	a5,0
	.loc 2 86 96
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE57:
	.size	do_page_fault, .-do_page_fault
	.section	.rodata
	.align	3
.LC14:
	.string	"Instruction address misaligned"
	.align	3
.LC15:
	.string	"Instruction access fault"
	.align	3
.LC16:
	.string	"Illegal instruction"
	.align	3
.LC17:
	.string	"Breakpoint"
	.align	3
.LC18:
	.string	"Load address misaligned"
	.align	3
.LC19:
	.string	"Load access fault"
	.align	3
.LC20:
	.string	"Store/AMO address misaligned"
	.align	3
.LC21:
	.string	"Store/AMO access fault"
	.align	3
.LC22:
	.string	"Environment call from U-mode"
	.align	3
.LC23:
	.string	"Environment call from S-mode"
	.align	3
.LC24:
	.string	"unknown 10"
	.align	3
.LC25:
	.string	"unknown 11"
	.align	3
.LC26:
	.string	"Instruction page fault"
	.align	3
.LC27:
	.string	"Load page fault"
	.align	3
.LC28:
	.string	"unknown 14"
	.align	3
.LC29:
	.string	"Store/AMO page fault"
	.align	3
	.type	fault_info, @object
	.size	fault_info, 256
fault_info:
	.dword	do_trap_insn_misaligned
	.dword	.LC14
	.dword	do_trap_insn_fault
	.dword	.LC15
	.dword	do_trap_insn_illegal
	.dword	.LC16
	.dword	do_trap_break
	.dword	.LC17
	.dword	do_trap_load_misaligned
	.dword	.LC18
	.dword	do_trap_load_fault
	.dword	.LC19
	.dword	do_trap_store_misaligned
	.dword	.LC20
	.dword	do_trap_store_fault
	.dword	.LC21
	.dword	do_trap_ecall_u
	.dword	.LC22
	.dword	do_trap_ecall_s
	.dword	.LC23
	.dword	do_trap_unknown
	.dword	.LC24
	.dword	do_trap_unknown
	.dword	.LC25
	.dword	do_page_fault
	.dword	.LC26
	.dword	do_page_fault
	.dword	.LC27
	.dword	do_trap_unknown
	.dword	.LC28
	.dword	do_page_fault
	.dword	.LC29
	.text
	.align	2
	.type	ec_to_fault_info, @function
ec_to_fault_info:
.LFB58:
	.loc 2 108 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 2 109 30
	lwu	a5,-20(s0)
	andi	a5,a5,15
	.loc 2 109 20
	slli	a4,a5,4
	lla	a5,fault_info
	add	a5,a4,a5
	.loc 2 110 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE58:
	.size	ec_to_fault_info, .-ec_to_fault_info
	.section	.rodata
	.align	3
.LC30:
	.string	"%s: running in HS mode\n"
	.align	3
.LC31:
	.string	"hstatus 0x%lx\n"
	.align	3
.LC32:
	.string	"read VS virtual address 0x%lx val 0x%lx\n"
	.align	3
.LC33:
	.string	"write VS address 0x%lx\n"
	.text
	.align	2
	.type	vs_sbi_ecall_handle, @function
vs_sbi_ecall_handle:
.LFB59:
	.loc 2 127 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sd	a1,-48(s0)
	sw	a5,-36(s0)
	.loc 2 128 6
	sw	zero,-20(s0)
	.loc 2 130 2
	lw	a5,-36(s0)
	sext.w	a5,a5
	beqz	a5,.L34
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,256
	bne	a4,a5,.L35
.LBB2:
	.loc 2 132 3
	lla	a1,__func__.1980
	lla	a0,.LC30
	call	printk
.LBB3:
	.loc 2 133 60
#APP
# 133 "src/trap.c" 1
	csrr a5, 0x600
# 0 "" 2
#NO_APP
	mv	ra,a5
	.loc 2 133 130
	mv	a5,ra
.LBE3:
	.loc 2 133 3
	mv	a1,a5
	lla	a0,.LC31
	call	printk
	.loc 2 135 23
	li	a0,805306368
	call	hlvwu
	sd	a0,-32(s0)
	.loc 2 136 3
	ld	a2,-32(s0)
	li	a1,805306368
	lla	a0,.LC32
	call	printk
	.loc 2 138 3
	li	a1,805306368
	lla	a0,.LC33
	call	printk
	.loc 2 139 3
	li	a5,567889920
	slli	a5,a5,2
	addi	a1,a5,801
	li	a0,805306368
	call	hsvw
	.loc 2 140 3
	j	.L35
.L34:
	.loc 2 142 3
	ld	a5,-48(s0)
	ld	a5,80(a5)
	mv	a0,a5
	call	riscv_vcpu_timer_event_start
	.loc 2 143 3
	nop
.L35:
.LBE2:
	.loc 2 147 5
	lw	a5,-20(s0)
	sext.w	a5,a5
	bnez	a5,.L36
	.loc 2 148 14
	ld	a5,-48(s0)
	ld	a5,0(a5)
	addi	a4,a5,4
	ld	a5,-48(s0)
	sd	a4,0(a5)
.L36:
	.loc 2 150 9
	lw	a5,-20(s0)
	.loc 2 151 1
	mv	a0,a5
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE59:
	.size	vs_sbi_ecall_handle, .-vs_sbi_ecall_handle
	.section	.rodata
	.align	3
.LC34:
	.string	"trap handler failed"
	.align	3
.LC35:
	.string	"unexpected interrupt cause"
	.align	3
.LC36:
	.string	"virtual ecall handler failed"
	.align	3
.LC37:
	.string	"%s\n"
	.text
	.align	2
	.globl	do_exception
	.type	do_exception, @function
do_exception:
.LFB60:
	.loc 2 154 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	sd	s0,48(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	sd	a0,-56(s0)
	sd	a1,-64(s0)
	.loc 2 156 16
	ld	a5,-56(s0)
	ld	a5,136(a5)
	sd	a5,-40(s0)
	.loc 2 157 14
	lla	a5,.LC34
	sd	a5,-24(s0)
	.loc 2 158 6
	sw	zero,-28(s0)
	.loc 2 163 6
	ld	a5,-64(s0)
	.loc 2 163 5
	bgez	a5,.L39
	.loc 2 164 18
	ld	a4,-64(s0)
	li	a5,-1
	srli	a5,a5,1
	and	a5,a4,a5
	.loc 2 164 3
	li	a4,9
	beq	a5,a4,.L40
	li	a4,9
	bgtu	a5,a4,.L41
	li	a4,1
	beq	a5,a4,.L53
	li	a4,5
	bne	a5,a4,.L41
	.loc 2 166 4
	call	handle_timer_irq
	.loc 2 167 4
	j	.L44
.L40:
	.loc 2 169 4
	ld	a0,-56(s0)
	call	plic_handle_irq
	.loc 2 170 4
	j	.L44
.L41:
	.loc 2 175 4
	lla	a0,.LC35
	call	printk
	.loc 2 176 4
	call	panic
	j	.L44
.L39:
	.loc 2 179 3
	ld	a4,-64(s0)
	li	a5,23
	beq	a4,a5,.L45
	ld	a4,-64(s0)
	li	a5,23
	bgtu	a4,a5,.L46
	ld	a4,-64(s0)
	li	a5,21
	bgtu	a4,a5,.L46
	ld	a4,-64(s0)
	li	a5,20
	bgeu	a4,a5,.L45
	ld	a4,-64(s0)
	li	a5,8
	beq	a4,a5,.L47
	ld	a4,-64(s0)
	li	a5,10
	beq	a4,a5,.L48
	j	.L46
.L47:
	.loc 2 186 15
	ld	a5,-56(s0)
	ld	a5,0(a5)
	addi	a4,a5,4
	ld	a5,-56(s0)
	sd	a4,0(a5)
	.loc 2 187 11
	ld	a5,-56(s0)
	ld	a4,184(a5)
	.loc 2 187 6
	li	a5,100
	bne	a4,a5,.L49
	.loc 2 188 16
	call	sys_show_student_info
	mv	a5,a0
	mv	a4,a5
	.loc 2 188 14
	ld	a5,-56(s0)
	sd	a4,80(a5)
	.loc 2 192 4
	j	.L44
.L49:
	.loc 2 190 5
	ld	a0,-56(s0)
	call	riscv_svc_handler
	.loc 2 192 4
	j	.L44
.L48:
	.loc 2 194 10
	ld	a5,-40(s0)
	sext.w	a5,a5
	ld	a1,-56(s0)
	mv	a0,a5
	call	vs_sbi_ecall_handle
	mv	a5,a0
	sw	a5,-28(s0)
	.loc 2 195 8
	lla	a5,.LC36
	sd	a5,-24(s0)
	.loc 2 196 4
	j	.L44
.L45:
	.loc 2 200 10
	ld	a0,-56(s0)
	call	stage2_page_fault
	.loc 2 201 10
	j	.L44
.L46:
	.loc 2 203 10
	ld	a5,-64(s0)
	sext.w	a5,a5
	mv	a0,a5
	call	ec_to_fault_info
	sd	a0,-48(s0)
	.loc 2 204 12
	ld	a5,-48(s0)
	ld	a4,0(a5)
	.loc 2 204 9
	ld	a5,-48(s0)
	ld	a5,8(a5)
	mv	a1,a5
	ld	a0,-56(s0)
	jalr	a4
.LVL0:
	mv	a5,a0
	.loc 2 204 7
	bnez	a5,.L44
	.loc 2 205 11
	li	a5,0
	j	.L51
.L53:
	.loc 2 173 4
	nop
.L44:
	.loc 2 209 5
	lw	a5,-28(s0)
	sext.w	a5,a5
	beqz	a5,.L52
	.loc 2 210 3
	ld	a1,-24(s0)
	lla	a0,.LC37
	call	printk
	.loc 2 211 3
	call	panic
.L52:
	.loc 2 214 9
	lw	a5,-28(s0)
.L51:
	.loc 2 215 1
	mv	a0,a5
	ld	ra,56(sp)
	.cfi_restore 1
	ld	s0,48(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE60:
	.size	do_exception, .-do_exception
	.align	2
	.type	hs_delegate_traps, @function
hs_delegate_traps:
.LFB61:
	.loc 2 218 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	s0,56(sp)
	.cfi_offset 8, -8
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	.loc 2 222 12
	li	a5,1092
	sd	a5,-24(s0)
	.loc 2 224 13
	li	a5,45056
	addi	a5,a5,429
	sd	a5,-32(s0)
.LBB4:
	.loc 2 230 19
	ld	a5,-32(s0)
	sd	a5,-40(s0)
	.loc 2 230 54
	ld	a5,-40(s0)
#APP
# 230 "src/trap.c" 1
	csrw 0x602, a5
# 0 "" 2
#NO_APP
.LBE4:
.LBB5:
	.loc 2 231 19
	ld	a5,-24(s0)
	sd	a5,-48(s0)
	.loc 2 231 53
	ld	a5,-48(s0)
#APP
# 231 "src/trap.c" 1
	csrw 0x603, a5
# 0 "" 2
#NO_APP
.LBE5:
.LBB6:
	.loc 2 233 19
	sd	zero,-56(s0)
	.loc 2 233 45
	ld	a5,-56(s0)
#APP
# 233 "src/trap.c" 1
	csrw 0x645, a5
# 0 "" 2
#NO_APP
.LBE6:
	.loc 2 234 1
	nop
	ld	s0,56(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE61:
	.size	hs_delegate_traps, .-hs_delegate_traps
	.section	.rodata
	.align	3
.LC38:
	.string	"stvec=0x%x, 0x%x\n"
	.text
	.align	2
	.globl	trap_init
	.type	trap_init, @function
trap_init:
.LFB62:
	.loc 2 237 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	.loc 2 238 2
	call	hs_delegate_traps
.LBB7:
	.loc 2 240 19
	sd	zero,-24(s0)
	.loc 2 240 45
	ld	a5,-24(s0)
#APP
# 240 "src/trap.c" 1
	csrw sscratch, a5
# 0 "" 2
#NO_APP
.LBE7:
.LBB8:
	.loc 2 242 19
	lla	a5,do_exception_vector
	sd	a5,-32(s0)
	.loc 2 242 63
	ld	a5,-32(s0)
#APP
# 242 "src/trap.c" 1
	csrw stvec, a5
# 0 "" 2
#NO_APP
.LBE8:
.LBB9:
	.loc 2 243 62
#APP
# 243 "src/trap.c" 1
	csrr a5, stvec
# 0 "" 2
#NO_APP
	mv	ra,a5
	.loc 2 243 132
	mv	a5,ra
.LBE9:
	.loc 2 243 2
	lla	a2,do_exception_vector
	mv	a1,a5
	lla	a0,.LC38
	call	printk
.LBB10:
	.loc 2 245 19
	li	a5,-1
	sd	a5,-40(s0)
	.loc 2 245 46
	ld	a5,-40(s0)
#APP
# 245 "src/trap.c" 1
	csrw sie, a5
# 0 "" 2
#NO_APP
.LBE10:
	.loc 2 246 1
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE62:
	.size	trap_init, .-trap_init
	.section	.rodata
	.align	3
	.type	__func__.1980, @object
	.size	__func__.1980, 20
__func__.1980:
	.string	"vs_sbi_ecall_handle"
	.text
.Letext0:
	.file 3 "include/asm/ptregs.h"
	.file 4 "include/asm/processor.h"
	.file 5 "include/list.h"
	.file 6 "include/sched.h"
	.file 7 "include/asm/syscall.h"
	.file 8 "include/type.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xc5b
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF81
	.byte	0xc
	.4byte	.LASF82
	.4byte	.LASF83
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF10
	.2byte	0x120
	.byte	0x3
	.byte	0xe
	.byte	0x8
	.4byte	0x1f7
	.byte	0x3
	.4byte	.LASF0
	.byte	0x3
	.byte	0x10
	.byte	0x10
	.4byte	0x1f7
	.byte	0
	.byte	0x4
	.string	"ra"
	.byte	0x3
	.byte	0x11
	.byte	0x10
	.4byte	0x1f7
	.byte	0x8
	.byte	0x4
	.string	"sp"
	.byte	0x3
	.byte	0x12
	.byte	0x10
	.4byte	0x1f7
	.byte	0x10
	.byte	0x4
	.string	"gp"
	.byte	0x3
	.byte	0x13
	.byte	0x10
	.4byte	0x1f7
	.byte	0x18
	.byte	0x4
	.string	"tp"
	.byte	0x3
	.byte	0x14
	.byte	0x10
	.4byte	0x1f7
	.byte	0x20
	.byte	0x4
	.string	"t0"
	.byte	0x3
	.byte	0x15
	.byte	0x10
	.4byte	0x1f7
	.byte	0x28
	.byte	0x4
	.string	"t1"
	.byte	0x3
	.byte	0x16
	.byte	0x10
	.4byte	0x1f7
	.byte	0x30
	.byte	0x4
	.string	"t2"
	.byte	0x3
	.byte	0x17
	.byte	0x10
	.4byte	0x1f7
	.byte	0x38
	.byte	0x4
	.string	"s0"
	.byte	0x3
	.byte	0x18
	.byte	0x10
	.4byte	0x1f7
	.byte	0x40
	.byte	0x4
	.string	"s1"
	.byte	0x3
	.byte	0x19
	.byte	0x10
	.4byte	0x1f7
	.byte	0x48
	.byte	0x4
	.string	"a0"
	.byte	0x3
	.byte	0x1a
	.byte	0x10
	.4byte	0x1f7
	.byte	0x50
	.byte	0x4
	.string	"a1"
	.byte	0x3
	.byte	0x1b
	.byte	0x10
	.4byte	0x1f7
	.byte	0x58
	.byte	0x4
	.string	"a2"
	.byte	0x3
	.byte	0x1c
	.byte	0x10
	.4byte	0x1f7
	.byte	0x60
	.byte	0x4
	.string	"a3"
	.byte	0x3
	.byte	0x1d
	.byte	0x10
	.4byte	0x1f7
	.byte	0x68
	.byte	0x4
	.string	"a4"
	.byte	0x3
	.byte	0x1e
	.byte	0x10
	.4byte	0x1f7
	.byte	0x70
	.byte	0x4
	.string	"a5"
	.byte	0x3
	.byte	0x1f
	.byte	0x10
	.4byte	0x1f7
	.byte	0x78
	.byte	0x4
	.string	"a6"
	.byte	0x3
	.byte	0x20
	.byte	0x10
	.4byte	0x1f7
	.byte	0x80
	.byte	0x4
	.string	"a7"
	.byte	0x3
	.byte	0x21
	.byte	0x10
	.4byte	0x1f7
	.byte	0x88
	.byte	0x4
	.string	"s2"
	.byte	0x3
	.byte	0x22
	.byte	0x10
	.4byte	0x1f7
	.byte	0x90
	.byte	0x4
	.string	"s3"
	.byte	0x3
	.byte	0x23
	.byte	0x10
	.4byte	0x1f7
	.byte	0x98
	.byte	0x4
	.string	"s4"
	.byte	0x3
	.byte	0x24
	.byte	0x10
	.4byte	0x1f7
	.byte	0xa0
	.byte	0x4
	.string	"s5"
	.byte	0x3
	.byte	0x25
	.byte	0x10
	.4byte	0x1f7
	.byte	0xa8
	.byte	0x4
	.string	"s6"
	.byte	0x3
	.byte	0x26
	.byte	0x10
	.4byte	0x1f7
	.byte	0xb0
	.byte	0x4
	.string	"s7"
	.byte	0x3
	.byte	0x27
	.byte	0x10
	.4byte	0x1f7
	.byte	0xb8
	.byte	0x4
	.string	"s8"
	.byte	0x3
	.byte	0x28
	.byte	0x10
	.4byte	0x1f7
	.byte	0xc0
	.byte	0x4
	.string	"s9"
	.byte	0x3
	.byte	0x29
	.byte	0x10
	.4byte	0x1f7
	.byte	0xc8
	.byte	0x4
	.string	"s10"
	.byte	0x3
	.byte	0x2a
	.byte	0x10
	.4byte	0x1f7
	.byte	0xd0
	.byte	0x4
	.string	"s11"
	.byte	0x3
	.byte	0x2b
	.byte	0x10
	.4byte	0x1f7
	.byte	0xd8
	.byte	0x4
	.string	"t3"
	.byte	0x3
	.byte	0x2c
	.byte	0x10
	.4byte	0x1f7
	.byte	0xe0
	.byte	0x4
	.string	"t4"
	.byte	0x3
	.byte	0x2d
	.byte	0x10
	.4byte	0x1f7
	.byte	0xe8
	.byte	0x4
	.string	"t5"
	.byte	0x3
	.byte	0x2e
	.byte	0x10
	.4byte	0x1f7
	.byte	0xf0
	.byte	0x4
	.string	"t6"
	.byte	0x3
	.byte	0x2f
	.byte	0x10
	.4byte	0x1f7
	.byte	0xf8
	.byte	0x5
	.4byte	.LASF1
	.byte	0x3
	.byte	0x31
	.byte	0x10
	.4byte	0x1f7
	.2byte	0x100
	.byte	0x5
	.4byte	.LASF2
	.byte	0x3
	.byte	0x32
	.byte	0x10
	.4byte	0x1f7
	.2byte	0x108
	.byte	0x5
	.4byte	.LASF3
	.byte	0x3
	.byte	0x33
	.byte	0x10
	.4byte	0x1f7
	.2byte	0x110
	.byte	0x5
	.4byte	.LASF4
	.byte	0x3
	.byte	0x34
	.byte	0x10
	.4byte	0x1f7
	.2byte	0x118
	.byte	0
	.byte	0x6
	.byte	0x8
	.byte	0x7
	.4byte	.LASF5
	.byte	0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x6
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.byte	0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x7
	.string	"u64"
	.byte	0x8
	.byte	0x9
	.byte	0x17
	.4byte	0x1f7
	.byte	0x6
	.byte	0x1
	.byte	0x2
	.4byte	.LASF9
	.byte	0x8
	.4byte	.LASF11
	.byte	0x70
	.byte	0x4
	.byte	0xf
	.byte	0x8
	.4byte	0x257
	.byte	0x4
	.string	"ra"
	.byte	0x4
	.byte	0x10
	.byte	0x10
	.4byte	0x1f7
	.byte	0
	.byte	0x4
	.string	"sp"
	.byte	0x4
	.byte	0x11
	.byte	0x10
	.4byte	0x1f7
	.byte	0x8
	.byte	0x4
	.string	"s"
	.byte	0x4
	.byte	0x14
	.byte	0x10
	.4byte	0x257
	.byte	0x10
	.byte	0
	.byte	0x9
	.4byte	0x1f7
	.4byte	0x267
	.byte	0xa
	.4byte	0x1f7
	.byte	0xb
	.byte	0
	.byte	0x8
	.4byte	.LASF12
	.byte	0x10
	.byte	0x5
	.byte	0x3
	.byte	0x8
	.4byte	0x28f
	.byte	0x3
	.4byte	.LASF13
	.byte	0x5
	.byte	0x4
	.byte	0x14
	.4byte	0x28f
	.byte	0
	.byte	0x3
	.4byte	.LASF14
	.byte	0x5
	.byte	0x4
	.byte	0x1b
	.4byte	0x28f
	.byte	0x8
	.byte	0
	.byte	0xb
	.byte	0x8
	.4byte	0x267
	.byte	0x8
	.4byte	.LASF15
	.byte	0x30
	.byte	0x6
	.byte	0x13
	.byte	0x8
	.4byte	0x2f1
	.byte	0x3
	.4byte	.LASF13
	.byte	0x6
	.byte	0x14
	.byte	0x1c
	.4byte	0x2f6
	.byte	0
	.byte	0x3
	.4byte	.LASF16
	.byte	0x6
	.byte	0x16
	.byte	0x9
	.4byte	0x3c4
	.byte	0x8
	.byte	0x3
	.4byte	.LASF17
	.byte	0x6
	.byte	0x17
	.byte	0x9
	.4byte	0x422
	.byte	0x10
	.byte	0x3
	.4byte	.LASF18
	.byte	0x6
	.byte	0x18
	.byte	0x9
	.4byte	0x422
	.byte	0x18
	.byte	0x3
	.4byte	.LASF19
	.byte	0x6
	.byte	0x19
	.byte	0x9
	.4byte	0x422
	.byte	0x20
	.byte	0x3
	.4byte	.LASF20
	.byte	0x6
	.byte	0x1a
	.byte	0x19
	.4byte	0x43c
	.byte	0x28
	.byte	0
	.byte	0xc
	.4byte	0x295
	.byte	0xb
	.byte	0x8
	.4byte	0x2f1
	.byte	0xd
	.4byte	0x307
	.byte	0xe
	.4byte	0x307
	.byte	0
	.byte	0xb
	.byte	0x8
	.4byte	0x30d
	.byte	0x8
	.4byte	.LASF21
	.byte	0xc0
	.byte	0x6
	.byte	0x32
	.byte	0x8
	.4byte	0x3c4
	.byte	0x3
	.4byte	.LASF11
	.byte	0x6
	.byte	0x33
	.byte	0x15
	.4byte	0x226
	.byte	0
	.byte	0x3
	.4byte	.LASF22
	.byte	0x6
	.byte	0x34
	.byte	0x6
	.4byte	0x48c
	.byte	0x70
	.byte	0x3
	.4byte	.LASF23
	.byte	0x6
	.byte	0x35
	.byte	0x6
	.4byte	0x48c
	.byte	0x74
	.byte	0x3
	.4byte	.LASF24
	.byte	0x6
	.byte	0x36
	.byte	0x10
	.4byte	0x1f7
	.byte	0x78
	.byte	0x3
	.4byte	.LASF25
	.byte	0x6
	.byte	0x37
	.byte	0x10
	.4byte	0x1f7
	.byte	0x80
	.byte	0x3
	.4byte	.LASF26
	.byte	0x6
	.byte	0x38
	.byte	0x12
	.4byte	0x442
	.byte	0x88
	.byte	0x3
	.4byte	.LASF27
	.byte	0x6
	.byte	0x39
	.byte	0x12
	.4byte	0x473
	.byte	0x8c
	.byte	0x4
	.string	"pid"
	.byte	0x6
	.byte	0x3a
	.byte	0x6
	.4byte	0x48c
	.byte	0x90
	.byte	0x3
	.4byte	.LASF28
	.byte	0x6
	.byte	0x3b
	.byte	0x13
	.4byte	0x267
	.byte	0x98
	.byte	0x3
	.4byte	.LASF29
	.byte	0x6
	.byte	0x3c
	.byte	0x6
	.4byte	0x48c
	.byte	0xa8
	.byte	0x3
	.4byte	.LASF30
	.byte	0x6
	.byte	0x3d
	.byte	0x6
	.4byte	0x48c
	.byte	0xac
	.byte	0x3
	.4byte	.LASF31
	.byte	0x6
	.byte	0x3e
	.byte	0x16
	.4byte	0x307
	.byte	0xb0
	.byte	0x3
	.4byte	.LASF32
	.byte	0x6
	.byte	0x3f
	.byte	0x16
	.4byte	0x307
	.byte	0xb8
	.byte	0
	.byte	0xb
	.byte	0x8
	.4byte	0x2fc
	.byte	0xd
	.4byte	0x3da
	.byte	0xe
	.4byte	0x3da
	.byte	0xe
	.4byte	0x307
	.byte	0
	.byte	0xb
	.byte	0x8
	.4byte	0x3e0
	.byte	0x8
	.4byte	.LASF33
	.byte	0x28
	.byte	0x6
	.byte	0x1e
	.byte	0x8
	.4byte	0x422
	.byte	0x3
	.4byte	.LASF34
	.byte	0x6
	.byte	0x1f
	.byte	0x13
	.4byte	0x267
	.byte	0
	.byte	0x3
	.4byte	.LASF35
	.byte	0x6
	.byte	0x20
	.byte	0xf
	.4byte	0x20c
	.byte	0x10
	.byte	0x3
	.4byte	.LASF36
	.byte	0x6
	.byte	0x21
	.byte	0x6
	.4byte	0x213
	.byte	0x18
	.byte	0x3
	.4byte	.LASF37
	.byte	0x6
	.byte	0x22
	.byte	0x16
	.4byte	0x307
	.byte	0x20
	.byte	0
	.byte	0xb
	.byte	0x8
	.4byte	0x3ca
	.byte	0xf
	.4byte	0x307
	.4byte	0x43c
	.byte	0xe
	.4byte	0x3da
	.byte	0xe
	.4byte	0x307
	.byte	0
	.byte	0xb
	.byte	0x8
	.4byte	0x428
	.byte	0x10
	.4byte	.LASF43
	.byte	0x7
	.byte	0x4
	.4byte	0x20c
	.byte	0x6
	.byte	0x25
	.byte	0x6
	.4byte	0x473
	.byte	0x11
	.4byte	.LASF38
	.byte	0
	.byte	0x11
	.4byte	.LASF39
	.byte	0x1
	.byte	0x11
	.4byte	.LASF40
	.byte	0x2
	.byte	0x11
	.4byte	.LASF41
	.byte	0x3
	.byte	0x11
	.4byte	.LASF42
	.byte	0x4
	.byte	0
	.byte	0x10
	.4byte	.LASF44
	.byte	0x7
	.byte	0x4
	.4byte	0x20c
	.byte	0x6
	.byte	0x2d
	.byte	0x6
	.4byte	0x48c
	.byte	0x11
	.4byte	.LASF45
	.byte	0x1
	.byte	0
	.byte	0x12
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x13
	.4byte	.LASF84
	.2byte	0x1000
	.byte	0x6
	.byte	0x46
	.byte	0x7
	.4byte	0x4ba
	.byte	0x14
	.4byte	.LASF46
	.byte	0x6
	.byte	0x47
	.byte	0x15
	.4byte	0x30d
	.byte	0x14
	.4byte	.LASF47
	.byte	0x6
	.byte	0x48
	.byte	0x10
	.4byte	0x4ba
	.byte	0
	.byte	0x9
	.4byte	0x1f7
	.4byte	0x4cb
	.byte	0x15
	.4byte	0x1f7
	.2byte	0x1ff
	.byte	0
	.byte	0x9
	.4byte	0x307
	.4byte	0x4d6
	.byte	0x16
	.byte	0
	.byte	0x17
	.4byte	.LASF48
	.byte	0x6
	.byte	0x5b
	.byte	0x1c
	.4byte	0x4cb
	.byte	0x17
	.4byte	.LASF49
	.byte	0x6
	.byte	0x5d
	.byte	0x19
	.4byte	0x493
	.byte	0x17
	.4byte	.LASF50
	.byte	0x6
	.byte	0x6c
	.byte	0x21
	.4byte	0x2f1
	.byte	0x18
	.4byte	.LASF51
	.byte	0x7
	.byte	0x6
	.byte	0x10
	.4byte	0x50b
	.byte	0xc
	.4byte	0x4fa
	.byte	0xb
	.byte	0x8
	.4byte	0x511
	.byte	0xf
	.4byte	0x520
	.4byte	0x520
	.byte	0xe
	.4byte	0x527
	.byte	0
	.byte	0x6
	.byte	0x8
	.byte	0x5
	.4byte	.LASF52
	.byte	0xb
	.byte	0x8
	.4byte	0x2d
	.byte	0x9
	.4byte	0x506
	.4byte	0x538
	.byte	0x16
	.byte	0
	.byte	0xc
	.4byte	0x52d
	.byte	0x17
	.4byte	.LASF53
	.byte	0x7
	.byte	0x8
	.byte	0x1b
	.4byte	0x538
	.byte	0x8
	.4byte	.LASF54
	.byte	0x10
	.byte	0x2
	.byte	0x14
	.byte	0x8
	.4byte	0x570
	.byte	0x4
	.string	"fn"
	.byte	0x2
	.byte	0x15
	.byte	0x8
	.4byte	0x59b
	.byte	0
	.byte	0x3
	.4byte	.LASF55
	.byte	0x2
	.byte	0x16
	.byte	0xe
	.4byte	0x589
	.byte	0x8
	.byte	0
	.byte	0xc
	.4byte	0x549
	.byte	0xf
	.4byte	0x48c
	.4byte	0x589
	.byte	0xe
	.4byte	0x527
	.byte	0xe
	.4byte	0x589
	.byte	0
	.byte	0xb
	.byte	0x8
	.4byte	0x596
	.byte	0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF56
	.byte	0xc
	.4byte	0x58f
	.byte	0xb
	.byte	0x8
	.4byte	0x575
	.byte	0x9
	.4byte	0x570
	.4byte	0x5b1
	.byte	0xa
	.4byte	0x1f7
	.byte	0xf
	.byte	0
	.byte	0xc
	.4byte	0x5a1
	.byte	0x19
	.4byte	.LASF54
	.byte	0x2
	.byte	0x58
	.byte	0x20
	.4byte	0x5b1
	.byte	0x9
	.byte	0x3
	.8byte	fault_info
	.byte	0x1a
	.4byte	.LASF78
	.byte	0x2
	.byte	0xec
	.byte	0x6
	.8byte	.LFB62
	.8byte	.LFE62-.LFB62
	.byte	0x1
	.byte	0x9c
	.4byte	0x67a
	.byte	0x1b
	.8byte	.LBB7
	.8byte	.LBE7-.LBB7
	.4byte	0x60f
	.byte	0x1c
	.string	"__v"
	.byte	0x2
	.byte	0xf0
	.byte	0x13
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1b
	.8byte	.LBB8
	.8byte	.LBE8-.LBB8
	.4byte	0x634
	.byte	0x1c
	.string	"__v"
	.byte	0x2
	.byte	0xf2
	.byte	0x13
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x1b
	.8byte	.LBB9
	.8byte	.LBE9-.LBB9
	.4byte	0x658
	.byte	0x1c
	.string	"__v"
	.byte	0x2
	.byte	0xf3
	.byte	0x39
	.4byte	0x1f7
	.byte	0x1
	.byte	0x51
	.byte	0
	.byte	0x1d
	.8byte	.LBB10
	.8byte	.LBE10-.LBB10
	.byte	0x1c
	.string	"__v"
	.byte	0x2
	.byte	0xf5
	.byte	0x13
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0
	.byte	0x1e
	.4byte	.LASF76
	.byte	0x2
	.byte	0xd9
	.byte	0xd
	.8byte	.LFB61
	.8byte	.LFE61-.LFB61
	.byte	0x1
	.byte	0x9c
	.4byte	0x722
	.byte	0x19
	.4byte	.LASF57
	.byte	0x2
	.byte	0xdb
	.byte	0x10
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x19
	.4byte	.LASF58
	.byte	0x2
	.byte	0xdc
	.byte	0x10
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1b
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.4byte	0x6db
	.byte	0x1c
	.string	"__v"
	.byte	0x2
	.byte	0xe6
	.byte	0x13
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0x1b
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.4byte	0x700
	.byte	0x1c
	.string	"__v"
	.byte	0x2
	.byte	0xe7
	.byte	0x13
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0
	.byte	0x1d
	.8byte	.LBB6
	.8byte	.LBE6-.LBB6
	.byte	0x1c
	.string	"__v"
	.byte	0x2
	.byte	0xe9
	.byte	0x13
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0
	.byte	0
	.byte	0x1f
	.4byte	.LASF63
	.byte	0x2
	.byte	0x99
	.byte	0x5
	.4byte	0x48c
	.8byte	.LFB60
	.8byte	.LFE60-.LFB60
	.byte	0x1
	.byte	0x9c
	.4byte	0x79f
	.byte	0x20
	.4byte	.LASF59
	.byte	0x2
	.byte	0x99
	.byte	0x22
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x20
	.4byte	.LASF3
	.byte	0x2
	.byte	0x99
	.byte	0x36
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x1c
	.string	"inf"
	.byte	0x2
	.byte	0x9b
	.byte	0x1b
	.4byte	0x79f
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x19
	.4byte	.LASF60
	.byte	0x2
	.byte	0x9c
	.byte	0x10
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1c
	.string	"msg"
	.byte	0x2
	.byte	0x9d
	.byte	0xe
	.4byte	0x589
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1c
	.string	"ret"
	.byte	0x2
	.byte	0x9e
	.byte	0x6
	.4byte	0x48c
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0
	.byte	0xb
	.byte	0x8
	.4byte	0x570
	.byte	0x21
	.4byte	.LASF61
	.byte	0x2
	.byte	0x7e
	.byte	0xc
	.4byte	0x48c
	.8byte	.LFB59
	.8byte	.LFE59-.LFB59
	.byte	0x1
	.byte	0x9c
	.4byte	0x85a
	.byte	0x22
	.string	"id"
	.byte	0x2
	.byte	0x7e
	.byte	0x2d
	.4byte	0x20c
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x20
	.4byte	.LASF59
	.byte	0x2
	.byte	0x7e
	.byte	0x41
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x1c
	.string	"ret"
	.byte	0x2
	.byte	0x80
	.byte	0x6
	.4byte	0x48c
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x23
	.4byte	.LASF85
	.4byte	0x86a
	.byte	0x9
	.byte	0x3
	.8byte	__func__.1980
	.byte	0x1d
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x1c
	.string	"val"
	.byte	0x2
	.byte	0x87
	.byte	0x11
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x24
	.4byte	.LASF86
	.byte	0x2
	.byte	0x8e
	.byte	0x3
	.4byte	0x48c
	.4byte	0x838
	.byte	0x25
	.byte	0
	.byte	0x1d
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0x1c
	.string	"__v"
	.byte	0x2
	.byte	0x85
	.byte	0x37
	.4byte	0x1f7
	.byte	0x1
	.byte	0x51
	.byte	0
	.byte	0
	.byte	0
	.byte	0x9
	.4byte	0x596
	.4byte	0x86a
	.byte	0xa
	.4byte	0x1f7
	.byte	0x13
	.byte	0
	.byte	0xc
	.4byte	0x85a
	.byte	0x26
	.4byte	.LASF62
	.byte	0x2
	.byte	0x6b
	.byte	0x28
	.4byte	0x79f
	.8byte	.LFB58
	.8byte	.LFE58-.LFB58
	.byte	0x1
	.byte	0x9c
	.4byte	0x8a1
	.byte	0x20
	.4byte	.LASF3
	.byte	0x2
	.byte	0x6b
	.byte	0x46
	.4byte	0x20c
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x1f
	.4byte	.LASF64
	.byte	0x2
	.byte	0x56
	.byte	0x5
	.4byte	0x48c
	.8byte	.LFB57
	.8byte	.LFE57-.LFB57
	.byte	0x1
	.byte	0x9c
	.4byte	0x8e2
	.byte	0x20
	.4byte	.LASF59
	.byte	0x2
	.byte	0x56
	.byte	0x23
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x22
	.string	"str"
	.byte	0x2
	.byte	0x56
	.byte	0x35
	.4byte	0x589
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x1f
	.4byte	.LASF65
	.byte	0x2
	.byte	0x55
	.byte	0x5
	.4byte	0x48c
	.8byte	.LFB56
	.8byte	.LFE56-.LFB56
	.byte	0x1
	.byte	0x9c
	.4byte	0x923
	.byte	0x20
	.4byte	.LASF59
	.byte	0x2
	.byte	0x55
	.byte	0x23
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x22
	.string	"str"
	.byte	0x2
	.byte	0x55
	.byte	0x35
	.4byte	0x589
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x1f
	.4byte	.LASF66
	.byte	0x2
	.byte	0x54
	.byte	0x5
	.4byte	0x48c
	.8byte	.LFB55
	.8byte	.LFE55-.LFB55
	.byte	0x1
	.byte	0x9c
	.4byte	0x964
	.byte	0x20
	.4byte	.LASF59
	.byte	0x2
	.byte	0x54
	.byte	0x25
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x22
	.string	"str"
	.byte	0x2
	.byte	0x54
	.byte	0x37
	.4byte	0x589
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x1f
	.4byte	.LASF67
	.byte	0x2
	.byte	0x53
	.byte	0x5
	.4byte	0x48c
	.8byte	.LFB54
	.8byte	.LFE54-.LFB54
	.byte	0x1
	.byte	0x9c
	.4byte	0x9a5
	.byte	0x20
	.4byte	.LASF59
	.byte	0x2
	.byte	0x53
	.byte	0x25
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x22
	.string	"str"
	.byte	0x2
	.byte	0x53
	.byte	0x37
	.4byte	0x589
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x1f
	.4byte	.LASF68
	.byte	0x2
	.byte	0x52
	.byte	0x5
	.4byte	0x48c
	.8byte	.LFB53
	.8byte	.LFE53-.LFB53
	.byte	0x1
	.byte	0x9c
	.4byte	0x9e6
	.byte	0x20
	.4byte	.LASF59
	.byte	0x2
	.byte	0x52
	.byte	0x29
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x22
	.string	"str"
	.byte	0x2
	.byte	0x52
	.byte	0x3b
	.4byte	0x589
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x1f
	.4byte	.LASF69
	.byte	0x2
	.byte	0x51
	.byte	0x5
	.4byte	0x48c
	.8byte	.LFB52
	.8byte	.LFE52-.LFB52
	.byte	0x1
	.byte	0x9c
	.4byte	0xa27
	.byte	0x20
	.4byte	.LASF59
	.byte	0x2
	.byte	0x51
	.byte	0x2e
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x22
	.string	"str"
	.byte	0x2
	.byte	0x51
	.byte	0x40
	.4byte	0x589
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x1f
	.4byte	.LASF70
	.byte	0x2
	.byte	0x50
	.byte	0x5
	.4byte	0x48c
	.8byte	.LFB51
	.8byte	.LFE51-.LFB51
	.byte	0x1
	.byte	0x9c
	.4byte	0xa68
	.byte	0x20
	.4byte	.LASF59
	.byte	0x2
	.byte	0x50
	.byte	0x28
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x22
	.string	"str"
	.byte	0x2
	.byte	0x50
	.byte	0x3a
	.4byte	0x589
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x1f
	.4byte	.LASF71
	.byte	0x2
	.byte	0x4f
	.byte	0x5
	.4byte	0x48c
	.8byte	.LFB50
	.8byte	.LFE50-.LFB50
	.byte	0x1
	.byte	0x9c
	.4byte	0xaa9
	.byte	0x20
	.4byte	.LASF59
	.byte	0x2
	.byte	0x4f
	.byte	0x2d
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x22
	.string	"str"
	.byte	0x2
	.byte	0x4f
	.byte	0x3f
	.4byte	0x589
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x1f
	.4byte	.LASF72
	.byte	0x2
	.byte	0x4e
	.byte	0x5
	.4byte	0x48c
	.8byte	.LFB49
	.8byte	.LFE49-.LFB49
	.byte	0x1
	.byte	0x9c
	.4byte	0xaea
	.byte	0x20
	.4byte	.LASF59
	.byte	0x2
	.byte	0x4e
	.byte	0x2a
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x22
	.string	"str"
	.byte	0x2
	.byte	0x4e
	.byte	0x3c
	.4byte	0x589
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x1f
	.4byte	.LASF73
	.byte	0x2
	.byte	0x4d
	.byte	0x5
	.4byte	0x48c
	.8byte	.LFB48
	.8byte	.LFE48-.LFB48
	.byte	0x1
	.byte	0x9c
	.4byte	0xb2b
	.byte	0x20
	.4byte	.LASF59
	.byte	0x2
	.byte	0x4d
	.byte	0x28
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x22
	.string	"str"
	.byte	0x2
	.byte	0x4d
	.byte	0x3a
	.4byte	0x589
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x1f
	.4byte	.LASF74
	.byte	0x2
	.byte	0x4c
	.byte	0x5
	.4byte	0x48c
	.8byte	.LFB47
	.8byte	.LFE47-.LFB47
	.byte	0x1
	.byte	0x9c
	.4byte	0xb6c
	.byte	0x20
	.4byte	.LASF59
	.byte	0x2
	.byte	0x4c
	.byte	0x2d
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x22
	.string	"str"
	.byte	0x2
	.byte	0x4c
	.byte	0x3f
	.4byte	0x589
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x1f
	.4byte	.LASF75
	.byte	0x2
	.byte	0x4b
	.byte	0x5
	.4byte	0x48c
	.8byte	.LFB46
	.8byte	.LFE46-.LFB46
	.byte	0x1
	.byte	0x9c
	.4byte	0xbad
	.byte	0x20
	.4byte	.LASF59
	.byte	0x2
	.byte	0x4b
	.byte	0x25
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x22
	.string	"str"
	.byte	0x2
	.byte	0x4b
	.byte	0x37
	.4byte	0x589
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x27
	.4byte	.LASF77
	.byte	0x2
	.byte	0x3a
	.byte	0xd
	.8byte	.LFB45
	.8byte	.LFE45-.LFB45
	.byte	0x1
	.byte	0x9c
	.4byte	0xbea
	.byte	0x20
	.4byte	.LASF59
	.byte	0x2
	.byte	0x3a
	.byte	0x2b
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x22
	.string	"str"
	.byte	0x2
	.byte	0x3a
	.byte	0x3d
	.4byte	0x589
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x1a
	.4byte	.LASF79
	.byte	0x2
	.byte	0x20
	.byte	0x6
	.8byte	.LFB44
	.8byte	.LFE44-.LFB44
	.byte	0x1
	.byte	0x9c
	.4byte	0xc18
	.byte	0x20
	.4byte	.LASF59
	.byte	0x2
	.byte	0x20
	.byte	0x20
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x28
	.4byte	.LASF87
	.byte	0x2
	.byte	0x19
	.byte	0x6
	.8byte	.LFB43
	.8byte	.LFE43-.LFB43
	.byte	0x1
	.byte	0x9c
	.byte	0x29
	.4byte	.LASF80
	.byte	0x1
	.byte	0x4
	.byte	0x1c
	.4byte	0x307
	.8byte	.LFB35
	.8byte	.LFE35-.LFB35
	.byte	0x1
	.byte	0x9c
	.byte	0x1c
	.string	"tp"
	.byte	0x1
	.byte	0x6
	.byte	0x1f
	.4byte	0x307
	.byte	0x1
	.byte	0x54
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0x1b
	.byte	0xe
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0x5
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x4
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3e
	.byte	0xb
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x17
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0x5
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1f
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x20
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x21
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x22
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x23
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x49
	.byte	0x13
	.byte	0x34
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x24
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x25
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x26
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x27
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x28
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x96,0x42
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x29
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF67:
	.string	"do_trap_ecall_u"
.LASF83:
	.string	"/home/acetab/\346\241\214\351\235\242/benos"
.LASF57:
	.string	"exceptions"
.LASF58:
	.string	"interrupt"
.LASF16:
	.string	"task_fork"
.LASF12:
	.string	"list_head"
.LASF30:
	.string	"priority"
.LASF23:
	.string	"need_resched"
.LASF73:
	.string	"do_trap_insn_fault"
.LASF13:
	.string	"next"
.LASF51:
	.string	"syscall_fn_t"
.LASF74:
	.string	"do_trap_insn_misaligned"
.LASF78:
	.string	"trap_init"
.LASF46:
	.string	"task"
.LASF21:
	.string	"task_struct"
.LASF86:
	.string	"riscv_vcpu_timer_event_start"
.LASF87:
	.string	"panic"
.LASF75:
	.string	"do_trap_unknown"
.LASF47:
	.string	"stack"
.LASF22:
	.string	"preempt_count"
.LASF38:
	.string	"TASK_RUNNING"
.LASF60:
	.string	"ecall_id"
.LASF40:
	.string	"TASK_UNINTERRUPTIBLE"
.LASF18:
	.string	"dequeue_task"
.LASF11:
	.string	"cpu_context"
.LASF24:
	.string	"kernel_sp"
.LASF76:
	.string	"hs_delegate_traps"
.LASF39:
	.string	"TASK_INTERRUPTIBLE"
.LASF20:
	.string	"pick_next_task"
.LASF19:
	.string	"task_tick"
.LASF53:
	.string	"syscall_table"
.LASF32:
	.string	"prev_task"
.LASF28:
	.string	"run_list"
.LASF62:
	.string	"ec_to_fault_info"
.LASF26:
	.string	"state"
.LASF55:
	.string	"name"
.LASF34:
	.string	"rq_head"
.LASF65:
	.string	"do_trap_break"
.LASF6:
	.string	"unsigned char"
.LASF29:
	.string	"counter"
.LASF41:
	.string	"TASK_ZOMBIE"
.LASF45:
	.string	"PF_KTHREAD"
.LASF79:
	.string	"show_regs"
.LASF27:
	.string	"flags"
.LASF0:
	.string	"sepc"
.LASF82:
	.string	"src/trap.c"
.LASF10:
	.string	"pt_regs"
.LASF7:
	.string	"short unsigned int"
.LASF17:
	.string	"enqueue_task"
.LASF66:
	.string	"do_trap_ecall_s"
.LASF56:
	.string	"char"
.LASF52:
	.string	"long int"
.LASF80:
	.string	"get_current"
.LASF54:
	.string	"fault_info"
.LASF37:
	.string	"curr"
.LASF64:
	.string	"do_page_fault"
.LASF84:
	.string	"task_union"
.LASF9:
	.string	"_Bool"
.LASF1:
	.string	"sstatus"
.LASF59:
	.string	"regs"
.LASF44:
	.string	"task_flags"
.LASF85:
	.string	"__func__"
.LASF61:
	.string	"vs_sbi_ecall_handle"
.LASF49:
	.string	"init_task_union"
.LASF4:
	.string	"hstatus"
.LASF5:
	.string	"long unsigned int"
.LASF43:
	.string	"task_state"
.LASF33:
	.string	"run_queue"
.LASF70:
	.string	"do_trap_load_fault"
.LASF25:
	.string	"user_sp"
.LASF36:
	.string	"nr_switches"
.LASF63:
	.string	"do_exception"
.LASF50:
	.string	"simple_sched_class"
.LASF69:
	.string	"do_trap_store_misaligned"
.LASF72:
	.string	"do_trap_insn_illegal"
.LASF48:
	.string	"g_task"
.LASF81:
	.string	"GNU C17 9.4.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF42:
	.string	"TASK_STOPPED"
.LASF35:
	.string	"nr_running"
.LASF71:
	.string	"do_trap_load_misaligned"
.LASF15:
	.string	"sched_class"
.LASF77:
	.string	"do_trap_error"
.LASF14:
	.string	"prev"
.LASF8:
	.string	"unsigned int"
.LASF31:
	.string	"next_task"
.LASF3:
	.string	"scause"
.LASF68:
	.string	"do_trap_store_fault"
.LASF2:
	.string	"sbadaddr"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
