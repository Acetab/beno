	.file	"plic.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.comm	vhwirq,4,4
	.align	2
	.globl	plic_set_prority
	.type	plic_set_prority, @function
plic_set_prority:
.LFB4:
	.file 1 "src/plic.c"
	.loc 1 16 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	mv	a5,a0
	mv	a4,a1
	sw	a5,-36(s0)
	mv	a5,a4
	sw	a5,-40(s0)
	.loc 1 17 44
	lw	a5,-36(s0)
	slliw	a5,a5,2
	sext.w	a5,a5
	sext.w	a4,a5
	.loc 1 17 15
	li	a5,201326592
	addw	a5,a4,a5
	sw	a5,-20(s0)
.LBB2:
	.loc 1 19 18
	li	a5,1
	sw	a5,-24(s0)
	.loc 1 19 27
	.loc 1 19 97
	lwu	a5,-20(s0)
	.loc 1 19 71
	mv	a4,a5
	.loc 1 19 117
	lw	a5,-24(s0)
	sw	a5,0(a4)
	sext.w	a5,a5
.LBE2:
	.loc 1 20 1
	nop
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	plic_set_prority, .-plic_set_prority
	.section	.rodata
	.align	3
.LC0:
	.string	"reg: 0x%x, hwirq:%d\n"
	.text
	.align	2
	.globl	plic_enable_irq
	.type	plic_enable_irq, @function
