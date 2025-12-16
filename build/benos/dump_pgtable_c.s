	.file	"dump_pgtable.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.type	pgd_page_paddr, @function
pgd_page_paddr:
.LFB0:
	.file 1 "include/asm/pgtable.h"
	.loc 1 61 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 62 16
	ld	a5,-24(s0)
	.loc 1 62 22
	srli	a5,a5,10
	.loc 1 62 29
	slli	a5,a5,12
	.loc 1 63 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	pgd_page_paddr, .-pgd_page_paddr
	.align	2
	.type	get_pmdp_from_pgdp, @function
get_pmdp_from_pgdp:
.LFB1:
	.loc 1 69 1
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
	.loc 1 73 30
	ld	a5,-48(s0)
	srli	a5,a5,21
	.loc 1 73 16
	andi	a5,a5,511
	sd	a5,-24(s0)
	.loc 1 76 22
	ld	a5,-40(s0)
	ld	a0,0(a5)
	call	pgd_page_paddr
	mv	a5,a0
	.loc 1 76 11
	sd	a5,-32(s0)
	.loc 1 79 18
	ld	a5,-24(s0)
	slli	a5,a5,3
	ld	a4,-32(s0)
	add	a5,a4,a5
	.loc 1 80 1
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
	.size	get_pmdp_from_pgdp, .-get_pmdp_from_pgdp
	.align	2
	.type	pmd_page_paddr, @function
pmd_page_paddr:
.LFB2:
	.loc 1 83 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 84 16
	ld	a5,-24(s0)
	.loc 1 84 22
	srli	a5,a5,10
	.loc 1 84 29
	slli	a5,a5,12
	.loc 1 85 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	pmd_page_paddr, .-pmd_page_paddr
	.align	2
	.type	get_ptep_from_pmdp, @function
get_ptep_from_pmdp:
.LFB3:
	.loc 1 90 1
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
	.loc 1 94 31
	ld	a5,-48(s0)
	srli	a5,a5,12
	.loc 1 94 16
	andi	a5,a5,511
	sd	a5,-24(s0)
	.loc 1 97 22
	ld	a5,-40(s0)
	ld	a0,0(a5)
	call	pmd_page_paddr
	mv	a5,a0
	.loc 1 97 11
	sd	a5,-32(s0)
	.loc 1 100 18
	ld	a5,-24(s0)
	slli	a5,a5,3
	ld	a4,-32(s0)
	add	a5,a4,a5
	.loc 1 101 1
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
.LFE3:
	.size	get_ptep_from_pmdp, .-get_ptep_from_pmdp
	.align	2
	.type	pmd_present, @function
pmd_present:
.LFB12:
	.loc 1 144 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 145 22
	ld	a5,-24(s0)
	.loc 1 145 28
	sext.w	a5,a5
	andi	a5,a5,1
	sext.w	a5,a5
	.loc 1 146 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE12:
	.size	pmd_present, .-pmd_present
	.align	2
	.type	pmd_leaf, @function
pmd_leaf:
.LFB13:
	.loc 1 149 1
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
	.loc 1 150 15
	ld	a0,-24(s0)
	call	pmd_present
	mv	a5,a0
	.loc 1 150 32
	beqz	a5,.L12
	.loc 1 150 42 discriminator 1
	ld	a5,-24(s0)
	.loc 1 150 48 discriminator 1
	andi	a5,a5,14
	.loc 1 150 32 discriminator 1
	beqz	a5,.L12
	.loc 1 150 32 is_stmt 0 discriminator 3
	li	a5,1
	j	.L13
.L12:
	.loc 1 150 32 discriminator 4
	li	a5,0
.L13:
	.loc 1 151 1 is_stmt 1 discriminator 6
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
.LFE13:
	.size	pmd_leaf, .-pmd_leaf
	.section	.rodata
	.align	3
.LC0:
	.string	"Identical mapping"
	.align	3
	.type	address_markers, @object
	.size	address_markers, 16
address_markers:
	.dword	0
	.dword	.LC0
	.align	3
.LC1:
	.string	"RSW"
	.align	3
.LC2:
	.string	"   "
	.align	3
.LC3:
	.string	"D"
	.align	3
.LC4:
	.string	"."
	.align	3
.LC5:
	.string	"A"
	.align	3
.LC6:
	.string	"G"
	.align	3
.LC7:
	.string	"U"
	.align	3
.LC8:
	.string	"X"
	.align	3
.LC9:
	.string	"W"
	.align	3
.LC10:
	.string	"R"
	.align	3
.LC11:
	.string	"V"
	.align	3
	.type	pte_bits, @object
	.size	pte_bits, 288
pte_bits:
	.dword	256
	.dword	256
	.dword	.LC1
	.dword	.LC2
	.dword	128
	.dword	128
	.dword	.LC3
	.dword	.LC4
	.dword	64
	.dword	64
	.dword	.LC5
	.dword	.LC4
	.dword	32
	.dword	32
	.dword	.LC6
	.dword	.LC4
	.dword	16
	.dword	16
	.dword	.LC7
	.dword	.LC4
	.dword	8
	.dword	8
	.dword	.LC8
	.dword	.LC4
	.dword	4
	.dword	4
	.dword	.LC9
	.dword	.LC4
	.dword	2
	.dword	2
	.dword	.LC10
	.dword	.LC4
	.dword	1
	.dword	1
	.dword	.LC11
	.dword	.LC4
	.align	3
