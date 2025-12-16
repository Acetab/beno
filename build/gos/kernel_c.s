	.file	"kernel.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.type	arch_local_irq_enable, @function
arch_local_irq_enable:
.LFB0:
	.file 1 "include/asm/irq.h"
	.loc 1 10 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
.LBB2:
	.loc 1 11 19
	li	a5,2
	sd	a5,-24(s0)
	.loc 1 11 49
	ld	a5,-24(s0)
#APP
# 11 "include/asm/irq.h" 1
	csrs sstatus, a5
# 0 "" 2
#NO_APP
.LBE2:
	.loc 1 12 1
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	arch_local_irq_enable, .-arch_local_irq_enable
	.align	2
	.type	clean_bss, @function
clean_bss:
.LFB3:
	.file 2 "gos/kernel.c"
	.loc 2 9 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	.loc 2 10 16
	lla	a5,bss_begin
	sd	a5,-24(s0)
	.loc 2 11 16
	lla	a5,bss_end
	sd	a5,-32(s0)
	.loc 2 12 22
	ld	a5,-32(s0)
	sext.w	a4,a5
	ld	a5,-24(s0)
	sext.w	a5,a5
	.loc 2 12 11
	subw	a5,a4,a5
	sw	a5,-36(s0)
	.loc 2 14 2
	ld	a5,-24(s0)
	lw	a4,-36(s0)
	mv	a2,a4
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 2 15 1
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
	.size	clean_bss, .-clean_bss
	.section	.rodata
	.align	3
.LC0:
	.string	"Welcome GuestOS!\r\n"
	.align	3
.LC1:
	.string	"printk init done\n"
	.text
	.align	2
	.globl	kernel_main
	.type	kernel_main, @function
kernel_main:
.LFB4:
	.loc 2 18 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 19 2
	call	clean_bss
	.loc 2 20 2
	call	uart_init
	.loc 2 21 2
	lla	a0,.LC0
	call	uart_send_string
	.loc 2 22 2
	lla	a0,putchar
	call	init_printk_done
	.loc 2 23 2
	lla	a0,.LC1
	call	printk
	.loc 2 25 2
	call	vs_trap_init
	.loc 2 27 2
	call	plic_init
	.loc 2 28 2
	call	enable_uart_plic
	.loc 2 29 2
	call	arch_local_irq_enable
.L4:
	.loc 2 31 8 discriminator 1
	j	.L4
	.cfi_endproc
.LFE4:
	.size	kernel_main, .-kernel_main
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x119
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF10
	.byte	0xc
	.4byte	.LASF11
	.4byte	.LASF12
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
	.4byte	0x5b
	.4byte	0x5b
	.byte	0x4
	.byte	0
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF5
	.byte	0x5
	.4byte	.LASF6
	.byte	0x2
	.byte	0x7
	.byte	0xd
	.4byte	0x50
	.byte	0x5
	.4byte	.LASF7
	.byte	0x2
	.byte	0x7
	.byte	0x1a
	.4byte	0x50
	.byte	0x6
	.4byte	.LASF13
	.byte	0x2
	.byte	0x11
	.byte	0x6
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.byte	0x7
	.4byte	.LASF14
	.byte	0x2
	.byte	0x8
	.byte	0xd
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0xe0
	.byte	0x8
	.4byte	.LASF8
	.byte	0x2
	.byte	0xa
	.byte	0x10
	.4byte	0x42
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x9
	.string	"end"
	.byte	0x2
	.byte	0xb
	.byte	0x10
	.4byte	0x42
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x8
	.4byte	.LASF9
	.byte	0x2
	.byte	0xc
	.byte	0xb
	.4byte	0x3b
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0
	.byte	0xa
	.4byte	.LASF15
	.byte	0x1
	.byte	0x9
	.byte	0x14
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0xb
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x9
	.string	"__v"
	.byte	0x1
	.byte	0xb
	.byte	0x13
	.4byte	0x42
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
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x6
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
	.byte	0x7
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
	.byte	0x8
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
	.byte	0xb
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
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
.LASF8:
	.string	"start"
.LASF7:
	.string	"bss_end"
.LASF0:
	.string	"unsigned char"
.LASF3:
	.string	"long unsigned int"
.LASF1:
	.string	"short unsigned int"
.LASF11:
	.string	"gos/kernel.c"
.LASF15:
	.string	"arch_local_irq_enable"
.LASF10:
	.string	"GNU C17 9.4.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF6:
	.string	"bss_begin"
.LASF2:
	.string	"unsigned int"
.LASF5:
	.string	"char"
.LASF12:
	.string	"/home/acetab/\346\241\214\351\235\242/benos"
.LASF14:
	.string	"clean_bss"
.LASF13:
	.string	"kernel_main"
.LASF9:
	.string	"size"
.LASF4:
	.string	"_Bool"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