plic_enable_irq:
.LFB5:
	.loc 1 23 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	sd	s0,48(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	mv	a5,a0
	mv	a3,a1
	mv	a4,a2
	sw	a5,-52(s0)
	mv	a5,a3
	sw	a5,-56(s0)
	mv	a5,a4
	sw	a5,-60(s0)
	.loc 1 24 40
	lw	a4,-56(s0)
	sraiw	a5,a4,31
	srliw	a5,a5,27
	addw	a4,a4,a5
	andi	a4,a4,31
	subw	a5,a4,a5
	sext.w	a5,a5
	.loc 1 24 30
	li	a4,1
	sllw	a5,a4,a5
	sext.w	a5,a5
	.loc 1 24 15
	sw	a5,-20(s0)
	.loc 1 25 16
	lw	a5,-52(s0)
	slliw	a5,a5,1
	sext.w	a5,a5
	.loc 1 25 6
	addiw	a5,a5,1
	sw	a5,-24(s0)
	.loc 1 26 52
	lw	a5,-24(s0)
	slliw	a5,a5,7
	sext.w	a5,a5
	sext.w	a4,a5
	.loc 1 26 71
	lw	a5,-56(s0)
	sraiw	a3,a5,31
	srliw	a3,a3,27
	addw	a5,a3,a5
	sraiw	a5,a5,5
	sext.w	a5,a5
	.loc 1 26 63
	slliw	a5,a5,2
	sext.w	a5,a5
	sext.w	a5,a5
	.loc 1 26 60
	addw	a5,a4,a5
	sext.w	a4,a5
	.loc 1 26 15
	li	a5,201334784
	addw	a5,a4,a5
	sw	a5,-28(s0)
	.loc 1 28 2
	lw	a4,-56(s0)
	lw	a5,-28(s0)
	mv	a2,a4
	mv	a1,a5
	lla	a0,.LC0
	call	printk
	.loc 1 30 5
	lw	a5,-60(s0)
	sext.w	a5,a5
	beqz	a5,.L3
.LBB3:
.LBB4:
	.loc 1 31 75
	lwu	a5,-28(s0)
	.loc 1 31 41
	lw	a5,0(a5)
	sw	a5,-40(s0)
	.loc 1 31 97
	.loc 1 31 139
	lw	a5,-40(s0)
.LBE4:
	.loc 1 31 19
	mv	a4,a5
	lw	a5,-20(s0)
	or	a5,a4,a5
	sw	a5,-44(s0)
	.loc 1 31 161
	.loc 1 31 231
	lwu	a5,-28(s0)
	.loc 1 31 205
	mv	a4,a5
	.loc 1 31 251
	lw	a5,-44(s0)
	sw	a5,0(a4)
	sext.w	a5,a5
.LBE3:
	.loc 1 34 1
	j	.L5
.L3:
.LBB5:
.LBB6:
	.loc 1 33 75
	lwu	a5,-28(s0)
	.loc 1 33 41
	lw	a5,0(a5)
	sw	a5,-32(s0)
	.loc 1 33 97
	.loc 1 33 139
	lw	a4,-32(s0)
.LBE6:
	.loc 1 33 149
	lw	a5,-20(s0)
	not	a5,a5
	sext.w	a5,a5
	.loc 1 33 19
	and	a5,a4,a5
	sw	a5,-36(s0)
	.loc 1 33 162
	.loc 1 33 232
	lwu	a5,-28(s0)
	.loc 1 33 206
	mv	a4,a5
	.loc 1 33 252
	lw	a5,-36(s0)
	sw	a5,0(a4)
	sext.w	a5,a5
.L5:
.LBE5:
	.loc 1 34 1
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
.LFE5:
	.size	plic_enable_irq, .-plic_enable_irq
	.align	2
	.globl	plic_handle_irq
	.type	plic_handle_irq, @function
plic_handle_irq:
.LFB6:
	.loc 1 37 1
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	s0,72(sp)
	.cfi_offset 8, -8
	addi	s0,sp,80
	.cfi_def_cfa 8, 0
	sd	a0,-72(s0)
	.loc 1 40 6
	li	a5,1
	sw	a5,-20(s0)
	.loc 1 42 60
	lw	a5,-20(s0)
	slliw	a5,a5,12
	sext.w	a5,a5
	sext.w	a4,a5
	.loc 1 42 15
	li	a5,203423744
	addiw	a5,a5,4
	addw	a5,a4,a5
	sw	a5,-24(s0)
.LBB7:
	.loc 1 44 19
	li	a5,512
	sd	a5,-32(s0)
	.loc 1 44 51
	ld	a5,-32(s0)
#APP
# 44 "src/plic.c" 1
	csrc sie, a5
# 0 "" 2
#NO_APP
.LBE7:
	.loc 1 46 7
	j	.L7
.L8:
	.loc 1 47 10
	lla	a5,vhwirq
	lw	a4,-40(s0)
	sw	a4,0(a5)
.LBB8:
	.loc 1 48 20
	li	a5,1024
	sd	a5,-56(s0)
	.loc 1 48 54
	ld	a5,-56(s0)
#APP
# 48 "src/plic.c" 1
	csrs 0x645, a5
# 0 "" 2
#NO_APP
.LBE8:
.LBB9:
	.loc 1 50 19
	lw	a5,-40(s0)
	sw	a5,-60(s0)
	.loc 1 50 32
	.loc 1 50 102
	lwu	a5,-24(s0)
	.loc 1 50 76
	mv	a4,a5
	.loc 1 50 128
	lw	a5,-60(s0)
	sw	a5,0(a4)
	sext.w	a5,a5
.L7:
.LBE9:
.LBB10:
	.loc 1 46 67
	lwu	a5,-24(s0)
	.loc 1 46 33
	lw	a5,0(a5)
	sw	a5,-36(s0)
	.loc 1 46 95
	.loc 1 46 137
	lw	a5,-36(s0)
.LBE10:
	.loc 1 46 15
	sw	a5,-40(s0)
	.loc 1 46 7
	lw	a5,-40(s0)
	sext.w	a5,a5
	bnez	a5,.L8
.LBB11:
	.loc 1 52 19
	li	a5,512
	sd	a5,-48(s0)
	.loc 1 52 51
	ld	a5,-48(s0)
#APP
# 52 "src/plic.c" 1
	csrs sie, a5
# 0 "" 2
#NO_APP
.LBE11:
	.loc 1 53 1
	nop
	ld	s0,72(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 80
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE6:
	.size	plic_handle_irq, .-plic_handle_irq
	.align	2
	.globl	plic_init
	.type	plic_init, @function
plic_init:
.LFB7:
	.loc 1 56 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	.loc 1 60 9
	sw	zero,-20(s0)
	.loc 1 60 2
	j	.L10
.L13:
.LBB12:
	.loc 1 62 19
	sw	zero,-36(s0)
	.loc 1 62 28
	.loc 1 62 143
	lw	a5,-20(s0)
	slliw	a5,a5,1
	sext.w	a5,a5
	.loc 1 62 147
	addiw	a5,a5,1
	sext.w	a5,a5
	.loc 1 62 153
	slliw	a5,a5,12
	sext.w	a5,a5
	mv	a4,a5
	.loc 1 62 98
	li	a5,203423744
	add	a5,a4,a5
	.loc 1 62 72
	mv	a4,a5
	.loc 1 62 164
	lw	a5,-36(s0)
	sw	a5,0(a4)
	sext.w	a5,a5
.LBE12:
	.loc 1 64 14
	li	a5,1
	sw	a5,-24(s0)
	.loc 1 64 3
	j	.L11
.L12:
	.loc 1 66 4 discriminator 3
	lw	a4,-24(s0)
	lw	a5,-20(s0)
	li	a2,0
	mv	a1,a4
	mv	a0,a5
	call	plic_enable_irq
	.loc 1 69 4 discriminator 3
	lw	a5,-24(s0)
	li	a1,1
	mv	a0,a5
	call	plic_set_prority
	.loc 1 64 37 discriminator 3
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L11:
	.loc 1 64 3 discriminator 1
	lw	a5,-24(s0)
	sext.w	a4,a5
	li	a5,53
	ble	a4,a5,.L12
	.loc 1 60 22 discriminator 2
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L10:
	.loc 1 60 2 discriminator 1
	lw	a5,-20(s0)
	sext.w	a5,a5
	blez	a5,.L13
.LBB13:
	.loc 1 73 19
	li	a5,512
	sd	a5,-32(s0)
	.loc 1 73 51
	ld	a5,-32(s0)
#APP
# 73 "src/plic.c" 1
	csrs sie, a5
# 0 "" 2
#NO_APP
.LBE13:
	.loc 1 75 9
	li	a5,0
	.loc 1 76 1
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
.LFE7:
	.size	plic_init, .-plic_init
.Letext0:
	.file 2 "include/asm/ptregs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x525
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF15
	.byte	0xc
	.4byte	.LASF16
	.4byte	.LASF17
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF18
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
	.byte	0x7
	.4byte	.LASF19
	.byte	0x1
	.byte	0xd
	.byte	0x5
	.4byte	0x214
	.byte	0x9
	.byte	0x3
	.8byte	vhwirq
	.byte	0x8
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x9
	.4byte	.LASF20
	.byte	0x1
	.byte	0x37
	.byte	0x5
	.4byte	0x214
	.8byte	.LFB7
	.8byte	.LFE7-.LFB7
	.byte	0x1
	.byte	0x9c
	.4byte	0x2a0
	.byte	0xa
	.string	"i"
	.byte	0x1
	.byte	0x39
	.byte	0x6
	.4byte	0x214
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0xb
	.4byte	.LASF6
	.byte	0x1
	.byte	0x3a
	.byte	0x6
	.4byte	0x214
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xc
	.8byte	.LBB12
	.8byte	.LBE12-.LBB12
	.4byte	0x27e
	.byte	0xa
	.string	"__v"
	.byte	0x1
	.byte	0x3e
	.byte	0x13
	.4byte	0x2a0
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0
	.byte	0xd
	.8byte	.LBB13
	.8byte	.LBE13-.LBB13
	.byte	0xa
	.string	"__v"
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.byte	0xe
	.4byte	.LASF10
	.byte	0x1
	.byte	0x24
	.byte	0x6
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0x3b8
	.byte	0xf
	.4byte	.LASF12
	.byte	0x1
	.byte	0x24
	.byte	0x26
	.4byte	0x3b8
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0xb
	.4byte	.LASF6
	.byte	0x1
	.byte	0x26
	.byte	0x6
	.4byte	0x214
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xb
	.4byte	.LASF8
	.byte	0x1
	.byte	0x28
	.byte	0x6
	.4byte	0x214
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0xb
	.4byte	.LASF9
	.byte	0x1
	.byte	0x2a
	.byte	0xf
	.4byte	0x2a0
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xc
	.8byte	.LBB7
	.8byte	.LBE7-.LBB7
	.4byte	0x327
	.byte	0xa
	.string	"__v"
	.byte	0x1
	.byte	0x2c
	.byte	0x13
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0xc
	.8byte	.LBB8
	.8byte	.LBE8-.LBB8
	.4byte	0x34c
	.byte	0xa
	.string	"__v"
	.byte	0x1
	.byte	0x30
	.byte	0x14
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0
	.byte	0xc
	.8byte	.LBB9
	.8byte	.LBE9-.LBB9
	.4byte	0x371
	.byte	0xa
	.string	"__v"
	.byte	0x1
	.byte	0x32
	.byte	0x13
	.4byte	0x2a0
	.byte	0x2
	.byte	0x91
	.byte	0x44
	.byte	0
	.byte	0xc
	.8byte	.LBB10
	.8byte	.LBE10-.LBB10
	.4byte	0x396
	.byte	0xa
	.string	"__v"
	.byte	0x1
	.byte	0x2e
	.byte	0x21
	.4byte	0x2a0
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0
	.byte	0xd
	.8byte	.LBB11
	.8byte	.LBE11-.LBB11
	.byte	0xa
	.string	"__v"
	.byte	0x1
	.byte	0x34
	.byte	0x13
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0x2d
	.byte	0x11
	.4byte	.LASF11
	.byte	0x1
	.byte	0x16
	.byte	0x6
	.8byte	.LFB5
	.8byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.4byte	0x4bf
	.byte	0x12
	.string	"cpu"
	.byte	0x1
	.byte	0x16
	.byte	0x1a
	.4byte	0x214
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0xf
	.4byte	.LASF6
	.byte	0x1
	.byte	0x16
	.byte	0x23
	.4byte	0x214
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xf
	.4byte	.LASF13
	.byte	0x1
	.byte	0x16
	.byte	0x2e
	.4byte	0x214
	.byte	0x2
	.byte	0x91
	.byte	0x44
	.byte	0xb
	.4byte	.LASF14
	.byte	0x1
	.byte	0x18
	.byte	0xf
	.4byte	0x2a0
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0xb
	.4byte	.LASF8
	.byte	0x1
	.byte	0x19
	.byte	0x6
	.4byte	0x214
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xa
	.string	"reg"
	.byte	0x1
	.byte	0x1a
	.byte	0xf
	.4byte	0x2a0
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0xc
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.4byte	0x47c
	.byte	0xa
	.string	"__v"
	.byte	0x1
	.byte	0x1f
	.byte	0x13
	.4byte	0x2a0
	.byte	0x2
	.byte	0x91
	.byte	0x54
	.byte	0xd
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.byte	0xa
	.string	"__v"
	.byte	0x1
	.byte	0x1f
	.byte	0x29
	.4byte	0x2a0
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0
	.byte	0xd
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.byte	0xa
	.string	"__v"
	.byte	0x1
	.byte	0x21
	.byte	0x13
	.4byte	0x2a0
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0xd
	.8byte	.LBB6
	.8byte	.LBE6-.LBB6
	.byte	0xa
	.string	"__v"
	.byte	0x1
	.byte	0x21
	.byte	0x29
	.4byte	0x2a0
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0
	.byte	0
	.byte	0x13
	.4byte	.LASF21
	.byte	0x1
	.byte	0xf
	.byte	0x6
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.byte	0xf
	.4byte	.LASF6
	.byte	0x1
	.byte	0xf
	.byte	0x1b
	.4byte	0x214
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x12
	.string	"pro"
	.byte	0x1
	.byte	0xf
	.byte	0x26
	.4byte	0x214
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xa
	.string	"reg"
	.byte	0x1
	.byte	0x11
	.byte	0xf
	.4byte	0x2a0
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0xd
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0xa
	.string	"__v"
	.byte	0x1
	.byte	0x13
	.byte	0x12
	.4byte	0x2a0
	.byte	0x2
	.byte	0x91
	.byte	0x68
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
	.byte	0x8
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
	.byte	0x9
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
	.byte	0xa
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
	.byte	0xb
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
	.byte	0xc
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
	.byte	0xd
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0xe
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
	.byte	0xf
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
	.byte	0x10
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
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
	.byte	0x12
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
	.byte	0x13
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
.LASF12:
	.string	"regs"
.LASF10:
	.string	"plic_handle_irq"
.LASF2:
	.string	"sbadaddr"
.LASF3:
	.string	"scause"
.LASF21:
	.string	"plic_set_prority"
.LASF4:
	.string	"hstatus"
.LASF18:
	.string	"pt_regs"
.LASF1:
	.string	"sstatus"
.LASF5:
	.string	"long unsigned int"
.LASF19:
	.string	"vhwirq"
.LASF14:
	.string	"hwirq_mask"
.LASF15:
	.string	"GNU C17 9.4.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF16:
	.string	"src/plic.c"
.LASF8:
	.string	"hart"
.LASF0:
	.string	"sepc"
.LASF17:
	.string	"/home/acetab/\346\241\214\351\235\242/benos"
.LASF13:
	.string	"enable"
.LASF7:
	.string	"unsigned int"
.LASF9:
	.string	"claim_reg"
.LASF20:
	.string	"plic_init"
.LASF11:
	.string	"plic_enable_irq"
.LASF6:
	.string	"hwirq"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
