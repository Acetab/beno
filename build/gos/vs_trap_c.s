	.file	"vs_trap.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata
	.align	3
.LC0:
	.string	"VS Kernel panic\n"
	.text
	.align	2
	.type	vs_panic, @function
vs_panic:
.LFB1:
	.file 1 "gos/vs_trap.c"
	.loc 1 17 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 18 2
	lla	a0,.LC0
	call	printk
.L2:
	.loc 1 19 7 discriminator 1
	j	.L2
	.cfi_endproc
.LFE1:
	.size	vs_panic, .-vs_panic
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
	.type	vs_show_regs, @function
vs_show_regs:
.LFB2:
	.loc 1 24 1
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
	.loc 1 25 2
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
	.loc 1 27 2
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
	.loc 1 29 2
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
	.loc 1 31 2
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
	.loc 1 33 2
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
	.loc 1 35 2
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
	.loc 1 37 2
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
	.loc 1 39 2
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
	.loc 1 41 2
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
	.loc 1 43 2
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
	.loc 1 45 2
	ld	a5,-24(s0)
	ld	a4,240(a5)
	ld	a5,-24(s0)
	ld	a5,248(a5)
	mv	a2,a5
	mv	a1,a4
	lla	a0,.LC11
	call	printk
	.loc 1 47 1
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
.LFE2:
	.size	vs_show_regs, .-vs_show_regs
	.section	.rodata
	.align	3
.LC12:
	.string	"Oops - %s\n"
	.align	3
.LC13:
	.string	"sstatus:0x%016lx  sbadaddr:0x%016lx  scause:0x%016lx\n"
	.text
	.align	2
	.type	vs_trap_error, @function
vs_trap_error:
.LFB3:
	.loc 1 50 1
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
	.loc 1 51 2
	ld	a1,-32(s0)
	lla	a0,.LC12
	call	printk
	.loc 1 53 2
	ld	a0,-24(s0)
	call	vs_show_regs
	.loc 1 54 2
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
	.loc 1 56 2
	call	vs_panic
	.loc 1 57 1
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
.LFE3:
	.size	vs_trap_error, .-vs_trap_error
	.align	2
	.globl	vs_trap_unknown
	.type	vs_trap_unknown, @function
vs_trap_unknown:
.LFB4:
	.loc 1 66 60
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
	.loc 1 66 62
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	vs_trap_error
	.loc 1 66 95
	li	a5,0
	.loc 1 66 98
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
.LFE4:
	.size	vs_trap_unknown, .-vs_trap_unknown
	.align	2
	.globl	vs_trap_insn_misaligned
	.type	vs_trap_insn_misaligned, @function
vs_trap_insn_misaligned:
.LFB5:
	.loc 1 67 68
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
	.loc 1 67 70
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	vs_trap_error
	.loc 1 67 103
	li	a5,0
	.loc 1 67 106
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
.LFE5:
	.size	vs_trap_insn_misaligned, .-vs_trap_insn_misaligned
	.align	2
	.globl	vs_trap_insn_fault
	.type	vs_trap_insn_fault, @function
vs_trap_insn_fault:
.LFB6:
	.loc 1 68 63
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
	.loc 1 68 65
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	vs_trap_error
	.loc 1 68 98
	li	a5,0
	.loc 1 68 101
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
.LFE6:
	.size	vs_trap_insn_fault, .-vs_trap_insn_fault
	.align	2
	.globl	vs_trap_insn_illegal
	.type	vs_trap_insn_illegal, @function
vs_trap_insn_illegal:
.LFB7:
	.loc 1 69 65
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
	.loc 1 69 67
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	vs_trap_error
	.loc 1 69 100
	li	a5,0
	.loc 1 69 103
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
.LFE7:
	.size	vs_trap_insn_illegal, .-vs_trap_insn_illegal
	.align	2
	.globl	vs_trap_load_misaligned
	.type	vs_trap_load_misaligned, @function
vs_trap_load_misaligned:
.LFB8:
	.loc 1 70 68
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
	.loc 1 70 70
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	vs_trap_error
	.loc 1 70 103
	li	a5,0
	.loc 1 70 106
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
.LFE8:
	.size	vs_trap_load_misaligned, .-vs_trap_load_misaligned
	.align	2
	.globl	vs_trap_load_fault
	.type	vs_trap_load_fault, @function
