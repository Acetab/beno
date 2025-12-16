	.file	"mmu.c"
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
	.type	set_pgd, @function
set_pgd:
.LFB4:
	.loc 1 104 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	.loc 1 105 8
	ld	a5,-24(s0)
	ld	a4,-32(s0)
	sd	a4,0(a5)
	.loc 1 106 1
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	set_pgd, .-set_pgd
	.align	2
	.type	set_pmd, @function
set_pmd:
.LFB5:
	.loc 1 109 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	.loc 1 110 8
	ld	a5,-24(s0)
	ld	a4,-32(s0)
	sd	a4,0(a5)
	.loc 1 111 1
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE5:
	.size	set_pmd, .-set_pmd
	.align	2
	.type	set_pte, @function
set_pte:
.LFB6:
	.loc 1 114 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	.loc 1 115 8
	ld	a5,-24(s0)
	ld	a4,-32(s0)
	sd	a4,0(a5)
	.loc 1 116 1
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE6:
	.size	set_pte, .-set_pte
	.align	2
	.type	pfn_pgd, @function
pfn_pgd:
.LFB7:
	.loc 1 119 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	.loc 1 120 26
	ld	a5,-24(s0)
	slli	a4,a5,10
	.loc 1 120 42
	ld	a5,-32(s0)
	.loc 1 120 33
	or	a5,a4,a5
	.loc 1 121 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE7:
	.size	pfn_pgd, .-pfn_pgd
	.align	2
	.type	pfn_pmd, @function
pfn_pmd:
.LFB9:
	.loc 1 129 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	.loc 1 130 26
	ld	a5,-24(s0)
	slli	a4,a5,10
	.loc 1 130 42
	ld	a5,-32(s0)
	.loc 1 130 33
	or	a5,a4,a5
	.loc 1 131 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE9:
	.size	pfn_pmd, .-pfn_pmd
	.align	2
	.type	pfn_pte, @function
pfn_pte:
.LFB11:
	.loc 1 139 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	.loc 1 140 26
	ld	a5,-24(s0)
	slli	a4,a5,10
	.loc 1 140 42
	ld	a5,-32(s0)
	.loc 1 140 33
	or	a5,a4,a5
	.loc 1 141 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE11:
	.size	pfn_pte, .-pfn_pte
	.align	2
	.type	alloc_init_pte, @function