.LC12:
	.string	"PGD"
	.align	3
.LC13:
	.string	"PMD"
	.align	3
.LC14:
	.string	"PTE"
	.data
	.align	3
	.type	pg_level, @object
	.size	pg_level, 96
pg_level:
	.dword	pte_bits
	.dword	.LC12
	.word	9
	.zero	12
	.dword	pte_bits
	.dword	.LC13
	.word	9
	.zero	12
	.dword	pte_bits
	.dword	.LC14
	.word	9
	.zero	12
	.section	.rodata
	.align	3
.LC15:
	.string	" %s"
	.text
	.align	2
	.type	dump_prot, @function
dump_prot:
.LFB23:
	.file 2 "src/dump_pgtable.c"
	.loc 2 97 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	sd	s0,48(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	mv	a5,a2
	sw	a5,-52(s0)
	.loc 2 100 9
	sw	zero,-20(s0)
	.loc 2 100 2
	j	.L16
.L20:
.LBB2:
	.loc 2 103 19
	ld	a5,-48(s0)
	ld	a4,0(a5)
	.loc 2 103 13
	ld	a5,-40(s0)
	and	a4,a4,a5
	.loc 2 103 34
	ld	a5,-48(s0)
	ld	a5,8(a5)
	.loc 2 103 6
	bne	a4,a5,.L17
	.loc 2 104 6
	ld	a5,-48(s0)
	ld	a5,16(a5)
	sd	a5,-32(s0)
	j	.L18
.L17:
	.loc 2 106 6
	ld	a5,-48(s0)
	ld	a5,24(a5)
	sd	a5,-32(s0)
.L18:
	.loc 2 108 6
	ld	a5,-32(s0)
	beqz	a5,.L19
	.loc 2 109 4
	ld	a1,-32(s0)
	lla	a0,.LC15
	call	printk
.L19:
.LBE2:
	.loc 2 100 24 discriminator 2
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
	.loc 2 100 32 discriminator 2
	ld	a5,-48(s0)
	addi	a5,a5,32
	sd	a5,-48(s0)
.L16:
	.loc 2 100 2 discriminator 1
	lw	a4,-20(s0)
	lw	a5,-52(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bltu	a4,a5,.L20
	.loc 2 111 1
	nop
	nop
	ld	ra,56(sp)
	.cfi_restore 1
	ld	s0,48(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE23:
	.size	dump_prot, .-dump_prot
	.section	.rodata
	.align	3
.LC16:
	.string	"---[ %s ]---\n"
	.align	3
.LC17:
	.string	"0x%016lx-0x%016lx   "
	.align	3
.LC18:
	.string	"%9lu%c %s"
	.align	3
.LC19:
	.string	"\n"
	.text
	.align	2
	.type	print_pgtable, @function
print_pgtable:
.LFB24:
	.loc 2 115 1
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	sd	s0,64(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,80
	.cfi_def_cfa 8, 0
	sd	a0,-56(s0)
	sd	a1,-64(s0)
	mv	a5,a2
	sd	a3,-80(s0)
	sw	a5,-68(s0)
	.loc 2 117 44
	lla	a4,pg_level
	lw	a5,-68(s0)
	slli	a5,a5,5
	add	a5,a4,a5
	ld	a5,24(a5)
	.loc 2 117 16
	ld	a4,-80(s0)
	and	a5,a4,a5
	sd	a5,-48(s0)
	.loc 2 119 14
	lla	a5,units.1731
	sd	a5,-32(s0)
	.loc 2 122 9
	sw	zero,-36(s0)
	.loc 2 122 2
	j	.L22
.L24:
	.loc 2 123 34
	lla	a4,address_markers
	lw	a5,-36(s0)
	slli	a5,a5,4
	add	a5,a4,a5
	ld	a5,0(a5)
	.loc 2 123 6
	ld	a4,-56(s0)
	bne	a4,a5,.L23
	.loc 2 124 4
	lla	a5,.LC0
	mv	a1,a5
	lla	a0,.LC16
	call	printk
.L23:
	.loc 2 122 77 discriminator 2
	lw	a5,-36(s0)
	addiw	a5,a5,1
	sw	a5,-36(s0)
.L22:
	.loc 2 122 2 discriminator 1
	lw	a5,-36(s0)
	sext.w	a5,a5
	beqz	a5,.L24
	.loc 2 126 5
	ld	a5,-80(s0)
	bnez	a5,.L25
	.loc 2 127 10
	li	a5,0
	j	.L26
.L25:
	.loc 2 129 2
	ld	a2,-64(s0)
	ld	a1,-56(s0)
	lla	a0,.LC17
	call	printk
	.loc 2 131 15
	ld	a4,-64(s0)
	ld	a5,-56(s0)
	sub	a5,a4,a5
	.loc 2 131 8
	srli	a5,a5,10
	sd	a5,-24(s0)
	.loc 2 132 8
	j	.L27
.L29:
	.loc 2 133 9
	ld	a5,-24(s0)
	srli	a5,a5,10
	sd	a5,-24(s0)
	.loc 2 134 7
	ld	a5,-32(s0)
	addi	a5,a5,1
	sd	a5,-32(s0)
.L27:
	.loc 2 132 17
	ld	a5,-24(s0)
	andi	a5,a5,1023
	.loc 2 132 8
	bnez	a5,.L28
	.loc 2 132 33 discriminator 1
	lla	a5,units.1731
	lbu	a5,1(a5)
	.loc 2 132 25 discriminator 1
	bnez	a5,.L29
.L28:
	.loc 2 137 29
	ld	a5,-32(s0)
	lbu	a5,0(a5)
	.loc 2 137 2
	sext.w	a2,a5
	lla	a4,pg_level
	lw	a5,-68(s0)
	slli	a5,a5,5
	add	a5,a4,a5
	ld	a5,8(a5)
	mv	a3,a5
	ld	a1,-24(s0)
	lla	a0,.LC18
	call	printk
	.loc 2 140 21
	lla	a4,pg_level
	lw	a5,-68(s0)
	slli	a5,a5,5
	add	a5,a4,a5
	ld	a5,0(a5)
	.loc 2 140 5
	beqz	a5,.L30
	.loc 2 141 3
	lla	a4,pg_level
	lw	a5,-68(s0)
	slli	a5,a5,5
	add	a5,a4,a5
	ld	a3,0(a5)
	lla	a4,pg_level
	lw	a5,-68(s0)
	slli	a5,a5,5
	add	a5,a4,a5
	lw	a5,16(a5)
	mv	a2,a5
	mv	a1,a3
	ld	a0,-48(s0)
	call	dump_prot
.L30:
	.loc 2 143 2
	lla	a0,.LC19
	call	printk
	.loc 2 145 9
	li	a5,0
.L26:
	.loc 2 146 1
	mv	a0,a5
	ld	ra,72(sp)
	.cfi_restore 1
	ld	s0,64(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 80
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE24:
	.size	print_pgtable, .-print_pgtable
	.align	2
	.type	walk_pte, @function
walk_pte:
.LFB25:
	.loc 2 149 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	sd	s0,48(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	sd	a2,-56(s0)
	.loc 2 151 16
	ld	a5,-48(s0)
	sd	a5,-32(s0)
	.loc 2 153 9
	ld	a1,-32(s0)
	ld	a0,-40(s0)
	call	get_ptep_from_pmdp
	sd	a0,-24(s0)
.L32:
	.loc 2 156 3 discriminator 1
	ld	a4,-32(s0)
	li	a5,4096
	add	a4,a4,a5
	ld	a5,-24(s0)
	ld	a5,0(a5)
	mv	a3,a5
	li	a2,2
	mv	a1,a4
	ld	a0,-32(s0)
	call	print_pgtable
	.loc 2 157 15 discriminator 1
	ld	a5,-24(s0)
	addi	a5,a5,8
	sd	a5,-24(s0)
	.loc 2 157 24 discriminator 1
	ld	a4,-32(s0)
	li	a5,4096
	add	a5,a4,a5
	sd	a5,-32(s0)
	.loc 2 157 2 discriminator 1
	ld	a4,-32(s0)
	ld	a5,-56(s0)
	bne	a4,a5,.L32
	.loc 2 158 1
	nop
	nop
	ld	ra,56(sp)
	.cfi_restore 1
	ld	s0,48(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE25:
	.size	walk_pte, .-walk_pte
	.align	2
	.type	walk_pmd, @function
walk_pmd:
.LFB26:
	.loc 2 161 1
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
	.loc 2 162 22
	ld	a5,-80(s0)
	sd	a5,-24(s0)
	.loc 2 166 9
	ld	a1,-24(s0)
	ld	a0,-72(s0)
	call	get_pmdp_from_pgdp
	sd	a0,-32(s0)
.L39:
	.loc 2 169 7
	ld	a5,-32(s0)
	ld	a5,0(a5)
	sd	a5,-56(s0)
.LBB3:
	.loc 2 170 48
	ld	a4,-24(s0)
	li	a5,2097152
	add	a4,a4,a5
	.loc 2 170 27
	li	a5,-2097152
	and	a5,a4,a5
	sd	a5,-40(s0)
	.loc 2 170 99
	ld	a5,-40(s0)
	addi	a4,a5,-1
	.loc 2 170 111
	ld	a5,-88(s0)
	addi	a5,a5,-1
	.loc 2 170 129
	bgeu	a4,a5,.L34
	.loc 2 170 129 is_stmt 0 discriminator 1
	ld	a5,-40(s0)
	j	.L35
.L34:
	.loc 2 170 129 discriminator 2
	ld	a5,-88(s0)
.L35:
.LBE3:
	.loc 2 170 8 is_stmt 1 discriminator 4
	sd	a5,-48(s0)
	.loc 2 172 15 discriminator 4
	ld	a5,-56(s0)
	.loc 2 172 6 discriminator 4
	beqz	a5,.L36
	.loc 2 172 25 discriminator 1
	ld	a0,-56(s0)
	call	pmd_leaf
	mv	a5,a0
	.loc 2 172 22 discriminator 1
	beqz	a5,.L37
.L36:
	.loc 2 173 4
	ld	a5,-56(s0)
	mv	a3,a5
	li	a2,1
	ld	a1,-48(s0)
	ld	a0,-24(s0)
	call	print_pgtable
	j	.L38
.L37:
	.loc 2 175 4
	ld	a2,-48(s0)
	ld	a1,-24(s0)
	ld	a0,-32(s0)
	call	walk_pte
.L38:
	.loc 2 176 15
	ld	a5,-32(s0)
	addi	a5,a5,8
	sd	a5,-32(s0)
	.loc 2 176 24
	ld	a5,-48(s0)
	sd	a5,-24(s0)
	.loc 2 176 2
	ld	a4,-24(s0)
	ld	a5,-88(s0)
	bne	a4,a5,.L39
	.loc 2 177 1
	nop
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
.LFE26:
	.size	walk_pmd, .-walk_pmd
	.align	2
	.globl	walk_pgd
	.type	walk_pgd, @function
walk_pgd:
.LFB27:
	.loc 2 180 1
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
	.loc 2 181 16
	ld	a4,-80(s0)
	ld	a5,-88(s0)
	add	a5,a4,a5
	sd	a5,-40(s0)
	.loc 2 182 22
	ld	a5,-80(s0)
	sd	a5,-24(s0)
	.loc 2 186 28
	ld	a5,-80(s0)
	srli	a5,a5,30
	.loc 2 186 35
	andi	a5,a5,511
	.loc 2 186 16
	slli	a5,a5,3
	.loc 2 186 7
	ld	a4,-72(s0)
	add	a5,a4,a5
	sd	a5,-32(s0)
.L45:
	.loc 2 189 13
	ld	a5,-32(s0)
	ld	a5,0(a5)
	sd	a5,-64(s0)
.LBB4:
	.loc 2 190 48
	ld	a4,-24(s0)
	li	a5,1073741824
	add	a4,a4,a5
	.loc 2 190 27
	li	a5,-1073741824
	and	a5,a4,a5
	sd	a5,-48(s0)
	.loc 2 190 99
	ld	a5,-48(s0)
	addi	a4,a5,-1
	.loc 2 190 111
	ld	a5,-40(s0)
	addi	a5,a5,-1
	.loc 2 190 129
	bgeu	a4,a5,.L41
	.loc 2 190 129 is_stmt 0 discriminator 1
	ld	a5,-48(s0)
	j	.L42
.L41:
	.loc 2 190 129 discriminator 2
	ld	a5,-40(s0)
.L42:
.LBE4:
	.loc 2 190 8 is_stmt 1 discriminator 4
	sd	a5,-56(s0)
	.loc 2 192 21 discriminator 4
	ld	a5,-64(s0)
	.loc 2 192 6 discriminator 4
	bnez	a5,.L43
	.loc 2 193 4
	ld	a5,-64(s0)
	mv	a3,a5
	li	a2,0
	ld	a1,-56(s0)
	ld	a0,-24(s0)
	call	print_pgtable
	j	.L44
.L43:
	.loc 2 195 4
	ld	a2,-56(s0)
	ld	a1,-24(s0)
	ld	a0,-32(s0)
	call	walk_pmd
.L44:
	.loc 2 196 15
	ld	a5,-32(s0)
	addi	a5,a5,8
	sd	a5,-32(s0)
	.loc 2 196 24
	ld	a5,-56(s0)
	sd	a5,-24(s0)
	.loc 2 196 2
	ld	a4,-24(s0)
	ld	a5,-40(s0)
	bne	a4,a5,.L45
	.loc 2 197 1
	nop
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
.LFE27:
	.size	walk_pgd, .-walk_pgd
	.align	2
	.type	pg_level_init, @function
pg_level_init:
.LFB28:
	.loc 2 200 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 203 9
	sw	zero,-20(s0)
	.loc 2 203 2
	j	.L47
.L51:
	.loc 2 204 18
	lla	a4,pg_level
	lwu	a5,-20(s0)
	slli	a5,a5,5
	add	a5,a4,a5
	ld	a5,0(a5)
	.loc 2 204 6
	beqz	a5,.L48
	.loc 2 205 11
	sw	zero,-24(s0)
	.loc 2 205 4
	j	.L49
.L50:
	.loc 2 206 22 discriminator 3
	lla	a4,pg_level
	lwu	a5,-20(s0)
	slli	a5,a5,5
	add	a5,a4,a5
	ld	a4,24(a5)
	.loc 2 206 36 discriminator 3
	lla	a3,pg_level
	lwu	a5,-20(s0)
	slli	a5,a5,5
	add	a5,a3,a5
	ld	a3,0(a5)
	.loc 2 206 41 discriminator 3
	lwu	a5,-24(s0)
	slli	a5,a5,5
	add	a5,a3,a5
	.loc 2 206 44 discriminator 3
	ld	a5,0(a5)
	.loc 2 206 22 discriminator 3
	or	a4,a4,a5
	lla	a3,pg_level
	lwu	a5,-20(s0)
	slli	a5,a5,5
	add	a5,a3,a5
	sd	a4,24(a5)
	.loc 2 205 38 discriminator 3
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L49:
	.loc 2 205 31 discriminator 1
	lla	a4,pg_level
	lwu	a5,-20(s0)
	slli	a5,a5,5
	add	a5,a4,a5
	lw	a4,16(a5)
	.loc 2 205 4 discriminator 1
	lw	a5,-24(s0)
	sext.w	a5,a5
	bltu	a5,a4,.L50
.L48:
	.loc 2 203 63 discriminator 2
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L47:
	.loc 2 203 2 discriminator 1
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,2
	bleu	a4,a5,.L51
	.loc 2 207 1
	nop
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE28:
	.size	pg_level_init, .-pg_level_init
	.align	2
	.globl	dump_pgtable
	.type	dump_pgtable, @function
dump_pgtable:
.LFB29:
	.loc 2 211 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 215 13
	lla	a4,_text_boot
	.loc 2 215 49
	li	a5,4096
	addi	a5,a5,-1
	add	a4,a4,a5
	.loc 2 215 8
	li	a5,-4096
	and	a5,a4,a5
	sd	a5,-24(s0)
	.loc 2 216 6
	li	a5,129
	slli	a5,a5,24
	sd	a5,-32(s0)
	.loc 2 218 2
	call	pg_level_init
	.loc 2 219 2
	ld	a4,-32(s0)
	ld	a5,-24(s0)
	sub	a5,a4,a5
	mv	a2,a5
	ld	a1,-24(s0)
	lla	a0,idmap_pg_dir
	call	walk_pgd
	.loc 2 220 1
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
.LFE29:
	.size	dump_pgtable, .-dump_pgtable
	.section	.srodata,"a"
	.align	3
	.type	units.1731, @object
	.size	units.1731, 5
units.1731:
	.string	"KMGT"
	.text
.Letext0:
	.file 3 "include/type.h"
	.file 4 "include/asm/pgtable_types.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x78f
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF56
	.byte	0xc
	.4byte	.LASF57
	.4byte	.LASF58
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
	.byte	0x3
	.byte	0x9
	.byte	0x17
	.4byte	0x4e
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF3
	.byte	0x4
	.4byte	.LASF4
	.byte	0x3
	.byte	0xb
	.byte	0x16
	.4byte	0x3b
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF5
	.byte	0x4
	.4byte	.LASF6
	.byte	0x4
	.byte	0x6
	.byte	0xd
	.4byte	0x42
	.byte	0x4
	.4byte	.LASF7
	.byte	0x4
	.byte	0x7
	.byte	0xd
	.4byte	0x42
	.byte	0x4
	.4byte	.LASF8
	.byte	0x4
	.byte	0x9
	.byte	0xd
	.4byte	0x42
	.byte	0x5
	.byte	0x8
	.byte	0x4
	.byte	0xb
	.byte	0x9
	.4byte	0xa3
	.byte	0x6
	.string	"pte"
	.byte	0x4
	.byte	0xc
	.byte	0xb
	.4byte	0x68
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	.LASF9
	.byte	0x4
	.byte	0xd
	.byte	0x3
	.4byte	0x8c
	.byte	0x5
	.byte	0x8
	.byte	0x4
	.byte	0x11
	.byte	0x9
	.4byte	0xc6
	.byte	0x6
	.string	"pmd"
	.byte	0x4
	.byte	0x12
	.byte	0xb
	.4byte	0x74
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	.LASF10
	.byte	0x4
	.byte	0x13
	.byte	0x3
	.4byte	0xaf
	.byte	0x5
	.byte	0x8
	.byte	0x4
	.byte	0x1d
	.byte	0x9
	.4byte	0xe9
	.byte	0x6
	.string	"pgd"
	.byte	0x4
	.byte	0x1e
	.byte	0xb
	.4byte	0x80
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	.LASF11
	.byte	0x4
	.byte	0x1f
	.byte	0x3
	.4byte	0xd2
	.byte	0x7
	.4byte	0x100
	.4byte	0x100
	.byte	0x8
	.byte	0
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF12
	.byte	0x9
	.4byte	0x100
	.byte	0xa
	.4byte	.LASF23
	.byte	0x2
	.byte	0x5
	.byte	0xd
	.4byte	0xf5
	.byte	0xb
	.4byte	.LASF15
	.byte	0x10
	.byte	0x2
	.byte	0x7
	.byte	0x8
	.4byte	0x140
	.byte	0xc
	.4byte	.LASF13
	.byte	0x2
	.byte	0x8
	.byte	0x10
	.4byte	0x4e
	.byte	0
	.byte	0xc
	.4byte	.LASF14
	.byte	0x2
	.byte	0x9
	.byte	0x8
	.4byte	0x145
	.byte	0x8
	.byte	0
	.byte	0x9
	.4byte	0x118
	.byte	0xd
	.byte	0x8
	.4byte	0x100
	.byte	0xb
	.4byte	.LASF16
	.byte	0x20
	.byte	0x2
	.byte	0xc
	.byte	0x8
	.4byte	0x18d
	.byte	0xc
	.4byte	.LASF17
	.byte	0x2
	.byte	0xd
	.byte	0x10
	.4byte	0x4e
	.byte	0
	.byte	0x6
	.string	"val"
	.byte	0x2
	.byte	0xe
	.byte	0x10
	.4byte	0x4e
	.byte	0x8
	.byte	0x6
	.string	"set"
	.byte	0x2
	.byte	0xf
	.byte	0xe
	.4byte	0x192
	.byte	0x10
	.byte	0xc
	.4byte	.LASF18
	.byte	0x2
	.byte	0x10
	.byte	0xe
	.4byte	0x192
	.byte	0x18
	.byte	0
	.byte	0x9
	.4byte	0x14b
	.byte	0xd
	.byte	0x8
	.4byte	0x107
	.byte	0xb
	.4byte	.LASF19
	.byte	0x20
	.byte	0x2
	.byte	0x13
	.byte	0x8
	.4byte	0x1da
	.byte	0xc
	.4byte	.LASF20
	.byte	0x2
	.byte	0x14
	.byte	0x1a
	.4byte	0x1da
	.byte	0
	.byte	0xc
	.4byte	.LASF14
	.byte	0x2
	.byte	0x15
	.byte	0xe
	.4byte	0x192
	.byte	0x8
	.byte	0x6
	.string	"num"
	.byte	0x2
	.byte	0x16
	.byte	0x9
	.4byte	0x55
	.byte	0x10
	.byte	0xc
	.4byte	.LASF17
	.byte	0x2
	.byte	0x17
	.byte	0x10
	.4byte	0x4e
	.byte	0x18
	.byte	0
	.byte	0xd
	.byte	0x8
	.4byte	0x18d
	.byte	0x7
	.4byte	0x140
	.4byte	0x1f0
	.byte	0xe
	.4byte	0x4e
	.byte	0
	.byte	0
	.byte	0x9
	.4byte	0x1e0
	.byte	0xf
	.4byte	.LASF21
	.byte	0x2
	.byte	0x1a
	.byte	0x21
	.4byte	0x1f0
	.byte	0x9
	.byte	0x3
	.8byte	address_markers
	.byte	0x7
	.4byte	0x18d
	.4byte	0x21b
	.byte	0xe
	.4byte	0x4e
	.byte	0x8
	.byte	0
	.byte	0x9
	.4byte	0x20b
	.byte	0xf
	.4byte	.LASF22
	.byte	0x2
	.byte	0x1e
	.byte	0x1f
	.4byte	0x21b
	.byte	0x9
	.byte	0x3
	.8byte	pte_bits
	.byte	0x7
	.4byte	0x198
	.4byte	0x246
	.byte	0xe
	.4byte	0x4e
	.byte	0x2
	.byte	0
	.byte	0xf
	.4byte	.LASF19
	.byte	0x2
	.byte	0x4f
	.byte	0x18
	.4byte	0x236
	.byte	0x9
	.byte	0x3
	.8byte	pg_level
	.byte	0xa
	.4byte	.LASF24
	.byte	0x2
	.byte	0xd1
	.byte	0xd
	.4byte	0xf5
	.byte	0xa
	.4byte	.LASF25
	.byte	0x2
	.byte	0xd1
	.byte	0x1b
	.4byte	0xf5
	.byte	0x10
	.4byte	.LASF27
	.byte	0x2
	.byte	0xd2
	.byte	0x6
	.8byte	.LFB29
	.8byte	.LFE29-.LFB29
	.byte	0x1
	.byte	0x9c
	.4byte	0x2b1
	.byte	0xf
	.4byte	.LASF26
	.byte	0x2
	.byte	0xd4
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x11
	.string	"end"
	.byte	0x2
	.byte	0xd4
	.byte	0x17
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x12
	.4byte	.LASF35
	.byte	0x2
	.byte	0xc7
	.byte	0xd
	.8byte	.LFB28
	.8byte	.LFE28-.LFB28
	.byte	0x1
	.byte	0x9c
	.4byte	0x2ea
	.byte	0x11
	.string	"i"
	.byte	0x2
	.byte	0xc9
	.byte	0xf
	.4byte	0x3b
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x11
	.string	"j"
	.byte	0x2
	.byte	0xc9
	.byte	0x12
	.4byte	0x3b
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x10
	.4byte	.LASF28
	.byte	0x2
	.byte	0xb3
	.byte	0x6
	.8byte	.LFB27
	.8byte	.LFE27-.LFB27
	.byte	0x1
	.byte	0x9c
	.4byte	0x3a5
	.byte	0x13
	.string	"pgd"
	.byte	0x2
	.byte	0xb3
	.byte	0x16
	.4byte	0x3a5
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x14
	.4byte	.LASF26
	.byte	0x2
	.byte	0xb3
	.byte	0x29
	.4byte	0x4e
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x14
	.4byte	.LASF29
	.byte	0x2
	.byte	0xb3
	.byte	0x3e
	.4byte	0x4e
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0x11
	.string	"end"
	.byte	0x2
	.byte	0xb5
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xf
	.4byte	.LASF30
	.byte	0x2
	.byte	0xb6
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xf
	.4byte	.LASF31
	.byte	0x2
	.byte	0xb6
	.byte	0x16
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xf
	.4byte	.LASF32
	.byte	0x2
	.byte	0xb7
	.byte	0x9
	.4byte	0x3a5
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xf
	.4byte	.LASF33
	.byte	0x2
	.byte	0xb8
	.byte	0x8
	.4byte	0xe9
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x15
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.byte	0xf
	.4byte	.LASF34
	.byte	0x2
	.byte	0xbe
	.byte	0x1b
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x8
	.4byte	0xe9
	.byte	0x16
	.4byte	.LASF36
	.byte	0x2
	.byte	0xa0
	.byte	0xd
	.8byte	.LFB26
	.8byte	.LFE26-.LFB26
	.byte	0x1
	.byte	0x9c
	.4byte	0x457
	.byte	0x14
	.4byte	.LASF32
	.byte	0x2
	.byte	0xa0
	.byte	0x1d
	.4byte	0x3a5
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x14
	.4byte	.LASF26
	.byte	0x2
	.byte	0xa0
	.byte	0x31
	.4byte	0x4e
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x13
	.string	"end"
	.byte	0x2
	.byte	0xa0
	.byte	0x46
	.4byte	0x4e
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0xf
	.4byte	.LASF30
	.byte	0x2
	.byte	0xa2
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xf
	.4byte	.LASF31
	.byte	0x2
	.byte	0xa2
	.byte	0x16
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xf
	.4byte	.LASF37
	.byte	0x2
	.byte	0xa3
	.byte	0x9
	.4byte	0x457
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x11
	.string	"pmd"
	.byte	0x2
	.byte	0xa4
	.byte	0x8
	.4byte	0xc6
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x15
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0xf
	.4byte	.LASF34
	.byte	0x2
	.byte	0xaa
	.byte	0x1b
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x8
	.4byte	0xc6
	.byte	0x16
	.4byte	.LASF38
	.byte	0x2
	.byte	0x94
	.byte	0xd
	.8byte	.LFB25
	.8byte	.LFE25-.LFB25
	.byte	0x1
	.byte	0x9c
	.4byte	0x4c7
	.byte	0x14
	.4byte	.LASF37
	.byte	0x2
	.byte	0x94
	.byte	0x1d
	.4byte	0x457
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x14
	.4byte	.LASF26
	.byte	0x2
	.byte	0x94
	.byte	0x31
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x13
	.string	"end"
	.byte	0x2
	.byte	0x94
	.byte	0x46
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xf
	.4byte	.LASF39
	.byte	0x2
	.byte	0x96
	.byte	0x9
	.4byte	0x4c7
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xf
	.4byte	.LASF31
	.byte	0x2
	.byte	0x97
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0xd
	.byte	0x8
	.4byte	0xa3
	.byte	0x17
	.4byte	.LASF46
	.byte	0x2
	.byte	0x71
	.byte	0xc
	.4byte	0x57e
	.8byte	.LFB24
	.8byte	.LFE24-.LFB24
	.byte	0x1
	.byte	0x9c
	.4byte	0x57e
	.byte	0x14
	.4byte	.LASF26
	.byte	0x2
	.byte	0x71
	.byte	0x28
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x13
	.string	"end"
	.byte	0x2
	.byte	0x71
	.byte	0x3d
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x14
	.4byte	.LASF40
	.byte	0x2
	.byte	0x72
	.byte	0x7
	.4byte	0x57e
	.byte	0x3
	.byte	0x91
	.byte	0xbc,0x7f
	.byte	0x13
	.string	"val"
	.byte	0x2
	.byte	0x72
	.byte	0x1c
	.4byte	0x4e
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0xf
	.4byte	.LASF41
	.byte	0x2
	.byte	0x74
	.byte	0x14
	.4byte	0x595
	.byte	0x9
	.byte	0x3
	.8byte	units.1731
	.byte	0xf
	.4byte	.LASF42
	.byte	0x2
	.byte	0x75
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xf
	.4byte	.LASF43
	.byte	0x2
	.byte	0x76
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xf
	.4byte	.LASF44
	.byte	0x2
	.byte	0x77
	.byte	0xe
	.4byte	0x192
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x11
	.string	"i"
	.byte	0x2
	.byte	0x78
	.byte	0x6
	.4byte	0x57e
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0
	.byte	0x18
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x7
	.4byte	0x107
	.4byte	0x595
	.byte	0xe
	.4byte	0x4e
	.byte	0x4
	.byte	0
	.byte	0x9
	.4byte	0x585
	.byte	0x16
	.4byte	.LASF45
	.byte	0x2
	.byte	0x5f
	.byte	0xd
	.8byte	.LFB23
	.8byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
	.4byte	0x612
	.byte	0x14
	.4byte	.LASF42
	.byte	0x2
	.byte	0x5f
	.byte	0x25
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x14
	.4byte	.LASF20
	.byte	0x2
	.byte	0x5f
	.byte	0x43
	.4byte	0x1da
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x13
	.string	"num"
	.byte	0x2
	.byte	0x60
	.byte	0xb
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0x11
	.string	"i"
	.byte	0x2
	.byte	0x62
	.byte	0xb
	.4byte	0x3b
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x15
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x11
	.string	"s"
	.byte	0x2
	.byte	0x65
	.byte	0xf
	.4byte	0x192
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0
	.byte	0x17
	.4byte	.LASF47
	.byte	0x1
	.byte	0x94
	.byte	0x13
	.4byte	0x57e
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.4byte	0x644
	.byte	0x13
	.string	"pmd"
	.byte	0x1
	.byte	0x94
	.byte	0x22
	.4byte	0xc6
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x19
	.4byte	.LASF48
	.byte	0x1
	.byte	0x8f
	.byte	0x13
	.4byte	0x57e
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0x676
	.byte	0x13
	.string	"pmd"
	.byte	0x1
	.byte	0x8f
	.byte	0x25
	.4byte	0xc6
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x17
	.4byte	.LASF49
	.byte	0x1
	.byte	0x59
	.byte	0x16
	.4byte	0x4c7
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x6d4
	.byte	0x14
	.4byte	.LASF37
	.byte	0x1
	.byte	0x59
	.byte	0x30
	.4byte	0x457
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x13
	.string	"va"
	.byte	0x1
	.byte	0x59
	.byte	0x44
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xf
	.4byte	.LASF50
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.4byte	0x4c7
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xf
	.4byte	.LASF51
	.byte	0x1
	.byte	0x5e
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x19
	.4byte	.LASF52
	.byte	0x1
	.byte	0x52
	.byte	0x1d
	.4byte	0x4e
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x706
	.byte	0x13
	.string	"pmd"
	.byte	0x1
	.byte	0x52
	.byte	0x32
	.4byte	0xc6
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x17
	.4byte	.LASF53
	.byte	0x1
	.byte	0x44
	.byte	0x16
	.4byte	0x457
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x764
	.byte	0x14
	.4byte	.LASF32
	.byte	0x1
	.byte	0x44
	.byte	0x30
	.4byte	0x3a5
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x13
	.string	"va"
	.byte	0x1
	.byte	0x44
	.byte	0x44
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xf
	.4byte	.LASF54
	.byte	0x1
	.byte	0x46
	.byte	0x9
	.4byte	0x457
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xf
	.4byte	.LASF51
	.byte	0x1
	.byte	0x49
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1a
	.4byte	.LASF55
	.byte	0x1
	.byte	0x3c
	.byte	0x1d
	.4byte	0x4e
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x13
	.string	"pgd"
	.byte	0x1
	.byte	0x3c
	.byte	0x32
	.4byte	0xe9
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
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x21
	.byte	0
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
	.byte	0xd
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xf
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
	.byte	0x10
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
	.byte	0x11
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
	.byte	0x97,0x42
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
	.byte	0x15
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x16
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
	.byte	0x17
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
	.byte	0x18
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
	.byte	0x19
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
.LASF58:
	.string	"/home/acetab/\346\241\214\351\235\242/benos"
.LASF47:
	.string	"pmd_leaf"
.LASF24:
	.string	"_text_boot"
.LASF41:
	.string	"units"
.LASF4:
	.string	"size_t"
.LASF21:
	.string	"address_markers"
.LASF52:
	.string	"pmd_page_paddr"
.LASF27:
	.string	"dump_pgtable"
.LASF43:
	.string	"delta"
.LASF36:
	.string	"walk_pmd"
.LASF45:
	.string	"dump_prot"
.LASF57:
	.string	"src/dump_pgtable.c"
.LASF19:
	.string	"pg_level"
.LASF37:
	.string	"pmdp"
.LASF16:
	.string	"prot_bits"
.LASF51:
	.string	"index"
.LASF15:
	.string	"addr_marker"
.LASF11:
	.string	"pgd_t"
.LASF35:
	.string	"pg_level_init"
.LASF39:
	.string	"ptep"
.LASF20:
	.string	"bits"
.LASF25:
	.string	"_ebss"
.LASF31:
	.string	"addr"
.LASF23:
	.string	"idmap_pg_dir"
.LASF18:
	.string	"clear"
.LASF14:
	.string	"name"
.LASF34:
	.string	"__boundary"
.LASF0:
	.string	"unsigned char"
.LASF50:
	.string	"pte_base"
.LASF9:
	.string	"pte_t"
.LASF55:
	.string	"pgd_page_paddr"
.LASF13:
	.string	"start_address"
.LASF2:
	.string	"unsigned int"
.LASF33:
	.string	"pgd_entry"
.LASF44:
	.string	"unit"
.LASF42:
	.string	"prot"
.LASF26:
	.string	"start"
.LASF1:
	.string	"short unsigned int"
.LASF12:
	.string	"char"
.LASF38:
	.string	"walk_pte"
.LASF53:
	.string	"get_pmdp_from_pgdp"
.LASF28:
	.string	"walk_pgd"
.LASF5:
	.string	"_Bool"
.LASF48:
	.string	"pmd_present"
.LASF46:
	.string	"print_pgtable"
.LASF54:
	.string	"pmd_base"
.LASF8:
	.string	"pgdval_t"
.LASF3:
	.string	"long unsigned int"
.LASF6:
	.string	"pteval_t"
.LASF29:
	.string	"size"
.LASF10:
	.string	"pmd_t"
.LASF40:
	.string	"level"
.LASF49:
	.string	"get_ptep_from_pmdp"
.LASF56:
	.string	"GNU C17 9.4.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF22:
	.string	"pte_bits"
.LASF32:
	.string	"pgdp"
.LASF7:
	.string	"pmdval_t"
.LASF30:
	.string	"next"
.LASF17:
	.string	"mask"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