vs_trap_load_fault:
.LFB9:
	.loc 1 71 63
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
	.loc 1 71 65
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	vs_trap_error
	.loc 1 71 98
	li	a5,0
	.loc 1 71 101
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
.LFE9:
	.size	vs_trap_load_fault, .-vs_trap_load_fault
	.align	2
	.globl	vs_trap_store_misaligned
	.type	vs_trap_store_misaligned, @function
vs_trap_store_misaligned:
.LFB10:
	.loc 1 72 69
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
	.loc 1 72 71
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	vs_trap_error
	.loc 1 72 104
	li	a5,0
	.loc 1 72 107
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
.LFE10:
	.size	vs_trap_store_misaligned, .-vs_trap_store_misaligned
	.align	2
	.globl	vs_trap_store_fault
	.type	vs_trap_store_fault, @function
vs_trap_store_fault:
.LFB11:
	.loc 1 73 64
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
	.loc 1 73 66
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	vs_trap_error
	.loc 1 73 99
	li	a5,0
	.loc 1 73 102
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
.LFE11:
	.size	vs_trap_store_fault, .-vs_trap_store_fault
	.align	2
	.globl	vs_trap_ecall_u
	.type	vs_trap_ecall_u, @function
vs_trap_ecall_u:
.LFB12:
	.loc 1 74 60
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
	.loc 1 74 62
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	vs_trap_error
	.loc 1 74 95
	li	a5,0
	.loc 1 74 98
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
.LFE12:
	.size	vs_trap_ecall_u, .-vs_trap_ecall_u
	.align	2
	.globl	vs_trap_ecall_s
	.type	vs_trap_ecall_s, @function
vs_trap_ecall_s:
.LFB13:
	.loc 1 75 60
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
	.loc 1 75 62
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	vs_trap_error
	.loc 1 75 95
	li	a5,0
	.loc 1 75 98
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
.LFE13:
	.size	vs_trap_ecall_s, .-vs_trap_ecall_s
	.align	2
	.globl	vs_trap_break
	.type	vs_trap_break, @function
vs_trap_break:
.LFB14:
	.loc 1 76 58
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
	.loc 1 76 60
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	vs_trap_error
	.loc 1 76 93
	li	a5,0
	.loc 1 76 96
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
.LFE14:
	.size	vs_trap_break, .-vs_trap_break
	.align	2
	.globl	vs_page_fault
	.type	vs_page_fault, @function
vs_page_fault:
.LFB15:
	.loc 1 77 58
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
	.loc 1 77 60
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	vs_trap_error
	.loc 1 77 93
	li	a5,0
	.loc 1 77 96
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
.LFE15:
	.size	vs_page_fault, .-vs_page_fault
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
	.dword	vs_trap_insn_misaligned
	.dword	.LC14
	.dword	vs_trap_insn_fault
	.dword	.LC15
	.dword	vs_trap_insn_illegal
	.dword	.LC16
	.dword	vs_trap_break
	.dword	.LC17
	.dword	vs_trap_load_misaligned
	.dword	.LC18
	.dword	vs_trap_load_fault
	.dword	.LC19
	.dword	vs_trap_store_misaligned
	.dword	.LC20
	.dword	vs_trap_store_fault
	.dword	.LC21
	.dword	vs_trap_ecall_u
	.dword	.LC22
	.dword	vs_trap_ecall_s
	.dword	.LC23
	.dword	vs_trap_unknown
	.dword	.LC24
	.dword	vs_trap_unknown
	.dword	.LC25
	.dword	vs_page_fault
	.dword	.LC26
	.dword	vs_page_fault
	.dword	.LC27
	.dword	vs_trap_unknown
	.dword	.LC28
	.dword	vs_page_fault
	.dword	.LC29
	.text
	.align	2
	.type	ec_to_fault_info, @function
ec_to_fault_info:
.LFB16:
	.loc 1 99 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 1 100 30
	lwu	a5,-20(s0)
	andi	a5,a5,15
	.loc 1 100 20
	slli	a4,a5,4
	lla	a5,fault_info
	add	a5,a4,a5
	.loc 1 101 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE16:
	.size	ec_to_fault_info, .-ec_to_fault_info
	.section	.rodata
	.align	3
