	.file	"vs_vplic.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.globl	emu_plic_basic
	.type	emu_plic_basic, @function
emu_plic_basic:
.LFB1:
	.file 1 "virt/vs_vplic.c"
	.loc 1 10 1
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
	.loc 1 11 16
	ld	a5,-40(s0)
	ld	a5,8(a5)
	sd	a5,-24(s0)
	.loc 1 12 18
	ld	a5,-24(s0)
	srli	a5,a5,12
	.loc 1 12 25
	sext.w	a5,a5
	.loc 1 12 6
	andi	a5,a5,3
	sw	a5,-28(s0)
	.loc 1 14 2
	lw	a5,-28(s0)
	sext.w	a4,a5
	li	a5,2
	beq	a4,a5,.L2
	lw	a5,-28(s0)
	sext.w	a4,a5
	li	a5,2
	bgt	a4,a5,.L3
	lw	a5,-28(s0)
	sext.w	a5,a5
	beqz	a5,.L4
	lw	a5,-28(s0)
	sext.w	a4,a5
	li	a5,1
	beq	a4,a5,.L5
	j	.L3
.L4:
	.loc 1 16 3
	ld	a0,-40(s0)
	call	emu_mmio_rw_reg32
	.loc 1 17 3
	j	.L3
.L5:
	.loc 1 19 3
	ld	a0,-40(s0)
	call	emu_mmio_ro_reg32
	.loc 1 20 3
	j	.L3
.L2:
	.loc 1 22 3
	ld	a0,-40(s0)
	call	emu_mmio_rw_reg32
	.loc 1 23 3
	nop
.L3:
	.loc 1 26 9
	li	a5,0
	.loc 1 27 1
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
.LFE1:
	.size	emu_plic_basic, .-emu_plic_basic
	.align	2
	.type	emu_mmio_plic_claim, @function
emu_mmio_plic_claim:
.LFB2:
	.loc 1 30 1
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
	.loc 1 33 14
	ld	a5,-24(s0)
	lw	a5,16(a5)
	.loc 1 33 5
	beqz	a5,.L8
	.loc 1 34 10
	lla	a5,vhwirq
	sw	zero,0(a5)
	.loc 1 38 1
	j	.L10
.L8:
	.loc 1 36 3
	ld	a5,-24(s0)
	ld	a4,0(a5)
	ld	a5,-24(s0)
	lw	a3,28(a5)
	lla	a5,vhwirq
	lw	a5,0(a5)
	mv	a2,a5
	mv	a1,a3
	mv	a0,a4
	call	emul_writereg
.L10:
	.loc 1 38 1
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
	.size	emu_mmio_plic_claim, .-emu_mmio_plic_claim
	.align	2
	.type	emu_plic_claim, @function
emu_plic_claim:
.LFB3:
	.loc 1 41 1
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
	.loc 1 42 16
	ld	a5,-40(s0)
	ld	a5,8(a5)
	sd	a5,-24(s0)
	.loc 1 43 17
	ld	a5,-24(s0)
	sext.w	a5,a5
	.loc 1 43 6
	andi	a5,a5,15
	sw	a5,-28(s0)
	.loc 1 45 2
	lw	a5,-28(s0)
	sext.w	a5,a5
	beqz	a5,.L12
	lw	a5,-28(s0)
	sext.w	a4,a5
	li	a5,4
	beq	a4,a5,.L13
	.loc 1 53 1
	j	.L15
.L12:
	.loc 1 47 3
	ld	a0,-40(s0)
	call	emu_mmio_rw_reg32
	.loc 1 48 3
	j	.L14
.L13:
	.loc 1 50 3
	ld	a0,-40(s0)
	call	emu_mmio_plic_claim
	.loc 1 51 3
	nop
.L14:
.L15:
	.loc 1 53 1
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
.LFE3:
	.size	emu_plic_claim, .-emu_plic_claim
	.align	2
	.globl	emu_plic
	.type	emu_plic, @function
