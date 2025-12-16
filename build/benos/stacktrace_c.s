	.file	"stacktrace.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.type	print_trace_address, @function
print_trace_address:
.LFB0:
	.file 1 "src/stacktrace.c"
	.loc 1 11 1
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
	.loc 1 12 2
	ld	a0,-24(s0)
	call	print_symbol
	.loc 1 13 9
	li	a5,0
	.loc 1 14 1
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
.LFE0:
	.size	print_trace_address, .-print_trace_address
	.align	2
	.type	kernel_text, @function
kernel_text:
.LFB1:
	.loc 1 18 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 19 14
	lla	a5,_text
	.loc 1 19 5
	ld	a4,-24(s0)
	bltu	a4,a5,.L4
	.loc 1 20 13 discriminator 1
	lla	a5,_etext
	.loc 1 19 35 discriminator 1
	ld	a4,-24(s0)
	bgeu	a4,a5,.L4
	.loc 1 21 10
	li	a5,1
	j	.L5
.L4:
	.loc 1 23 9
	li	a5,0
.L5:
	.loc 1 24 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	kernel_text, .-kernel_text
	.align	2
	.type	walk_stackframe, @function
walk_stackframe:
.LFB2:
	.loc 1 28 1
	.cfi_startproc
	addi	sp,sp,-96
	.cfi_def_cfa_offset 96
	sd	ra,88(sp)
	sd	s0,80(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,96
	.cfi_def_cfa 8, 0
	sd	a0,-72(s0)
	sd	a1,-80(s0)
	sd	a2,-88(s0)
	.loc 1 33 5
	ld	a5,-72(s0)
	beqz	a5,.L7
	.loc 1 34 6
	ld	a5,-72(s0)
	ld	a5,0(a5)
	sd	a5,-32(s0)
	.loc 1 35 6
	ld	a5,-72(s0)
	ld	a5,16(a5)
	sd	a5,-24(s0)
	.loc 1 36 6
	ld	a5,-72(s0)
	ld	a5,64(a5)
	sd	a5,-40(s0)
	j	.L10
.L7:
.LBB2:
	.loc 1 39 6
	sd	sp,-24(s0)
	.loc 1 40 6
	lla	a5,walk_stackframe
	sd	a5,-32(s0)
	.loc 1 41 23
	mv	a5,s0
	.loc 1 41 6
	sd	a5,-40(s0)
.L10:
.LBE2:
	.loc 1 45 8
	ld	a0,-32(s0)
	call	kernel_text
	mv	a5,a0
	.loc 1 45 6
	beqz	a5,.L11
	.loc 1 45 27 discriminator 1
	ld	a5,-80(s0)
	ld	a1,-88(s0)
	ld	a0,-32(s0)
	jalr	a5
.LVL0:
	mv	a5,a0
	.loc 1 45 24 discriminator 1
	bnez	a5,.L11
	.loc 1 49 7
	ld	a5,-24(s0)
	addi	a5,a5,16
	sd	a5,-48(s0)
	.loc 1 50 6
	ld	a4,-40(s0)
	ld	a5,-48(s0)
	bltu	a4,a5,.L11
	.loc 1 50 23 discriminator 1
	ld	a5,-40(s0)
	andi	a5,a5,7
	.loc 1 50 17 discriminator 1
	bnez	a5,.L11
	.loc 1 57 36
	ld	a5,-40(s0)
	addi	a5,a5,-16
	.loc 1 57 9
	sd	a5,-56(s0)
	.loc 1 58 6
	ld	a5,-40(s0)
	sd	a5,-24(s0)
	.loc 1 59 6
	ld	a5,-56(s0)
	ld	a5,0(a5)
	sd	a5,-40(s0)
	.loc 1 61 13
	ld	a5,-56(s0)
	ld	a5,8(a5)
	.loc 1 61 6
	addi	a5,a5,-4
	sd	a5,-32(s0)
	.loc 1 45 6
	j	.L10
.L11:
	.loc 1 63 1
	nop
	ld	ra,88(sp)
	.cfi_restore 1
	ld	s0,80(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 96
	addi	sp,sp,96
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	walk_stackframe, .-walk_stackframe
	.section	.rodata
	.align	3
.LC0:
	.string	"Call Trace:\n"
	.text
	.align	2
	.globl	show_stack
	.type	show_stack, @function
show_stack:
.LFB3:
	.loc 1 66 1
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
	.loc 1 67 2
	lla	a0,.LC0
	call	printk
	.loc 1 68 2
	li	a2,0
	lla	a1,print_trace_address
	ld	a0,-24(s0)
	call	walk_stackframe
	.loc 1 69 1
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
	.size	show_stack, .-show_stack
	.align	2
	.globl	dump_stack
	.type	dump_stack, @function
dump_stack:
.LFB4:
	.loc 1 72 1
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
	.loc 1 73 2
	ld	a0,-24(s0)
	call	show_stack
	.loc 1 74 1
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
.LFE4:
	.size	dump_stack, .-dump_stack
.Letext0:
	.file 2 "include/asm/ptregs.h"
	.file 3 "include/type.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x442
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF25
	.byte	0xc
	.4byte	.LASF26
	.4byte	.LASF27
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF12
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
	.4byte	0x1f7
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
	.byte	0x8
	.4byte	.LASF28
	.byte	0x3
	.byte	0xd
	.byte	0xf
	.4byte	0x224
	.byte	0x6
	.byte	0x1
	.byte	0x2
	.4byte	.LASF9
	.byte	0x9
	.byte	0x7
	.byte	0x4
	.4byte	0x211
	.byte	0x3
	.byte	0x13
	.byte	0x6
	.4byte	0x246
	.byte	0xa
	.4byte	.LASF10
	.byte	0
	.byte	0xa
	.4byte	.LASF11
	.byte	0x1
	.byte	0
	.byte	0xb
	.4byte	.LASF13
	.byte	0x10
	.byte	0x1
	.byte	0x5
	.byte	0x8
	.4byte	0x26c
	.byte	0x4
	.string	"fp"
	.byte	0x1
	.byte	0x6
	.byte	0x10
	.4byte	0x1f7
	.byte	0
	.byte	0x4
	.string	"ra"
	.byte	0x1
	.byte	0x7
	.byte	0x10
	.4byte	0x1f7
	.byte	0x8
	.byte	0
	.byte	0xc
	.4byte	0x277
	.4byte	0x277
	.byte	0xd
	.byte	0
	.byte	0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF14
	.byte	0xe
	.4byte	.LASF15
	.byte	0x1
	.byte	0x10
	.byte	0xd
	.4byte	0x26c
	.byte	0xe
	.4byte	.LASF16
	.byte	0x1
	.byte	0x10
	.byte	0x16
	.4byte	0x26c
	.byte	0xf
	.4byte	.LASF17
	.byte	0x1
	.byte	0x47
	.byte	0x6
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0x2c4
	.byte	0x10
	.4byte	.LASF19
	.byte	0x1
	.byte	0x47
	.byte	0x21
	.4byte	0x2c4
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x11
	.byte	0x8
	.4byte	0x2d
	.byte	0xf
	.4byte	.LASF18
	.byte	0x1
	.byte	0x41
	.byte	0x6
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x2f8
	.byte	0x10
	.4byte	.LASF19
	.byte	0x1
	.byte	0x41
	.byte	0x21
	.4byte	0x2c4
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x12
	.4byte	.LASF23
	.byte	0x1
	.byte	0x1a
	.byte	0xd
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x3ae
	.byte	0x10
	.4byte	.LASF19
	.byte	0x1
	.byte	0x1a
	.byte	0x2d
	.4byte	0x2c4
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x13
	.string	"fn"
	.byte	0x1
	.byte	0x1a
	.byte	0x3a
	.4byte	0x3c4
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x13
	.string	"arg"
	.byte	0x1
	.byte	0x1b
	.byte	0x9
	.4byte	0x3c2
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0x14
	.string	"sp"
	.byte	0x1
	.byte	0x1d
	.byte	0x10
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x14
	.string	"pc"
	.byte	0x1
	.byte	0x1d
	.byte	0x14
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x14
	.string	"fp"
	.byte	0x1
	.byte	0x1d
	.byte	0x18
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x15
	.4byte	.LASF20
	.byte	0x1
	.byte	0x1e
	.byte	0x15
	.4byte	0x3ca
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x14
	.string	"low"
	.byte	0x1
	.byte	0x1f
	.byte	0x10
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x16
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x15
	.4byte	.LASF21
	.byte	0x1
	.byte	0x26
	.byte	0x20
	.4byte	0x1fe
	.byte	0x1
	.byte	0x52
	.byte	0
	.byte	0
	.byte	0x17
	.4byte	0x218
	.4byte	0x3c2
	.byte	0x18
	.4byte	0x1f7
	.byte	0x18
	.4byte	0x3c2
	.byte	0
	.byte	0x19
	.byte	0x8
	.byte	0x11
	.byte	0x8
	.4byte	0x3ae
	.byte	0x11
	.byte	0x8
	.4byte	0x246
	.byte	0x1a
	.4byte	.LASF29
	.byte	0x1
	.byte	0x11
	.byte	0xc
	.4byte	0x402
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x402
	.byte	0x10
	.4byte	.LASF22
	.byte	0x1
	.byte	0x11
	.byte	0x26
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1b
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x1c
	.4byte	.LASF24
	.byte	0x1
	.byte	0xa
	.byte	0xd
	.4byte	0x218
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x13
	.string	"pc"
	.byte	0x1
	.byte	0xa
	.byte	0x2f
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x13
	.string	"arg"
	.byte	0x1
	.byte	0xa
	.byte	0x39
	.4byte	0x3c2
	.byte	0x2
	.byte	0x91
	.byte	0x60
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
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
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
	.byte	0x9
	.byte	0x4
	.byte	0x1
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
	.byte	0xa
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xb
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
	.byte	0xc
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x21
	.byte	0
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
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0xf
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
	.byte	0x10
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
	.byte	0x11
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x12
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
	.byte	0x13
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
	.byte	0x14
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
	.byte	0x15
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
	.byte	0x16
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x17
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
	.byte	0x18
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x1a
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
	.byte	0x1b
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
	.byte	0x1c
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
.LASF11:
	.string	"true"
.LASF28:
	.string	"bool"
.LASF15:
	.string	"_text"
.LASF17:
	.string	"dump_stack"
.LASF26:
	.string	"src/stacktrace.c"
.LASF2:
	.string	"sbadaddr"
.LASF3:
	.string	"scause"
.LASF22:
	.string	"addr"
.LASF29:
	.string	"kernel_text"
.LASF10:
	.string	"false"
.LASF6:
	.string	"unsigned char"
.LASF4:
	.string	"hstatus"
.LASF12:
	.string	"pt_regs"
.LASF1:
	.string	"sstatus"
.LASF5:
	.string	"long unsigned int"
.LASF25:
	.string	"GNU C17 9.4.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF0:
	.string	"sepc"
.LASF18:
	.string	"show_stack"
.LASF16:
	.string	"_etext"
.LASF27:
	.string	"/home/acetab/\346\241\214\351\235\242/benos"
.LASF13:
	.string	"stackframe"
.LASF14:
	.string	"char"
.LASF21:
	.string	"current_sp"
.LASF8:
	.string	"unsigned int"
.LASF19:
	.string	"regs"
.LASF23:
	.string	"walk_stackframe"
.LASF24:
	.string	"print_trace_address"
.LASF20:
	.string	"frame"
.LASF7:
	.string	"short unsigned int"
.LASF9:
	.string	"_Bool"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