.LC30:
	.string	"vs unexpected interrupt cause"
	.text
	.align	2
	.globl	do_vs_exception
	.type	do_vs_exception, @function
do_vs_exception:
.LFB17:
	.loc 1 104 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	.loc 1 109 6
	ld	a5,-48(s0)
	.loc 1 109 5
	bgez	a5,.L32
	.loc 1 110 18
	ld	a4,-48(s0)
	li	a5,-1
	srli	a5,a5,1
	and	a5,a4,a5
	.loc 1 110 3
	li	a4,5
	beq	a5,a4,.L33
	li	a4,9
	beq	a5,a4,.L34
	j	.L38
.L33:
	.loc 1 112 4
	call	vs_handle_timer_irq
	.loc 1 113 4
	j	.L31
.L34:
	.loc 1 115 4
	ld	a0,-40(s0)
	call	plic_handle_irq
	.loc 1 116 4
	j	.L31
.L38:
	.loc 1 118 4
	lla	a0,.LC30
	call	printk
	.loc 1 119 4
	call	vs_panic
	j	.L31
.L32:
	.loc 1 123 9
	ld	a5,-48(s0)
	sext.w	a5,a5
	mv	a0,a5
	call	ec_to_fault_info
	sd	a0,-24(s0)
	.loc 1 125 11
	ld	a5,-24(s0)
	ld	a4,0(a5)
	.loc 1 125 8
	ld	a5,-24(s0)
	ld	a5,8(a5)
	mv	a1,a5
	ld	a0,-40(s0)
	jalr	a4
.LVL0:
.L31:
	.loc 1 128 1
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE17:
	.size	do_vs_exception, .-do_vs_exception
	.align	2
	.globl	vs_trap_init
	.type	vs_trap_init, @function
vs_trap_init:
.LFB18:
	.loc 1 131 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
.LBB2:
	.loc 1 132 19
	sd	zero,-24(s0)
	.loc 1 132 45
	ld	a5,-24(s0)
#APP
# 132 "gos/vs_trap.c" 1
	csrw sscratch, a5
# 0 "" 2
#NO_APP
.LBE2:
.LBB3:
	.loc 1 134 19
	lla	a5,vs_exception_vector
	sd	a5,-32(s0)
	.loc 1 134 63
	ld	a5,-32(s0)
#APP
# 134 "gos/vs_trap.c" 1
	csrw stvec, a5
# 0 "" 2
#NO_APP
.LBE3:
.LBB4:
	.loc 1 137 19
	li	a5,-1
	sd	a5,-40(s0)
	.loc 1 137 46
	ld	a5,-40(s0)
#APP
# 137 "gos/vs_trap.c" 1
	csrw sie, a5
# 0 "" 2
#NO_APP
.LBE4:
	.loc 1 138 1
	nop
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE18:
	.size	vs_trap_init, .-vs_trap_init
