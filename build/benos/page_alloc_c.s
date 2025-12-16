	.file	"page_alloc.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.local	mem_map
	.comm	mem_map,8192,8
	.local	phy_start_address
	.comm	phy_start_address,8,8
	.section	.rodata
	.align	3
.LC0:
	.string	"Memory: %uKB available, %u free pages, phy_start_address=0x%x\n"
	.text
	.align	2
	.globl	mem_init
	.type	mem_init, @function
mem_init:
.LFB23:
	.file 1 "src/page_alloc.c"
	.loc 1 12 1
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
	.loc 1 13 16
	sd	zero,-24(s0)
	.loc 1 16 37
	ld	a4,-40(s0)
	li	a5,4096
	addi	a5,a5,-1
	add	a4,a4,a5
	.loc 1 16 12
	li	a5,-4096
	and	a5,a4,a5
	sd	a5,-40(s0)
	.loc 1 17 20
	lla	a5,phy_start_address
	ld	a4,-40(s0)
	sd	a4,0(a5)
	.loc 1 18 10
	ld	a4,-48(s0)
	li	a5,-4096
	and	a5,a4,a5
	sd	a5,-48(s0)
	.loc 1 19 7
	ld	a4,-48(s0)
	ld	a5,-40(s0)
	sub	a5,a4,a5
	sd	a5,-32(s0)
	.loc 1 21 8
	j	.L2
.L3:
	.loc 1 22 16
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	.loc 1 23 13
	ld	a4,-40(s0)
	li	a5,4096
	add	a5,a4,a5
	sd	a5,-40(s0)
.L2:
	.loc 1 21 8
	ld	a4,-40(s0)
	ld	a5,-48(s0)
	bltu	a4,a5,.L3
	.loc 1 26 2
	ld	a5,-32(s0)
	srli	a4,a5,10
	lla	a5,phy_start_address
	ld	a5,0(a5)
	mv	a3,a5
	ld	a2,-24(s0)
	mv	a1,a4
	lla	a0,.LC0
	call	printk
	.loc 1 27 1
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
.LFE23:
	.size	mem_init, .-mem_init
	.align	2
	.globl	get_free_page
	.type	get_free_page, @function
get_free_page:
.LFB24:
	.loc 1 30 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 33 9
	sw	zero,-20(s0)
	.loc 1 33 2
	j	.L5
.L8:
	.loc 1 34 14
	lla	a4,mem_map
	lw	a5,-20(s0)
	slli	a5,a5,1
	add	a5,a4,a5
	lhu	a5,0(a5)
	.loc 1 34 6
	bnez	a5,.L6
	.loc 1 35 15
	lla	a4,mem_map
	lw	a5,-20(s0)
	slli	a5,a5,1
	add	a5,a4,a5
	li	a4,1
	sh	a4,0(a5)
	.loc 1 36 33
	lw	a5,-20(s0)
	slliw	a5,a5,12
	sext.w	a5,a5
	mv	a4,a5
	.loc 1 36 29
	lla	a5,phy_start_address
	ld	a5,0(a5)
	add	a5,a4,a5
	j	.L7
.L6:
	.loc 1 33 52 discriminator 2
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L5:
	.loc 1 33 16 discriminator 1
	lw	a5,-20(s0)
	.loc 1 33 2 discriminator 1
	mv	a4,a5
	li	a5,4096
	bltu	a4,a5,.L8
	.loc 1 39 9
	li	a5,0
.L7:
	.loc 1 40 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE24:
	.size	get_free_page, .-get_free_page
	.align	2
	.globl	free_page
	.type	free_page, @function
free_page:
.LFB25:
	.loc 1 43 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 44 13
	lla	a5,phy_start_address
	ld	a5,0(a5)
	ld	a4,-24(s0)
	sub	a5,a4,a5
	.loc 1 44 33
	srli	a5,a5,12
	.loc 1 44 45
	lla	a4,mem_map
	slli	a5,a5,1
	add	a5,a4,a5
	sh	zero,0(a5)
	.loc 1 45 1
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE25:
	.size	free_page, .-free_page
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x144
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF11
	.byte	0xc
	.4byte	.LASF12
	.4byte	.LASF13
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
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF4
	.byte	0x3
	.4byte	0x34
	.4byte	0x61
	.byte	0x4
	.4byte	0x42
	.2byte	0xfff
	.byte	0
	.byte	0x5
	.4byte	.LASF5
	.byte	0x1
	.byte	0x7
	.byte	0x17
	.4byte	0x50
	.byte	0x9
	.byte	0x3
	.8byte	mem_map
	.byte	0x5
	.4byte	.LASF6
	.byte	0x1
	.byte	0x9
	.byte	0x16
	.4byte	0x42
	.byte	0x9
	.byte	0x3
	.8byte	phy_start_address
	.byte	0x6
	.4byte	.LASF14
	.byte	0x1
	.byte	0x2a
	.byte	0x6
	.8byte	.LFB25
	.8byte	.LFE25-.LFB25
	.byte	0x1
	.byte	0x9c
	.4byte	0xb9
	.byte	0x7
	.string	"p"
	.byte	0x1
	.byte	0x2a
	.byte	0x1e
	.4byte	0x42
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x8
	.4byte	.LASF15
	.byte	0x1
	.byte	0x1d
	.byte	0xf
	.4byte	0x42
	.8byte	.LFB24
	.8byte	.LFE24-.LFB24
	.byte	0x1
	.byte	0x9c
	.4byte	0xe9
	.byte	0x9
	.string	"i"
	.byte	0x1
	.byte	0x1f
	.byte	0x6
	.4byte	0xe9
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0xa
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0xb
	.4byte	.LASF16
	.byte	0x1
	.byte	0xb
	.byte	0x6
	.8byte	.LFB23
	.8byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
	.byte	0xc
	.4byte	.LASF7
	.byte	0x1
	.byte	0xb
	.byte	0x1d
	.4byte	0x42
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xc
	.4byte	.LASF8
	.byte	0x1
	.byte	0xb
	.byte	0x36
	.4byte	0x42
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x5
	.4byte	.LASF9
	.byte	0x1
	.byte	0xd
	.byte	0x10
	.4byte	0x42
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x5
	.4byte	.LASF10
	.byte	0x1
	.byte	0xe
	.byte	0x10
	.4byte	0x42
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
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x5
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
	.byte	0x6
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
	.byte	0x7
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
	.byte	0x9
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
	.byte	0xa
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
.LASF9:
	.string	"nr_free_pages"
.LASF16:
	.string	"mem_init"
.LASF6:
	.string	"phy_start_address"
.LASF0:
	.string	"unsigned char"
.LASF3:
	.string	"long unsigned int"
.LASF5:
	.string	"mem_map"
.LASF1:
	.string	"short unsigned int"
.LASF7:
	.string	"start_mem"
.LASF8:
	.string	"end_mem"
.LASF11:
	.string	"GNU C17 9.4.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF2:
	.string	"unsigned int"
.LASF13:
	.string	"/home/acetab/\346\241\214\351\235\242/benos"
.LASF10:
	.string	"free"
.LASF12:
	.string	"src/page_alloc.c"
.LASF15:
	.string	"get_free_page"
.LASF14:
	.string	"free_page"
.LASF4:
	.string	"_Bool"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
