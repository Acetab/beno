	.file	"stage2_mmu.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.type	hfence_gvma, @function
hfence_gvma:
.LFB23:
	.file 1 "include/asm/barrier.h"
	.loc 1 4 34
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	s0,8(sp)
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 5 5
#APP
# 5 "include/asm/barrier.h" 1
	.insn r 0x73, 0x0, 0x31, x0, x0, x0
	
# 0 "" 2
	.loc 1 8 1
#NO_APP
	nop
	ld	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE23:
	.size	hfence_gvma, .-hfence_gvma
	.align	2
	.type	hfence_vvma, @function
hfence_vvma:
.LFB24:
	.loc 1 10 34
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	s0,8(sp)
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 11 5
#APP
# 11 "include/asm/barrier.h" 1
	.insn r 0x73, 0x0, 0x11, x0, x0, x0
	
# 0 "" 2
	.loc 1 14 1
#NO_APP
	nop
	ld	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE24:
	.size	hfence_vvma, .-hfence_vvma
	.align	2
	.type	hfence, @function
hfence:
.LFB25:
	.loc 1 16 29
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 17 2
	call	hfence_vvma
	.loc 1 18 2
	call	hfence_gvma
	.loc 1 19 1
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
.LFE25:
	.size	hfence, .-hfence
	.comm	hs_pg_dir,16384,16384
	.align	2
	.globl	set_stage2_page_mapping
	.type	set_stage2_page_mapping, @function
set_stage2_page_mapping:
.LFB26:
	.file 2 "src/stage2_mmu.c"
	.loc 2 18 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	sd	a2,-40(s0)
	sd	a3,-48(s0)
	.loc 2 19 2
	li	a6,0
	lla	a5,early_pgtable_alloc
	ld	a4,-48(s0)
	ld	a3,-40(s0)
	ld	a2,-24(s0)
	ld	a1,-32(s0)
	lla	a0,hs_pg_dir
	call	__create_pgd_mapping
	.loc 2 20 1
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
.LFE26:
	.size	set_stage2_page_mapping, .-set_stage2_page_mapping
	.section	.rodata
	.align	3
.LC0:
	.string	"write hgatp done\n"
	.text
	.align	2
	.globl	write_stage2_pg_reg
	.type	write_stage2_pg_reg, @function
write_stage2_pg_reg:
.LFB27:
	.loc 2 23 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 25 12
	lla	a5,hs_pg_dir
	.loc 2 25 38
	srli	a4,a5,12
	.loc 2 25 8
	li	a5,-1
	slli	a5,a5,63
	or	a5,a4,a5
	sd	a5,-24(s0)
.LBB2:
	.loc 2 26 19
	ld	a5,-24(s0)
	sd	a5,-32(s0)
	.loc 2 26 49
	ld	a5,-32(s0)
#APP
# 26 "src/stage2_mmu.c" 1
	csrw 0x680, a5
# 0 "" 2
#NO_APP
.LBE2:
	.loc 2 28 2
	call	hfence
	.loc 2 29 2
	lla	a0,.LC0
	call	printk
	.loc 2 30 1
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
.LFE27:
	.size	write_stage2_pg_reg, .-write_stage2_pg_reg
	.align	2
	.type	setup_hg_page_table, @function
setup_hg_page_table:
.LFB28:
	.loc 2 33 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	sd	a2,-40(s0)
	sd	a3,-48(s0)
	.loc 2 34 2
	li	a6,0
	lla	a5,early_pgtable_alloc
	ld	a4,-48(s0)
	ld	a3,-40(s0)
	ld	a2,-24(s0)
	ld	a1,-32(s0)
	lla	a0,hs_pg_dir
	call	__create_pgd_mapping
	.loc 2 35 1
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
.LFE28:
	.size	setup_hg_page_table, .-setup_hg_page_table
	.align	2
	.globl	stage2_page_fault
	.type	stage2_page_fault, @function
