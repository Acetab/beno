	.file	"uart.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.globl	uart_send
	.type	uart_send, @function
uart_send:
.LFB4:
	.file 1 "gos/uart.c"
	.loc 1 8 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sb	a5,-33(s0)
	.loc 1 9 7
	nop
.L2:
.LBB2:
	.loc 1 9 33 discriminator 1
	li	a5,268435456
	addi	a5,a5,5
	.loc 1 9 26 discriminator 1
	lbu	a5,0(a5)
	sb	a5,-17(s0)
	.loc 1 9 83 discriminator 1
	.loc 1 9 125 discriminator 1
	lbu	a5,-17(s0)
.LBE2:
	.loc 1 9 133 discriminator 1
	sext.w	a5,a5
	andi	a5,a5,64
	sext.w	a5,a5
	.loc 1 9 7 discriminator 1
	beqz	a5,.L2
.LBB3:
	.loc 1 12 19
	lbu	a5,-33(s0)
	sb	a5,-18(s0)
	.loc 1 12 28
	.loc 1 12 71
	li	a5,268435456
	.loc 1 12 119
	lbu	a4,-18(s0)
	sb	a4,0(a5)
.LBE3:
	.loc 1 13 1
	nop
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	uart_send, .-uart_send
	.align	2
	.globl	uart_get
	.type	uart_get, @function
uart_get:
.LFB5:
	.loc 1 16 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
.LBB4:
	.loc 1 17 30
	li	a5,268435456
	addi	a5,a5,5
	.loc 1 17 23
	lbu	a5,0(a5)
	sb	a5,-17(s0)
	.loc 1 17 80
	.loc 1 17 122
	lbu	a5,-17(s0)
.LBE4:
	.loc 1 17 130
	sext.w	a5,a5
	andi	a5,a5,1
	sext.w	a5,a5
	.loc 1 17 5
	beqz	a5,.L4
.LBB5:
	.loc 1 18 34
	li	a5,268435456
	.loc 1 18 27
	lbu	a5,0(a5)
	sb	a5,-18(s0)
	.loc 1 18 84
	.loc 1 18 126
	lbu	a5,-18(s0)
.LBE5:
	.loc 1 18 11
	j	.L5
.L4:
	.loc 1 20 10
	li	a5,255
.L5:
	.loc 1 21 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE5:
	.size	uart_get, .-uart_get
	.align	2
	.globl	uart_send_string
	.type	uart_send_string, @function
uart_send_string:
.LFB6:
	.loc 1 24 1
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
	.loc 1 27 9
	sw	zero,-20(s0)
	.loc 1 27 2
	j	.L7
