	.file	"kallsyms.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.type	is_kernel, @function
is_kernel:
.LFB0:
	.file 1 "src/kallsyms.c"
	.loc 1 65 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 66 14
	lla	a5,_stext
	.loc 1 66 5
	ld	a4,-24(s0)
	bltu	a4,a5,.L2
	.loc 1 67 12 discriminator 1
	lla	a5,_etext
	.loc 1 66 36 discriminator 1
	ld	a4,-24(s0)
	bgtu	a4,a5,.L2
	.loc 1 68 10
	li	a5,1
	j	.L3
.L2:
	.loc 1 70 10
	li	a5,0
.L3:
	.loc 1 71 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	is_kernel, .-is_kernel
	.align	2
	.type	get_symbol_offset, @function
get_symbol_offset:
.LFB1:
	.loc 1 74 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	.loc 1 78 45
	ld	a5,-40(s0)
	srli	a5,a5,8
	.loc 1 78 41
	lla	a4,kallsyms_markers
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	.loc 1 78 7
	slli	a4,a5,32
	srli	a4,a4,32
	lla	a5,kallsyms_names
	add	a5,a4,a5
	sd	a5,-24(s0)
	.loc 1 80 9
	sw	zero,-28(s0)
	.loc 1 80 2
	j	.L5
.L6:
	.loc 1 81 18 discriminator 3
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	.loc 1 81 25 discriminator 3
	addi	a5,a5,1
	.loc 1 81 8 discriminator 3
	ld	a4,-24(s0)
	add	a5,a4,a5
	sd	a5,-24(s0)
	.loc 1 80 33 discriminator 3
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sw	a5,-28(s0)
.L5:
	.loc 1 80 16 discriminator 1
	lw	a4,-28(s0)
	.loc 1 80 23 discriminator 1
	ld	a5,-40(s0)
	andi	a5,a5,255
	.loc 1 80 2 discriminator 1
	bltu	a4,a5,.L6
	.loc 1 83 14
	ld	a4,-24(s0)
	lla	a5,kallsyms_names
	sub	a5,a4,a5
	sext.w	a5,a5
	.loc 1 84 1
	mv	a0,a5
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	get_symbol_offset, .-get_symbol_offset
	.align	2
	.type	kallsyms_expand_symbol, @function
kallsyms_expand_symbol:
.LFB2:
	.loc 1 87 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	s0,56(sp)
	.cfi_offset 8, -8
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sd	a1,-64(s0)
	sw	a5,-52(s0)
	.loc 1 88 11
	sw	zero,-24(s0)
	.loc 1 91 7
	lwu	a4,-52(s0)
	lla	a5,kallsyms_names
	add	a5,a4,a5
	sd	a5,-40(s0)
	.loc 1 92 8
	ld	a5,-40(s0)
	lbu	a5,0(a5)
	.loc 1 92 6
	sw	a5,-20(s0)
	.loc 1 93 6
	ld	a5,-40(s0)
	addi	a5,a5,1
	sd	a5,-40(s0)
	.loc 1 95 6
	lw	a5,-20(s0)
	lw	a4,-52(s0)
	addw	a5,a4,a5
	sext.w	a5,a5
	addiw	a5,a5,1
	sw	a5,-52(s0)
	.loc 1 97 8
	j	.L9
.L14:
	.loc 1 98 53
	ld	a5,-40(s0)
	lbu	a5,0(a5)
	sext.w	a5,a5
	.loc 1 98 52
	lla	a4,kallsyms_token_index
	slli	a5,a5,1
	add	a5,a4,a5
	lhu	a5,0(a5)
	sext.w	a4,a5
	.loc 1 98 8
	lla	a5,kallsyms_token_table
	add	a5,a4,a5
	sd	a5,-32(s0)
	.loc 1 99 7
	ld	a5,-40(s0)
	addi	a5,a5,1
	sd	a5,-40(s0)
	.loc 1 100 6
	lw	a5,-20(s0)
	addiw	a5,a5,-1
	sw	a5,-20(s0)
	.loc 1 102 9
	j	.L10