.Letext0:
	.file 2 "include/asm/ptregs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x746
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF31
	.byte	0xc
	.4byte	.LASF32
	.4byte	.LASF33
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF10
	.2byte	0x120
	.byte	0x2
	.byte	0xe
	.byte	0x8
	.4byte	0x1f7
	.byte	0x3
	.4byte	.LASF0
	.byte	0x2
	.byte	0x10
	.byte	0x10
	.4byte	0x1f7
	.byte	0
	.byte	0x4
	.string	"ra"
	.byte	0x2
	.byte	0x11
	.byte	0x10
	.4byte	0x1f7
	.byte	0x8
	.byte	0x4
	.string	"sp"
	.byte	0x2
	.byte	0x12
	.byte	0x10
	.4byte	0x1f7
	.byte	0x10
	.byte	0x4
	.string	"gp"
	.byte	0x2
	.byte	0x13
	.byte	0x10
	.4byte	0x1f7
	.byte	0x18
	.byte	0x4
	.string	"tp"
	.byte	0x2
	.byte	0x14
	.byte	0x10
	.4byte	0x1f7
	.byte	0x20
	.byte	0x4
	.string	"t0"
	.byte	0x2
	.byte	0x15
	.byte	0x10
	.4byte	0x1f7
	.byte	0x28
	.byte	0x4
	.string	"t1"
	.byte	0x2
	.byte	0x16
	.byte	0x10
	.4byte	0x1f7
	.byte	0x30
	.byte	0x4
	.string	"t2"
	.byte	0x2
	.byte	0x17
	.byte	0x10
	.4byte	0x1f7
	.byte	0x38
	.byte	0x4
	.string	"s0"
	.byte	0x2
	.byte	0x18
	.byte	0x10
	.4byte	0x1f7
	.byte	0x40
	.byte	0x4
	.string	"s1"
	.byte	0x2
	.byte	0x19
	.byte	0x10
	.4byte	0x1f7
	.byte	0x48
	.byte	0x4
	.string	"a0"
	.byte	0x2
	.byte	0x1a
	.byte	0x10
	.4byte	0x1f7
	.byte	0x50
	.byte	0x4
	.string	"a1"
	.byte	0x2
	.byte	0x1b
	.byte	0x10
	.4byte	0x1f7
	.byte	0x58
	.byte	0x4
	.string	"a2"
	.byte	0x2
	.byte	0x1c
	.byte	0x10
	.4byte	0x1f7
	.byte	0x60
	.byte	0x4
	.string	"a3"
	.byte	0x2
	.byte	0x1d
	.byte	0x10
	.4byte	0x1f7
	.byte	0x68
	.byte	0x4
	.string	"a4"
	.byte	0x2
	.byte	0x1e
	.byte	0x10
	.4byte	0x1f7
	.byte	0x70
	.byte	0x4
	.string	"a5"
	.byte	0x2
	.byte	0x1f
	.byte	0x10
	.4byte	0x1f7
	.byte	0x78
	.byte	0x4
	.string	"a6"
	.byte	0x2
	.byte	0x20
	.byte	0x10
	.4byte	0x1f7
	.byte	0x80
	.byte	0x4
	.string	"a7"
	.byte	0x2
	.byte	0x21
	.byte	0x10
	.4byte	0x1f7
	.byte	0x88
	.byte	0x4
	.string	"s2"
	.byte	0x2
	.byte	0x22
	.byte	0x10
	.4byte	0x1f7
	.byte	0x90
	.byte	0x4
	.string	"s3"
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.4byte	0x1f7
	.byte	0x98
	.byte	0x4
	.string	"s4"
	.byte	0x2
	.byte	0x24
	.byte	0x10
	.4byte	0x1f7
	.byte	0xa0
	.byte	0x4
	.string	"s5"
	.byte	0x2
	.byte	0x25
	.byte	0x10
	.4byte	0x1f7
	.byte	0xa8
	.byte	0x4
	.string	"s6"
	.byte	0x2
	.byte	0x26
	.byte	0x10
	.4byte	0x1f7
	.byte	0xb0
	.byte	0x4
	.string	"s7"
	.byte	0x2
	.byte	0x27
	.byte	0x10
	.4byte	0x1f7
	.byte	0xb8
	.byte	0x4
	.string	"s8"
	.byte	0x2
	.byte	0x28
	.byte	0x10
	.4byte	0x1f7
	.byte	0xc0
	.byte	0x4
	.string	"s9"
	.byte	0x2
	.byte	0x29
	.byte	0x10
	.4byte	0x1f7
	.byte	0xc8
	.byte	0x4
	.string	"s10"
	.byte	0x2
	.byte	0x2a
	.byte	0x10
	.4byte	0x1f7
	.byte	0xd0
	.byte	0x4
	.string	"s11"
	.byte	0x2
	.byte	0x2b
	.byte	0x10
	.4byte	0x1f7
	.byte	0xd8
	.byte	0x4
	.string	"t3"
	.byte	0x2
	.byte	0x2c
	.byte	0x10
	.4byte	0x1f7
	.byte	0xe0
	.byte	0x4
	.string	"t4"
	.byte	0x2
	.byte	0x2d
	.byte	0x10
	.4byte	0x1f7
	.byte	0xe8
	.byte	0x4
	.string	"t5"
	.byte	0x2
	.byte	0x2e
	.byte	0x10
	.4byte	0x1f7
	.byte	0xf0
	.byte	0x4
	.string	"t6"
	.byte	0x2
	.byte	0x2f
	.byte	0x10
	.4byte	0x1f7
	.byte	0xf8
	.byte	0x5
	.4byte	.LASF1
	.byte	0x2
	.byte	0x31
	.byte	0x10
	.4byte	0x1f7
	.2byte	0x100
	.byte	0x5
	.4byte	.LASF2
	.byte	0x2
	.byte	0x32
	.byte	0x10
	.4byte	0x1f7
	.2byte	0x108
	.byte	0x5
	.4byte	.LASF3
	.byte	0x2
	.byte	0x33
	.byte	0x10
	.4byte	0x1f7
	.2byte	0x110
	.byte	0x5
	.4byte	.LASF4
	.byte	0x2
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
	.byte	0x6
	.byte	0x1
	.byte	0x2
	.4byte	.LASF9
	.byte	0x7
	.4byte	.LASF11
	.byte	0x10
	.byte	0x1
	.byte	0xb
	.byte	0x8
	.4byte	0x241
	.byte	0x4
	.string	"fn"
	.byte	0x1
	.byte	0xc
	.byte	0x8
	.4byte	0x279
	.byte	0
	.byte	0x3
	.4byte	.LASF12
	.byte	0x1
	.byte	0xd
	.byte	0xe
	.4byte	0x267
	.byte	0x8
	.byte	0
	.byte	0x8
	.4byte	0x21a
	.byte	0x9
	.4byte	0x25a
	.4byte	0x25a
	.byte	0xa
	.4byte	0x261
	.byte	0xa
	.4byte	0x267
	.byte	0
	.byte	0xb
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0xc
	.byte	0x8
	.4byte	0x2d
	.byte	0xc
	.byte	0x8
	.4byte	0x274
	.byte	0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF13
	.byte	0x8
	.4byte	0x26d
	.byte	0xc
	.byte	0x8
	.4byte	0x246
	.byte	0xd
	.4byte	0x241
	.4byte	0x28f
	.byte	0xe
	.4byte	0x1f7
	.byte	0xf
	.byte	0
	.byte	0x8
	.4byte	0x27f
	.byte	0xf
	.4byte	.LASF11
	.byte	0x1
	.byte	0x4f
	.byte	0x20
	.4byte	0x28f
	.byte	0x9
	.byte	0x3
	.8byte	fault_info
	.byte	0x10
	.4byte	.LASF14
	.byte	0x1
	.byte	0x82
	.byte	0x6
	.8byte	.LFB18
	.8byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.4byte	0x334
	.byte	0x11
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.4byte	0x2ed
	.byte	0x12
	.string	"__v"
	.byte	0x1
	.byte	0x84
	.byte	0x13
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x11
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.4byte	0x312
	.byte	0x12
	.string	"__v"
	.byte	0x1
	.byte	0x86
	.byte	0x13
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x13
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.byte	0x12
	.string	"__v"
	.byte	0x1
	.byte	0x89
	.byte	0x13
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0
	.byte	0x14
	.4byte	.LASF15
	.byte	0x1
	.byte	0x67
	.byte	0x6
	.8byte	.LFB17
	.8byte	.LFE17-.LFB17
	.byte	0x1
	.byte	0x9c
	.4byte	0x380
	.byte	0x15
	.4byte	.LASF16
	.byte	0x1
	.byte	0x67
	.byte	0x26
	.4byte	0x261
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x15
	.4byte	.LASF3
	.byte	0x1
	.byte	0x67
	.byte	0x3a
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x12
	.string	"inf"
	.byte	0x1
	.byte	0x69
	.byte	0x1b
	.4byte	0x380
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xc
	.byte	0x8
	.4byte	0x241
	.byte	0x16
	.4byte	.LASF34
	.byte	0x1
	.byte	0x62
	.byte	0x28
	.4byte	0x380
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x3b8
	.byte	0x15
	.4byte	.LASF3
	.byte	0x1
	.byte	0x62
	.byte	0x46
	.4byte	0x20c
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x17
	.4byte	.LASF17
	.byte	0x1
	.byte	0x4d
	.byte	0x5
	.4byte	0x25a
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0x3f9
	.byte	0x15
	.4byte	.LASF16
	.byte	0x1
	.byte	0x4d
	.byte	0x23
	.4byte	0x261
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x18
	.string	"str"
	.byte	0x1
	.byte	0x4d
	.byte	0x35
	.4byte	0x267
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x17
	.4byte	.LASF18
	.byte	0x1
	.byte	0x4c
	.byte	0x5
	.4byte	0x25a
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0x43a
	.byte	0x15
	.4byte	.LASF16
	.byte	0x1
	.byte	0x4c
	.byte	0x23
	.4byte	0x261
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x18
	.string	"str"
	.byte	0x1
	.byte	0x4c
	.byte	0x35
	.4byte	0x267
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x17
	.4byte	.LASF19
	.byte	0x1
	.byte	0x4b
	.byte	0x5
	.4byte	0x25a
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.4byte	0x47b
	.byte	0x15
	.4byte	.LASF16
	.byte	0x1
	.byte	0x4b
	.byte	0x25
	.4byte	0x261
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x18
	.string	"str"
	.byte	0x1
	.byte	0x4b
	.byte	0x37
	.4byte	0x267
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x17
	.4byte	.LASF20
	.byte	0x1
	.byte	0x4a
	.byte	0x5
	.4byte	0x25a
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0x4bc
	.byte	0x15
	.4byte	.LASF16
	.byte	0x1
	.byte	0x4a
	.byte	0x25
	.4byte	0x261
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x18
	.string	"str"
	.byte	0x1
	.byte	0x4a
	.byte	0x37
	.4byte	0x267
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x17
	.4byte	.LASF21
	.byte	0x1
	.byte	0x49
	.byte	0x5
	.4byte	0x25a
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.4byte	0x4fd
	.byte	0x15
	.4byte	.LASF16
	.byte	0x1
	.byte	0x49
	.byte	0x29
	.4byte	0x261
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x18
	.string	"str"
	.byte	0x1
	.byte	0x49
	.byte	0x3b
	.4byte	0x267
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x17
	.4byte	.LASF22
	.byte	0x1
	.byte	0x48
	.byte	0x5
	.4byte	0x25a
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0x53e
	.byte	0x15
	.4byte	.LASF16
	.byte	0x1
	.byte	0x48
	.byte	0x2e
	.4byte	0x261
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x18
	.string	"str"
	.byte	0x1
	.byte	0x48
	.byte	0x40
	.4byte	0x267
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x17
	.4byte	.LASF23
	.byte	0x1
	.byte	0x47
	.byte	0x5
	.4byte	0x25a
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0x57f
	.byte	0x15
	.4byte	.LASF16
	.byte	0x1
	.byte	0x47
	.byte	0x28
	.4byte	0x261
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x18
	.string	"str"
	.byte	0x1
	.byte	0x47
	.byte	0x3a
	.4byte	0x267
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x17
	.4byte	.LASF24
	.byte	0x1
	.byte	0x46
	.byte	0x5
	.4byte	0x25a
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0x5c0
	.byte	0x15
	.4byte	.LASF16
	.byte	0x1
	.byte	0x46
	.byte	0x2d
	.4byte	0x261
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x18
	.string	"str"
	.byte	0x1
	.byte	0x46
	.byte	0x3f
	.4byte	0x267
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x17
	.4byte	.LASF25
	.byte	0x1
	.byte	0x45
	.byte	0x5
	.4byte	0x25a
	.8byte	.LFB7
	.8byte	.LFE7-.LFB7
	.byte	0x1
	.byte	0x9c
	.4byte	0x601
	.byte	0x15
	.4byte	.LASF16
	.byte	0x1
	.byte	0x45
	.byte	0x2a
	.4byte	0x261
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x18
	.string	"str"
	.byte	0x1
	.byte	0x45
	.byte	0x3c
	.4byte	0x267
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x17
	.4byte	.LASF26
	.byte	0x1
	.byte	0x44
	.byte	0x5
	.4byte	0x25a
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0x642
	.byte	0x15
	.4byte	.LASF16
	.byte	0x1
	.byte	0x44
	.byte	0x28
	.4byte	0x261
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x18
	.string	"str"
	.byte	0x1
	.byte	0x44
	.byte	0x3a
	.4byte	0x267
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x17
	.4byte	.LASF27
	.byte	0x1
	.byte	0x43
	.byte	0x5
	.4byte	0x25a
	.8byte	.LFB5
	.8byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.4byte	0x683
	.byte	0x15
	.4byte	.LASF16
	.byte	0x1
	.byte	0x43
	.byte	0x2d
	.4byte	0x261
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x18
	.string	"str"
	.byte	0x1
	.byte	0x43
	.byte	0x3f
	.4byte	0x267
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x17
	.4byte	.LASF28
	.byte	0x1
	.byte	0x42
	.byte	0x5
	.4byte	0x25a
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0x6c4
	.byte	0x15
	.4byte	.LASF16
	.byte	0x1
	.byte	0x42
	.byte	0x25
	.4byte	0x261
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x18
	.string	"str"
	.byte	0x1
	.byte	0x42
	.byte	0x37
	.4byte	0x267
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x19
	.4byte	.LASF29
	.byte	0x1
	.byte	0x31
	.byte	0xd
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x701
	.byte	0x15
	.4byte	.LASF16
	.byte	0x1
	.byte	0x31
	.byte	0x2b
	.4byte	0x261
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x18
	.string	"str"
	.byte	0x1
	.byte	0x31
	.byte	0x3d
	.4byte	0x267
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x19
	.4byte	.LASF30
	.byte	0x1
	.byte	0x17
	.byte	0xd
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x72f
	.byte	0x15
	.4byte	.LASF16
	.byte	0x1
	.byte	0x17
	.byte	0x2a
	.4byte	0x261
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1a
	.4byte	.LASF35
	.byte	0x1
	.byte	0x10
	.byte	0xd
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
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
	.byte	0x8
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0xa
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
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
	.byte	0xc
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xf
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
	.byte	0x10
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
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
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
	.byte	0x12
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
	.byte	0x13
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x14
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
	.byte	0x15
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
	.byte	0x16
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
	.byte	0x17
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
	.byte	0x18
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
	.byte	0x19
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
	.byte	0x1a
	.byte	0x2e
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
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
.LASF25:
	.string	"vs_trap_insn_illegal"
