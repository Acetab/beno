	.file	"fork.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.type	get_current, @function
get_current:
.LFB31:
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
.LFE31:
	.size	get_current, .-get_current
	.globl	init_task_union
	.section	.data.init_task,"aw"
	.align	3
	.type	init_task_union, @object
	.size	init_task_union, 4096
init_task_union:
	.zero	112
	.word	0
	.word	0
	.zero	16
	.word	0
	.word	1
	.word	0
	.zero	20
	.word	10
	.word	10
	.dword	init_task_union
	.dword	init_task_union
	.zero	3904
	.globl	g_task
	.data
	.align	3
	.type	g_task, @object
	.size	g_task, 1024
g_task:
	.dword	init_task_union
	.zero	1016
	.comm	total_forks,8,8
	.text
	.align	2
	.type	find_empty_task, @function
find_empty_task:
.LFB36:
	.file 2 "src/fork.c"
	.loc 2 20 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 23 9
	sw	zero,-20(s0)
	.loc 2 23 2
	j	.L4
.L7:
	.loc 2 24 14
	lla	a4,g_task
	lw	a5,-20(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a5,0(a5)
	.loc 2 24 6
	bnez	a5,.L5
	.loc 2 25 11
	lw	a5,-20(s0)
	j	.L6
.L5:
	.loc 2 23 25 discriminator 2
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L4:
	.loc 2 23 2 discriminator 1
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,127
	ble	a4,a5,.L7
	.loc 2 28 9
	li	a5,-1
.L6:
	.loc 2 29 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE36:
	.size	find_empty_task, .-find_empty_task
	.align	2
	.type	task_pt_regs, @function
task_pt_regs:
.LFB37:
	.loc 2 35 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	.loc 2 38 6
	ld	a4,-40(s0)
	.loc 2 38 4
	li	a5,4096
	addi	a5,a5,-288
	add	a5,a4,a5
	sd	a5,-24(s0)
	.loc 2 40 9
	ld	a5,-24(s0)
	.loc 2 41 1
	mv	a0,a5
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE37:
	.size	task_pt_regs, .-task_pt_regs
	.align	2
	.type	copy_thread, @function
copy_thread:
.LFB38:
	.loc 2 48 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	sd	s0,48(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	sd	a2,-56(s0)
	sd	a3,-64(s0)
	.loc 2 51 14
	ld	a0,-48(s0)
	call	task_pt_regs
	sd	a0,-24(s0)
	.loc 2 52 2
	li	a2,288
	li	a1,0
	ld	a0,-24(s0)
	call	memset
	.loc 2 53 9
	ld	a5,-48(s0)
	.loc 2 53 2
	li	a2,112
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 2 55 18
	ld	a5,-40(s0)
	andi	a5,a5,1
	.loc 2 55 5
	beqz	a5,.L11
.LBB2:
	.loc 2 57 17
	mv	a4,gp
	ld	a5,-24(s0)
	sd	a4,24(a5)
	.loc 2 59 22
	ld	a5,-24(s0)
	li	a4,288
	sd	a4,256(a5)
	.loc 2 61 23
	ld	a5,-48(s0)
	ld	a4,-56(s0)
	sd	a4,16(a5)
	.loc 2 62 23
	ld	a5,-48(s0)
	ld	a4,-64(s0)
	sd	a4,24(a5)
	.loc 2 64 23
	lla	a4,ret_from_kernel_thread
	.loc 2 64 21
	ld	a5,-48(s0)
	sd	a4,0(a5)
.LBE2:
	j	.L12
.L11:
	.loc 2 66 17
	call	get_current
	mv	a5,a0
	mv	a0,a5
	call	task_pt_regs
	mv	a3,a0
	.loc 2 66 14
	ld	a5,-24(s0)
	mv	a4,a5
	li	a5,288
	mv	a2,a5
	mv	a1,a3
	mv	a0,a4
	call	memcpy
	.loc 2 67 17
	ld	a5,-24(s0)
	sd	zero,80(a5)
	.loc 2 68 6
	ld	a5,-56(s0)
	beqz	a5,.L13
	.loc 2 69 18
	ld	a5,-24(s0)
	ld	a4,-56(s0)
	sd	a4,16(a5)
.L13:
	.loc 2 71 23
	lla	a4,ret_from_fork
	.loc 2 71 21
	ld	a5,-48(s0)
	sd	a4,0(a5)
.L12:
	.loc 2 74 22
	ld	a4,-24(s0)
	.loc 2 74 20
	ld	a5,-48(s0)
	sd	a4,8(a5)
	.loc 2 76 9
	li	a5,0
	.loc 2 77 1
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
.LFE38:
	.size	copy_thread, .-copy_thread
	.align	2
	.globl	do_fork
	.type	do_fork, @function
do_fork:
.LFB39:
	.loc 2 87 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	sd	s0,48(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	sd	a2,-56(s0)
	.loc 2 91 28
	call	get_free_page
	mv	a5,a0
	.loc 2 91 4
	sd	a5,-24(s0)
	.loc 2 92 5
	ld	a5,-24(s0)
	beqz	a5,.L21
	.loc 2 95 2
	li	a2,192
	li	a1,0
	ld	a0,-24(s0)
	call	memset
	.loc 2 97 8
	call	find_empty_task
	mv	a5,a0
	sw	a5,-28(s0)
	.loc 2 98 5
	lw	a5,-28(s0)
	sext.w	a5,a5
	bltz	a5,.L22
	.loc 2 101 6
	ld	a3,-56(s0)
	ld	a2,-48(s0)
	ld	a1,-24(s0)
	ld	a0,-40(s0)
	call	copy_thread
	mv	a5,a0
	.loc 2 101 5
	bnez	a5,.L23
	.loc 2 104 11
	ld	a5,-24(s0)
	sw	zero,136(a5)
	.loc 2 105 9
	ld	a5,-24(s0)
	lw	a4,-28(s0)
	sw	a4,144(a5)
	.loc 2 106 16
	call	get_current
	mv	a5,a0
	.loc 2 106 29
	lw	a5,168(a5)
	.loc 2 106 39
	addiw	a5,a5,1
	sext.w	a5,a5
	.loc 2 106 44
	sraiw	a5,a5,1
	sext.w	a4,a5
	.loc 2 106 13
	ld	a5,-24(s0)
	sw	a4,168(a5)
	.loc 2 107 2
	call	get_current
	mv	a5,a0
	.loc 2 107 25
	lw	a4,168(a5)
	sraiw	a4,a4,1
	sext.w	a4,a4
	sw	a4,168(a5)
	.loc 2 108 18
	ld	a5,-24(s0)
	sw	zero,116(a5)
	.loc 2 109 19
	ld	a5,-24(s0)
	sw	zero,112(a5)
	.loc 2 110 14
	ld	a5,-24(s0)
	li	a4,2
	sw	a4,172(a5)
	.loc 2 111 13
	lla	a5,total_forks
	ld	a5,0(a5)
	addi	a4,a5,1
	lla	a5,total_forks
	sd	a4,0(a5)
	.loc 2 112 14
	lla	a4,g_task
	lw	a5,-28(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a4,-24(s0)
	sd	a4,0(a5)
	.loc 2 113 22
	ld	a5,-24(s0)
	lla	a4,init_task_union
	sd	a4,176(a5)
	.loc 2 113 88
	lla	a5,init_task_union
	ld	a4,184(a5)
	.loc 2 113 64
	ld	a5,-24(s0)
	sd	a4,184(a5)
	.loc 2 113 122
	lla	a5,init_task_union
	ld	a5,184(a5)
	.loc 2 113 144
	ld	a4,-24(s0)
	sd	a4,176(a5)
	.loc 2 113 184
	lla	a5,init_task_union
	ld	a4,-24(s0)
	sd	a4,184(a5)
	.loc 2 114 2
	ld	a0,-24(s0)
	call	wake_up_process
	.loc 2 116 9
	lw	a5,-28(s0)
	j	.L20
.L21:
	.loc 2 93 3
	nop
	j	.L17
.L22:
	.loc 2 99 3
	nop
	j	.L17
.L23:
	.loc 2 102 3
	nop
.L17:
	.loc 2 119 9
	li	a5,-1
.L20:
	.loc 2 120 1
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
.LFE39:
	.size	do_fork, .-do_fork
	.section	.rodata
	.align	3
.LC0:
	.string	"sstatus 0x%llx sp 0x%llx  pc 0x%llx\n"
	.text
	.align	2
	.type	start_user_thread, @function
start_user_thread:
.LFB40:
	.loc 2 124 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	sd	s0,48(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	sd	a2,-56(s0)
	.loc 2 126 2
	li	a2,288
	li	a1,0
	ld	a0,-40(s0)
	call	memset
	.loc 2 127 13
	ld	a5,-40(s0)
	ld	a4,-48(s0)
	sd	a4,0(a5)
	.loc 2 128 11
	ld	a5,-40(s0)
	ld	a4,-56(s0)
	sd	a4,16(a5)
.LBB3:
	.loc 2 130 39
#APP
# 130 "src/fork.c" 1
	csrr a5, sstatus
# 0 "" 2
#NO_APP
	mv	ra,a5
	.loc 2 130 111
	mv	a5,ra
.LBE3:
	.loc 2 130 6
	sd	a5,-24(s0)
	.loc 2 131 22
	ld	a5,-24(s0)
	andi	a4,a5,-257
	.loc 2 131 16
	ld	a5,-40(s0)
	sd	a4,256(a5)
	.loc 2 132 2
	ld	a5,-40(s0)
	ld	a4,256(a5)
	ld	a5,-40(s0)
	ld	a2,16(a5)
	ld	a5,-40(s0)
	ld	a5,0(a5)
	mv	a3,a5
	mv	a1,a4
	lla	a0,.LC0
	call	printk
	.loc 2 133 1
	nop
	ld	ra,56(sp)
	.cfi_restore 1
	ld	s0,48(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE40:
	.size	start_user_thread, .-start_user_thread
	.align	2
	.globl	move_to_user_space
	.type	move_to_user_space, @function
move_to_user_space:
.LFB41:
	.loc 2 136 1
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
	.loc 2 140 9
	call	get_current
	mv	a5,a0
	mv	a0,a5
	call	task_pt_regs
	sd	a0,-24(s0)
	.loc 2 142 10
	call	get_free_page
	sd	a0,-32(s0)
	.loc 2 143 5
	ld	a5,-32(s0)
	bnez	a5,.L26
	.loc 2 144 10
	li	a5,-1
	j	.L27
.L26:
	.loc 2 146 2
	ld	a5,-32(s0)
	li	a2,4096
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 2 148 2
	ld	a4,-32(s0)
	li	a5,4096
	add	a5,a4,a5
	mv	a2,a5
	ld	a1,-40(s0)
	ld	a0,-24(s0)
	call	start_user_thread
	.loc 2 150 9
	li	a5,0
.L27:
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
.LFE41:
	.size	move_to_user_space, .-move_to_user_space
.Letext0:
	.file 3 "include/asm/ptregs.h"
	.file 4 "include/asm/processor.h"
	.file 5 "include/list.h"
	.file 6 "include/sched.h"
	.file 7 "include/type.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x7a4
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF62
	.byte	0xc
	.4byte	.LASF63
	.4byte	.LASF64
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF0
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF1
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.byte	0x3
	.string	"u64"
	.byte	0x7
	.byte	0x9
	.byte	0x17
	.4byte	0x4e
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF3
	.byte	0x4
	.4byte	0x4e
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF4
	.byte	0x5
	.4byte	.LASF10
	.2byte	0x120
	.byte	0x3
	.byte	0xe
	.byte	0x8
	.4byte	0x22b
	.byte	0x6
	.4byte	.LASF5
	.byte	0x3
	.byte	0x10
	.byte	0x10
	.4byte	0x4e
	.byte	0
	.byte	0x7
	.string	"ra"
	.byte	0x3
	.byte	0x11
	.byte	0x10
	.4byte	0x4e
	.byte	0x8
	.byte	0x7
	.string	"sp"
	.byte	0x3
	.byte	0x12
	.byte	0x10
	.4byte	0x4e
	.byte	0x10
	.byte	0x7
	.string	"gp"
	.byte	0x3
	.byte	0x13
	.byte	0x10
	.4byte	0x4e
	.byte	0x18
	.byte	0x7
	.string	"tp"
	.byte	0x3
	.byte	0x14
	.byte	0x10
	.4byte	0x4e
	.byte	0x20
	.byte	0x7
	.string	"t0"
	.byte	0x3
	.byte	0x15
	.byte	0x10
	.4byte	0x4e
	.byte	0x28
	.byte	0x7
	.string	"t1"
	.byte	0x3
	.byte	0x16
	.byte	0x10
	.4byte	0x4e
	.byte	0x30
	.byte	0x7
	.string	"t2"
	.byte	0x3
	.byte	0x17
	.byte	0x10
	.4byte	0x4e
	.byte	0x38
	.byte	0x7
	.string	"s0"
	.byte	0x3
	.byte	0x18
	.byte	0x10
	.4byte	0x4e
	.byte	0x40
	.byte	0x7
	.string	"s1"
	.byte	0x3
	.byte	0x19
	.byte	0x10
	.4byte	0x4e
	.byte	0x48
	.byte	0x7
	.string	"a0"
	.byte	0x3
	.byte	0x1a
	.byte	0x10
	.4byte	0x4e
	.byte	0x50
	.byte	0x7
	.string	"a1"
	.byte	0x3
	.byte	0x1b
	.byte	0x10
	.4byte	0x4e
	.byte	0x58
	.byte	0x7
	.string	"a2"
	.byte	0x3
	.byte	0x1c
	.byte	0x10
	.4byte	0x4e
	.byte	0x60
	.byte	0x7
	.string	"a3"
	.byte	0x3
	.byte	0x1d
	.byte	0x10
	.4byte	0x4e
	.byte	0x68
	.byte	0x7
	.string	"a4"
	.byte	0x3
	.byte	0x1e
	.byte	0x10
	.4byte	0x4e
	.byte	0x70
	.byte	0x7
	.string	"a5"
	.byte	0x3
	.byte	0x1f
	.byte	0x10
	.4byte	0x4e
	.byte	0x78
	.byte	0x7
	.string	"a6"
	.byte	0x3
	.byte	0x20
	.byte	0x10
	.4byte	0x4e
	.byte	0x80
	.byte	0x7
	.string	"a7"
	.byte	0x3
	.byte	0x21
	.byte	0x10
	.4byte	0x4e
	.byte	0x88
	.byte	0x7
	.string	"s2"
	.byte	0x3
	.byte	0x22
	.byte	0x10
	.4byte	0x4e
	.byte	0x90
	.byte	0x7
	.string	"s3"
	.byte	0x3
	.byte	0x23
	.byte	0x10
	.4byte	0x4e
	.byte	0x98
	.byte	0x7
	.string	"s4"
	.byte	0x3
	.byte	0x24
	.byte	0x10
	.4byte	0x4e
	.byte	0xa0
	.byte	0x7
	.string	"s5"
	.byte	0x3
	.byte	0x25
	.byte	0x10
	.4byte	0x4e
	.byte	0xa8
	.byte	0x7
	.string	"s6"
	.byte	0x3
	.byte	0x26
	.byte	0x10
	.4byte	0x4e
	.byte	0xb0
	.byte	0x7
	.string	"s7"
	.byte	0x3
	.byte	0x27
	.byte	0x10
	.4byte	0x4e
	.byte	0xb8
	.byte	0x7
	.string	"s8"
	.byte	0x3
	.byte	0x28
	.byte	0x10
	.4byte	0x4e
	.byte	0xc0
	.byte	0x7
	.string	"s9"
	.byte	0x3
	.byte	0x29
	.byte	0x10
	.4byte	0x4e
	.byte	0xc8
	.byte	0x7
	.string	"s10"
	.byte	0x3
	.byte	0x2a
	.byte	0x10
	.4byte	0x4e
	.byte	0xd0
	.byte	0x7
	.string	"s11"
	.byte	0x3
	.byte	0x2b
	.byte	0x10
	.4byte	0x4e
	.byte	0xd8
	.byte	0x7
	.string	"t3"
	.byte	0x3
	.byte	0x2c
	.byte	0x10
	.4byte	0x4e
	.byte	0xe0
	.byte	0x7
	.string	"t4"
	.byte	0x3
	.byte	0x2d
	.byte	0x10
	.4byte	0x4e
	.byte	0xe8
	.byte	0x7
	.string	"t5"
	.byte	0x3
	.byte	0x2e
	.byte	0x10
	.4byte	0x4e
	.byte	0xf0
	.byte	0x7
	.string	"t6"
	.byte	0x3
	.byte	0x2f
	.byte	0x10
	.4byte	0x4e
	.byte	0xf8
	.byte	0x8
	.4byte	.LASF6
	.byte	0x3
	.byte	0x31
	.byte	0x10
	.4byte	0x4e
	.2byte	0x100
	.byte	0x8
	.4byte	.LASF7
	.byte	0x3
	.byte	0x32
	.byte	0x10
	.4byte	0x4e
	.2byte	0x108
	.byte	0x8
	.4byte	.LASF8
	.byte	0x3
	.byte	0x33
	.byte	0x10
	.4byte	0x4e
	.2byte	0x110
	.byte	0x8
	.4byte	.LASF9
	.byte	0x3
	.byte	0x34
	.byte	0x10
	.4byte	0x4e
	.2byte	0x118
	.byte	0
	.byte	0x9
	.4byte	.LASF11
	.byte	0x70
	.byte	0x4
	.byte	0xf
	.byte	0x8
	.4byte	0x25c
	.byte	0x7
	.string	"ra"
	.byte	0x4
	.byte	0x10
	.byte	0x10
	.4byte	0x4e
	.byte	0
	.byte	0x7
	.string	"sp"
	.byte	0x4
	.byte	0x11
	.byte	0x10
	.4byte	0x4e
	.byte	0x8
	.byte	0x7
	.string	"s"
	.byte	0x4
	.byte	0x14
	.byte	0x10
	.4byte	0x25c
	.byte	0x10
	.byte	0
	.byte	0xa
	.4byte	0x4e
	.4byte	0x26c
	.byte	0xb
	.4byte	0x4e
	.byte	0xb
	.byte	0
	.byte	0x9
	.4byte	.LASF12
	.byte	0x10
	.byte	0x5
	.byte	0x3
	.byte	0x8
	.4byte	0x294
	.byte	0x6
	.4byte	.LASF13
	.byte	0x5
	.byte	0x4
	.byte	0x14
	.4byte	0x294
	.byte	0
	.byte	0x6
	.4byte	.LASF14
	.byte	0x5
	.byte	0x4
	.byte	0x1b
	.4byte	0x294
	.byte	0x8
	.byte	0
	.byte	0xc
	.byte	0x8
	.4byte	0x26c
	.byte	0x9
	.4byte	.LASF15
	.byte	0x30
	.byte	0x6
	.byte	0x13
	.byte	0x8
	.4byte	0x2f6
	.byte	0x6
	.4byte	.LASF13
	.byte	0x6
	.byte	0x14
	.byte	0x1c
	.4byte	0x2fb
	.byte	0
	.byte	0x6
	.4byte	.LASF16
	.byte	0x6
	.byte	0x16
	.byte	0x9
	.4byte	0x3c9
	.byte	0x8
	.byte	0x6
	.4byte	.LASF17
	.byte	0x6
	.byte	0x17
	.byte	0x9
	.4byte	0x427
	.byte	0x10
	.byte	0x6
	.4byte	.LASF18
	.byte	0x6
	.byte	0x18
	.byte	0x9
	.4byte	0x427
	.byte	0x18
	.byte	0x6
	.4byte	.LASF19
	.byte	0x6
	.byte	0x19
	.byte	0x9
	.4byte	0x427
	.byte	0x20
	.byte	0x6
	.4byte	.LASF20
	.byte	0x6
	.byte	0x1a
	.byte	0x19
	.4byte	0x441
	.byte	0x28
	.byte	0
	.byte	0x4
	.4byte	0x29a
	.byte	0xc
	.byte	0x8
	.4byte	0x2f6
	.byte	0xd
	.4byte	0x30c
	.byte	0xe
	.4byte	0x30c
	.byte	0
	.byte	0xc
	.byte	0x8
	.4byte	0x312
	.byte	0x9
	.4byte	.LASF21
	.byte	0xc0
	.byte	0x6
	.byte	0x32
	.byte	0x8
	.4byte	0x3c9
	.byte	0x6
	.4byte	.LASF11
	.byte	0x6
	.byte	0x33
	.byte	0x15
	.4byte	0x22b
	.byte	0
	.byte	0x6
	.4byte	.LASF22
	.byte	0x6
	.byte	0x34
	.byte	0x6
	.4byte	0x491
	.byte	0x70
	.byte	0x6
	.4byte	.LASF23
	.byte	0x6
	.byte	0x35
	.byte	0x6
	.4byte	0x491
	.byte	0x74
	.byte	0x6
	.4byte	.LASF24
	.byte	0x6
	.byte	0x36
	.byte	0x10
	.4byte	0x4e
	.byte	0x78
	.byte	0x6
	.4byte	.LASF25
	.byte	0x6
	.byte	0x37
	.byte	0x10
	.4byte	0x4e
	.byte	0x80
	.byte	0x6
	.4byte	.LASF26
	.byte	0x6
	.byte	0x38
	.byte	0x12
	.4byte	0x447
	.byte	0x88
	.byte	0x6
	.4byte	.LASF27
	.byte	0x6
	.byte	0x39
	.byte	0x12
	.4byte	0x478
	.byte	0x8c
	.byte	0x7
	.string	"pid"
	.byte	0x6
	.byte	0x3a
	.byte	0x6
	.4byte	0x491
	.byte	0x90
	.byte	0x6
	.4byte	.LASF28
	.byte	0x6
	.byte	0x3b
	.byte	0x13
	.4byte	0x26c
	.byte	0x98
	.byte	0x6
	.4byte	.LASF29
	.byte	0x6
	.byte	0x3c
	.byte	0x6
	.4byte	0x491
	.byte	0xa8
	.byte	0x6
	.4byte	.LASF30
	.byte	0x6
	.byte	0x3d
	.byte	0x6
	.4byte	0x491
	.byte	0xac
	.byte	0x6
	.4byte	.LASF31
	.byte	0x6
	.byte	0x3e
	.byte	0x16
	.4byte	0x30c
	.byte	0xb0
	.byte	0x6
	.4byte	.LASF32
	.byte	0x6
	.byte	0x3f
	.byte	0x16
	.4byte	0x30c
	.byte	0xb8
	.byte	0
	.byte	0xc
	.byte	0x8
	.4byte	0x301
	.byte	0xd
	.4byte	0x3df
	.byte	0xe
	.4byte	0x3df
	.byte	0xe
	.4byte	0x30c
	.byte	0
	.byte	0xc
	.byte	0x8
	.4byte	0x3e5
	.byte	0x9
	.4byte	.LASF33
	.byte	0x28
	.byte	0x6
	.byte	0x1e
	.byte	0x8
	.4byte	0x427
	.byte	0x6
	.4byte	.LASF34
	.byte	0x6
	.byte	0x1f
	.byte	0x13
	.4byte	0x26c
	.byte	0
	.byte	0x6
	.4byte	.LASF35
	.byte	0x6
	.byte	0x20
	.byte	0xf
	.4byte	0x3b
	.byte	0x10
	.byte	0x6
	.4byte	.LASF36
	.byte	0x6
	.byte	0x21
	.byte	0x6
	.4byte	0x42
	.byte	0x18
	.byte	0x6
	.4byte	.LASF37
	.byte	0x6
	.byte	0x22
	.byte	0x16
	.4byte	0x30c
	.byte	0x20
	.byte	0
	.byte	0xc
	.byte	0x8
	.4byte	0x3cf
	.byte	0xf
	.4byte	0x30c
	.4byte	0x441
	.byte	0xe
	.4byte	0x3df
	.byte	0xe
	.4byte	0x30c
	.byte	0
	.byte	0xc
	.byte	0x8
	.4byte	0x42d
	.byte	0x10
	.4byte	.LASF43
	.byte	0x7
	.byte	0x4
	.4byte	0x3b
	.byte	0x6
	.byte	0x25
	.byte	0x6
	.4byte	0x478
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
	.4byte	0x3b
	.byte	0x6
	.byte	0x2d
	.byte	0x6
	.4byte	0x491
	.byte	0x11
	.4byte	.LASF45
	.byte	0x1
	.byte	0
	.byte	0x12
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x13
	.4byte	.LASF65
	.2byte	0x1000
	.byte	0x6
	.byte	0x46
	.byte	0x7
	.4byte	0x4bf
	.byte	0x14
	.4byte	.LASF46
	.byte	0x6
	.byte	0x47
	.byte	0x15
	.4byte	0x312
	.byte	0x14
	.4byte	.LASF47
	.byte	0x6
	.byte	0x48
	.byte	0x10
	.4byte	0x4bf
	.byte	0
	.byte	0xa
	.4byte	0x4e
	.4byte	0x4d0
	.byte	0x15
	.4byte	0x4e
	.2byte	0x1ff
	.byte	0
	.byte	0xa
	.4byte	0x30c
	.4byte	0x4db
	.byte	0x16
	.byte	0
	.byte	0x17
	.4byte	.LASF48
	.byte	0x6
	.byte	0x5b
	.byte	0x1c
	.4byte	0x4d0
	.byte	0x17
	.4byte	.LASF49
	.byte	0x6
	.byte	0x5d
	.byte	0x19
	.4byte	0x498
	.byte	0x17
	.4byte	.LASF50
	.byte	0x6
	.byte	0x6c
	.byte	0x21
	.4byte	0x2f6
	.byte	0x18
	.4byte	0x4e7
	.byte	0x2
	.byte	0xb
	.byte	0x12
	.byte	0x9
	.byte	0x3
	.8byte	init_task_union
	.byte	0x18
	.4byte	0x4db
	.byte	0x2
	.byte	0xf
	.byte	0x15
	.byte	0x9
	.byte	0x3
	.8byte	g_task
	.byte	0x19
	.4byte	.LASF51
	.byte	0x2
	.byte	0x11
	.byte	0xf
	.4byte	0x4e
	.byte	0x9
	.byte	0x3
	.8byte	total_forks
	.byte	0x1a
	.4byte	.LASF53
	.byte	0x2
	.byte	0x87
	.byte	0x5
	.4byte	0x491
	.8byte	.LFB41
	.8byte	.LFE41-.LFB41
	.byte	0x1
	.byte	0x9c
	.4byte	0x588
	.byte	0x1b
	.string	"pc"
	.byte	0x2
	.byte	0x87
	.byte	0x26
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1c
	.4byte	.LASF52
	.byte	0x2
	.byte	0x89
	.byte	0x12
	.4byte	0x588
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1c
	.4byte	.LASF47
	.byte	0x2
	.byte	0x8a
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0xc
	.byte	0x8
	.4byte	0x61
	.byte	0x1d
	.4byte	.LASF60
	.byte	0x2
	.byte	0x7a
	.byte	0xd
	.8byte	.LFB40
	.8byte	.LFE40-.LFB40
	.byte	0x1
	.byte	0x9c
	.4byte	0x607
	.byte	0x1e
	.4byte	.LASF52
	.byte	0x2
	.byte	0x7a
	.byte	0x2f
	.4byte	0x588
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1b
	.string	"pc"
	.byte	0x2
	.byte	0x7a
	.byte	0x43
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x1b
	.string	"sp"
	.byte	0x2
	.byte	0x7b
	.byte	0x11
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x1f
	.string	"val"
	.byte	0x2
	.byte	0x7d
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x20
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0x1f
	.string	"__v"
	.byte	0x2
	.byte	0x82
	.byte	0x22
	.4byte	0x4e
	.byte	0x1
	.byte	0x51
	.byte	0
	.byte	0
	.byte	0x1a
	.4byte	.LASF54
	.byte	0x2
	.byte	0x56
	.byte	0x5
	.4byte	0x491
	.8byte	.LFB39
	.8byte	.LFE39-.LFB39
	.byte	0x1
	.byte	0x9c
	.4byte	0x682
	.byte	0x1e
	.4byte	.LASF55
	.byte	0x2
	.byte	0x56
	.byte	0x1b
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1b
	.string	"fn"
	.byte	0x2
	.byte	0x56
	.byte	0x36
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x1b
	.string	"arg"
	.byte	0x2
	.byte	0x56
	.byte	0x48
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x1f
	.string	"p"
	.byte	0x2
	.byte	0x58
	.byte	0x16
	.4byte	0x30c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1f
	.string	"pid"
	.byte	0x2
	.byte	0x59
	.byte	0x6
	.4byte	0x491
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x21
	.4byte	.LASF66
	.byte	0x2
	.byte	0x76
	.byte	0x1
	.8byte	.L17
	.byte	0
	.byte	0x22
	.4byte	.LASF57
	.byte	0x2
	.byte	0x2e
	.byte	0xc
	.4byte	0x491
	.8byte	.LFB38
	.8byte	.LFE38-.LFB38
	.byte	0x1
	.byte	0x9c
	.4byte	0x70c
	.byte	0x1e
	.4byte	.LASF55
	.byte	0x2
	.byte	0x2e
	.byte	0x26
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1b
	.string	"p"
	.byte	0x2
	.byte	0x2e
	.byte	0x47
	.4byte	0x30c
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x1b
	.string	"fn"
	.byte	0x2
	.byte	0x2f
	.byte	0x11
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x1b
	.string	"arg"
	.byte	0x2
	.byte	0x2f
	.byte	0x23
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x1c
	.4byte	.LASF56
	.byte	0x2
	.byte	0x31
	.byte	0x12
	.4byte	0x588
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x20
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x1f
	.string	"gp"
	.byte	0x2
	.byte	0x38
	.byte	0x20
	.4byte	0x55
	.byte	0x1
	.byte	0x53
	.byte	0
	.byte	0
	.byte	0x23
	.4byte	.LASF58
	.byte	0x2
	.byte	0x22
	.byte	0x18
	.4byte	0x588
	.8byte	.LFB37
	.8byte	.LFE37-.LFB37
	.byte	0x1
	.byte	0x9c
	.4byte	0x74b
	.byte	0x1b
	.string	"tsk"
	.byte	0x2
	.byte	0x22
	.byte	0x39
	.4byte	0x30c
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1f
	.string	"p"
	.byte	0x2
	.byte	0x24
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x23
	.4byte	.LASF59
	.byte	0x2
	.byte	0x13
	.byte	0xc
	.4byte	0x491
	.8byte	.LFB36
	.8byte	.LFE36-.LFB36
	.byte	0x1
	.byte	0x9c
	.4byte	0x77b
	.byte	0x1f
	.string	"i"
	.byte	0x2
	.byte	0x15
	.byte	0x6
	.4byte	0x491
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x24
	.4byte	.LASF61
	.byte	0x1
	.byte	0x4
	.byte	0x1c
	.4byte	0x30c
	.8byte	.LFB31
	.8byte	.LFE31-.LFB31
	.byte	0x1
	.byte	0x9c
	.byte	0x1f
	.string	"tp"
	.byte	0x1
	.byte	0x6
	.byte	0x1f
	.4byte	0x30c
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
	.byte	0x3
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
	.byte	0x4
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
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
	.byte	0x6
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
	.byte	0x7
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
	.byte	0x8
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
	.byte	0x9
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
	.byte	0xa
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
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
	.byte	0x34
	.byte	0
	.byte	0x47
	.byte	0x13
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x2
	.byte	0x18
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
	.byte	0x3f
	.byte	0x19
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
	.byte	0x1b
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
	.byte	0x1c
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
	.byte	0x1d
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
	.byte	0x1e
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
	.byte	0x1f
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
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x21
	.byte	0xa
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
	.byte	0
	.byte	0
	.byte	0x22
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
	.byte	0x23
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
	.byte	0x24
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
.LASF56:
	.string	"childregs"
.LASF64:
	.string	"/home/acetab/\346\241\214\351\235\242/benos"
.LASF16:
	.string	"task_fork"
.LASF12:
	.string	"list_head"
.LASF30:
	.string	"priority"
.LASF23:
	.string	"need_resched"
.LASF13:
	.string	"next"
.LASF63:
	.string	"src/fork.c"
.LASF53:
	.string	"move_to_user_space"
.LASF46:
	.string	"task"
.LASF21:
	.string	"task_struct"
.LASF47:
	.string	"stack"
.LASF57:
	.string	"copy_thread"
.LASF22:
	.string	"preempt_count"
.LASF38:
	.string	"TASK_RUNNING"
.LASF60:
	.string	"start_user_thread"
.LASF18:
	.string	"dequeue_task"
.LASF54:
	.string	"do_fork"
.LASF11:
	.string	"cpu_context"
.LASF24:
	.string	"kernel_sp"
.LASF39:
	.string	"TASK_INTERRUPTIBLE"
.LASF51:
	.string	"total_forks"
.LASF20:
	.string	"pick_next_task"
.LASF19:
	.string	"task_tick"
.LASF32:
	.string	"prev_task"
.LASF55:
	.string	"clone_flags"
.LASF28:
	.string	"run_list"
.LASF26:
	.string	"state"
.LASF34:
	.string	"rq_head"
.LASF0:
	.string	"unsigned char"
.LASF29:
	.string	"counter"
.LASF41:
	.string	"TASK_ZOMBIE"
.LASF45:
	.string	"PF_KTHREAD"
.LASF27:
	.string	"flags"
.LASF2:
	.string	"unsigned int"
.LASF5:
	.string	"sepc"
.LASF10:
	.string	"pt_regs"
.LASF1:
	.string	"short unsigned int"
.LASF17:
	.string	"enqueue_task"
.LASF58:
	.string	"task_pt_regs"
.LASF61:
	.string	"get_current"
.LASF37:
	.string	"curr"
.LASF65:
	.string	"task_union"
.LASF4:
	.string	"_Bool"
.LASF6:
	.string	"sstatus"
.LASF52:
	.string	"regs"
.LASF44:
	.string	"task_flags"
.LASF49:
	.string	"init_task_union"
.LASF9:
	.string	"hstatus"
.LASF3:
	.string	"long unsigned int"
.LASF43:
	.string	"task_state"
.LASF33:
	.string	"run_queue"
.LASF25:
	.string	"user_sp"
.LASF36:
	.string	"nr_switches"
.LASF50:
	.string	"simple_sched_class"
.LASF66:
	.string	"error"
.LASF48:
	.string	"g_task"
.LASF62:
	.string	"GNU C17 9.4.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF42:
	.string	"TASK_STOPPED"
.LASF35:
	.string	"nr_running"
.LASF15:
	.string	"sched_class"
.LASF14:
	.string	"prev"
.LASF40:
	.string	"TASK_UNINTERRUPTIBLE"
.LASF59:
	.string	"find_empty_task"
.LASF31:
	.string	"next_task"
.LASF8:
	.string	"scause"
.LASF7:
	.string	"sbadaddr"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