alloc_init_pte:
.LFB23:
	.file 2 "src/mmu.c"
	.loc 2 21 1
	.cfi_startproc
	addi	sp,sp,-112
	.cfi_def_cfa_offset 112
	sd	ra,104(sp)
	sd	s0,96(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,112
	.cfi_def_cfa 8, 0
	sd	a0,-56(s0)
	sd	a1,-64(s0)
	sd	a2,-72(s0)
	sd	a3,-80(s0)
	sd	a4,-88(s0)
	sd	a5,-96(s0)
	sd	a6,-104(s0)
	.loc 2 22 8
	ld	a5,-56(s0)
	ld	a5,0(a5)
	sd	a5,-40(s0)
	.loc 2 26 14
	ld	a5,-40(s0)
	.loc 2 26 5
	bnez	a5,.L19
.LBB2:
	.loc 2 30 14
	ld	a5,-96(s0)
	jalr	a5
.LVL0:
	sd	a0,-32(s0)
	.loc 2 32 3
	ld	a5,-32(s0)
	srli	a5,a5,12
	.loc 2 32 57
	li	a4,1
	.loc 2 32 3
	mv	a1,a4
	mv	a0,a5
	call	pfn_pmd
	mv	a5,a0
	mv	a1,a5
	ld	a0,-56(s0)
	call	set_pmd
	.loc 2 33 7
	ld	a5,-56(s0)
	ld	a5,0(a5)
	sd	a5,-40(s0)
.L19:
.LBE2:
	.loc 2 37 9
	ld	a1,-64(s0)
	ld	a0,-56(s0)
	call	get_ptep_from_pmdp
	sd	a0,-24(s0)
.L20:
	.loc 2 40 3 discriminator 1
	ld	a5,-80(s0)
	srli	a5,a5,12
	ld	a1,-88(s0)
	mv	a0,a5
	call	pfn_pte
	mv	a5,a0
	mv	a1,a5
	ld	a0,-24(s0)
	call	set_pte
	.loc 2 41 8 discriminator 1
	ld	a4,-80(s0)
	li	a5,4096
	add	a5,a4,a5
	sd	a5,-80(s0)
	.loc 2 42 15 discriminator 1
	ld	a5,-24(s0)
	addi	a5,a5,8
	sd	a5,-24(s0)
	.loc 2 42 24 discriminator 1
	ld	a4,-64(s0)
	li	a5,4096
	add	a5,a4,a5
	sd	a5,-64(s0)
	.loc 2 42 2 discriminator 1
	ld	a4,-64(s0)
	ld	a5,-72(s0)
	bne	a4,a5,.L20
	.loc 2 43 1
	nop
	nop
	ld	ra,104(sp)
	.cfi_restore 1
	ld	s0,96(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 112
	addi	sp,sp,112
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE23:
	.size	alloc_init_pte, .-alloc_init_pte
	.align	2
	.type	alloc_init_pmd, @function
alloc_init_pmd:
.LFB24:
	.loc 2 50 1
	.cfi_startproc
	addi	sp,sp,-128
	.cfi_def_cfa_offset 128
	sd	ra,120(sp)
	sd	s0,112(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,128
	.cfi_def_cfa 8, 0
	sd	a0,-72(s0)
	sd	a1,-80(s0)
	sd	a2,-88(s0)
	sd	a3,-96(s0)
	sd	a4,-104(s0)
	sd	a5,-112(s0)
	sd	a6,-120(s0)
	.loc 2 51 8
	ld	a5,-72(s0)
	ld	a5,0(a5)
	sd	a5,-56(s0)
	.loc 2 56 14
	ld	a5,-56(s0)
	.loc 2 56 5
	bnez	a5,.L22
.LBB3:
	.loc 2 60 14
	ld	a5,-112(s0)
	jalr	a5
.LVL1:
	sd	a0,-32(s0)
	.loc 2 62 3
	ld	a5,-32(s0)
	srli	a5,a5,12
	.loc 2 62 57
	li	a4,1
	.loc 2 62 3
	mv	a1,a4
	mv	a0,a5
	call	pfn_pgd
	mv	a5,a0
	mv	a1,a5
	ld	a0,-72(s0)
	call	set_pgd
	.loc 2 63 7
	ld	a5,-72(s0)
	ld	a5,0(a5)
	sd	a5,-56(s0)
.L22:
.LBE3:
	.loc 2 67 9
	ld	a1,-80(s0)
	ld	a0,-72(s0)
	call	get_pmdp_from_pgdp
	sd	a0,-24(s0)
.L25:
.LBB4:
	.loc 2 69 48
	ld	a4,-80(s0)
	li	a5,2097152
	add	a4,a4,a5
	.loc 2 69 27
	li	a5,-2097152
	and	a5,a4,a5
	sd	a5,-40(s0)
	.loc 2 69 99
	ld	a5,-40(s0)
	addi	a4,a5,-1
	.loc 2 69 111
	ld	a5,-88(s0)
	addi	a5,a5,-1
	.loc 2 69 129
	bgeu	a4,a5,.L23
	.loc 2 69 129 is_stmt 0 discriminator 1
	ld	a5,-40(s0)
	j	.L24
.L23:
	.loc 2 69 129 discriminator 2
	ld	a5,-88(s0)
.L24:
.LBE4:
	.loc 2 69 8 is_stmt 1 discriminator 4
	sd	a5,-48(s0)
	.loc 2 71 3 discriminator 4
	ld	a6,-120(s0)
	ld	a5,-112(s0)
	ld	a4,-104(s0)
	ld	a3,-96(s0)
	ld	a2,-48(s0)
	ld	a1,-80(s0)
	ld	a0,-24(s0)
	call	alloc_init_pte
	.loc 2 74 16 discriminator 4
	ld	a4,-48(s0)
	ld	a5,-80(s0)
	sub	a5,a4,a5
	.loc 2 74 8 discriminator 4
	ld	a4,-96(s0)
	add	a5,a4,a5
	sd	a5,-96(s0)
	.loc 2 75 15 discriminator 4
	ld	a5,-24(s0)
	addi	a5,a5,8
	sd	a5,-24(s0)
	.loc 2 75 24 discriminator 4
	ld	a5,-48(s0)
	sd	a5,-80(s0)
	.loc 2 75 2 discriminator 4
	ld	a4,-80(s0)
	ld	a5,-88(s0)
	bne	a4,a5,.L25
	.loc 2 76 1
	nop
	nop
	ld	ra,120(sp)
	.cfi_restore 1
	ld	s0,112(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 128
	addi	sp,sp,128
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE24:
	.size	alloc_init_pmd, .-alloc_init_pmd
	.align	2
	.globl	early_pgtable_alloc
	.type	early_pgtable_alloc, @function
early_pgtable_alloc:
.LFB25:
	.loc 2 82 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 85 9
	call	get_free_page
	sd	a0,-24(s0)
	.loc 2 86 2
	ld	a5,-24(s0)
	li	a2,4096
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 2 88 9
	ld	a5,-24(s0)
	.loc 2 89 1
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
.LFE25:
	.size	early_pgtable_alloc, .-early_pgtable_alloc
	.align	2
	.globl	__create_pgd_mapping
	.type	__create_pgd_mapping, @function
__create_pgd_mapping:
.LFB26:
	.loc 2 107 1
	.cfi_startproc
	addi	sp,sp,-128
	.cfi_def_cfa_offset 128
	sd	ra,120(sp)
	sd	s0,112(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,128
	.cfi_def_cfa 8, 0
	sd	a0,-72(s0)
	sd	a1,-80(s0)
	sd	a2,-88(s0)
	sd	a3,-96(s0)
	sd	a4,-104(s0)
	sd	a5,-112(s0)
	sd	a6,-120(s0)
	.loc 2 109 36
	ld	a5,-88(s0)
	srli	a5,a5,30
	.loc 2 109 43
	andi	a5,a5,511
	.loc 2 109 25
	slli	a5,a5,3
	.loc 2 109 9
	ld	a4,-72(s0)
	add	a5,a4,a5
	sd	a5,-24(s0)
	.loc 2 112 7
	ld	a4,-80(s0)
	li	a5,-4096
	and	a5,a4,a5
	sd	a5,-80(s0)
	.loc 2 113 7
	ld	a4,-88(s0)
	li	a5,-4096
	and	a5,a4,a5
	sd	a5,-32(s0)
	.loc 2 114 16
	ld	a4,-88(s0)
	ld	a5,-96(s0)
	add	a4,a4,a5
	.loc 2 114 33
	li	a5,4096
	addi	a5,a5,-1
	add	a4,a4,a5
	.loc 2 114 6
	li	a5,-4096
	and	a5,a4,a5
	sd	a5,-40(s0)
.L31:
.LBB5:
	.loc 2 118 48
	ld	a4,-32(s0)
	li	a5,1073741824
	add	a4,a4,a5
	.loc 2 118 27
	li	a5,-1073741824
	and	a5,a4,a5
	sd	a5,-48(s0)
	.loc 2 118 99
	ld	a5,-48(s0)
	addi	a4,a5,-1
	.loc 2 118 111
	ld	a5,-40(s0)
	addi	a5,a5,-1
	.loc 2 118 129
	bgeu	a4,a5,.L29
	.loc 2 118 129 is_stmt 0 discriminator 1
	ld	a5,-48(s0)
	j	.L30
.L29:
	.loc 2 118 129 discriminator 2
	ld	a5,-40(s0)
.L30:
.LBE5:
	.loc 2 118 8 is_stmt 1 discriminator 4
	sd	a5,-56(s0)
	.loc 2 119 3 discriminator 4
	ld	a6,-120(s0)
	ld	a5,-112(s0)
	ld	a4,-104(s0)
	ld	a3,-80(s0)
	ld	a2,-56(s0)
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	alloc_init_pmd
	.loc 2 121 16 discriminator 4
	ld	a4,-56(s0)
	ld	a5,-32(s0)
	sub	a5,a4,a5
	.loc 2 121 8 discriminator 4
	ld	a4,-80(s0)
	add	a5,a4,a5
	sd	a5,-80(s0)
	.loc 2 122 15 discriminator 4
	ld	a5,-24(s0)
	addi	a5,a5,8
	sd	a5,-24(s0)
	.loc 2 122 24 discriminator 4
	ld	a5,-56(s0)
	sd	a5,-32(s0)
	.loc 2 122 2 discriminator 4
	ld	a4,-32(s0)
	ld	a5,-40(s0)
	bne	a4,a5,.L31
	.loc 2 123 1
	nop
	nop
	ld	ra,120(sp)
	.cfi_restore 1
	ld	s0,112(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 128
	addi	sp,sp,128
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE26:
	.size	__create_pgd_mapping, .-__create_pgd_mapping
	.align	2
	.type	create_identical_mapping, @function
create_identical_mapping:
.LFB27:
	.loc 2 126 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 131 8
	lla	a5,_text_boot
	sd	a5,-24(s0)
	.loc 2 132 6
	lla	a5,_etext
	sd	a5,-32(s0)
	.loc 2 133 2
	ld	a4,-32(s0)
	ld	a5,-24(s0)
	sub	a3,a4,a5
	.loc 2 134 29
	li	a4,235
	.loc 2 133 2
	li	a6,0
	lla	a5,early_pgtable_alloc
	ld	a2,-24(s0)
	ld	a1,-24(s0)
	lla	a0,idmap_pg_dir
	call	__create_pgd_mapping
	.loc 2 141 13
	lla	a4,_etext
	.loc 2 141 45
	li	a5,4096
	addi	a5,a5,-1
	add	a4,a4,a5
	.loc 2 141 8
	li	a5,-4096
	and	a5,a4,a5
	sd	a5,-24(s0)
	.loc 2 142 6
	li	a5,129
	slli	a5,a5,24
	sd	a5,-32(s0)
	.loc 2 143 2
	ld	a4,-32(s0)
	ld	a5,-24(s0)
	sub	a3,a4,a5
	.loc 2 144 29
	li	a4,231
	.loc 2 143 2
	li	a6,0
	lla	a5,early_pgtable_alloc
	ld	a2,-24(s0)
	ld	a1,-24(s0)
	lla	a0,idmap_pg_dir
	call	__create_pgd_mapping
	.loc 2 148 1
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
	.size	create_identical_mapping, .-create_identical_mapping
	.align	2
	.type	create_mmio_mapping, @function
create_mmio_mapping:
.LFB28:
	.loc 2 151 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 157 8
	li	a5,201326592
	sd	a5,-24(s0)
	.loc 2 158 6
	li	a5,268435456
	sd	a5,-32(s0)
	.loc 2 159 2
	ld	a4,-32(s0)
	ld	a5,-24(s0)
	sub	a3,a4,a5
	.loc 2 160 29
	li	a4,231
	.loc 2 159 2
	li	a6,0
	lla	a5,early_pgtable_alloc
	ld	a2,-24(s0)
	ld	a1,-24(s0)
	lla	a0,idmap_pg_dir
	call	__create_pgd_mapping
	.loc 2 166 8
	li	a5,33554432
	sd	a5,-24(s0)
	.loc 2 168 25
	li	a4,231
	.loc 2 167 2
	li	a6,0
	lla	a5,early_pgtable_alloc
	li	a3,65536
	ld	a2,-24(s0)
	ld	a1,-24(s0)
	lla	a0,idmap_pg_dir
	call	__create_pgd_mapping
	.loc 2 173 8
	li	a5,268435456
	sd	a5,-24(s0)
	.loc 2 175 22
	li	a4,231
	.loc 2 174 2
	li	a6,0
	lla	a5,early_pgtable_alloc
	li	a3,4096
	ld	a2,-24(s0)
	ld	a1,-24(s0)
	lla	a0,idmap_pg_dir
	call	__create_pgd_mapping
	.loc 2 180 8
	li	a5,33554432
	sd	a5,-24(s0)
	.loc 2 182 25
	li	a4,231
	.loc 2 181 2
	li	a6,0
	lla	a5,early_pgtable_alloc
	li	a3,65536
	ld	a2,-24(s0)
	ld	a1,-24(s0)
	lla	a0,idmap_pg_dir
	call	__create_pgd_mapping
	.loc 2 185 1
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
.LFE28:
	.size	create_mmio_mapping, .-create_mmio_mapping
	.align	2
	.globl	paging_init
	.type	paging_init, @function
paging_init:
.LFB29:
	.loc 2 188 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 191 2
	call	create_mmio_mapping
	.loc 2 194 1
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
.LFE29:
	.size	paging_init, .-paging_init
.Letext0:
	.file 3 "include/asm/pgtable_types.h"
	.file 4 "include/type.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x78a
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF52
	.byte	0xc
	.4byte	.LASF53
	.4byte	.LASF54
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
	.byte	0x4
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
	.byte	0x6
	.byte	0xd
	.4byte	0x42
	.byte	0x4
	.4byte	.LASF6
	.byte	0x3
	.byte	0x7
	.byte	0xd
	.4byte	0x42
	.byte	0x4
	.4byte	.LASF7
	.byte	0x3
	.byte	0x9
	.byte	0xd
	.4byte	0x42
	.byte	0x5
	.byte	0x8
	.byte	0x3
	.byte	0xb
	.byte	0x9
	.4byte	0x97
	.byte	0x6
	.string	"pte"
	.byte	0x3
	.byte	0xc
	.byte	0xb
	.4byte	0x5c
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	.LASF8
	.byte	0x3
	.byte	0xd
	.byte	0x3
	.4byte	0x80
	.byte	0x5
	.byte	0x8
	.byte	0x3
	.byte	0x11
	.byte	0x9
	.4byte	0xba
	.byte	0x6
	.string	"pmd"
	.byte	0x3
	.byte	0x12
	.byte	0xb
	.4byte	0x68
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	.LASF9
	.byte	0x3
	.byte	0x13
	.byte	0x3
	.4byte	0xa3
	.byte	0x5
	.byte	0x8
	.byte	0x3
	.byte	0x1d
	.byte	0x9
	.4byte	0xdd
	.byte	0x6
	.string	"pgd"
	.byte	0x3
	.byte	0x1e
	.byte	0xb
	.4byte	0x74
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	.LASF10
	.byte	0x3
	.byte	0x1f
	.byte	0x3
	.4byte	0xc6
	.byte	0x5
	.byte	0x8
	.byte	0x3
	.byte	0x23
	.byte	0x9
	.4byte	0x100
	.byte	0x7
	.4byte	.LASF11
	.byte	0x3
	.byte	0x24
	.byte	0x10
	.4byte	0x4e
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	.LASF12
	.byte	0x3
	.byte	0x25
	.byte	0x3
	.4byte	0xe9
	.byte	0x8
	.4byte	0x117
	.4byte	0x117
	.byte	0x9
	.byte	0
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF13
	.byte	0xa
	.4byte	.LASF14
	.byte	0x2
	.byte	0xb
	.byte	0xd
	.4byte	0x10c
	.byte	0xa
	.4byte	.LASF15
	.byte	0x2
	.byte	0xd
	.byte	0xd
	.4byte	0x10c
	.byte	0xa
	.4byte	.LASF16
	.byte	0x2
	.byte	0xd
	.byte	0x1b
	.4byte	0x10c
	.byte	0xa
	.4byte	.LASF17
	.byte	0x2
	.byte	0xe
	.byte	0xd
	.4byte	0x10c
	.byte	0xa
	.4byte	.LASF18
	.byte	0x2
	.byte	0xe
	.byte	0x16
	.4byte	0x10c
	.byte	0xb
	.4byte	.LASF55
	.byte	0x2
	.byte	0xbb
	.byte	0x6
	.8byte	.LFB29
	.8byte	.LFE29-.LFB29
	.byte	0x1
	.byte	0x9c
	.byte	0xc
	.4byte	.LASF20
	.byte	0x2
	.byte	0x96
	.byte	0xd
	.8byte	.LFB28
	.8byte	.LFE28-.LFB28
	.byte	0x1
	.byte	0x9c
	.4byte	0x1b1
	.byte	0xd
	.4byte	.LASF19
	.byte	0x2
	.byte	0x98
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xe
	.string	"end"
	.byte	0x2
	.byte	0x99
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0xc
	.4byte	.LASF21
	.byte	0x2
	.byte	0x7d
	.byte	0xd
	.8byte	.LFB27
	.8byte	.LFE27-.LFB27
	.byte	0x1
	.byte	0x9c
	.4byte	0x1ee
	.byte	0xd
	.4byte	.LASF19
	.byte	0x2
	.byte	0x7f
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xe
	.string	"end"
	.byte	0x2
	.byte	0x80
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0xf
	.4byte	.LASF56
	.byte	0x2
	.byte	0x66
	.byte	0x6
	.8byte	.LFB26
	.8byte	.LFE26-.LFB26
	.byte	0x1
	.byte	0x9c
	.4byte	0x2da
	.byte	0x10
	.4byte	.LASF22
	.byte	0x2
	.byte	0x66
	.byte	0x22
	.4byte	0x2da
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x10
	.4byte	.LASF23
	.byte	0x2
	.byte	0x66
	.byte	0x37
	.4byte	0x4e
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x10
	.4byte	.LASF24
	.byte	0x2
	.byte	0x67
	.byte	0x11
	.4byte	0x4e
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0x10
	.4byte	.LASF25
	.byte	0x2
	.byte	0x67
	.byte	0x25
	.4byte	0x4e
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x7f
	.byte	0x10
	.4byte	.LASF26
	.byte	0x2
	.byte	0x68
	.byte	0xc
	.4byte	0x100
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x7f
	.byte	0x10
	.4byte	.LASF27
	.byte	0x2
	.byte	0x69
	.byte	0x13
	.4byte	0x2e5
	.byte	0x3
	.byte	0x91
	.byte	0x90,0x7f
	.byte	0x10
	.4byte	.LASF28
	.byte	0x2
	.byte	0x6a
	.byte	0x11
	.4byte	0x4e
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0xd
	.4byte	.LASF29
	.byte	0x2
	.byte	0x6d
	.byte	0x9
	.4byte	0x2da
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xd
	.4byte	.LASF30
	.byte	0x2
	.byte	0x6e
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xe
	.string	"end"
	.byte	0x2
	.byte	0x6e
	.byte	0x16
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xd
	.4byte	.LASF31
	.byte	0x2
	.byte	0x6e
	.byte	0x1b
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x11
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.byte	0xd
	.4byte	.LASF32
	.byte	0x2
	.byte	0x76
	.byte	0x1b
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x8
	.4byte	0xdd
	.byte	0x13
	.4byte	0x4e
	.byte	0x12
	.byte	0x8
	.4byte	0x2e0
	.byte	0x14
	.4byte	.LASF57
	.byte	0x2
	.byte	0x51
	.byte	0xf
	.4byte	0x4e
	.8byte	.LFB25
	.8byte	.LFE25-.LFB25
	.byte	0x1
	.byte	0x9c
	.4byte	0x31d
	.byte	0xd
	.4byte	.LASF23
	.byte	0x2
	.byte	0x53
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xc
	.4byte	.LASF33
	.byte	0x2
	.byte	0x2d
	.byte	0xd
	.8byte	.LFB24
	.8byte	.LFE24-.LFB24
	.byte	0x1
	.byte	0x9c
	.4byte	0x41f
	.byte	0x10
	.4byte	.LASF29
	.byte	0x2
	.byte	0x2d
	.byte	0x23
	.4byte	0x2da
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x10
	.4byte	.LASF30
	.byte	0x2
	.byte	0x2d
	.byte	0x37
	.4byte	0x4e
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x15
	.string	"end"
	.byte	0x2
	.byte	0x2e
	.byte	0x11
	.4byte	0x4e
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0x10
	.4byte	.LASF23
	.byte	0x2
	.byte	0x2e
	.byte	0x24
	.4byte	0x4e
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x7f
	.byte	0x10
	.4byte	.LASF26
	.byte	0x2
	.byte	0x2f
	.byte	0xc
	.4byte	0x100
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x7f
	.byte	0x10
	.4byte	.LASF27
	.byte	0x2
	.byte	0x30
	.byte	0x13
	.4byte	0x2e5
	.byte	0x3
	.byte	0x91
	.byte	0x90,0x7f
	.byte	0x10
	.4byte	.LASF28
	.byte	0x2
	.byte	0x31
	.byte	0x11
	.4byte	0x4e
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0xe
	.string	"pgd"
	.byte	0x2
	.byte	0x33
	.byte	0x8
	.4byte	0xdd
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xd
	.4byte	.LASF34
	.byte	0x2
	.byte	0x34
	.byte	0x9
	.4byte	0x41f
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xd
	.4byte	.LASF31
	.byte	0x2
	.byte	0x35
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x16
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.4byte	0x3fd
	.byte	0xd
	.4byte	.LASF35
	.byte	0x2
	.byte	0x39
	.byte	0x11
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x11
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.byte	0xd
	.4byte	.LASF32
	.byte	0x2
	.byte	0x45
	.byte	0x1b
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x8
	.4byte	0xba
	.byte	0xc
	.4byte	.LASF36
	.byte	0x2
	.byte	0x10
	.byte	0xd
	.8byte	.LFB23
	.8byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
	.4byte	0x4f1
	.byte	0x10
	.4byte	.LASF34
	.byte	0x2
	.byte	0x10
	.byte	0x23
	.4byte	0x41f
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x10
	.4byte	.LASF30
	.byte	0x2
	.byte	0x10
	.byte	0x37
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x15
	.string	"end"
	.byte	0x2
	.byte	0x11
	.byte	0x11
	.4byte	0x4e
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x10
	.4byte	.LASF23
	.byte	0x2
	.byte	0x11
	.byte	0x24
	.4byte	0x4e
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x10
	.4byte	.LASF26
	.byte	0x2
	.byte	0x12
	.byte	0xc
	.4byte	0x100
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0x10
	.4byte	.LASF27
	.byte	0x2
	.byte	0x13
	.byte	0x13
	.4byte	0x2e5
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x7f
	.byte	0x10
	.4byte	.LASF28
	.byte	0x2
	.byte	0x14
	.byte	0x11
	.4byte	0x4e
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x7f
	.byte	0xe
	.string	"pmd"
	.byte	0x2
	.byte	0x16
	.byte	0x8
	.4byte	0xba
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xd
	.4byte	.LASF37
	.byte	0x2
	.byte	0x17
	.byte	0x9
	.4byte	0x4f1
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x11
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0xd
	.4byte	.LASF38
	.byte	0x2
	.byte	0x1b
	.byte	0x11
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x8
	.4byte	0x97
	.byte	0x17
	.4byte	.LASF39
	.byte	0x1
	.byte	0x8a
	.byte	0x15
	.4byte	0x97
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.4byte	0x538
	.byte	0x15
	.string	"pfn"
	.byte	0x1
	.byte	0x8a
	.byte	0x2b
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x10
	.4byte	.LASF26
	.byte	0x1
	.byte	0x8a
	.byte	0x39
	.4byte	0x100
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x17
	.4byte	.LASF40
	.byte	0x1
	.byte	0x80
	.byte	0x15
	.4byte	0xba
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0x579
	.byte	0x15
	.string	"pfn"
	.byte	0x1
	.byte	0x80
	.byte	0x2b
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x10
	.4byte	.LASF26
	.byte	0x1
	.byte	0x80
	.byte	0x39
	.4byte	0x100
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x17
	.4byte	.LASF41
	.byte	0x1
	.byte	0x76
	.byte	0x15
	.4byte	0xdd
	.8byte	.LFB7
	.8byte	.LFE7-.LFB7
	.byte	0x1
	.byte	0x9c
	.4byte	0x5ba
	.byte	0x15
	.string	"pfn"
	.byte	0x1
	.byte	0x76
	.byte	0x2b
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x10
	.4byte	.LASF26
	.byte	0x1
	.byte	0x76
	.byte	0x39
	.4byte	0x100
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x18
	.4byte	.LASF42
	.byte	0x1
	.byte	0x71
	.byte	0x14
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0x5f7
	.byte	0x10
	.4byte	.LASF37
	.byte	0x1
	.byte	0x71
	.byte	0x23
	.4byte	0x4f1
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x15
	.string	"pte"
	.byte	0x1
	.byte	0x71
	.byte	0x2f
	.4byte	0x97
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x18
	.4byte	.LASF43
	.byte	0x1
	.byte	0x6c
	.byte	0x14
	.8byte	.LFB5
	.8byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.4byte	0x634
	.byte	0x10
	.4byte	.LASF34
	.byte	0x1
	.byte	0x6c
	.byte	0x23
	.4byte	0x41f
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x15
	.string	"pmd"
	.byte	0x1
	.byte	0x6c
	.byte	0x2f
	.4byte	0xba
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x18
	.4byte	.LASF44
	.byte	0x1
	.byte	0x67
	.byte	0x14
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0x671
	.byte	0x10
	.4byte	.LASF29
	.byte	0x1
	.byte	0x67
	.byte	0x23
	.4byte	0x2da
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x15
	.string	"pgd"
	.byte	0x1
	.byte	0x67
	.byte	0x2f
	.4byte	0xdd
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x19
	.4byte	.LASF45
	.byte	0x1
	.byte	0x59
	.byte	0x16
	.4byte	0x4f1
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x6cf
	.byte	0x10
	.4byte	.LASF34
	.byte	0x1
	.byte	0x59
	.byte	0x30
	.4byte	0x41f
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x15
	.string	"va"
	.byte	0x1
	.byte	0x59
	.byte	0x44
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xd
	.4byte	.LASF46
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.4byte	0x4f1
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xd
	.4byte	.LASF47
	.byte	0x1
	.byte	0x5e
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x17
	.4byte	.LASF48
	.byte	0x1
	.byte	0x52
	.byte	0x1d
	.4byte	0x4e
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x701
	.byte	0x15
	.string	"pmd"
	.byte	0x1
	.byte	0x52
	.byte	0x32
	.4byte	0xba
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x19
	.4byte	.LASF49
	.byte	0x1
	.byte	0x44
	.byte	0x16
	.4byte	0x41f
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x75f
	.byte	0x10
	.4byte	.LASF29
	.byte	0x1
	.byte	0x44
	.byte	0x30
	.4byte	0x2da
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x15
	.string	"va"
	.byte	0x1
	.byte	0x44
	.byte	0x44
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xd
	.4byte	.LASF50
	.byte	0x1
	.byte	0x46
	.byte	0x9
	.4byte	0x41f
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xd
	.4byte	.LASF47
	.byte	0x1
	.byte	0x49
	.byte	0x10
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1a
	.4byte	.LASF51
	.byte	0x1
	.byte	0x3c
	.byte	0x1d
	.4byte	0x4e
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x15
	.string	"pgd"
	.byte	0x1
	.byte	0x3c
	.byte	0x32
	.4byte	0xdd
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
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x21
	.byte	0
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
	.byte	0xc
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
	.byte	0xd
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
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
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
	.byte	0x15
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
	.byte	0x16
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
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x18
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
	.byte	0x96,0x42
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
.LASF54:
	.string	"/home/acetab/\346\241\214\351\235\242/benos"
.LASF15:
	.string	"_text_boot"
.LASF39:
	.string	"pfn_pte"
.LASF21:
	.string	"create_identical_mapping"
.LASF48:
	.string	"pmd_page_paddr"
.LASF35:
	.string	"pmd_phys"
.LASF16:
	.string	"_etext_boot"
.LASF43:
	.string	"set_pmd"
.LASF34:
	.string	"pmdp"
.LASF17:
	.string	"_text"
.LASF47:
	.string	"index"
.LASF10:
	.string	"pgd_t"
.LASF33:
	.string	"alloc_init_pmd"
.LASF40:
	.string	"pfn_pmd"
.LASF20:
	.string	"create_mmio_mapping"
.LASF27:
	.string	"alloc_pgtable"
.LASF30:
	.string	"addr"
.LASF14:
	.string	"idmap_pg_dir"
.LASF23:
	.string	"phys"
.LASF12:
	.string	"pgprot_t"
.LASF53:
	.string	"src/mmu.c"
.LASF0:
	.string	"unsigned char"
.LASF24:
	.string	"virt"
.LASF46:
	.string	"pte_base"
.LASF8:
	.string	"pte_t"
.LASF51:
	.string	"pgd_page_paddr"
.LASF28:
	.string	"flags"
.LASF56:
	.string	"__create_pgd_mapping"
.LASF2:
	.string	"unsigned int"
.LASF32:
	.string	"__boundary"
.LASF26:
	.string	"prot"
.LASF11:
	.string	"pgprot"
.LASF50:
	.string	"pmd_base"
.LASF19:
	.string	"start"
.LASF1:
	.string	"short unsigned int"
.LASF13:
	.string	"char"
.LASF49:
	.string	"get_pmdp_from_pgdp"
.LASF37:
	.string	"ptep"
.LASF4:
	.string	"_Bool"
.LASF41:
	.string	"pfn_pgd"
.LASF7:
	.string	"pgdval_t"
.LASF3:
	.string	"long unsigned int"
.LASF5:
	.string	"pteval_t"
.LASF25:
	.string	"size"
.LASF9:
	.string	"pmd_t"
.LASF55:
	.string	"paging_init"
.LASF57:
	.string	"early_pgtable_alloc"
.LASF45:
	.string	"get_ptep_from_pmdp"
.LASF36:
	.string	"alloc_init_pte"
.LASF52:
	.string	"GNU C17 9.4.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF29:
	.string	"pgdp"
.LASF22:
	.string	"pgdir"
.LASF44:
	.string	"set_pgd"
.LASF18:
	.string	"_etext"
.LASF42:
	.string	"set_pte"
.LASF6:
	.string	"pmdval_t"
.LASF38:
	.string	"pte_phys"
.LASF31:
	.string	"next"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
