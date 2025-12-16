	.file	"vs_main.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
#APP
	.pushsection .vm_image, "ax"
.balign 4096
.global vm_image_begin
vm_image_begin:
.incbin "gos.bin"
.balign 4096
.global vm_image_end
vm_image_end:
.global vm_image_size
.set vm_image_size, vm_image_end - vm_image_begin
.popsection
#NO_APP
	.comm	vs_stack,4096,4096
	.section	.rodata
	.align	3
.LC0:
	.string	"hstatus 0x%lx\n"
	.align	3
.LC1:
	.string	"vm_image_begin 0x%lx, size 0x%lx\n"
	.align	3
.LC2:
	.string	"...entering VM...\n"
	.text
	.align	2
	.globl	vs_main
	.type	vs_main, @function
vs_main:
.LFB32:
	.file 1 "virt/vs_main.c"
	.loc 1 42 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
.LBB2:
	.loc 1 45 39
#APP
# 45 "virt/vs_main.c" 1
	csrr a5, sstatus
# 0 "" 2
#NO_APP
	mv	ra,a5
	.loc 1 45 111
	mv	a5,ra
.LBE2:
	.loc 1 45 6
	sd	a5,-24(s0)
	.loc 1 46 6
	ld	a5,-24(s0)
	ori	a5,a5,256
	sd	a5,-24(s0)
.LBB3:
	.loc 1 47 19
	ld	a5,-24(s0)
	sd	a5,-32(s0)
	.loc 1 47 47
	ld	a5,-32(s0)
#APP
# 47 "virt/vs_main.c" 1
	csrw sstatus, a5
# 0 "" 2
#NO_APP
.LBE3:
.LBB4:
	.loc 1 49 39
#APP
# 49 "virt/vs_main.c" 1
	csrr a5, 0x600
# 0 "" 2
#NO_APP
	mv	ra,a5
	.loc 1 49 109
	mv	a5,ra
.LBE4:
	.loc 1 49 6
	sd	a5,-24(s0)
	.loc 1 50 6
	ld	a5,-24(s0)
	ori	a5,a5,384
	sd	a5,-24(s0)
.LBB5:
	.loc 1 51 19
	ld	a5,-24(s0)
	sd	a5,-40(s0)
	.loc 1 51 47
	ld	a5,-40(s0)
#APP
# 51 "virt/vs_main.c" 1
	csrw 0x600, a5
# 0 "" 2
#NO_APP
.LBE5:
	.loc 1 52 2
	ld	a1,-24(s0)
	lla	a0,.LC0
	call	printk
	.loc 1 54 2
	lla	a5,vm_image_begin
	lla	a4,vm_image_size
	mv	a2,a4
	mv	a1,a5
	lla	a0,.LC1
	call	printk
	.loc 1 56 2
	lla	a5,vm_image_begin
	lla	a4,vm_image_size
	.loc 1 56 113
	li	a3,91
	.loc 1 56 2
	mv	a2,a4
	mv	a1,a5
	li	a5,1025
	slli	a0,a5,21
	call	set_stage2_page_mapping
	.loc 1 58 2
	call	write_stage2_pg_reg
	.loc 1 60 2
	lla	a0,.LC2
	call	printk
	.loc 1 63 2
	li	a5,1025
	slli	a0,a5,21
	call	jump_to_vs_mode
.L2:
	.loc 1 65 8 discriminator 1
	j	.L2
	.cfi_endproc
.LFE32:
	.size	vs_main, .-vs_main
.Letext0:
	.file 2 "include/asm/pgtable_types.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x198
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF8
	.byte	0xc
	.4byte	.LASF9
	.4byte	.LASF10
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
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.byte	0x9
	.4byte	0x67
	.byte	0x4
	.4byte	.LASF11
	.byte	0x2
	.byte	0x24
	.byte	0x10
	.4byte	0x42
	.byte	0
	.byte	0
	.byte	0x5
	.4byte	.LASF12
	.byte	0x2
	.byte	0x25
	.byte	0x3
	.4byte	0x50
	.byte	0x6
	.4byte	0x7e
	.4byte	0x7e
	.byte	0x7
	.byte	0
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF5
	.byte	0x8
	.4byte	.LASF6
	.byte	0x1
	.byte	0x10
	.byte	0xd
	.4byte	0x73
	.byte	0x8
	.4byte	.LASF7
	.byte	0x1
	.byte	0x11
	.byte	0xd
	.4byte	0x73
	.byte	0x6
	.4byte	0x7e
	.4byte	0xae
	.byte	0x9
	.4byte	0x42
	.2byte	0xfff
	.byte	0
	.byte	0xa
	.4byte	.LASF13
	.byte	0x1
	.byte	0x25
	.byte	0x6
	.4byte	0x9d
	.2byte	0x1000
	.byte	0x9
	.byte	0x3
	.8byte	vs_stack
	.byte	0xb
	.4byte	.LASF14
	.byte	0x1
	.byte	0x29
	.byte	0x6
	.8byte	.LFB32
	.8byte	.LFE32-.LFB32
	.byte	0x1
	.byte	0x9c
	.4byte	0x194
	.byte	0xc
	.string	"val"
	.byte	0x1
	.byte	0x2b
	.byte	0x10
	.4byte	0x42
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xd
	.4byte	.LASF15
	.byte	0x1
	.byte	0x3f
	.byte	0x2
	.4byte	0x194
	.4byte	0x105
	.byte	0xe
	.byte	0
	.byte	0xf
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.4byte	0x129
	.byte	0xc
	.string	"__v"
	.byte	0x1
	.byte	0x2d
	.byte	0x22
	.4byte	0x42
	.byte	0x1
	.byte	0x51
	.byte	0
	.byte	0xf
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.4byte	0x14e
	.byte	0xc
	.string	"__v"
	.byte	0x1
	.byte	0x2f
	.byte	0x13
	.4byte	0x42
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0xf
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.4byte	0x172
	.byte	0xc
	.string	"__v"
	.byte	0x1
	.byte	0x31
	.byte	0x22
	.4byte	0x42
	.byte	0x1
	.byte	0x51
	.byte	0
	.byte	0x10
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.byte	0xc
	.string	"__v"
	.byte	0x1
	.byte	0x33
	.byte	0x13
	.4byte	0x42
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x4
	.byte	0x5
	.string	"int"
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
	.byte	0x13
	.byte	0x1
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
	.byte	0x4
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
	.byte	0x5
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
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
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
	.byte	0x88,0x1
	.byte	0x5
	.byte	0x2
	.byte	0x18
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
	.byte	0x49
	.byte	0x13
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0xf
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
	.byte	0x10
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x11
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
.LASF7:
	.string	"vm_image_size"
.LASF6:
	.string	"vm_image_begin"
.LASF14:
	.string	"vs_main"
.LASF0:
	.string	"unsigned char"
.LASF3:
	.string	"long unsigned int"
.LASF1:
	.string	"short unsigned int"
.LASF11:
	.string	"pgprot"
.LASF8:
	.string	"GNU C17 9.4.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF2:
	.string	"unsigned int"
.LASF5:
	.string	"char"
.LASF9:
	.string	"virt/vs_main.c"
.LASF10:
	.string	"/home/acetab/\346\241\214\351\235\242/benos"
.LASF12:
	.string	"pgprot_t"
.LASF13:
	.string	"vs_stack"
.LASF4:
	.string	"_Bool"
.LASF15:
	.string	"jump_to_vs_mode"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
