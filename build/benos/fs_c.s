	.file	"fs.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata
	.align	3
.LC0:
	.string	"%s\n"
	.text
	.align	2
	.globl	sys_open
	.type	sys_open, @function
sys_open:
.LFB0:
	.file 1 "src/fs.c"
	.loc 1 5 1
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
	mv	a5,a1
	mv	a4,a2
	sw	a5,-28(s0)
	mv	a5,a4
	sw	a5,-32(s0)
	.loc 1 6 2
	lla	a1,__func__.1524
	lla	a0,.LC0
	call	printk
	.loc 1 8 9
	li	a5,0
	.loc 1 9 1
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
	.size	sys_open, .-sys_open
	.align	2
	.globl	sys_close
	.type	sys_close, @function
sys_close:
.LFB1:
	.loc 1 12 1
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
	sw	a5,-20(s0)
	.loc 1 13 2
	lla	a1,__func__.1528
	lla	a0,.LC0
	call	printk
	.loc 1 15 9
	li	a5,0
	.loc 1 16 1
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
.LFE1:
	.size	sys_close, .-sys_close
	.align	2
	.globl	sys_read
	.type	sys_read, @function
sys_read:
.LFB2:
	.loc 1 19 1
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
	sd	a1,-32(s0)
	mv	a4,a2
	sw	a5,-20(s0)
	mv	a5,a4
	sw	a5,-24(s0)
	.loc 1 20 2
	lla	a1,__func__.1534
	lla	a0,.LC0
	call	printk
	.loc 1 22 9
	li	a5,0
	.loc 1 23 1
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
.LFE2:
	.size	sys_read, .-sys_read
	.align	2
	.globl	sys_write
	.type	sys_write, @function
sys_write:
.LFB3:
	.loc 1 26 1
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
	sd	a1,-32(s0)
	mv	a4,a2
	sw	a5,-20(s0)
	mv	a5,a4
	sw	a5,-24(s0)
	.loc 1 27 2
	lla	a1,__func__.1540
	lla	a0,.LC0
	call	printk
	.loc 1 29 9
	li	a5,0
	.loc 1 30 1
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
.LFE3:
	.size	sys_write, .-sys_write
	.section	.rodata
	.align	3
	.type	__func__.1524, @object
	.size	__func__.1524, 9
__func__.1524:
	.string	"sys_open"
	.align	3
	.type	__func__.1528, @object
	.size	__func__.1528, 10
__func__.1528:
	.string	"sys_close"
	.align	3
	.type	__func__.1534, @object
	.size	__func__.1534, 9
__func__.1534:
	.string	"sys_read"
	.align	3
	.type	__func__.1540, @object
	.size	__func__.1540, 10
__func__.1540:
	.string	"sys_write"
	.text
.Letext0:
	.file 2 "include/type.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x214
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF16
	.byte	0xc
	.4byte	.LASF17
	.4byte	.LASF18
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
	.4byte	.LASF19
	.byte	0x2
	.byte	0xb
	.byte	0x16
	.4byte	0x3b
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF4
	.byte	0x4
	.4byte	.LASF7
	.byte	0x1
	.byte	0x19
	.byte	0x5
	.4byte	0xbe
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0xbe
	.byte	0x5
	.string	"fd"
	.byte	0x1
	.byte	0x19
	.byte	0x1c
	.4byte	0x3b
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x5
	.string	"buf"
	.byte	0x1
	.byte	0x19
	.byte	0x26
	.4byte	0xc5
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x6
	.4byte	.LASF5
	.byte	0x1
	.byte	0x19
	.byte	0x32
	.4byte	0x49
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x7
	.4byte	.LASF9
	.4byte	0xe7
	.byte	0x9
	.byte	0x3
	.8byte	__func__.1540
	.byte	0
	.byte	0x8
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x9
	.byte	0x8
	.4byte	0xcb
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0xa
	.4byte	0xcb
	.byte	0xb
	.4byte	0xd2
	.4byte	0xe7
	.byte	0xc
	.4byte	0x42
	.byte	0x9
	.byte	0
	.byte	0xa
	.4byte	0xd7
	.byte	0x4
	.4byte	.LASF8
	.byte	0x1
	.byte	0x12
	.byte	0x5
	.4byte	0xbe
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x14e
	.byte	0x5
	.string	"fd"
	.byte	0x1
	.byte	0x12
	.byte	0x1b
	.4byte	0x3b
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x5
	.string	"buf"
	.byte	0x1
	.byte	0x12
	.byte	0x25
	.4byte	0xc5
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x6
	.4byte	.LASF5
	.byte	0x1
	.byte	0x12
	.byte	0x31
	.4byte	0x49
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x7
	.4byte	.LASF9
	.4byte	0x15e
	.byte	0x9
	.byte	0x3
	.8byte	__func__.1534
	.byte	0
	.byte	0xb
	.4byte	0xd2
	.4byte	0x15e
	.byte	0xc
	.4byte	0x42
	.byte	0x8
	.byte	0
	.byte	0xa
	.4byte	0x14e
	.byte	0x4
	.4byte	.LASF10
	.byte	0x1
	.byte	0xb
	.byte	0x6
	.4byte	0x1a7
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x1a7
	.byte	0x5
	.string	"fd"
	.byte	0x1
	.byte	0xb
	.byte	0x1d
	.4byte	0x3b
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x7
	.4byte	.LASF9
	.4byte	0xe7
	.byte	0x9
	.byte	0x3
	.8byte	__func__.1528
	.byte	0
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF11
	.byte	0x4
	.4byte	.LASF12
	.byte	0x1
	.byte	0x4
	.byte	0x6
	.4byte	0x1a7
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x211
	.byte	0x6
	.4byte	.LASF13
	.byte	0x1
	.byte	0x4
	.byte	0x1b
	.4byte	0x211
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x6
	.4byte	.LASF14
	.byte	0x1
	.byte	0x4
	.byte	0x29
	.4byte	0xbe
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x6
	.4byte	.LASF15
	.byte	0x1
	.byte	0x4
	.byte	0x34
	.4byte	0xbe
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x7
	.4byte	.LASF9
	.4byte	0x15e
	.byte	0x9
	.byte	0x3
	.8byte	__func__.1524
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0xd2
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
	.byte	0x5
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
	.byte	0x6
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
	.byte	0x7
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
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
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
.LASF1:
	.string	"short unsigned int"
.LASF2:
	.string	"unsigned int"
.LASF18:
	.string	"/home/acetab/\346\241\214\351\235\242/benos"
.LASF15:
	.string	"mode"
.LASF14:
	.string	"flags"
.LASF19:
	.string	"size_t"
.LASF12:
	.string	"sys_open"
.LASF3:
	.string	"long unsigned int"
.LASF8:
	.string	"sys_read"
.LASF0:
	.string	"unsigned char"
.LASF6:
	.string	"char"
.LASF5:
	.string	"count"
.LASF11:
	.string	"long int"
.LASF10:
	.string	"sys_close"
.LASF4:
	.string	"_Bool"
.LASF17:
	.string	"src/fs.c"
.LASF7:
	.string	"sys_write"
.LASF13:
	.string	"filename"
.LASF16:
	.string	"GNU C17 9.4.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF9:
	.string	"__func__"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
