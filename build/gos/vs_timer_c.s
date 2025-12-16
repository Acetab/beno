	.file	"vs_timer.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.type	sbi_set_timer, @function
sbi_set_timer:
.LFB0:
	.file 1 "include/asm/sbi.h"
	.loc 1 33 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
.LBB2:
	.loc 1 34 28
	ld	a0,-24(s0)
	.loc 1 34 97
	li	a1,0
	.loc 1 34 156
	li	a2,0
	.loc 1 34 215
	li	a7,0
	.loc 1 34 251
#APP
# 34 "include/asm/sbi.h" 1
	ecall
# 0 "" 2
#NO_APP
.LBE2:
	.loc 1 35 1
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	sbi_set_timer, .-sbi_set_timer
	.comm	vs_jiffies,8,64
	.align	2
	.globl	vs_get_cycles
	.type	vs_get_cycles, @function
vs_get_cycles:
.LFB4:
	.file 2 "gos/vs_timer.c"
	.loc 2 16 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 19 2
#APP
# 19 "gos/vs_timer.c" 1
	rdtime a5
# 0 "" 2
#NO_APP
	sd	a5,-24(s0)
	.loc 2 22 9
	ld	a5,-24(s0)
	.loc 2 23 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	vs_get_cycles, .-vs_get_cycles
	.align	2
	.type	reset_timer, @function
reset_timer:
.LFB5:
	.loc 2 34 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
.LBB3:
	.loc 2 35 19
	li	a5,32
	sd	a5,-24(s0)
	.loc 2 35 50
	ld	a5,-24(s0)
#APP
# 35 "gos/vs_timer.c" 1
	csrs sie, a5
# 0 "" 2
#NO_APP
.LBE3:
	.loc 2 36 16
	call	vs_get_cycles
	mv	a4,a0
	.loc 2 36 2
	li	a5,200704
	addi	a5,a5,-704
	add	a5,a4,a5
	mv	a0,a5
	call	sbi_set_timer
	.loc 2 37 1
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
.LFE5:
	.size	reset_timer, .-reset_timer
	.align	2
	.globl	vs_timer_init
	.type	vs_timer_init, @function
vs_timer_init:
.LFB6:
	.loc 2 40 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 41 2
	call	reset_timer
	.loc 2 42 1
	nop
	ld	ra,8(sp)
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE6:
	.size	vs_timer_init, .-vs_timer_init
	.section	.rodata
	.align	3
.LC0:
	.string	"Virtual Core0 Timer interrupt received %lu\n"
	.text
	.align	2
	.globl	vs_handle_timer_irq
	.type	vs_handle_timer_irq, @function
vs_handle_timer_irq:
.LFB7:
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
.LBB4:
	.loc 2 46 19
	li	a5,32
	sd	a5,-24(s0)
	.loc 2 46 50
	ld	a5,-24(s0)
#APP
# 46 "gos/vs_timer.c" 1
	csrc sie, a5
# 0 "" 2
#NO_APP
.LBE4:
	.loc 2 47 2
	call	reset_timer
	.loc 2 48 12
	lla	a5,vs_jiffies
	ld	a5,0(a5)
	addi	a4,a5,1
	lla	a5,vs_jiffies
	sd	a4,0(a5)
	.loc 2 49 2
	lla	a5,vs_jiffies
	ld	a5,0(a5)
	mv	a1,a5
	lla	a0,.LC0
	call	printk
	.loc 2 50 1
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
.LFE7:
	.size	vs_handle_timer_irq, .-vs_handle_timer_irq
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x1a3
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF7
	.byte	0xc
	.4byte	.LASF8
	.4byte	.LASF9
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
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF3
	.byte	0x3
	.4byte	0x42
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF4
	.byte	0x4
	.4byte	.LASF10
	.byte	0x2
	.byte	0x9
	.byte	0x39
	.4byte	0x49
	.byte	0x40
	.byte	0x9
	.byte	0x3
	.8byte	vs_jiffies
	.byte	0x5
	.4byte	.LASF11
	.byte	0x2
	.byte	0x2c
	.byte	0x6
	.8byte	.LFB7
	.8byte	.LFE7-.LFB7
	.byte	0x1
	.byte	0x9c
	.4byte	0xac
	.byte	0x6
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.byte	0x7
	.string	"__v"
	.byte	0x2
	.byte	0x2e
	.byte	0x13
	.4byte	0x42
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0x8
	.4byte	.LASF12
	.byte	0x2
	.byte	0x27
	.byte	0x6
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.byte	0x9
	.4byte	.LASF5
	.byte	0x2
	.byte	0x21
	.byte	0xd
	.8byte	.LFB5
	.8byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.4byte	0x106
	.byte	0x6
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0x7
	.string	"__v"
	.byte	0x2
	.byte	0x23
	.byte	0x13
	.4byte	0x42
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0xa
	.4byte	.LASF13
	.byte	0x2
	.byte	0xf
	.byte	0xf
	.4byte	0x42
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0x136
	.byte	0x7
	.string	"n"
	.byte	0x2
	.byte	0x11
	.byte	0x10
	.4byte	0x42
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xb
	.4byte	.LASF6
	.byte	0x1
	.byte	0x20
	.byte	0x14
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0xc
	.4byte	.LASF14
	.byte	0x1
	.byte	0x20
	.byte	0x30
	.4byte	0x42
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x6
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x7
	.string	"a0"
	.byte	0x1
	.byte	0x22
	.byte	0x1c
	.4byte	0x42
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.string	"a1"
	.byte	0x1
	.byte	0x22
	.byte	0x61
	.4byte	0x42
	.byte	0x1
	.byte	0x5b
	.byte	0x7
	.string	"a2"
	.byte	0x1
	.byte	0x22
	.byte	0x9c
	.4byte	0x42
	.byte	0x1
	.byte	0x5c
	.byte	0x7
	.string	"a7"
	.byte	0x1
	.byte	0x22
	.byte	0xd7
	.4byte	0x42
	.byte	0x1
	.byte	0x61
	.byte	0
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
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
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
	.byte	0x88,0x1
	.byte	0xb
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x5
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
	.byte	0x6
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x7
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
	.byte	0x8
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
	.byte	0x9
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
	.byte	0xa
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
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
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
	.byte	0
	.byte	0
	.byte	0xc
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
.LASF13:
	.string	"vs_get_cycles"
.LASF2:
	.string	"unsigned int"
.LASF9:
	.string	"/home/acetab/\346\241\214\351\235\242/benos"
.LASF8:
	.string	"gos/vs_timer.c"
.LASF11:
	.string	"vs_handle_timer_irq"
.LASF3:
	.string	"long unsigned int"
.LASF12:
	.string	"vs_timer_init"
.LASF5:
	.string	"reset_timer"
.LASF10:
	.string	"vs_jiffies"
.LASF0:
	.string	"unsigned char"
.LASF6:
	.string	"sbi_set_timer"
.LASF4:
	.string	"_Bool"
.LASF1:
	.string	"short unsigned int"
.LASF14:
	.string	"stime_value"
.LASF7:
	.string	"GNU C17 9.4.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