stage2_page_fault:
.LFB29:
	.loc 2 38 1
	.cfi_startproc
	addi	sp,sp,-96
	.cfi_def_cfa_offset 96
	sd	ra,88(sp)
	sd	s0,80(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,96
	.cfi_def_cfa 8, 0
	sd	a0,-88(s0)
.LBB3:
	.loc 2 44 41
#APP
# 44 "src/stage2_mmu.c" 1
	csrr a5, 0x643
# 0 "" 2
#NO_APP
	mv	ra,a5
	.loc 2 44 111
	mv	a5,ra
.LBE3:
	.loc 2 44 8
	sd	a5,-24(s0)
.LBB4:
	.loc 2 45 41
#APP
# 45 "src/stage2_mmu.c" 1
	csrr a5, stval
# 0 "" 2
#NO_APP
	mv	ra,a5
	.loc 2 45 111
	mv	a5,ra
.LBE4:
	.loc 2 45 8
	sd	a5,-32(s0)
.LBB5:
	.loc 2 46 42
#APP
# 46 "src/stage2_mmu.c" 1
	csrr a5, scause
# 0 "" 2
#NO_APP
	mv	ra,a5
	.loc 2 46 113
	mv	a5,ra
.LBE5:
	.loc 2 46 9
	sd	a5,-40(s0)
	.loc 2 48 22
	ld	a5,-24(s0)
	slli	a4,a5,2
	.loc 2 48 37
	ld	a5,-32(s0)
	andi	a5,a5,3
	.loc 2 48 13
	or	a5,a4,a5
	sd	a5,-48(s0)
	.loc 2 59 5
	ld	a4,-40(s0)
	li	a5,21
	beq	a4,a5,.L8
	.loc 2 59 21 discriminator 1
	ld	a4,-40(s0)
	li	a5,23
	bne	a4,a5,.L9
.L8:
.LBB6:
.LBB7:
	.loc 2 61 59
#APP
# 61 "src/stage2_mmu.c" 1
	csrr a5, sepc
# 0 "" 2
#NO_APP
	mv	ra,a5
	.loc 2 61 128
	mv	a5,ra
.LBE7:
	.loc 2 61 17
	sd	a5,-56(s0)
	.loc 2 62 29
	ld	a0,-56(s0)
	call	hlvxwu
	sd	a0,-64(s0)
	.loc 2 65 7
	ld	a0,-48(s0)
	call	check_emul_mmio_range
	mv	a5,a0
	.loc 2 65 6
	beqz	a5,.L9
	.loc 2 66 4
	ld	a2,-88(s0)
	ld	a1,-64(s0)
	ld	a0,-48(s0)
	call	emul_device
	.loc 2 67 15
	ld	a5,-88(s0)
	ld	a5,0(a5)
	addi	a4,a5,4
	ld	a5,-88(s0)
	sd	a4,0(a5)
	j	.L7
.L9:
.LBE6:
	.loc 2 75 13
	ld	a4,-48(s0)
	li	a5,-4096
	and	a5,a4,a5
	sd	a5,-48(s0)
	.loc 2 76 13
	call	get_free_page
	sd	a0,-72(s0)
	.loc 2 77 2
	ld	a5,-72(s0)
	li	a2,4096
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 2 79 2
	ld	a4,-40(s0)
	li	a5,23
	bne	a4,a5,.L11
	.loc 2 79 2 is_stmt 0 discriminator 1
	li	a5,95
	j	.L12
.L11:
	.loc 2 79 2 discriminator 2
	li	a5,91
.L12:
	.loc 2 79 2 discriminator 4
	mv	a3,a5
	li	a2,4096
	ld	a1,-72(s0)
	ld	a0,-48(s0)
	call	setup_hg_page_table
	.loc 2 81 2 is_stmt 1 discriminator 4
	call	hfence
.L7:
	.loc 2 82 1
	ld	ra,88(sp)
	.cfi_restore 1
	ld	s0,80(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 96
	addi	sp,sp,96
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE29:
	.size	stage2_page_fault, .-stage2_page_fault
.Letext0:
	.file 3 "include/asm/pgtable_types.h"
	.file 4 "include/asm/ptregs.h"
	.file 5 "include/type.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x53c
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF31
	.byte	0xc
	.4byte	.LASF32
	.4byte	.LASF33
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
	.byte	0x5
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
	.byte	0x3
	.byte	0x9
	.byte	0xd
	.4byte	0x42
	.byte	0x5
	.byte	0x8
	.byte	0x3
	.byte	0x1d
	.byte	0x9
	.4byte	0x7f
	.byte	0x6
	.string	"pgd"
	.byte	0x3
	.byte	0x1e
	.byte	0xb
	.4byte	0x5c
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	.LASF6
	.byte	0x3
	.byte	0x1f
	.byte	0x3
	.4byte	0x68
	.byte	0x5
	.byte	0x8
	.byte	0x3
	.byte	0x23
	.byte	0x9
	.4byte	0xa2
	.byte	0x7
	.4byte	.LASF7
	.byte	0x3
	.byte	0x24
	.byte	0x10
	.4byte	0x4e
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	.LASF8
	.byte	0x3
	.byte	0x25
	.byte	0x3
	.4byte	0x8b
	.byte	0x8
	.4byte	.LASF34
	.2byte	0x120
	.byte	0x4
	.byte	0xe
	.byte	0x8
	.4byte	0x278
	.byte	0x7
	.4byte	.LASF9
	.byte	0x4
	.byte	0x10
	.byte	0x10
	.4byte	0x4e
	.byte	0
	.byte	0x6
	.string	"ra"
	.byte	0x4
	.byte	0x11
	.byte	0x10
	.4byte	0x4e
	.byte	0x8
	.byte	0x6
	.string	"sp"
	.byte	0x4
	.byte	0x12
	.byte	0x10
	.4byte	0x4e
	.byte	0x10
	.byte	0x6
	.string	"gp"
	.byte	0x4
	.byte	0x13
	.byte	0x10
	.4byte	0x4e
	.byte	0x18
	.byte	0x6
	.string	"tp"
	.byte	0x4
	.byte	0x14
	.byte	0x10
	.4byte	0x4e
	.byte	0x20
	.byte	0x6
	.string	"t0"
	.byte	0x4
	.byte	0x15
	.byte	0x10
	.4byte	0x4e
	.byte	0x28
	.byte	0x6
	.string	"t1"
	.byte	0x4
	.byte	0x16
	.byte	0x10
	.4byte	0x4e
	.byte	0x30
	.byte	0x6
	.string	"t2"
	.byte	0x4
	.byte	0x17
	.byte	0x10
	.4byte	0x4e
	.byte	0x38
	.byte	0x6
	.string	"s0"
	.byte	0x4
	.byte	0x18
	.byte	0x10
	.4byte	0x4e
	.byte	0x40
	.byte	0x6
	.string	"s1"
	.byte	0x4
	.byte	0x19
	.byte	0x10
	.4byte	0x4e
	.byte	0x48
	.byte	0x6
	.string	"a0"
	.byte	0x4
	.byte	0x1a
	.byte	0x10
	.4byte	0x4e
	.byte	0x50
	.byte	0x6
	.string	"a1"
	.byte	0x4
	.byte	0x1b
	.byte	0x10
	.4byte	0x4e
	.byte	0x58
	.byte	0x6
	.string	"a2"
	.byte	0x4
	.byte	0x1c
	.byte	0x10
	.4byte	0x4e
	.byte	0x60
	.byte	0x6
	.string	"a3"
	.byte	0x4
	.byte	0x1d
	.byte	0x10
	.4byte	0x4e
	.byte	0x68
	.byte	0x6
	.string	"a4"
	.byte	0x4
	.byte	0x1e
	.byte	0x10
	.4byte	0x4e
	.byte	0x70
	.byte	0x6
	.string	"a5"
	.byte	0x4
	.byte	0x1f
	.byte	0x10
	.4byte	0x4e
	.byte	0x78
	.byte	0x6
	.string	"a6"
	.byte	0x4
	.byte	0x20
	.byte	0x10
	.4byte	0x4e
	.byte	0x80
	.byte	0x6
	.string	"a7"
	.byte	0x4
	.byte	0x21
	.byte	0x10
	.4byte	0x4e
	.byte	0x88
	.byte	0x6
	.string	"s2"
	.byte	0x4
	.byte	0x22
	.byte	0x10
	.4byte	0x4e
	.byte	0x90
	.byte	0x6
	.string	"s3"
	.byte	0x4
	.byte	0x23
	.byte	0x10
	.4byte	0x4e
	.byte	0x98
	.byte	0x6
	.string	"s4"
	.byte	0x4
	.byte	0x24
	.byte	0x10
	.4byte	0x4e
	.byte	0xa0
	.byte	0x6
	.string	"s5"
	.byte	0x4
	.byte	0x25
	.byte	0x10
	.4byte	0x4e
	.byte	0xa8
	.byte	0x6
	.string	"s6"
	.byte	0x4
	.byte	0x26
	.byte	0x10
	.4byte	0x4e
	.byte	0xb0
	.byte	0x6
	.string	"s7"
	.byte	0x4
	.byte	0x27
	.byte	0x10
	.4byte	0x4e
	.byte	0xb8
	.byte	0x6
	.string	"s8"
	.byte	0x4
	.byte	0x28
	.byte	0x10
	.4byte	0x4e
	.byte	0xc0
	.byte	0x6
	.string	"s9"
	.byte	0x4
	.byte	0x29
	.byte	0x10
	.4byte	0x4e
	.byte	0xc8
	.byte	0x6
	.string	"s10"
	.byte	0x4
	.byte	0x2a
	.byte	0x10
	.4byte	0x4e
	.byte	0xd0
	.byte	0x6
	.string	"s11"
	.byte	0x4
	.byte	0x2b
	.byte	0x10
	.4byte	0x4e
	.byte	0xd8
	.byte	0x6
	.string	"t3"
	.byte	0x4
	.byte	0x2c
	.byte	0x10
	.4byte	0x4e
	.byte	0xe0
	.byte	0x6
	.string	"t4"
	.byte	0x4
	.byte	0x2d
	.byte	0x10
	.4byte	0x4e
	.byte	0xe8
	.byte	0x6
	.string	"t5"
	.byte	0x4
	.byte	0x2e
	.byte	0x10
	.4byte	0x4e
	.byte	0xf0
	.byte	0x6
	.string	"t6"
	.byte	0x4
	.byte	0x2f
	.byte	0x10
	.4byte	0x4e
	.byte	0xf8
	.byte	0x9
	.4byte	.LASF10
	.byte	0x4
	.byte	0x31
	.byte	0x10
	.4byte	0x4e
	.2byte	0x100
	.byte	0x9
	.4byte	.LASF11
	.byte	0x4
	.byte	0x32
	.byte	0x10
	.4byte	0x4e
	.2byte	0x108
	.byte	0x9
	.4byte	.LASF12
	.byte	0x4
	.byte	0x33
	.byte	0x10
	.4byte	0x4e
	.2byte	0x110
	.byte	0x9
	.4byte	.LASF13
	.byte	0x4
	.byte	0x34
	.byte	0x10
	.4byte	0x4e
	.2byte	0x118
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0xae
	.byte	0xb
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0xc
	.4byte	0x296
	.4byte	0x296
	.byte	0xd
	.4byte	0x4e
	.2byte	0x3fff
	.byte	0
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF14
	.byte	0xe
	.4byte	.LASF35
	.byte	0x2
	.byte	0xf
	.byte	0x6
	.4byte	0x285
	.2byte	0x4000
	.byte	0x9
	.byte	0x3
	.8byte	hs_pg_dir
	.byte	0xf
	.4byte	.LASF24
	.byte	0x2
	.byte	0x25
	.byte	0x6
	.8byte	.LFB29
	.8byte	.LFE29-.LFB29
	.byte	0x1
	.byte	0x9c
	.4byte	0x3ec
	.byte	0x10
	.4byte	.LASF21
	.byte	0x2
	.byte	0x25
	.byte	0x28
	.4byte	0x278
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0x11
	.4byte	.LASF15
	.byte	0x2
	.byte	0x27
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x11
	.4byte	.LASF16
	.byte	0x2
	.byte	0x28
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x11
	.4byte	.LASF17
	.byte	0x2
	.byte	0x28
	.byte	0x17
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x11
	.4byte	.LASF12
	.byte	0x2
	.byte	0x29
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x11
	.4byte	.LASF18
	.byte	0x2
	.byte	0x2a
	.byte	0x10
	.4byte	0x4e
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x12
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.4byte	0x353
	.byte	0x13
	.string	"__v"
	.byte	0x2
	.byte	0x2c
	.byte	0x24
	.4byte	0x4e
	.byte	0x1
	.byte	0x51
	.byte	0
	.byte	0x12
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.4byte	0x377
	.byte	0x13
	.string	"__v"
	.byte	0x2
	.byte	0x2d
	.byte	0x24
	.4byte	0x4e
	.byte	0x1
	.byte	0x51
	.byte	0
	.byte	0x12
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.4byte	0x39b
	.byte	0x13
	.string	"__v"
	.byte	0x2
	.byte	0x2e
	.byte	0x25
	.4byte	0x4e
	.byte	0x1
	.byte	0x51
	.byte	0
	.byte	0x14
	.8byte	.LBB6
	.8byte	.LBE6-.LBB6
	.byte	0x11
	.4byte	.LASF19
	.byte	0x2
	.byte	0x3d
	.byte	0x11
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x11
	.4byte	.LASF20
	.byte	0x2
	.byte	0x3e
	.byte	0x11
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x14
	.8byte	.LBB7
	.8byte	.LBE7-.LBB7
	.byte	0x13
	.string	"__v"
	.byte	0x2
	.byte	0x3d
	.byte	0x36
	.4byte	0x4e
	.byte	0x1
	.byte	0x51
	.byte	0
	.byte	0
	.byte	0
	.byte	0x15
	.4byte	.LASF36
	.byte	0x2
	.byte	0x20
	.byte	0xd
	.8byte	.LFB28
	.8byte	.LFE28-.LFB28
	.byte	0x1
	.byte	0x9c
	.4byte	0x447
	.byte	0x16
	.string	"gpa"
	.byte	0x2
	.byte	0x20
	.byte	0x2f
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x16
	.string	"hpa"
	.byte	0x2
	.byte	0x20
	.byte	0x42
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x10
	.4byte	.LASF22
	.byte	0x2
	.byte	0x20
	.byte	0x55
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x10
	.4byte	.LASF23
	.byte	0x2
	.byte	0x20
	.byte	0x64
	.4byte	0xa2
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0
	.byte	0xf
	.4byte	.LASF25
	.byte	0x2
	.byte	0x16
	.byte	0x6
	.8byte	.LFB27
	.8byte	.LFE27-.LFB27
	.byte	0x1
	.byte	0x9c
	.4byte	0x496
	.byte	0x11
	.4byte	.LASF26
	.byte	0x2
	.byte	0x18
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x14
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x13
	.string	"__v"
	.byte	0x2
	.byte	0x1a
	.byte	0x13
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0
	.byte	0xf
	.4byte	.LASF27
	.byte	0x2
	.byte	0x11
	.byte	0x6
	.8byte	.LFB26
	.8byte	.LFE26-.LFB26
	.byte	0x1
	.byte	0x9c
	.4byte	0x4f1
	.byte	0x16
	.string	"gpa"
	.byte	0x2
	.byte	0x11
	.byte	0x2c
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x16
	.string	"hpa"
	.byte	0x2
	.byte	0x11
	.byte	0x3f
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x10
	.4byte	.LASF22
	.byte	0x2
	.byte	0x11
	.byte	0x52
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x10
	.4byte	.LASF23
	.byte	0x2
	.byte	0x11
	.byte	0x61
	.4byte	0xa2
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0
	.byte	0x17
	.4byte	.LASF28
	.byte	0x1
	.byte	0x10
	.byte	0x14
	.8byte	.LFB25
	.8byte	.LFE25-.LFB25
	.byte	0x1
	.byte	0x9c
	.byte	0x18
	.4byte	.LASF29
	.byte	0x1
	.byte	0xa
	.byte	0x14
	.8byte	.LFB24
	.8byte	.LFE24-.LFB24
	.byte	0x1
	.byte	0x9c
	.byte	0x18
	.4byte	.LASF30
	.byte	0x1
	.byte	0x4
	.byte	0x14
	.8byte	.LFB23
	.8byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
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
	.byte	0x5
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
	.byte	0x6
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
	.byte	0x7
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
	.byte	0x8
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
	.byte	0x9
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
	.byte	0xa
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
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
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
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
	.byte	0x88,0x1
	.byte	0x5
	.byte	0x2
	.byte	0x18
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
	.byte	0x12
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
	.byte	0x13
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
	.byte	0x14
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x15
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
	.byte	0x16
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
	.byte	0x17
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
	.byte	0x18
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
.LASF18:
	.string	"new_page"
.LASF33:
	.string	"/home/acetab/\346\241\214\351\235\242/benos"
.LASF20:
	.string	"ins_value"
.LASF24:
	.string	"stage2_page_fault"
.LASF27:
	.string	"set_stage2_page_mapping"
.LASF15:
	.string	"fault_addr"
.LASF16:
	.string	"htval"
.LASF29:
	.string	"hfence_vvma"
.LASF6:
	.string	"pgd_t"
.LASF32:
	.string	"src/stage2_mmu.c"
.LASF30:
	.string	"hfence_gvma"
.LASF8:
	.string	"pgprot_t"
.LASF17:
	.string	"stval"
.LASF0:
	.string	"unsigned char"
.LASF19:
	.string	"ins_addr"
.LASF26:
	.string	"hsatp"
.LASF2:
	.string	"unsigned int"
.LASF9:
	.string	"sepc"
.LASF23:
	.string	"prot"
.LASF7:
	.string	"pgprot"
.LASF34:
	.string	"pt_regs"
.LASF1:
	.string	"short unsigned int"
.LASF14:
	.string	"char"
.LASF36:
	.string	"setup_hg_page_table"
.LASF28:
	.string	"hfence"
.LASF4:
	.string	"_Bool"
.LASF10:
	.string	"sstatus"
.LASF22:
	.string	"size"
.LASF5:
	.string	"pgdval_t"
.LASF13:
	.string	"hstatus"
.LASF3:
	.string	"long unsigned int"
.LASF21:
	.string	"regs"
.LASF35:
	.string	"hs_pg_dir"
.LASF25:
	.string	"write_stage2_pg_reg"
.LASF31:
	.string	"GNU C17 9.4.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF12:
	.string	"scause"
.LASF11:
	.string	"sbadaddr"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