.L13:
	.loc 1 103 7
	lw	a5,-24(s0)
	sext.w	a5,a5
	beqz	a5,.L11
	.loc 1 104 15
	ld	a5,-32(s0)
	lbu	a4,0(a5)
	.loc 1 104 13
	ld	a5,-64(s0)
	sb	a4,0(a5)
	.loc 1 105 11
	ld	a5,-64(s0)
	addi	a5,a5,1
	sd	a5,-64(s0)
	j	.L12
.L11:
	.loc 1 107 19
	li	a5,1
	sw	a5,-24(s0)
.L12:
	.loc 1 108 8
	ld	a5,-32(s0)
	addi	a5,a5,1
	sd	a5,-32(s0)
.L10:
	.loc 1 102 10
	ld	a5,-32(s0)
	lbu	a5,0(a5)
	.loc 1 102 9
	bnez	a5,.L13
.L9:
	.loc 1 97 8
	lw	a5,-20(s0)
	sext.w	a5,a5
	bnez	a5,.L14
	.loc 1 112 10
	ld	a5,-64(s0)
	sb	zero,0(a5)
	.loc 1 114 9
	lw	a5,-52(s0)
	.loc 1 115 1
	mv	a0,a5
	ld	s0,56(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	kallsyms_expand_symbol, .-kallsyms_expand_symbol
	.align	2
	.globl	kallsyms_lookup
	.type	kallsyms_lookup, @function
kallsyms_lookup:
.LFB3:
	.loc 1 119 1
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
	sd	a3,-96(s0)
	.loc 1 122 9
	ld	a5,-96(s0)
	addi	a5,a5,127
	.loc 1 122 18
	sb	zero,0(a5)
	.loc 1 123 13
	ld	a5,-96(s0)
	sb	zero,0(a5)
	.loc 1 125 6
	ld	a0,-72(s0)
	call	is_kernel
	mv	a5,a0
	.loc 1 125 5
	beqz	a5,.L17
.LBB2:
	.loc 1 126 17
	sd	zero,-48(s0)
	.loc 1 129 7
	sd	zero,-32(s0)
	.loc 1 130 8
	lla	a5,kallsyms_num_syms
	lw	a5,0(a5)
	slli	a5,a5,32
	srli	a5,a5,32
	sd	a5,-40(s0)
	.loc 1 132 9
	j	.L18
.L20:
	.loc 1 133 15
	ld	a4,-32(s0)
	ld	a5,-40(s0)
	add	a5,a4,a5
	.loc 1 133 8
	srli	a5,a5,1
	sd	a5,-56(s0)
	.loc 1 134 26
	lla	a4,kallsyms_addresses
	ld	a5,-56(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a5,0(a5)
	.loc 1 134 7
	ld	a4,-72(s0)
	bltu	a4,a5,.L19
	.loc 1 135 9
	ld	a5,-56(s0)
	sd	a5,-32(s0)
	j	.L18
.L19:
	.loc 1 137 10
	ld	a5,-56(s0)
	sd	a5,-40(s0)
.L18:
	.loc 1 132 15
	ld	a4,-40(s0)
	ld	a5,-32(s0)
	sub	a4,a4,a5
	.loc 1 132 9
	li	a5,1
	bgtu	a4,a5,.L20
	.loc 1 141 3
	ld	a0,-32(s0)
	call	get_symbol_offset
	mv	a5,a0
	sext.w	a5,a5
	ld	a1,-96(s0)
	mv	a0,a5
	call	kallsyms_expand_symbol
	.loc 1 144 10
	ld	a5,-32(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	.loc 1 144 3
	j	.L21
.L24:
	.loc 1 145 26
	lla	a4,kallsyms_addresses
	ld	a5,-24(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a4,0(a5)
	.loc 1 145 50
	lla	a3,kallsyms_addresses
	ld	a5,-32(s0)
	slli	a5,a5,3
	add	a5,a3,a5
	ld	a5,0(a5)
	.loc 1 145 7
	bleu	a4,a5,.L22
	.loc 1 146 16
	lla	a4,kallsyms_addresses
	ld	a5,-24(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a5,0(a5)
	sd	a5,-48(s0)
	.loc 1 147 5
	j	.L23
.L22:
	.loc 1 144 45 discriminator 2
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
.L21:
	.loc 1 144 23 discriminator 1
	lla	a5,kallsyms_num_syms
	lw	a5,0(a5)
	slli	a5,a5,32
	srli	a5,a5,32
	.loc 1 144 3 discriminator 1
	ld	a4,-24(s0)
	bltu	a4,a5,.L24
.L23:
	.loc 1 151 48
	lla	a4,kallsyms_addresses
	ld	a5,-32(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a5,0(a5)
	.loc 1 151 28
	ld	a4,-48(s0)
	sub	a4,a4,a5
	.loc 1 151 15
	ld	a5,-80(s0)
	sd	a4,0(a5)
	.loc 1 152 38
	lla	a4,kallsyms_addresses
	ld	a5,-32(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a5,0(a5)
	.loc 1 152 18
	ld	a4,-72(s0)
	sub	a4,a4,a5
	.loc 1 152 11
	ld	a5,-88(s0)
	sd	a4,0(a5)
	.loc 1 153 10
	ld	a5,-96(s0)
	j	.L25
.L17:
.LBE2:
	.loc 1 156 9
	li	a5,0
.L25:
	.loc 1 157 1
	mv	a0,a5
	ld	ra,88(sp)
	.cfi_restore 1
	ld	s0,80(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 96
	addi	sp,sp,96
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE3:
	.size	kallsyms_lookup, .-kallsyms_lookup
	.section	.rodata
	.align	3
.LC0:
	.string	"[<0x%016lx>] "
	.align	3
.LC1:
	.string	"%s+0x%lx/0x%lx\n"
	.text
	.align	2
	.globl	print_symbol
	.type	print_symbol, @function
print_symbol:
.LFB4:
	.loc 1 160 1
	.cfi_startproc
	addi	sp,sp,-192
	.cfi_def_cfa_offset 192
	sd	ra,184(sp)
	sd	s0,176(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,192
	.cfi_def_cfa 8, 0
	sd	a0,-184(s0)
	.loc 1 165 9
	addi	a3,s0,-168
	addi	a4,s0,-32
	addi	a5,s0,-40
	mv	a2,a4
	mv	a1,a5
	ld	a0,-184(s0)
	call	kallsyms_lookup
	sd	a0,-24(s0)
	.loc 1 166 5
	ld	a5,-24(s0)
	bnez	a5,.L27
	.loc 1 167 3
	ld	a1,-184(s0)
	lla	a0,.LC0
	call	printk
	.loc 1 172 1
	j	.L29
.L27:
	.loc 1 169 3
	ld	a1,-184(s0)
	lla	a0,.LC0
	call	printk
	.loc 1 170 3
	ld	a5,-32(s0)
	ld	a4,-40(s0)
	mv	a3,a4
	mv	a2,a5
	ld	a1,-24(s0)
	lla	a0,.LC1
	call	printk
.L29:
	.loc 1 172 1
	nop
	ld	ra,184(sp)
	.cfi_restore 1
	ld	s0,176(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 192
	addi	sp,sp,192
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	print_symbol, .-print_symbol
	.weak	kallsyms_addresses
	.weak	kallsyms_num_syms
	.weak	kallsyms_token_table
	.weak	kallsyms_token_index
	.weak	kallsyms_names
	.weak	kallsyms_markers
.Letext0:
	.file 2 "include/type.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x364
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF28
	.byte	0xc
	.4byte	.LASF29
	.4byte	.LASF30
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.string	"u8"
	.byte	0x2
	.byte	0x6
	.byte	0x17
	.4byte	0x3d
	.byte	0x3
	.4byte	0x2d
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF0
	.byte	0x2
	.string	"u16"
	.byte	0x2
	.byte	0x7
	.byte	0x18
	.4byte	0x50
	.byte	0x4
	.byte	0x2
	.byte	0x7
	.4byte	.LASF1
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.byte	0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF3
	.byte	0x4
	.byte	0x1
	.byte	0x2
	.4byte	.LASF4
	.byte	0x5
	.4byte	0x5e
	.4byte	0x77
	.byte	0x6
	.byte	0
	.byte	0x7
	.4byte	.LASF5
	.byte	0x1
	.byte	0x30
	.byte	0x16
	.4byte	0x6c
	.byte	0x7
	.4byte	.LASF6
	.byte	0x1
	.byte	0x33
	.byte	0x15
	.4byte	0x57
	.byte	0x5
	.4byte	0x2d
	.4byte	0x9a
	.byte	0x6
	.byte	0
	.byte	0x7
	.4byte	.LASF7
	.byte	0x1
	.byte	0x36
	.byte	0xb
	.4byte	0x8f
	.byte	0x7
	.4byte	.LASF8
	.byte	0x1
	.byte	0x39
	.byte	0xb
	.4byte	0x8f
	.byte	0x5
	.4byte	0x44
	.4byte	0xbd
	.byte	0x6
	.byte	0
	.byte	0x7
	.4byte	.LASF9
	.byte	0x1
	.byte	0x3a
	.byte	0xc
	.4byte	0xb2
	.byte	0x5
	.4byte	0x57
	.4byte	0xd4
	.byte	0x6
	.byte	0
	.byte	0x7
	.4byte	.LASF10
	.byte	0x1
	.byte	0x3c
	.byte	0x15
	.4byte	0xc9
	.byte	0x5
	.4byte	0xeb
	.4byte	0xeb
	.byte	0x6
	.byte	0
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF11
	.byte	0x3
	.4byte	0xeb
	.byte	0x7
	.4byte	.LASF12
	.byte	0x1
	.byte	0x3e
	.byte	0xd
	.4byte	0xe0
	.byte	0x7
	.4byte	.LASF13
	.byte	0x1
	.byte	0x3e
	.byte	0x17
	.4byte	0xe0
	.byte	0x8
	.4byte	.LASF31
	.byte	0x1
	.byte	0x9f
	.byte	0x6
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0x17b
	.byte	0x9
	.4byte	.LASF18
	.byte	0x1
	.byte	0x9f
	.byte	0x21
	.4byte	0x5e
	.byte	0x3
	.byte	0x91
	.byte	0xc8,0x7e
	.byte	0xa
	.4byte	.LASF14
	.byte	0x1
	.byte	0xa1
	.byte	0xe
	.4byte	0x17b
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xa
	.4byte	.LASF15
	.byte	0x1
	.byte	0xa2
	.byte	0x10
	.4byte	0x5e
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xa
	.4byte	.LASF16
	.byte	0x1
	.byte	0xa2
	.byte	0x18
	.4byte	0x5e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xa
	.4byte	.LASF17
	.byte	0x1
	.byte	0xa3
	.byte	0x7
	.4byte	0x181
	.byte	0x3
	.byte	0x91
	.byte	0xd8,0x7e
	.byte	0
	.byte	0xb
	.byte	0x8
	.4byte	0xf2
	.byte	0x5
	.4byte	0xeb
	.4byte	0x191
	.byte	0xc
	.4byte	0x5e
	.byte	0x7f
	.byte	0
	.byte	0xd
	.4byte	.LASF32
	.byte	0x1
	.byte	0x75
	.byte	0xd
	.4byte	0x17b
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x24f
	.byte	0x9
	.4byte	.LASF18
	.byte	0x1
	.byte	0x75
	.byte	0x2b
	.4byte	0x5e
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x9
	.4byte	.LASF19
	.byte	0x1
	.byte	0x75
	.byte	0x40
	.4byte	0x24f
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x9
	.4byte	.LASF15
	.byte	0x1
	.byte	0x76
	.byte	0x12
	.4byte	0x24f
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0x9
	.4byte	.LASF17
	.byte	0x1
	.byte	0x76
	.byte	0x20
	.4byte	0x255
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x7f
	.byte	0xe
	.string	"i"
	.byte	0x1
	.byte	0x78
	.byte	0x10
	.4byte	0x5e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xe
	.string	"low"
	.byte	0x1
	.byte	0x78
	.byte	0x13
	.4byte	0x5e
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xa
	.4byte	.LASF20
	.byte	0x1
	.byte	0x78
	.byte	0x18
	.4byte	0x5e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xe
	.string	"mid"
	.byte	0x1
	.byte	0x78
	.byte	0x1e
	.4byte	0x5e
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xf
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0xa
	.4byte	.LASF21
	.byte	0x1
	.byte	0x7e
	.byte	0x11
	.4byte	0x5e
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x8
	.4byte	0x5e
	.byte	0xb
	.byte	0x8
	.4byte	0xeb
	.byte	0x10
	.4byte	.LASF26
	.byte	0x1
	.byte	0x56
	.byte	0x15
	.4byte	0x57
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x2d8
	.byte	0x11
	.string	"off"
	.byte	0x1
	.byte	0x56
	.byte	0x39
	.4byte	0x57
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0x9
	.4byte	.LASF22
	.byte	0x1
	.byte	0x56
	.byte	0x44
	.4byte	0x255
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0xe
	.string	"len"
	.byte	0x1
	.byte	0x58
	.byte	0x6
	.4byte	0x2d8
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0xa
	.4byte	.LASF23
	.byte	0x1
	.byte	0x58
	.byte	0xb
	.4byte	0x2d8
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xa
	.4byte	.LASF24
	.byte	0x1
	.byte	0x59
	.byte	0x6
	.4byte	0x2df
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xa
	.4byte	.LASF25
	.byte	0x1
	.byte	0x59
	.byte	0xd
	.4byte	0x2df
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0x12
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0xb
	.byte	0x8
	.4byte	0x2d
	.byte	0x10
	.4byte	.LASF27
	.byte	0x1
	.byte	0x49
	.byte	0x15
	.4byte	0x57
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x333
	.byte	0x11
	.string	"pos"
	.byte	0x1
	.byte	0x49
	.byte	0x35
	.4byte	0x5e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xa
	.4byte	.LASF14
	.byte	0x1
	.byte	0x4b
	.byte	0xc
	.4byte	0x333
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xe
	.string	"i"
	.byte	0x1
	.byte	0x4c
	.byte	0x6
	.4byte	0x2d8
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0
	.byte	0xb
	.byte	0x8
	.4byte	0x38
	.byte	0x13
	.4byte	.LASF33
	.byte	0x1
	.byte	0x40
	.byte	0xc
	.4byte	0x2d8
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x9
	.4byte	.LASF18
	.byte	0x1
	.byte	0x40
	.byte	0x24
	.4byte	0x5e
	.byte	0x2
	.byte	0x91
	.byte	0x68
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
	.byte	0x3
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
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
	.byte	0x5
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x21
	.byte	0
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
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x8
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
	.byte	0x9
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
	.byte	0x2
	.byte	0x18
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
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xd
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
	.byte	0xe
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
	.byte	0xf
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x10
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
	.byte	0x11
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
.LASF29:
	.string	"src/kallsyms.c"
.LASF12:
	.string	"_stext"
.LASF20:
	.string	"high"
.LASF17:
	.string	"namebuf"
.LASF5:
	.string	"kallsyms_addresses"
.LASF32:
	.string	"kallsyms_lookup"
.LASF26:
	.string	"kallsyms_expand_symbol"
.LASF18:
	.string	"addr"
.LASF25:
	.string	"data"
.LASF0:
	.string	"unsigned char"
.LASF3:
	.string	"long unsigned int"
.LASF1:
	.string	"short unsigned int"
.LASF23:
	.string	"skipped_first"
.LASF28:
	.string	"GNU C17 9.4.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF31:
	.string	"print_symbol"
.LASF7:
	.string	"kallsyms_names"
.LASF2:
	.string	"unsigned int"
.LASF27:
	.string	"get_symbol_offset"
.LASF11:
	.string	"char"
.LASF22:
	.string	"result"
.LASF8:
	.string	"kallsyms_token_table"
.LASF30:
	.string	"/home/acetab/\346\241\214\351\235\242/benos"
.LASF10:
	.string	"kallsyms_markers"
.LASF14:
	.string	"name"
.LASF15:
	.string	"offset"
.LASF19:
	.string	"symbolsize"
.LASF21:
	.string	"symbol_end"
.LASF9:
	.string	"kallsyms_token_index"
.LASF6:
	.string	"kallsyms_num_syms"
.LASF24:
	.string	"tptr"
.LASF16:
	.string	"size"
.LASF4:
	.string	"_Bool"
.LASF13:
	.string	"_etext"
.LASF33:
	.string	"is_kernel"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