.LASF17:
	.string	"vs_page_fault"
.LASF16:
	.string	"regs"
.LASF18:
	.string	"vs_trap_break"
.LASF2:
	.string	"sbadaddr"
.LASF29:
	.string	"vs_trap_error"
.LASF3:
	.string	"scause"
.LASF26:
	.string	"vs_trap_insn_fault"
.LASF11:
	.string	"fault_info"
.LASF6:
	.string	"unsigned char"
.LASF35:
	.string	"vs_panic"
.LASF14:
	.string	"vs_trap_init"
.LASF4:
	.string	"hstatus"
.LASF10:
	.string	"pt_regs"
.LASF1:
	.string	"sstatus"
.LASF5:
	.string	"long unsigned int"
.LASF31:
	.string	"GNU C17 9.4.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF20:
	.string	"vs_trap_ecall_u"
.LASF0:
	.string	"sepc"
.LASF33:
	.string	"/home/acetab/\346\241\214\351\235\242/benos"
.LASF30:
	.string	"vs_show_regs"
.LASF22:
	.string	"vs_trap_store_misaligned"
.LASF24:
	.string	"vs_trap_load_misaligned"
.LASF19:
	.string	"vs_trap_ecall_s"
.LASF12:
	.string	"name"
.LASF8:
	.string	"unsigned int"
.LASF23:
	.string	"vs_trap_load_fault"
.LASF21:
	.string	"vs_trap_store_fault"
.LASF27:
	.string	"vs_trap_insn_misaligned"
.LASF32:
	.string	"gos/vs_trap.c"
.LASF15:
	.string	"do_vs_exception"
.LASF13:
	.string	"char"
.LASF28:
	.string	"vs_trap_unknown"
.LASF7:
	.string	"short unsigned int"
.LASF34:
	.string	"ec_to_fault_info"
.LASF9:
	.string	"_Bool"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
