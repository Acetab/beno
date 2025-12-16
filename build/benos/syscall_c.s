	.file	"syscall.c"
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
	.align	2
	.type	sys_ni_syscall, @function
sys_ni_syscall:
.LFB36:
	.file 2 "src/syscall.c"
	.loc 2 6 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 2 7 9
	li	a5,-1
	.loc 2 8 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE36:
	.size	sys_ni_syscall, .-sys_ni_syscall
	.align	2
	.type	invoke_syscall, @function
invoke_syscall:
.LFB37:
	.loc 2 12 1
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
	mv	a5,a1
	mv	a4,a2
	sd	a3,-56(s0)
	sw	a5,-44(s0)
	mv	a5,a4
	sw	a5,-48(s0)
	.loc 2 16 5
	lw	a4,-44(s0)
	lw	a5,-48(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bge	a4,a5,.L6
	.loc 2 17 21
	lw	a5,-44(s0)
	slli	a5,a5,3
	ld	a4,-56(s0)
	add	a5,a4,a5
	.loc 2 17 6
	ld	a5,0(a5)
	sd	a5,-32(s0)
	.loc 2 18 9
	ld	a5,-32(s0)
	ld	a0,-40(s0)
	jalr	a5
.LVL0:
	sd	a0,-24(s0)
	j	.L7
.L6:
	.loc 2 20 9
	ld	a0,-40(s0)
	call	sys_ni_syscall
	sd	a0,-24(s0)
.L7:
	.loc 2 23 11
	ld	a4,-24(s0)
	ld	a5,-40(s0)
	sd	a4,80(a5)
	.loc 2 24 1
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
.LFE37:
	.size	invoke_syscall, .-invoke_syscall
	.align	2
	.type	riscv_syscall_common, @function
riscv_syscall_common:
.LFB38:
	.loc 2 28 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	mv	a5,a1
	mv	a4,a2
	sd	a3,-40(s0)
	sw	a5,-28(s0)
	mv	a5,a4
	sw	a5,-32(s0)
	.loc 2 31 2
	lw	a4,-32(s0)
	lw	a5,-28(s0)
	ld	a3,-40(s0)
	mv	a2,a4
	mv	a1,a5
	ld	a0,-24(s0)
	call	invoke_syscall
	.loc 2 32 1
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
.LFE38:
	.size	riscv_syscall_common, .-riscv_syscall_common
	.align	2
	.globl	riscv_svc_handler
	.type	riscv_svc_handler, @function
riscv_svc_handler:
.LFB39:
	.loc 2 39 1
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
	.loc 2 40 40
	ld	a5,-24(s0)
	ld	a5,136(a5)
	.loc 2 40 9
	sext.w	a5,a5
	lla	a3,syscall_table
	li	a2,6
	mv	a1,a5
	ld	a0,-24(s0)
	call	riscv_syscall_common
	.loc 2 42 1
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE39:
	.size	riscv_svc_handler, .-riscv_svc_handler
	.align	2
	.globl	__riscv_sys_open
	.type	__riscv_sys_open, @function
__riscv_sys_open:
.LFB40:
	.loc 2 45 1
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
	.loc 2 46 36
	ld	a5,-24(s0)
	ld	a5,80(a5)
	.loc 2 46 9
	mv	a3,a5
	.loc 2 47 8
	ld	a5,-24(s0)
	ld	a5,88(a5)
	.loc 2 46 9
	sext.w	a4,a5
	.loc 2 47 18
	ld	a5,-24(s0)
	ld	a5,96(a5)
	.loc 2 46 9
	sext.w	a5,a5
	mv	a2,a5
	mv	a1,a4
	mv	a0,a3
	call	sys_open
	mv	a5,a0
	.loc 2 49 1
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
.LFE40:
	.size	__riscv_sys_open, .-__riscv_sys_open
	.align	2
	.globl	__riscv_sys_close
	.type	__riscv_sys_close, @function
__riscv_sys_close:
.LFB41:
	.loc 2 52 1
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
	.loc 2 53 23
	ld	a5,-24(s0)
	ld	a5,80(a5)
	.loc 2 53 9
	sext.w	a5,a5
	mv	a0,a5
	call	sys_close
	mv	a5,a0
	.loc 2 55 1
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
.LFE41:
	.size	__riscv_sys_close, .-__riscv_sys_close
	.align	2
	.globl	__riscv_sys_read
	.type	__riscv_sys_read, @function
__riscv_sys_read:
.LFB42:
	.loc 2 58 1
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
	.loc 2 59 22
	ld	a5,-24(s0)
	ld	a5,80(a5)
	.loc 2 59 9
	sext.w	a4,a5
	.loc 2 59 40
	ld	a5,-24(s0)
	ld	a5,88(a5)
	.loc 2 59 9
	mv	a3,a5
	.loc 2 60 8
	ld	a5,-24(s0)
	ld	a5,96(a5)
	.loc 2 59 9
	sext.w	a5,a5
	mv	a2,a5
	mv	a1,a3
	mv	a0,a4
	call	sys_read
	mv	a5,a0
	.loc 2 62 1
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
.LFE42:
	.size	__riscv_sys_read, .-__riscv_sys_read
	.align	2
	.globl	__riscv_sys_write
	.type	__riscv_sys_write, @function
__riscv_sys_write:
.LFB43:
	.loc 2 65 1
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
	.loc 2 66 23
	ld	a5,-24(s0)
	ld	a5,80(a5)
	.loc 2 66 9
	sext.w	a4,a5
	.loc 2 66 41
	ld	a5,-24(s0)
	ld	a5,88(a5)
	.loc 2 66 9
	mv	a3,a5
	.loc 2 67 8
	ld	a5,-24(s0)
	ld	a5,96(a5)
	.loc 2 66 9
	sext.w	a5,a5
	mv	a2,a5
	mv	a1,a3
	mv	a0,a4
	call	sys_write
	mv	a5,a0
	.loc 2 69 1
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
.LFE43:
	.size	__riscv_sys_write, .-__riscv_sys_write
	.align	2
	.globl	__riscv_sys_clone
	.type	__riscv_sys_clone, @function
__riscv_sys_clone:
.LFB44:
	.loc 2 72 1
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
	.loc 2 73 9
	ld	a5,-24(s0)
	ld	a4,80(a5)
	ld	a5,-24(s0)
	ld	a3,88(a5)
	ld	a5,-24(s0)
	ld	a5,96(a5)
	mv	a2,a5
	mv	a1,a3
	mv	a0,a4
	call	do_fork
	mv	a5,a0
	.loc 2 75 1
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
.LFE44:
	.size	__riscv_sys_clone, .-__riscv_sys_clone
	.align	2
	.globl	__riscv_sys_malloc
	.type	__riscv_sys_malloc, @function
__riscv_sys_malloc:
.LFB45:
	.loc 2 78 1
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
	.loc 2 81 9
	call	get_free_page
	sd	a0,-24(s0)
	.loc 2 82 5
	ld	a5,-24(s0)
	bnez	a5,.L22
	.loc 2 83 10
	li	a5,-1
	j	.L23
.L22:
	.loc 2 85 9
	ld	a5,-24(s0)
.L23:
	.loc 2 86 1
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
.LFE45:
	.size	__riscv_sys_malloc, .-__riscv_sys_malloc
	.globl	syscall_table
	.section	.rodata
	.align	3
	.type	syscall_table, @object
	.size	syscall_table, 48
syscall_table:
	.dword	__riscv_sys_open
	.dword	__riscv_sys_close
	.dword	__riscv_sys_read
	.dword	__riscv_sys_write
	.dword	__riscv_sys_clone
	.dword	__riscv_sys_malloc
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
	.4byte	0x7f8
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF67
	.byte	0xc
	.4byte	.LASF68
	.4byte	.LASF69
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
	.byte	0x8
	.byte	0x9
	.byte	0x17
	.4byte	0x4e
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF3
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF4
	.byte	0x4
	.4byte	.LASF10
	.2byte	0x120
	.byte	0x3
	.byte	0xe
	.byte	0x8
	.4byte	0x226
	.byte	0x5
	.4byte	.LASF5
	.byte	0x3
	.byte	0x10
	.byte	0x10
	.4byte	0x4e
	.byte	0
	.byte	0x6
	.string	"ra"
	.byte	0x3
	.byte	0x11
	.byte	0x10
	.4byte	0x4e
	.byte	0x8
	.byte	0x6
	.string	"sp"
	.byte	0x3
	.byte	0x12
	.byte	0x10
	.4byte	0x4e
	.byte	0x10
	.byte	0x6
	.string	"gp"
	.byte	0x3
	.byte	0x13
	.byte	0x10
	.4byte	0x4e
	.byte	0x18
	.byte	0x6
	.string	"tp"
	.byte	0x3
	.byte	0x14
	.byte	0x10
	.4byte	0x4e
	.byte	0x20
	.byte	0x6
	.string	"t0"
	.byte	0x3
	.byte	0x15
	.byte	0x10
	.4byte	0x4e
	.byte	0x28
	.byte	0x6
	.string	"t1"
	.byte	0x3
	.byte	0x16
	.byte	0x10
	.4byte	0x4e
	.byte	0x30
	.byte	0x6
	.string	"t2"
	.byte	0x3
	.byte	0x17
	.byte	0x10
	.4byte	0x4e
	.byte	0x38
	.byte	0x6
	.string	"s0"
	.byte	0x3
	.byte	0x18
	.byte	0x10
	.4byte	0x4e
	.byte	0x40
	.byte	0x6
	.string	"s1"
	.byte	0x3
	.byte	0x19
	.byte	0x10
	.4byte	0x4e
	.byte	0x48
	.byte	0x6
	.string	"a0"
	.byte	0x3
	.byte	0x1a
	.byte	0x10
	.4byte	0x4e
	.byte	0x50
	.byte	0x6
	.string	"a1"
	.byte	0x3
	.byte	0x1b
	.byte	0x10
	.4byte	0x4e
	.byte	0x58
	.byte	0x6
	.string	"a2"
	.byte	0x3
	.byte	0x1c
	.byte	0x10
	.4byte	0x4e
	.byte	0x60
	.byte	0x6
	.string	"a3"
	.byte	0x3
	.byte	0x1d
	.byte	0x10
	.4byte	0x4e
	.byte	0x68
	.byte	0x6
	.string	"a4"
	.byte	0x3
	.byte	0x1e
	.byte	0x10
	.4byte	0x4e
	.byte	0x70
	.byte	0x6
	.string	"a5"
	.byte	0x3
	.byte	0x1f
	.byte	0x10
	.4byte	0x4e
	.byte	0x78
	.byte	0x6
	.string	"a6"
	.byte	0x3
	.byte	0x20
	.byte	0x10
	.4byte	0x4e
	.byte	0x80
	.byte	0x6
	.string	"a7"
	.byte	0x3
	.byte	0x21
	.byte	0x10
	.4byte	0x4e
	.byte	0x88
	.byte	0x6
	.string	"s2"
	.byte	0x3
	.byte	0x22
	.byte	0x10
	.4byte	0x4e
	.byte	0x90
	.byte	0x6
	.string	"s3"
	.byte	0x3
	.byte	0x23
	.byte	0x10
	.4byte	0x4e
	.byte	0x98
	.byte	0x6
	.string	"s4"
	.byte	0x3
	.byte	0x24
	.byte	0x10
	.4byte	0x4e
	.byte	0xa0
	.byte	0x6
	.string	"s5"
	.byte	0x3
	.byte	0x25
	.byte	0x10
	.4byte	0x4e
	.byte	0xa8
	.byte	0x6
	.string	"s6"
	.byte	0x3
	.byte	0x26
	.byte	0x10
	.4byte	0x4e
	.byte	0xb0
	.byte	0x6
	.string	"s7"
	.byte	0x3
	.byte	0x27
	.byte	0x10
	.4byte	0x4e
	.byte	0xb8
	.byte	0x6
	.string	"s8"
	.byte	0x3
	.byte	0x28
	.byte	0x10
	.4byte	0x4e
	.byte	0xc0
	.byte	0x6
	.string	"s9"
	.byte	0x3
	.byte	0x29
	.byte	0x10
	.4byte	0x4e
	.byte	0xc8
	.byte	0x6
	.string	"s10"
	.byte	0x3
	.byte	0x2a
	.byte	0x10
	.4byte	0x4e
	.byte	0xd0
	.byte	0x6
	.string	"s11"
	.byte	0x3
	.byte	0x2b
	.byte	0x10
	.4byte	0x4e
	.byte	0xd8
	.byte	0x6
	.string	"t3"
	.byte	0x3
	.byte	0x2c
	.byte	0x10
	.4byte	0x4e
	.byte	0xe0
	.byte	0x6
	.string	"t4"
	.byte	0x3
	.byte	0x2d
	.byte	0x10
	.4byte	0x4e
	.byte	0xe8
	.byte	0x6
	.string	"t5"
	.byte	0x3
	.byte	0x2e
	.byte	0x10
	.4byte	0x4e
	.byte	0xf0
	.byte	0x6
	.string	"t6"
	.byte	0x3
	.byte	0x2f
	.byte	0x10
	.4byte	0x4e
	.byte	0xf8
	.byte	0x7
	.4byte	.LASF6
	.byte	0x3
	.byte	0x31
	.byte	0x10
	.4byte	0x4e
	.2byte	0x100
	.byte	0x7
	.4byte	.LASF7
	.byte	0x3
	.byte	0x32
	.byte	0x10
	.4byte	0x4e
	.2byte	0x108
	.byte	0x7
	.4byte	.LASF8
	.byte	0x3
	.byte	0x33
	.byte	0x10
	.4byte	0x4e
	.2byte	0x110
	.byte	0x7
	.4byte	.LASF9
	.byte	0x3
	.byte	0x34
	.byte	0x10
	.4byte	0x4e
	.2byte	0x118
	.byte	0
	.byte	0x8
	.4byte	.LASF11
	.byte	0x70
	.byte	0x4
	.byte	0xf
	.byte	0x8
	.4byte	0x257
	.byte	0x6
	.string	"ra"
	.byte	0x4
	.byte	0x10
	.byte	0x10
	.4byte	0x4e
	.byte	0
	.byte	0x6
	.string	"sp"
	.byte	0x4
	.byte	0x11
	.byte	0x10
	.4byte	0x4e
	.byte	0x8
	.byte	0x6
	.string	"s"
	.byte	0x4
	.byte	0x14
	.byte	0x10
	.4byte	0x257
	.byte	0x10
	.byte	0
	.byte	0x9
	.4byte	0x4e
	.4byte	0x267
	.byte	0xa
	.4byte	0x4e
	.byte	0xb
	.byte	0
	.byte	0x8
	.4byte	.LASF12
	.byte	0x10
	.byte	0x5
	.byte	0x3
	.byte	0x8
	.4byte	0x28f
	.byte	0x5
	.4byte	.LASF13
	.byte	0x5
	.byte	0x4
	.byte	0x14
	.4byte	0x28f
	.byte	0
	.byte	0x5
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
	.byte	0x5
	.4byte	.LASF13
	.byte	0x6
	.byte	0x14
	.byte	0x1c
	.4byte	0x2f6
	.byte	0
	.byte	0x5
	.4byte	.LASF16
	.byte	0x6
	.byte	0x16
	.byte	0x9
	.4byte	0x3c4
	.byte	0x8
	.byte	0x5
	.4byte	.LASF17
	.byte	0x6
	.byte	0x17
	.byte	0x9
	.4byte	0x422
	.byte	0x10
	.byte	0x5
	.4byte	.LASF18
	.byte	0x6
	.byte	0x18
	.byte	0x9
	.4byte	0x422
	.byte	0x18
	.byte	0x5
	.4byte	.LASF19
	.byte	0x6
	.byte	0x19
	.byte	0x9
	.4byte	0x422
	.byte	0x20
	.byte	0x5
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
	.byte	0x5
	.4byte	.LASF11
	.byte	0x6
	.byte	0x33
	.byte	0x15
	.4byte	0x226
	.byte	0
	.byte	0x5
	.4byte	.LASF22
	.byte	0x6
	.byte	0x34
	.byte	0x6
	.4byte	0x48c
	.byte	0x70
	.byte	0x5
	.4byte	.LASF23
	.byte	0x6
	.byte	0x35
	.byte	0x6
	.4byte	0x48c
	.byte	0x74
	.byte	0x5
	.4byte	.LASF24
	.byte	0x6
	.byte	0x36
	.byte	0x10
	.4byte	0x4e
	.byte	0x78
	.byte	0x5
	.4byte	.LASF25
	.byte	0x6
	.byte	0x37
	.byte	0x10
	.4byte	0x4e
	.byte	0x80
	.byte	0x5
	.4byte	.LASF26
	.byte	0x6
	.byte	0x38
	.byte	0x12
	.4byte	0x442
	.byte	0x88
	.byte	0x5
	.4byte	.LASF27
	.byte	0x6
	.byte	0x39
	.byte	0x12
	.4byte	0x473
	.byte	0x8c
	.byte	0x6
	.string	"pid"
	.byte	0x6
	.byte	0x3a
	.byte	0x6
	.4byte	0x48c
	.byte	0x90
	.byte	0x5
	.4byte	.LASF28
	.byte	0x6
	.byte	0x3b
	.byte	0x13
	.4byte	0x267
	.byte	0x98
	.byte	0x5
	.4byte	.LASF29
	.byte	0x6
	.byte	0x3c
	.byte	0x6
	.4byte	0x48c
	.byte	0xa8
	.byte	0x5
	.4byte	.LASF30
	.byte	0x6
	.byte	0x3d
	.byte	0x6
	.4byte	0x48c
	.byte	0xac
	.byte	0x5
	.4byte	.LASF31
	.byte	0x6
	.byte	0x3e
	.byte	0x16
	.4byte	0x307
	.byte	0xb0
	.byte	0x5
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
	.byte	0x5
	.4byte	.LASF34
	.byte	0x6
	.byte	0x1f
	.byte	0x13
	.4byte	0x267
	.byte	0
	.byte	0x5
	.4byte	.LASF35
	.byte	0x6
	.byte	0x20
	.byte	0xf
	.4byte	0x3b
	.byte	0x10
	.byte	0x5
	.4byte	.LASF36
	.byte	0x6
	.byte	0x21
	.byte	0x6
	.4byte	0x42
	.byte	0x18
	.byte	0x5
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
	.4byte	0x3b
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
	.4byte	0x3b
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
	.4byte	.LASF70
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
	.4byte	0x4e
	.4byte	0x4cb
	.byte	0x15
	.4byte	0x4e
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
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF52
	.byte	0xb
	.byte	0x8
	.4byte	0x5c
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
	.byte	0x19
	.4byte	0x53d
	.byte	0x2
	.byte	0x5e
	.byte	0x14
	.byte	0x9
	.byte	0x3
	.8byte	syscall_table
	.byte	0x1a
	.4byte	.LASF54
	.byte	0x2
	.byte	0x4d
	.byte	0x6
	.4byte	0x520
	.8byte	.LFB45
	.8byte	.LFE45-.LFB45
	.byte	0x1
	.byte	0x9c
	.4byte	0x59c
	.byte	0x1b
	.4byte	.LASF56
	.byte	0x2
	.byte	0x4d
	.byte	0x29
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1c
	.4byte	.LASF65
	.byte	0x2
	.byte	0x4f
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1a
	.4byte	.LASF55
	.byte	0x2
	.byte	0x47
	.byte	0x6
	.4byte	0x520
	.8byte	.LFB44
	.8byte	.LFE44-.LFB44
	.byte	0x1
	.byte	0x9c
	.4byte	0x5ce
	.byte	0x1b
	.4byte	.LASF56
	.byte	0x2
	.byte	0x47
	.byte	0x28
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1a
	.4byte	.LASF57
	.byte	0x2
	.byte	0x40
	.byte	0x6
	.4byte	0x520
	.8byte	.LFB43
	.8byte	.LFE43-.LFB43
	.byte	0x1
	.byte	0x9c
	.4byte	0x600
	.byte	0x1b
	.4byte	.LASF56
	.byte	0x2
	.byte	0x40
	.byte	0x28
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1a
	.4byte	.LASF58
	.byte	0x2
	.byte	0x39
	.byte	0x6
	.4byte	0x520
	.8byte	.LFB42
	.8byte	.LFE42-.LFB42
	.byte	0x1
	.byte	0x9c
	.4byte	0x632
	.byte	0x1b
	.4byte	.LASF56
	.byte	0x2
	.byte	0x39
	.byte	0x27
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1a
	.4byte	.LASF59
	.byte	0x2
	.byte	0x33
	.byte	0x6
	.4byte	0x520
	.8byte	.LFB41
	.8byte	.LFE41-.LFB41
	.byte	0x1
	.byte	0x9c
	.4byte	0x664
	.byte	0x1b
	.4byte	.LASF56
	.byte	0x2
	.byte	0x33
	.byte	0x28
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1a
	.4byte	.LASF60
	.byte	0x2
	.byte	0x2c
	.byte	0x6
	.4byte	0x520
	.8byte	.LFB40
	.8byte	.LFE40-.LFB40
	.byte	0x1
	.byte	0x9c
	.4byte	0x696
	.byte	0x1b
	.4byte	.LASF56
	.byte	0x2
	.byte	0x2c
	.byte	0x27
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1d
	.4byte	.LASF71
	.byte	0x2
	.byte	0x26
	.byte	0x6
	.8byte	.LFB39
	.8byte	.LFE39-.LFB39
	.byte	0x1
	.byte	0x9c
	.4byte	0x6c4
	.byte	0x1b
	.4byte	.LASF56
	.byte	0x2
	.byte	0x26
	.byte	0x28
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1e
	.4byte	.LASF63
	.byte	0x2
	.byte	0x1a
	.byte	0xd
	.8byte	.LFB38
	.8byte	.LFE38-.LFB38
	.byte	0x1
	.byte	0x9c
	.4byte	0x71f
	.byte	0x1b
	.4byte	.LASF56
	.byte	0x2
	.byte	0x1a
	.byte	0x32
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1b
	.4byte	.LASF61
	.byte	0x2
	.byte	0x1a
	.byte	0x3c
	.4byte	0x48c
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x1b
	.4byte	.LASF62
	.byte	0x2
	.byte	0x1b
	.byte	0x7
	.4byte	0x48c
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x1b
	.4byte	.LASF53
	.byte	0x2
	.byte	0x1b
	.byte	0x26
	.4byte	0x71f
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0xb
	.byte	0x8
	.4byte	0x506
	.byte	0x1e
	.4byte	.LASF64
	.byte	0x2
	.byte	0xa
	.byte	0xd
	.8byte	.LFB37
	.8byte	.LFE37-.LFB37
	.byte	0x1
	.byte	0x9c
	.4byte	0x79d
	.byte	0x1b
	.4byte	.LASF56
	.byte	0x2
	.byte	0xa
	.byte	0x2c
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1b
	.4byte	.LASF61
	.byte	0x2
	.byte	0xa
	.byte	0x36
	.4byte	0x48c
	.byte	0x2
	.byte	0x91
	.byte	0x54
	.byte	0x1b
	.4byte	.LASF62
	.byte	0x2
	.byte	0xb
	.byte	0x7
	.4byte	0x48c
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x1b
	.4byte	.LASF53
	.byte	0x2
	.byte	0xb
	.byte	0x26
	.4byte	0x71f
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x1f
	.string	"ret"
	.byte	0x2
	.byte	0xd
	.byte	0x7
	.4byte	0x520
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1f
	.string	"fn"
	.byte	0x2
	.byte	0xe
	.byte	0xf
	.4byte	0x4fa
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x20
	.4byte	.LASF72
	.byte	0x2
	.byte	0x5
	.byte	0xd
	.4byte	0x520
	.8byte	.LFB36
	.8byte	.LFE36-.LFB36
	.byte	0x1
	.byte	0x9c
	.4byte	0x7cf
	.byte	0x1b
	.4byte	.LASF56
	.byte	0x2
	.byte	0x5
	.byte	0x2c
	.4byte	0x527
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x21
	.4byte	.LASF66
	.byte	0x1
	.byte	0x4
	.byte	0x1c
	.4byte	0x307
	.8byte	.LFB31
	.8byte	.LFE31-.LFB31
	.byte	0x1
	.byte	0x9c
	.byte	0x1f
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
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x6
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
	.byte	0x7
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
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
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
.LASF69:
	.string	"/home/acetab/\346\241\214\351\235\242/benos"
.LASF16:
	.string	"task_fork"
.LASF12:
	.string	"list_head"
.LASF30:
	.string	"priority"
.LASF23:
	.string	"need_resched"
.LASF55:
	.string	"__riscv_sys_clone"
.LASF13:
	.string	"next"
.LASF63:
	.string	"riscv_syscall_common"
.LASF64:
	.string	"invoke_syscall"
.LASF46:
	.string	"task"
.LASF21:
	.string	"task_struct"
.LASF68:
	.string	"src/syscall.c"
.LASF72:
	.string	"sys_ni_syscall"
.LASF47:
	.string	"stack"
.LASF22:
	.string	"preempt_count"
.LASF38:
	.string	"TASK_RUNNING"
.LASF62:
	.string	"syscall_nr"
.LASF18:
	.string	"dequeue_task"
.LASF11:
	.string	"cpu_context"
.LASF58:
	.string	"__riscv_sys_read"
.LASF24:
	.string	"kernel_sp"
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
.LASF65:
	.string	"addr"
.LASF28:
	.string	"run_list"
.LASF71:
	.string	"riscv_svc_handler"
.LASF57:
	.string	"__riscv_sys_write"
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
.LASF61:
	.string	"syscall_no"
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
.LASF59:
	.string	"__riscv_sys_close"
.LASF52:
	.string	"long int"
.LASF66:
	.string	"get_current"
.LASF37:
	.string	"curr"
.LASF70:
	.string	"task_union"
.LASF4:
	.string	"_Bool"
.LASF51:
	.string	"syscall_fn_t"
.LASF6:
	.string	"sstatus"
.LASF56:
	.string	"regs"
.LASF54:
	.string	"__riscv_sys_malloc"
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
.LASF60:
	.string	"__riscv_sys_open"
.LASF48:
	.string	"g_task"
.LASF67:
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
.LASF31:
	.string	"next_task"
.LASF8:
	.string	"scause"
.LASF7:
	.string	"sbadaddr"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