emu_plic:
.LFB4:
	.loc 1 56 1
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
	.loc 1 57 14
	ld	a5,-24(s0)
	ld	a4,8(a5)
	.loc 1 57 5
	li	a5,203423744
	bleu	a4,a5,.L17
	.loc 1 58 3
	ld	a0,-24(s0)
	call	emu_plic_claim
	j	.L18
.L17:
	.loc 1 60 3
	ld	a0,-24(s0)
	call	emu_plic_basic
.L18:
	.loc 1 62 9
	li	a5,0
	.loc 1 63 1
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
	.size	emu_plic, .-emu_plic
.Letext0:
	.file 2 "include/virt.h"
	.file 3 "include/asm/ptregs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x381
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF17
	.byte	0xc
	.4byte	.LASF18
	.4byte	.LASF19
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF5
	.byte	0x20
	.byte	0x2
	.byte	0x4
	.byte	0x8
	.4byte	0x89
	.byte	0x3
	.4byte	.LASF0
	.byte	0x2
	.byte	0x5
	.byte	0x12
	.4byte	0x253
	.byte	0
	.byte	0x3
	.4byte	.LASF1
	.byte	0x2
	.byte	0x6
	.byte	0x10
	.4byte	0x259
	.byte	0x8
	.byte	0x3
	.4byte	.LASF2
	.byte	0x2
	.byte	0x7
	.byte	0x6
	.4byte	0x260
	.byte	0x10
	.byte	0x3
	.4byte	.LASF3
	.byte	0x2
	.byte	0x8
	.byte	0x6
	.4byte	0x260
	.byte	0x14
	.byte	0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x9
	.byte	0x6
	.4byte	0x260
	.byte	0x18
	.byte	0x4
	.string	"reg"
	.byte	0x2
	.byte	0xa
	.byte	0x6
	.4byte	0x260
	.byte	0x1c
	.byte	0
	.byte	0x5
	.4byte	.LASF6
	.2byte	0x120
	.byte	0x3
	.byte	0xe
	.byte	0x8
	.4byte	0x253
	.byte	0x3
	.4byte	.LASF7
	.byte	0x3
	.byte	0x10
	.byte	0x10
	.4byte	0x259
	.byte	0
	.byte	0x4
	.string	"ra"
	.byte	0x3
	.byte	0x11
	.byte	0x10
	.4byte	0x259
	.byte	0x8
	.byte	0x4
	.string	"sp"
	.byte	0x3
	.byte	0x12
	.byte	0x10
	.4byte	0x259
	.byte	0x10
	.byte	0x4
	.string	"gp"
	.byte	0x3
	.byte	0x13
	.byte	0x10
	.4byte	0x259
	.byte	0x18
	.byte	0x4
	.string	"tp"
	.byte	0x3
	.byte	0x14
	.byte	0x10
	.4byte	0x259
	.byte	0x20
	.byte	0x4
	.string	"t0"
	.byte	0x3
	.byte	0x15
	.byte	0x10
	.4byte	0x259
	.byte	0x28
	.byte	0x4
	.string	"t1"
	.byte	0x3
	.byte	0x16
	.byte	0x10
	.4byte	0x259
	.byte	0x30
	.byte	0x4
	.string	"t2"
	.byte	0x3
	.byte	0x17
	.byte	0x10
	.4byte	0x259
	.byte	0x38
	.byte	0x4
	.string	"s0"
	.byte	0x3
	.byte	0x18
	.byte	0x10
	.4byte	0x259
	.byte	0x40
	.byte	0x4
	.string	"s1"
	.byte	0x3
	.byte	0x19
	.byte	0x10
	.4byte	0x259
	.byte	0x48
	.byte	0x4
	.string	"a0"
	.byte	0x3
	.byte	0x1a
	.byte	0x10
	.4byte	0x259
	.byte	0x50
	.byte	0x4
	.string	"a1"
	.byte	0x3
	.byte	0x1b
	.byte	0x10
	.4byte	0x259
	.byte	0x58
	.byte	0x4
	.string	"a2"
	.byte	0x3
	.byte	0x1c
	.byte	0x10
	.4byte	0x259
	.byte	0x60
	.byte	0x4
	.string	"a3"
	.byte	0x3
	.byte	0x1d
	.byte	0x10
	.4byte	0x259
	.byte	0x68
	.byte	0x4
	.string	"a4"
	.byte	0x3
	.byte	0x1e
	.byte	0x10
	.4byte	0x259
	.byte	0x70
	.byte	0x4
	.string	"a5"
	.byte	0x3
	.byte	0x1f
	.byte	0x10
	.4byte	0x259
	.byte	0x78
	.byte	0x4
	.string	"a6"
	.byte	0x3
	.byte	0x20
	.byte	0x10
	.4byte	0x259
	.byte	0x80
	.byte	0x4
	.string	"a7"
	.byte	0x3
	.byte	0x21
	.byte	0x10
	.4byte	0x259
	.byte	0x88
	.byte	0x4
	.string	"s2"
	.byte	0x3
	.byte	0x22
	.byte	0x10
	.4byte	0x259
	.byte	0x90
	.byte	0x4
	.string	"s3"
	.byte	0x3
	.byte	0x23
	.byte	0x10
	.4byte	0x259
	.byte	0x98
	.byte	0x4
	.string	"s4"
	.byte	0x3
	.byte	0x24
	.byte	0x10
	.4byte	0x259
	.byte	0xa0
	.byte	0x4
	.string	"s5"
	.byte	0x3
	.byte	0x25
	.byte	0x10
	.4byte	0x259
	.byte	0xa8
	.byte	0x4
	.string	"s6"
	.byte	0x3
	.byte	0x26
	.byte	0x10
	.4byte	0x259
	.byte	0xb0
	.byte	0x4
	.string	"s7"
	.byte	0x3
	.byte	0x27
	.byte	0x10
	.4byte	0x259
	.byte	0xb8
	.byte	0x4
	.string	"s8"
	.byte	0x3
	.byte	0x28
	.byte	0x10
	.4byte	0x259
	.byte	0xc0
	.byte	0x4
	.string	"s9"
	.byte	0x3
	.byte	0x29
	.byte	0x10
	.4byte	0x259
	.byte	0xc8
	.byte	0x4
	.string	"s10"
	.byte	0x3
	.byte	0x2a
	.byte	0x10
	.4byte	0x259
	.byte	0xd0
	.byte	0x4
	.string	"s11"
	.byte	0x3
	.byte	0x2b
	.byte	0x10
	.4byte	0x259
	.byte	0xd8
	.byte	0x4
	.string	"t3"
	.byte	0x3
	.byte	0x2c
	.byte	0x10
	.4byte	0x259
	.byte	0xe0
	.byte	0x4
	.string	"t4"
	.byte	0x3
	.byte	0x2d
	.byte	0x10
	.4byte	0x259
	.byte	0xe8
	.byte	0x4
	.string	"t5"
	.byte	0x3
	.byte	0x2e
	.byte	0x10
	.4byte	0x259
	.byte	0xf0
	.byte	0x4
	.string	"t6"
	.byte	0x3
	.byte	0x2f
	.byte	0x10
	.4byte	0x259
	.byte	0xf8
	.byte	0x6
	.4byte	.LASF8
	.byte	0x3
	.byte	0x31
	.byte	0x10
	.4byte	0x259
	.2byte	0x100
	.byte	0x6
	.4byte	.LASF9
	.byte	0x3
	.byte	0x32
	.byte	0x10
	.4byte	0x259
	.2byte	0x108
	.byte	0x6
	.4byte	.LASF10
	.byte	0x3
	.byte	0x33
	.byte	0x10
	.4byte	0x259
	.2byte	0x110
	.byte	0x6
	.4byte	.LASF11
	.byte	0x3
	.byte	0x34
	.byte	0x10
	.4byte	0x259
	.2byte	0x118
	.byte	0
	.byte	0x7
	.byte	0x8
	.4byte	0x89
	.byte	0x8
	.byte	0x8
	.byte	0x7
	.4byte	.LASF12
	.byte	0x9
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0xa
	.4byte	.LASF20
	.byte	0x1
	.byte	0x7
	.byte	0xc
	.4byte	0x260
	.byte	0xb
	.4byte	.LASF21
	.byte	0x1
	.byte	0x37
	.byte	0x5
	.4byte	0x260
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0x2a5
	.byte	0xc
	.4byte	.LASF13
	.byte	0x1
	.byte	0x37
	.byte	0x26
	.4byte	0x2a5
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x7
	.byte	0x8
	.4byte	0x2d
	.byte	0xd
	.4byte	.LASF14
	.byte	0x1
	.byte	0x28
	.byte	0xd
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x2f7
	.byte	0xc
	.4byte	.LASF13
	.byte	0x1
	.byte	0x28
	.byte	0x34
	.4byte	0x2a5
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xe
	.4byte	.LASF1
	.byte	0x1
	.byte	0x2a
	.byte	0x10
	.4byte	0x259
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xf
	.string	"reg"
	.byte	0x1
	.byte	0x2b
	.byte	0x6
	.4byte	0x260
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0
	.byte	0xd
	.4byte	.LASF15
	.byte	0x1
	.byte	0x1d
	.byte	0xd
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x331
	.byte	0xc
	.4byte	.LASF13
	.byte	0x1
	.byte	0x1d
	.byte	0x39
	.4byte	0x2a5
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x10
	.string	"val"
	.byte	0x1
	.byte	0x1f
	.byte	0xf
	.4byte	0x331
	.byte	0
	.byte	0x8
	.byte	0x4
	.byte	0x7
	.4byte	.LASF16
	.byte	0x11
	.4byte	.LASF22
	.byte	0x1
	.byte	0x9
	.byte	0x5
	.4byte	0x260
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.byte	0xc
	.4byte	.LASF13
	.byte	0x1
	.byte	0x9
	.byte	0x2c
	.4byte	0x2a5
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xe
	.4byte	.LASF1
	.byte	0x1
	.byte	0xb
	.byte	0x10
	.4byte	0x259
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xf
	.string	"reg"
	.byte	0x1
	.byte	0xc
	.byte	0x6
	.4byte	0x260
	.byte	0x2
	.byte	0x91
	.byte	0x64
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
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
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
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0xa
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
	.byte	0xb
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
	.byte	0xd
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
	.byte	0xe
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
	.byte	0xf
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
	.byte	0x10
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
.LASF9:
	.string	"sbadaddr"
.LASF10:
	.string	"scause"
.LASF22:
	.string	"emu_plic_basic"
.LASF21:
	.string	"emu_plic"
.LASF11:
	.string	"hstatus"
.LASF1:
	.string	"addr"
.LASF18:
	.string	"virt/vs_vplic.c"
.LASF2:
	.string	"write"
.LASF12:
	.string	"long unsigned int"
.LASF20:
	.string	"vhwirq"
.LASF8:
	.string	"sstatus"
.LASF17:
	.string	"GNU C17 9.4.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF7:
	.string	"sepc"
.LASF5:
	.string	"emu_mmio_access"
.LASF15:
	.string	"emu_mmio_plic_claim"
.LASF19:
	.string	"/home/acetab/\346\241\214\351\235\242/benos"
.LASF6:
	.string	"pt_regs"
.LASF14:
	.string	"emu_plic_claim"
.LASF4:
	.string	"width"
.LASF16:
	.string	"unsigned int"
.LASF0:
	.string	"regs"
.LASF13:
	.string	"emu_mmio"
.LASF3:
	.string	"sign_ext"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