.L8:
	.loc 1 28 23 discriminator 3
	lw	a5,-20(s0)
	ld	a4,-40(s0)
	add	a5,a4,a5
	.loc 1 28 3 discriminator 3
	lbu	a5,0(a5)
	mv	a0,a5
	call	uart_send
	.loc 1 27 31 discriminator 3
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L7:
	.loc 1 27 17 discriminator 1
	lw	a5,-20(s0)
	ld	a4,-40(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	.loc 1 27 2 discriminator 1
	bnez	a5,.L8
	.loc 1 29 1
	nop
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
.LFE6:
	.size	uart_send_string, .-uart_send_string
	.align	2
	.globl	putchar
	.type	putchar, @function
putchar:
.LFB7:
	.loc 1 32 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sb	a5,-17(s0)
	.loc 1 33 11
	lbu	a5,-17(s0)
	andi	a4,a5,0xff
	li	a5,10
	bne	a4,a5,.L10
	.loc 1 34 16
	li	a0,13
	call	uart_send
.L10:
	.loc 1 35 8
	lbu	a5,-17(s0)
	mv	a0,a5
	call	uart_send
	.loc 1 36 1
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
	.size	putchar, .-putchar
	.section	.sdata,"aw"
	.align	2
	.type	uart16550_clock, @object
	.size	uart16550_clock, 4
uart16550_clock:
	.word	1843200
	.text
	.align	2
	.globl	uart_init
	.type	uart_init, @function
uart_init:
.LFB8:
	.loc 1 42 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 43 41
	lla	a5,uart16550_clock
	lw	a5,0(a5)
	.loc 1 43 15
	mv	a4,a5
	li	a5,1843200
	divuw	a5,a4,a5
	sw	a5,-20(s0)
.LBB6:
	.loc 1 46 19
	sb	zero,-21(s0)
	.loc 1 46 28
	.loc 1 46 71
	li	a5,268435456
	addi	a5,a5,1
	.loc 1 46 119
	lbu	a4,-21(s0)
	sb	a4,0(a5)
.LBE6:
.LBB7:
	.loc 1 49 19
	li	a5,-128
	sb	a5,-22(s0)
	.loc 1 49 31
	.loc 1 49 74
	li	a5,268435456
	addi	a5,a5,3
	.loc 1 49 122
	lbu	a4,-22(s0)
	sb	a4,0(a5)
.LBE7:
.LBB8:
	.loc 1 50 19
	lw	a5,-20(s0)
	sb	a5,-23(s0)
	.loc 1 50 49
	.loc 1 50 92
	li	a5,268435456
	.loc 1 50 140
	lbu	a4,-23(s0)
	sb	a4,0(a5)
.LBE8:
.LBB9:
	.loc 1 51 49
	lw	a5,-20(s0)
	srliw	a5,a5,8
	sext.w	a5,a5
	.loc 1 51 19
	sb	a5,-24(s0)
	.loc 1 51 56
	.loc 1 51 99
	li	a5,268435456
	addi	a5,a5,1
	.loc 1 51 147
	lbu	a4,-24(s0)
	sb	a4,0(a5)
.LBE9:
.LBB10:
	.loc 1 54 19
	li	a5,3
	sb	a5,-25(s0)
	.loc 1 54 30
	.loc 1 54 73
	li	a5,268435456
	addi	a5,a5,3
	.loc 1 54 121
	lbu	a4,-25(s0)
	sb	a4,0(a5)
.LBE10:
.LBB11:
	.loc 1 57 19
	li	a5,-57
	sb	a5,-26(s0)
	.loc 1 57 31
	.loc 1 57 74
	li	a5,268435456
	addi	a5,a5,2
	.loc 1 57 122
	lbu	a4,-26(s0)
	sb	a4,0(a5)
.LBE11:
.LBB12:
	.loc 1 60 19
	li	a5,1
	sb	a5,-27(s0)
	.loc 1 60 30
	.loc 1 60 73
	li	a5,268435456
	addi	a5,a5,1
	.loc 1 60 121
	lbu	a4,-27(s0)
	sb	a4,0(a5)
.LBE12:
	.loc 1 61 1
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	uart_init, .-uart_init
	.section	.rodata
	.align	3
.LC0:
	.string	"gos: %s occurred\n"
	.text
	.align	2
	.globl	handle_uart_irq
	.type	handle_uart_irq, @function
handle_uart_irq:
.LFB9:
	.loc 1 64 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 67 6
	call	uart_get
	mv	a5,a0
	sb	a5,-17(s0)
	.loc 1 70 10
	lbu	a5,-17(s0)
	andi	a4,a5,0xff
	li	a5,13
	bne	a4,a5,.L12
	.loc 1 71 3
	lla	a1,__func__.1635
	lla	a0,.LC0
	call	printk
.L12:
	.loc 1 73 1
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
	.size	handle_uart_irq, .-handle_uart_irq
	.align	2
	.globl	enable_uart_plic
	.type	enable_uart_plic, @function
enable_uart_plic:
.LFB10:
	.loc 1 76 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 78 6
	sw	zero,-20(s0)
	.loc 1 80 2
	call	uart_init
	.loc 1 82 2
	lw	a5,-20(s0)
	li	a2,1
	li	a1,10
	mv	a0,a5
	call	plic_enable_irq
	.loc 1 83 1
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
.LFE10:
	.size	enable_uart_plic, .-enable_uart_plic
	.section	.rodata
	.align	3
	.type	__func__.1635, @object
	.size	__func__.1635, 16
__func__.1635:
	.string	"handle_uart_irq"
	.text
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x35b
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF12
	.byte	0xc
	.4byte	.LASF13
	.4byte	.LASF14
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF0
	.byte	0x3
	.4byte	.LASF2
	.byte	0x1
	.byte	0x26
	.byte	0x15
	.4byte	0x4a
	.byte	0x9
	.byte	0x3
	.8byte	uart16550_clock
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1
	.byte	0x4
	.4byte	.LASF10
	.byte	0x1
	.byte	0x4b
	.byte	0x6
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0x7f
	.byte	0x5
	.string	"cpu"
	.byte	0x1
	.byte	0x4e
	.byte	0x6
	.4byte	0x7f
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x6
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x7
	.4byte	.LASF4
	.byte	0x1
	.byte	0x3f
	.byte	0x6
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0xc5
	.byte	0x5
	.string	"c"
	.byte	0x1
	.byte	0x41
	.byte	0x7
	.4byte	0xc5
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0x8
	.4byte	.LASF15
	.4byte	0xe1
	.byte	0x9
	.byte	0x3
	.8byte	__func__.1635
	.byte	0
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.byte	0x9
	.4byte	0xc5
	.byte	0xa
	.4byte	0xcc
	.4byte	0xe1
	.byte	0xb
	.4byte	0x2d
	.byte	0xf
	.byte	0
	.byte	0x9
	.4byte	0xd1
	.byte	0xc
	.4byte	.LASF5
	.byte	0x1
	.byte	0x29
	.byte	0x6
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0x213
	.byte	0x3
	.4byte	.LASF6
	.byte	0x1
	.byte	0x2b
	.byte	0xf
	.4byte	0x4a
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0xd
	.8byte	.LBB6
	.8byte	.LBE6-.LBB6
	.4byte	0x138
	.byte	0x5
	.string	"__v"
	.byte	0x1
	.byte	0x2e
	.byte	0x13
	.4byte	0x213
	.byte	0x2
	.byte	0x91
	.byte	0x6b
	.byte	0
	.byte	0xd
	.8byte	.LBB7
	.8byte	.LBE7-.LBB7
	.4byte	0x15d
	.byte	0x5
	.string	"__v"
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.4byte	0x213
	.byte	0x2
	.byte	0x91
	.byte	0x6a
	.byte	0
	.byte	0xd
	.8byte	.LBB8
	.8byte	.LBE8-.LBB8
	.4byte	0x182
	.byte	0x5
	.string	"__v"
	.byte	0x1
	.byte	0x32
	.byte	0x13
	.4byte	0x213
	.byte	0x2
	.byte	0x91
	.byte	0x69
	.byte	0
	.byte	0xd
	.8byte	.LBB9
	.8byte	.LBE9-.LBB9
	.4byte	0x1a7
	.byte	0x5
	.string	"__v"
	.byte	0x1
	.byte	0x33
	.byte	0x13
	.4byte	0x213
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xd
	.8byte	.LBB10
	.8byte	.LBE10-.LBB10
	.4byte	0x1cc
	.byte	0x5
	.string	"__v"
	.byte	0x1
	.byte	0x36
	.byte	0x13
	.4byte	0x213
	.byte	0x2
	.byte	0x91
	.byte	0x67
	.byte	0
	.byte	0xd
	.8byte	.LBB11
	.8byte	.LBE11-.LBB11
	.4byte	0x1f1
	.byte	0x5
	.string	"__v"
	.byte	0x1
	.byte	0x39
	.byte	0x13
	.4byte	0x213
	.byte	0x2
	.byte	0x91
	.byte	0x66
	.byte	0
	.byte	0xe
	.8byte	.LBB12
	.8byte	.LBE12-.LBB12
	.byte	0x5
	.string	"__v"
	.byte	0x1
	.byte	0x3c
	.byte	0x13
	.4byte	0x213
	.byte	0x2
	.byte	0x91
	.byte	0x65
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF7
	.byte	0x7
	.4byte	.LASF8
	.byte	0x1
	.byte	0x1f
	.byte	0x6
	.8byte	.LFB7
	.8byte	.LFE7-.LFB7
	.byte	0x1
	.byte	0x9c
	.4byte	0x246
	.byte	0xf
	.string	"c"
	.byte	0x1
	.byte	0x1f
	.byte	0x13
	.4byte	0xc5
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0
	.byte	0x7
	.4byte	.LASF9
	.byte	0x1
	.byte	0x17
	.byte	0x6
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0x281
	.byte	0xf
	.string	"str"
	.byte	0x1
	.byte	0x17
	.byte	0x1d
	.4byte	0x281
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x5
	.string	"i"
	.byte	0x1
	.byte	0x19
	.byte	0x6
	.4byte	0x7f
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x10
	.byte	0x8
	.4byte	0xc5
	.byte	0x11
	.4byte	.LASF16
	.byte	0x1
	.byte	0xf
	.byte	0x6
	.4byte	0xc5
	.8byte	.LFB5
	.8byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.4byte	0x2f0
	.byte	0xd
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.4byte	0x2ce
	.byte	0x5
	.string	"__v"
	.byte	0x1
	.byte	0x11
	.byte	0x17
	.4byte	0x213
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0
	.byte	0xe
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.byte	0x5
	.string	"__v"
	.byte	0x1
	.byte	0x12
	.byte	0x1b
	.4byte	0x213
	.byte	0x2
	.byte	0x91
	.byte	0x6e
	.byte	0
	.byte	0
	.byte	0x12
	.4byte	.LASF11
	.byte	0x1
	.byte	0x7
	.byte	0x6
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.byte	0xf
	.string	"c"
	.byte	0x1
	.byte	0x7
	.byte	0x15
	.4byte	0xc5
	.byte	0x2
	.byte	0x91
	.byte	0x5f
	.byte	0xd
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.4byte	0x33c
	.byte	0x5
	.string	"__v"
	.byte	0x1
	.byte	0x9
	.byte	0x1a
	.4byte	0x213
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0
	.byte	0xe
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0x5
	.string	"__v"
	.byte	0x1
	.byte	0xc
	.byte	0x13
	.4byte	0x213
	.byte	0x2
	.byte	0x91
	.byte	0x6e
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
	.byte	0x4
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
	.byte	0x5
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
	.byte	0x6
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
	.byte	0x7
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
	.byte	0x8
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
	.byte	0x9
	.byte	0x26
	.byte	0
	.byte	0x49
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
	.byte	0xd
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
	.byte	0xe
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0xf
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
	.byte	0x12
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
.LASF15:
	.string	"__func__"
.LASF5:
	.string	"uart_init"
.LASF10:
	.string	"enable_uart_plic"
.LASF7:
	.string	"unsigned char"
.LASF0:
	.string	"long unsigned int"
.LASF8:
	.string	"putchar"
.LASF16:
	.string	"uart_get"
.LASF9:
	.string	"uart_send_string"
.LASF12:
	.string	"GNU C17 9.4.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF1:
	.string	"unsigned int"
.LASF3:
	.string	"char"
.LASF6:
	.string	"divisor"
.LASF2:
	.string	"uart16550_clock"
.LASF14:
	.string	"/home/acetab/\346\241\214\351\235\242/benos"
.LASF13:
	.string	"gos/uart.c"
.LASF4:
	.string	"handle_uart_irq"
.LASF11:
	.string	"uart_send"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
