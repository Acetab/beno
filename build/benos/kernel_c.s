	.file	"kernel.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.type	sbi_putchar, @function
sbi_putchar:
.LFB2:
	.file 1 "include/asm/sbi.h"
	.loc 1 38 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sb	a5,-17(s0)
.LBB2:
	.loc 1 39 44
	lbu	a5,-17(s0)
	.loc 1 39 28
	mv	a0,a5
	.loc 1 39 87
	li	a1,0
	.loc 1 39 146
	li	a2,0
	.loc 1 39 205
	li	a7,1
	.loc 1 39 243
#APP
# 39 "include/asm/sbi.h" 1
	ecall
# 0 "" 2
#NO_APP
.LBE2:
	.loc 1 40 1
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	sbi_putchar, .-sbi_putchar
	.align	2
	.type	sbi_put_string, @function
sbi_put_string:
.LFB3:
	.loc 1 43 1
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
	.loc 1 46 9
	sw	zero,-20(s0)
	.loc 1 46 2
	j	.L3
.L4:
	.loc 1 47 25 discriminator 3
	lw	a5,-20(s0)
	ld	a4,-40(s0)
	add	a5,a4,a5
	.loc 1 47 3 discriminator 3
	lbu	a5,0(a5)
	mv	a0,a5
	call	sbi_putchar
	.loc 1 46 31 discriminator 3
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L3:
	.loc 1 46 17 discriminator 1
	lw	a5,-20(s0)
	ld	a4,-40(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	.loc 1 46 2 discriminator 1
	bnez	a5,.L4
	.loc 1 48 1
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
.LFE3:
	.size	sbi_put_string, .-sbi_put_string
	.align	2
	.type	get_current, @function
get_current:
.LFB38:
	.file 2 "include/asm/current.h"
	.loc 2 5 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	s0,8(sp)
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 7 9
	mv	a5,tp
	.loc 2 8 1
	mv	a0,a5
	ld	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE38:
	.size	get_current, .-get_current
	.section	.rodata
	.align	3
.LC0:
	.string	"<0x%lx> %s\n"
	.text
	.align	2
	.type	print_func_name, @function
print_func_name:
.LFB43:
	.file 3 "src/kernel.c"
	.loc 3 37 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	sd	s0,48(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	sd	a0,-56(s0)
	.loc 3 41 12
	sw	zero,-20(s0)
	.loc 3 41 5
	j	.L8
.L11:
	.loc 3 42 30
	lla	a4,func_addr
	lw	a5,-20(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a5,0(a5)
	.loc 3 42 12
	ld	a4,-56(s0)
	beq	a4,a5,.L18
	.loc 3 41 37 discriminator 2
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L8:
	.loc 3 41 19 discriminator 1
	lw	a4,-20(s0)
	lla	a5,func_num_syms
	ld	a5,0(a5)
	.loc 3 41 5 discriminator 1
	bltu	a4,a5,.L11
	.loc 3 46 12
	li	a5,0
	j	.L12
.L18:
	.loc 3 43 13
	nop
.L10:
	.loc 3 49 7
	lla	a5,func_string
	sd	a5,-32(s0)
	.loc 3 51 8
	lw	a5,-20(s0)
	sext.w	a5,a5
	bnez	a5,.L13
	.loc 3 52 16
	ld	a5,-32(s0)
	sd	a5,-40(s0)
	.loc 3 53 9
	j	.L14
.L13:
	.loc 3 57 10
	ld	a5,-32(s0)
	addi	a5,a5,1
	sd	a5,-32(s0)
	.loc 3 59 13
	ld	a5,-32(s0)
	lbu	a5,0(a5)
	.loc 3 59 12
	bnez	a5,.L15
	.loc 3 60 14
	lw	a5,-20(s0)
	addiw	a5,a5,-1
	sw	a5,-20(s0)
.L15:
	.loc 3 62 12
	lw	a5,-20(s0)
	sext.w	a5,a5
	bnez	a5,.L13
	.loc 3 63 14
	ld	a5,-32(s0)
	addi	a5,a5,1
	sd	a5,-32(s0)
	.loc 3 64 20
	ld	a5,-32(s0)
	sd	a5,-40(s0)
.L14:
	.loc 3 70 5
	ld	a2,-40(s0)
	ld	a1,-56(s0)
	lla	a0,.LC0
	call	printk
	.loc 3 72 12
	li	a5,0
.L12:
	.loc 3 73 1
	mv	a0,a5
	ld	ra,56(sp)
	.cfi_restore 1
	ld	s0,48(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE43:
	.size	print_func_name, .-print_func_name
	.section	.rodata
	.align	3
.LC1:
	.string	"BenOS image layout:\n"
	.align	3
.LC2:
	.string	"  .text.boot: 0x%08lx - 0x%08lx (%6ld B)\n"
	.align	3
.LC3:
	.string	"       .text: 0x%08lx - 0x%08lx (%6ld B)\n"
	.align	3
.LC4:
	.string	"     .rodata: 0x%08lx - 0x%08lx (%6ld B)\n"
	.align	3
.LC5:
	.string	"       .data: 0x%08lx - 0x%08lx (%6ld B)\n"
	.align	3
.LC6:
	.string	"        .bss: 0x%08lx - 0x%08lx (%6ld B)\n"
	.text
	.align	2
	.type	print_mem, @function
print_mem:
.LFB47:
	.loc 3 100 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 3 101 5
	lla	a0,.LC1
	call	printk
	.loc 3 102 5
	lla	a1,_text_boot
	lla	a2,_etext_boot
	.loc 3 104 41
	lla	a4,_etext_boot
	lla	a5,_text_boot
	sub	a5,a4,a5
	.loc 3 102 5
	mv	a3,a5
	lla	a0,.LC2
	call	printk
	.loc 3 105 5
	lla	a1,_text
	lla	a2,_etext
	.loc 3 107 36
	lla	a4,_etext
	lla	a5,_text
	sub	a5,a4,a5
	.loc 3 105 5
	mv	a3,a5
	lla	a0,.LC3
	call	printk
	.loc 3 108 5
	lla	a1,_rodata
	lla	a2,_erodata
	.loc 3 110 38
	lla	a4,_erodata
	lla	a5,_rodata
	sub	a5,a4,a5
	.loc 3 108 5
	mv	a3,a5
	lla	a0,.LC4
	call	printk
	.loc 3 111 5
	lla	a1,_data
	lla	a2,_edata
	.loc 3 113 36
	lla	a4,_edata
	lla	a5,_data
	sub	a5,a4,a5
	.loc 3 111 5
	mv	a3,a5
	lla	a0,.LC5
	call	printk
	.loc 3 114 5
	lla	a1,_bss
	lla	a2,_ebss
	.loc 3 116 35
	lla	a4,_ebss
	lla	a5,_bss
	sub	a5,a4,a5
	.loc 3 114 5
	mv	a3,a5
	lla	a0,.LC6
	call	printk
	.loc 3 117 1
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
.LFE47:
	.size	print_mem, .-print_mem
	.align	2
	.type	clean_bss, @function
clean_bss:
.LFB48:
	.loc 3 120 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	.loc 3 121 19
	lla	a5,_bss
	sd	a5,-24(s0)
	.loc 3 122 19
	lla	a5,_ebss
	sd	a5,-32(s0)
	.loc 3 123 25
	ld	a5,-32(s0)
	sext.w	a4,a5
	ld	a5,-24(s0)
	sext.w	a5,a5
	.loc 3 123 14
	subw	a5,a4,a5
	sw	a5,-36(s0)
	.loc 3 125 5
	ld	a5,-24(s0)
	lw	a4,-36(s0)
	mv	a2,a4
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 3 126 1
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
.LFE48:
	.size	clean_bss, .-clean_bss
	.section	.rodata
	.align	3
.LC7:
	.string	"Welcome RISC-V!\r\n"
	.align	3
.LC8:
	.string	"printk init done\n"
	.align	3
.LC9:
	.string	"trap init done\n"
	.align	3
.LC10:
	.string	"System init done. Preparing to jump to User App...\n"
	.align	3
.LC11:
	.string	"Executing sret to jump to 0x%lx...\n"
	.text
	.align	2
	.globl	kernel_main
	.type	kernel_main, @function
kernel_main:
.LFB49:
	.loc 3 133 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	.loc 3 135 5
	call	clean_bss
	.loc 3 136 5
	lla	a0,.LC7
	call	sbi_put_string
	.loc 3 145 5
	call	uart_init
	.loc 3 146 5
	lla	a0,putchar
	call	init_printk_done
	.loc 3 147 5
	lla	a0,.LC8
	call	printk
	.loc 3 150 5
	call	trap_init
	.loc 3 151 5
	lla	a0,.LC9
	call	printk
	.loc 3 153 5
	call	print_mem
	.loc 3 157 5
	lla	a0,.LC10
	call	printk
.LBB3:
	.loc 3 161 60
#APP
# 161 "src/kernel.c" 1
	csrr a5, sstatus
# 0 "" 2
#NO_APP
	mv	ra,a5
	.loc 3 161 132
	mv	a5,ra
.LBE3:
	.loc 3 161 19
	sd	a5,-24(s0)
	.loc 3 163 13
	ld	a5,-24(s0)
	andi	a5,a5,-257
	sd	a5,-24(s0)
	.loc 3 165 13
	ld	a5,-24(s0)
	ori	a5,a5,32
	sd	a5,-24(s0)
	.loc 3 167 13
	ld	a4,-24(s0)
	li	a5,-262144
	addi	a5,a5,-1
	and	a5,a4,a5
	sd	a5,-24(s0)
.LBB4:
	.loc 3 169 22
	ld	a5,-24(s0)
	sd	a5,-32(s0)
	.loc 3 169 54
	ld	a5,-32(s0)
#APP
# 169 "src/kernel.c" 1
	csrw sstatus, a5
# 0 "" 2
#NO_APP
.LBE4:
.LBB5:
	.loc 3 172 22
	lla	a5,my_user_app
	sd	a5,-40(s0)
	.loc 3 172 73
	ld	a5,-40(s0)
#APP
# 172 "src/kernel.c" 1
	csrw sepc, a5
# 0 "" 2
#NO_APP
.LBE5:
	.loc 3 174 5
	lla	a5,my_user_app
	mv	a1,a5
	lla	a0,.LC11
	call	printk
	.loc 3 177 5
#APP
# 177 "src/kernel.c" 1
	sret
# 0 "" 2
#NO_APP
.L22:
	.loc 3 180 11 discriminator 1
	j	.L22
	.cfi_endproc
.LFE49:
	.size	kernel_main, .-kernel_main
.Letext0:
	.file 4 "include/asm/processor.h"
	.file 5 "include/list.h"
	.file 6 "include/sched.h"
	.file 7 "include/type.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x63e
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF70
	.byte	0xc
	.4byte	.LASF71
	.4byte	.LASF72
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
	.byte	0x7
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
	.4byte	.LASF5
	.byte	0x70
	.byte	0x4
	.byte	0xf
	.byte	0x8
	.4byte	0x8d
	.byte	0x5
	.string	"ra"
	.byte	0x4
	.byte	0x10
	.byte	0x10
	.4byte	0x4e
	.byte	0
	.byte	0x5
	.string	"sp"
	.byte	0x4
	.byte	0x11
	.byte	0x10
	.4byte	0x4e
	.byte	0x8
	.byte	0x5
	.string	"s"
	.byte	0x4
	.byte	0x14
	.byte	0x10
	.4byte	0x8d
	.byte	0x10
	.byte	0
	.byte	0x6
	.4byte	0x4e
	.4byte	0x9d
	.byte	0x7
	.4byte	0x4e
	.byte	0xb
	.byte	0
	.byte	0x4
	.4byte	.LASF6
	.byte	0x10
	.byte	0x5
	.byte	0x3
	.byte	0x8
	.4byte	0xc5
	.byte	0x8
	.4byte	.LASF7
	.byte	0x5
	.byte	0x4
	.byte	0x14
	.4byte	0xc5
	.byte	0
	.byte	0x8
	.4byte	.LASF8
	.byte	0x5
	.byte	0x4
	.byte	0x1b
	.4byte	0xc5
	.byte	0x8
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x9d
	.byte	0x4
	.4byte	.LASF9
	.byte	0x30
	.byte	0x6
	.byte	0x13
	.byte	0x8
	.4byte	0x127
	.byte	0x8
	.4byte	.LASF7
	.byte	0x6
	.byte	0x14
	.byte	0x1c
	.4byte	0x12c
	.byte	0
	.byte	0x8
	.4byte	.LASF10
	.byte	0x6
	.byte	0x16
	.byte	0x9
	.4byte	0x1fa
	.byte	0x8
	.byte	0x8
	.4byte	.LASF11
	.byte	0x6
	.byte	0x17
	.byte	0x9
	.4byte	0x258
	.byte	0x10
	.byte	0x8
	.4byte	.LASF12
	.byte	0x6
	.byte	0x18
	.byte	0x9
	.4byte	0x258
	.byte	0x18
	.byte	0x8
	.4byte	.LASF13
	.byte	0x6
	.byte	0x19
	.byte	0x9
	.4byte	0x258
	.byte	0x20
	.byte	0x8
	.4byte	.LASF14
	.byte	0x6
	.byte	0x1a
	.byte	0x19
	.4byte	0x272
	.byte	0x28
	.byte	0
	.byte	0xa
	.4byte	0xcb
	.byte	0x9
	.byte	0x8
	.4byte	0x127
	.byte	0xb
	.4byte	0x13d
	.byte	0xc
	.4byte	0x13d
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x143
	.byte	0x4
	.4byte	.LASF15
	.byte	0xc0
	.byte	0x6
	.byte	0x32
	.byte	0x8
	.4byte	0x1fa
	.byte	0x8
	.4byte	.LASF5
	.byte	0x6
	.byte	0x33
	.byte	0x15
	.4byte	0x5c
	.byte	0
	.byte	0x8
	.4byte	.LASF16
	.byte	0x6
	.byte	0x34
	.byte	0x6
	.4byte	0x2c2
	.byte	0x70
	.byte	0x8
	.4byte	.LASF17
	.byte	0x6
	.byte	0x35
	.byte	0x6
	.4byte	0x2c2
	.byte	0x74
	.byte	0x8
	.4byte	.LASF18
	.byte	0x6
	.byte	0x36
	.byte	0x10
	.4byte	0x4e
	.byte	0x78
	.byte	0x8
	.4byte	.LASF19
	.byte	0x6
	.byte	0x37
	.byte	0x10
	.4byte	0x4e
	.byte	0x80
	.byte	0x8
	.4byte	.LASF20
	.byte	0x6
	.byte	0x38
	.byte	0x12
	.4byte	0x278
	.byte	0x88
	.byte	0x8
	.4byte	.LASF21
	.byte	0x6
	.byte	0x39
	.byte	0x12
	.4byte	0x2a9
	.byte	0x8c
	.byte	0x5
	.string	"pid"
	.byte	0x6
	.byte	0x3a
	.byte	0x6
	.4byte	0x2c2
	.byte	0x90
	.byte	0x8
	.4byte	.LASF22
	.byte	0x6
	.byte	0x3b
	.byte	0x13
	.4byte	0x9d
	.byte	0x98
	.byte	0x8
	.4byte	.LASF23
	.byte	0x6
	.byte	0x3c
	.byte	0x6
	.4byte	0x2c2
	.byte	0xa8
	.byte	0x8
	.4byte	.LASF24
	.byte	0x6
	.byte	0x3d
	.byte	0x6
	.4byte	0x2c2
	.byte	0xac
	.byte	0x8
	.4byte	.LASF25
	.byte	0x6
	.byte	0x3e
	.byte	0x16
	.4byte	0x13d
	.byte	0xb0
	.byte	0x8
	.4byte	.LASF26
	.byte	0x6
	.byte	0x3f
	.byte	0x16
	.4byte	0x13d
	.byte	0xb8
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x132
	.byte	0xb
	.4byte	0x210
	.byte	0xc
	.4byte	0x210
	.byte	0xc
	.4byte	0x13d
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x216
	.byte	0x4
	.4byte	.LASF27
	.byte	0x28
	.byte	0x6
	.byte	0x1e
	.byte	0x8
	.4byte	0x258
	.byte	0x8
	.4byte	.LASF28
	.byte	0x6
	.byte	0x1f
	.byte	0x13
	.4byte	0x9d
	.byte	0
	.byte	0x8
	.4byte	.LASF29
	.byte	0x6
	.byte	0x20
	.byte	0xf
	.4byte	0x3b
	.byte	0x10
	.byte	0x8
	.4byte	.LASF30
	.byte	0x6
	.byte	0x21
	.byte	0x6
	.4byte	0x42
	.byte	0x18
	.byte	0x8
	.4byte	.LASF31
	.byte	0x6
	.byte	0x22
	.byte	0x16
	.4byte	0x13d
	.byte	0x20
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x200
	.byte	0xd
	.4byte	0x13d
	.4byte	0x272
	.byte	0xc
	.4byte	0x210
	.byte	0xc
	.4byte	0x13d
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x25e
	.byte	0xe
	.4byte	.LASF37
	.byte	0x7
	.byte	0x4
	.4byte	0x3b
	.byte	0x6
	.byte	0x25
	.byte	0x6
	.4byte	0x2a9
	.byte	0xf
	.4byte	.LASF32
	.byte	0
	.byte	0xf
	.4byte	.LASF33
	.byte	0x1
	.byte	0xf
	.4byte	.LASF34
	.byte	0x2
	.byte	0xf
	.4byte	.LASF35
	.byte	0x3
	.byte	0xf
	.4byte	.LASF36
	.byte	0x4
	.byte	0
	.byte	0xe
	.4byte	.LASF38
	.byte	0x7
	.byte	0x4
	.4byte	0x3b
	.byte	0x6
	.byte	0x2d
	.byte	0x6
	.4byte	0x2c2
	.byte	0xf
	.4byte	.LASF39
	.byte	0x1
	.byte	0
	.byte	0x10
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x11
	.4byte	.LASF73
	.2byte	0x1000
	.byte	0x6
	.byte	0x46
	.byte	0x7
	.4byte	0x2f0
	.byte	0x12
	.4byte	.LASF40
	.byte	0x6
	.byte	0x47
	.byte	0x15
	.4byte	0x143
	.byte	0x12
	.4byte	.LASF41
	.byte	0x6
	.byte	0x48
	.byte	0x10
	.4byte	0x2f0
	.byte	0
	.byte	0x6
	.4byte	0x4e
	.4byte	0x301
	.byte	0x13
	.4byte	0x4e
	.2byte	0x1ff
	.byte	0
	.byte	0x6
	.4byte	0x13d
	.4byte	0x30c
	.byte	0x14
	.byte	0
	.byte	0x15
	.4byte	.LASF42
	.byte	0x6
	.byte	0x5b
	.byte	0x1c
	.4byte	0x301
	.byte	0x15
	.4byte	.LASF43
	.byte	0x6
	.byte	0x5d
	.byte	0x19
	.4byte	0x2c9
	.byte	0x15
	.4byte	.LASF44
	.byte	0x6
	.byte	0x6c
	.byte	0x21
	.4byte	0x127
	.byte	0x6
	.4byte	0x4e
	.4byte	0x33b
	.byte	0x14
	.byte	0
	.byte	0x15
	.4byte	.LASF45
	.byte	0x3
	.byte	0x1b
	.byte	0x16
	.4byte	0x330
	.byte	0x15
	.4byte	.LASF46
	.byte	0x3
	.byte	0x1c
	.byte	0x16
	.4byte	0x4e
	.byte	0x15
	.4byte	.LASF47
	.byte	0x3
	.byte	0x1d
	.byte	0xd
	.4byte	0x35f
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF48
	.byte	0x6
	.4byte	0x35f
	.4byte	0x371
	.byte	0x14
	.byte	0
	.byte	0x15
	.4byte	.LASF49
	.byte	0x3
	.byte	0x5d
	.byte	0xd
	.4byte	0x366
	.byte	0x15
	.4byte	.LASF50
	.byte	0x3
	.byte	0x5d
	.byte	0x1b
	.4byte	0x366
	.byte	0x15
	.4byte	.LASF51
	.byte	0x3
	.byte	0x5e
	.byte	0xd
	.4byte	0x366
	.byte	0x15
	.4byte	.LASF52
	.byte	0x3
	.byte	0x5e
	.byte	0x16
	.4byte	0x366
	.byte	0x15
	.4byte	.LASF53
	.byte	0x3
	.byte	0x5f
	.byte	0xd
	.4byte	0x366
	.byte	0x15
	.4byte	.LASF54
	.byte	0x3
	.byte	0x5f
	.byte	0x18
	.4byte	0x366
	.byte	0x15
	.4byte	.LASF55
	.byte	0x3
	.byte	0x60
	.byte	0xd
	.4byte	0x366
	.byte	0x15
	.4byte	.LASF56
	.byte	0x3
	.byte	0x60
	.byte	0x16
	.4byte	0x366
	.byte	0x15
	.4byte	.LASF57
	.byte	0x3
	.byte	0x61
	.byte	0xd
	.4byte	0x366
	.byte	0x15
	.4byte	.LASF58
	.byte	0x3
	.byte	0x61
	.byte	0x15
	.4byte	0x366
	.byte	0x16
	.4byte	.LASF74
	.byte	0x3
	.byte	0x84
	.byte	0x6
	.8byte	.LFB49
	.8byte	.LFE49-.LFB49
	.byte	0x1
	.byte	0x9c
	.4byte	0x481
	.byte	0x17
	.4byte	.LASF59
	.byte	0x3
	.byte	0xa1
	.byte	0x13
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x18
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.4byte	0x43a
	.byte	0x19
	.string	"__v"
	.byte	0x3
	.byte	0xa1
	.byte	0x37
	.4byte	0x4e
	.byte	0x1
	.byte	0x51
	.byte	0
	.byte	0x18
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.4byte	0x45f
	.byte	0x19
	.string	"__v"
	.byte	0x3
	.byte	0xa9
	.byte	0x16
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x1a
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.byte	0x19
	.string	"__v"
	.byte	0x3
	.byte	0xac
	.byte	0x16
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0
	.byte	0x1b
	.4byte	.LASF67
	.byte	0x3
	.byte	0x77
	.byte	0xd
	.8byte	.LFB48
	.8byte	.LFE48-.LFB48
	.byte	0x1
	.byte	0x9c
	.4byte	0x4cd
	.byte	0x17
	.4byte	.LASF60
	.byte	0x3
	.byte	0x79
	.byte	0x13
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x19
	.string	"end"
	.byte	0x3
	.byte	0x7a
	.byte	0x13
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x17
	.4byte	.LASF61
	.byte	0x3
	.byte	0x7b
	.byte	0xe
	.4byte	0x3b
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0
	.byte	0x1c
	.4byte	.LASF75
	.byte	0x3
	.byte	0x63
	.byte	0xd
	.8byte	.LFB47
	.8byte	.LFE47-.LFB47
	.byte	0x1
	.byte	0x9c
	.byte	0x1d
	.4byte	.LASF65
	.byte	0x3
	.byte	0x24
	.byte	0xc
	.4byte	0x2c2
	.8byte	.LFB43
	.8byte	.LFE43-.LFB43
	.byte	0x1
	.byte	0x9c
	.4byte	0x562
	.byte	0x1e
	.4byte	.LASF69
	.byte	0x3
	.byte	0x24
	.byte	0x2a
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x19
	.string	"i"
	.byte	0x3
	.byte	0x26
	.byte	0x9
	.4byte	0x2c2
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x19
	.string	"p"
	.byte	0x3
	.byte	0x27
	.byte	0xb
	.4byte	0x562
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x17
	.4byte	.LASF62
	.byte	0x3
	.byte	0x27
	.byte	0xf
	.4byte	0x562
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1f
	.4byte	.LASF63
	.byte	0x3
	.byte	0x30
	.byte	0x1
	.8byte	.L10
	.byte	0x1f
	.4byte	.LASF64
	.byte	0x3
	.byte	0x45
	.byte	0x1
	.8byte	.L14
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x35f
	.byte	0x20
	.4byte	.LASF66
	.byte	0x2
	.byte	0x4
	.byte	0x1c
	.4byte	0x13d
	.8byte	.LFB38
	.8byte	.LFE38-.LFB38
	.byte	0x1
	.byte	0x9c
	.4byte	0x598
	.byte	0x19
	.string	"tp"
	.byte	0x2
	.byte	0x6
	.byte	0x1f
	.4byte	0x13d
	.byte	0x1
	.byte	0x54
	.byte	0
	.byte	0x1b
	.4byte	.LASF68
	.byte	0x1
	.byte	0x2a
	.byte	0x14
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x5d3
	.byte	0x21
	.string	"str"
	.byte	0x1
	.byte	0x2a
	.byte	0x29
	.4byte	0x562
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x19
	.string	"i"
	.byte	0x1
	.byte	0x2c
	.byte	0x6
	.4byte	0x2c2
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x22
	.4byte	.LASF76
	.byte	0x1
	.byte	0x25
	.byte	0x14
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.byte	0x21
	.string	"c"
	.byte	0x1
	.byte	0x25
	.byte	0x25
	.4byte	0x35f
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0x1a
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x19
	.string	"a0"
	.byte	0x1
	.byte	0x27
	.byte	0x1c
	.4byte	0x4e
	.byte	0x1
	.byte	0x5a
	.byte	0x19
	.string	"a1"
	.byte	0x1
	.byte	0x27
	.byte	0x57
	.4byte	0x4e
	.byte	0x1
	.byte	0x5b
	.byte	0x19
	.string	"a2"
	.byte	0x1
	.byte	0x27
	.byte	0x92
	.4byte	0x4e
	.byte	0x1
	.byte	0x5c
	.byte	0x19
	.string	"a7"
	.byte	0x1
	.byte	0x27
	.byte	0xcd
	.4byte	0x4e
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
	.byte	0x5
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
	.byte	0x6
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x8
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
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x5
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
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
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
	.byte	0xf
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x10
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
	.byte	0x11
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
	.byte	0x12
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
	.byte	0x13
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x21
	.byte	0
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
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x16
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x18
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
	.byte	0x19
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
	.byte	0x1a
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x1b
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
	.byte	0x1c
	.byte	0x2e
	.byte	0
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
	.byte	0x1d
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1e
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
	.byte	0x1f
	.byte	0xa
	.byte	0
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
	.byte	0x22
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
.LASF72:
	.string	"/home/acetab/\346\241\214\351\235\242/benos"
.LASF69:
	.string	"addr"
.LASF49:
	.string	"_text_boot"
.LASF10:
	.string	"task_fork"
.LASF6:
	.string	"list_head"
.LASF24:
	.string	"priority"
.LASF17:
	.string	"need_resched"
.LASF20:
	.string	"state"
.LASF54:
	.string	"_erodata"
.LASF57:
	.string	"_bss"
.LASF75:
	.string	"print_mem"
.LASF56:
	.string	"_edata"
.LASF40:
	.string	"task"
.LASF15:
	.string	"task_struct"
.LASF50:
	.string	"_etext_boot"
.LASF16:
	.string	"preempt_count"
.LASF32:
	.string	"TASK_RUNNING"
.LASF51:
	.string	"_text"
.LASF14:
	.string	"pick_next_task"
.LASF39:
	.string	"PF_KTHREAD"
.LASF12:
	.string	"dequeue_task"
.LASF5:
	.string	"cpu_context"
.LASF18:
	.string	"kernel_sp"
.LASF27:
	.string	"run_queue"
.LASF58:
	.string	"_ebss"
.LASF68:
	.string	"sbi_put_string"
.LASF13:
	.string	"task_tick"
.LASF47:
	.string	"func_string"
.LASF26:
	.string	"prev_task"
.LASF62:
	.string	"string"
.LASF71:
	.string	"src/kernel.c"
.LASF22:
	.string	"run_list"
.LASF55:
	.string	"_data"
.LASF67:
	.string	"clean_bss"
.LASF65:
	.string	"print_func_name"
.LASF59:
	.string	"mstatus"
.LASF28:
	.string	"rq_head"
.LASF0:
	.string	"unsigned char"
.LASF23:
	.string	"counter"
.LASF64:
	.string	"done"
.LASF45:
	.string	"func_addr"
.LASF21:
	.string	"flags"
.LASF2:
	.string	"unsigned int"
.LASF35:
	.string	"TASK_ZOMBIE"
.LASF41:
	.string	"stack"
.LASF60:
	.string	"start"
.LASF1:
	.string	"short unsigned int"
.LASF46:
	.string	"func_num_syms"
.LASF74:
	.string	"kernel_main"
.LASF48:
	.string	"char"
.LASF66:
	.string	"get_current"
.LASF31:
	.string	"curr"
.LASF73:
	.string	"task_union"
.LASF4:
	.string	"_Bool"
.LASF38:
	.string	"task_flags"
.LASF43:
	.string	"init_task_union"
.LASF53:
	.string	"_rodata"
.LASF3:
	.string	"long unsigned int"
.LASF37:
	.string	"task_state"
.LASF61:
	.string	"size"
.LASF63:
	.string	"found"
.LASF19:
	.string	"user_sp"
.LASF30:
	.string	"nr_switches"
.LASF44:
	.string	"simple_sched_class"
.LASF42:
	.string	"g_task"
.LASF70:
	.string	"GNU C17 9.4.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF36:
	.string	"TASK_STOPPED"
.LASF29:
	.string	"nr_running"
.LASF9:
	.string	"sched_class"
.LASF76:
	.string	"sbi_putchar"
.LASF8:
	.string	"prev"
.LASF34:
	.string	"TASK_UNINTERRUPTIBLE"
.LASF25:
	.string	"next_task"
.LASF52:
	.string	"_etext"
.LASF11:
	.string	"enqueue_task"
.LASF33:
	.string	"TASK_INTERRUPTIBLE"
.LASF7:
	.string	"next"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
