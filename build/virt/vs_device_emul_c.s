	.file	"vs_device_emul.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.type	check_uart_mmio_range, @function
check_uart_mmio_range:
.LFB1:
	.file 1 "virt/vs_device_emul.c"
	.loc 1 20 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 21 5
	ld	a4,-24(s0)
	li	a5,268435456
	bltu	a4,a5,.L2
	.loc 1 21 25 discriminator 1
	ld	a4,-24(s0)
	li	a5,268439552
	bgtu	a4,a5,.L2
	.loc 1 22 10
	li	a5,1
	j	.L3
.L2:
	.loc 1 24 10
	li	a5,0
.L3:
	.loc 1 25 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	check_uart_mmio_range, .-check_uart_mmio_range
	.align	2
	.type	check_plic_mmio_range, @function
check_plic_mmio_range:
.LFB2:
	.loc 1 28 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 29 5
	ld	a4,-24(s0)
	li	a5,201326592
	bltu	a4,a5,.L5
	.loc 1 29 26 discriminator 1
	ld	a4,-24(s0)
	li	a5,268435456
	bgtu	a4,a5,.L5
	.loc 1 30 10
	li	a5,1
	j	.L6
.L5:
	.loc 1 32 10
	li	a5,0
.L6:
	.loc 1 33 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	check_plic_mmio_range, .-check_plic_mmio_range
	.align	2
	.globl	check_emul_mmio_range
	.type	check_emul_mmio_range, @function
check_emul_mmio_range:
.LFB3:
	.loc 1 36 1
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
	.loc 1 37 6
	ld	a0,-24(s0)
	call	check_uart_mmio_range
	mv	a5,a0
	.loc 1 37 5
	bnez	a5,.L8
	.loc 1 37 37 discriminator 1
	ld	a0,-24(s0)
	call	check_plic_mmio_range
	mv	a5,a0
	.loc 1 37 34 discriminator 1
	beqz	a5,.L9
.L8:
	.loc 1 38 10
	li	a5,1
	j	.L10
.L9:
	.loc 1 40 10
	li	a5,0
.L10:
	.loc 1 41 1
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
	.size	check_emul_mmio_range, .-check_emul_mmio_range
	.align	2
	.globl	emul_readreg
	.type	emul_readreg, @function
emul_readreg:
.LFB4:
	.loc 1 44 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	mv	a5,a1
	sw	a5,-28(s0)
	.loc 1 45 8
	lw	a5,-28(s0)
	sext.w	a5,a5
	blez	a5,.L12
	.loc 1 45 20 discriminator 1
	lw	a5,-28(s0)
	sext.w	a4,a5
	li	a5,31
	ble	a4,a5,.L13
.L12:
	.loc 1 46 13
	li	a5,0
	j	.L14
.L13:
	.loc 1 48 57
	lw	a5,-28(s0)
	slliw	a5,a5,3
	sext.w	a5,a5
	mv	a4,a5
	.loc 1 48 31
	ld	a5,-24(s0)
	.loc 1 48 51
	add	a5,a4,a5
	.loc 1 48 12
	ld	a5,0(a5)
.L14:
	.loc 1 49 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	emul_readreg, .-emul_readreg
	.align	2
	.globl	emul_writereg
	.type	emul_writereg, @function
emul_writereg:
.LFB5:
	.loc 1 52 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	mv	a5,a1
	sd	a2,-40(s0)
	sw	a5,-28(s0)
	.loc 1 53 8
	lw	a5,-28(s0)
	sext.w	a5,a5
	blez	a5,.L19
	.loc 1 53 20 discriminator 1
	lw	a5,-28(s0)
	sext.w	a4,a5
	li	a5,31
	bgt	a4,a5,.L19
	.loc 1 56 50
	lw	a5,-28(s0)
	slliw	a5,a5,3
	sext.w	a5,a5
	mv	a4,a5
	.loc 1 56 24
	ld	a5,-24(s0)
	.loc 1 56 44
	add	a5,a4,a5
	.loc 1 56 6
	mv	a4,a5
	.loc 1 56 55
	ld	a5,-40(s0)
	sd	a5,0(a4)
	j	.L15
.L19:
	.loc 1 54 6
	nop
.L15:
	.loc 1 57 1
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE5:
	.size	emul_writereg, .-emul_writereg
	.align	2
	.globl	emu_mmio_rw_reg64
	.type	emu_mmio_rw_reg64, @function
emu_mmio_rw_reg64:
.LFB6:
	.loc 1 60 1
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
	.loc 1 63 14
	ld	a5,-56(s0)
	lw	a5,16(a5)
	.loc 1 63 5
	beqz	a5,.L21
	.loc 1 64 9
	ld	a5,-56(s0)
	ld	a4,0(a5)
	ld	a5,-56(s0)
	lw	a5,28(a5)
	mv	a1,a5
	mv	a0,a4
	call	emul_readreg
	sd	a0,-32(s0)
.LBB2:
	.loc 1 65 20
	ld	a5,-32(s0)
	sd	a5,-40(s0)
	.loc 1 65 31
	.loc 1 65 110
	ld	a5,-56(s0)
	ld	a5,8(a5)
	.loc 1 65 75
	mv	a4,a5
	.loc 1 65 118
	ld	a5,-40(s0)
	sd	a5,0(a4)
.LBE2:
	.loc 1 70 1
	j	.L23
.L21:
.LBB3:
	.loc 1 67 69
	ld	a5,-56(s0)
	ld	a5,8(a5)
	.loc 1 67 26
	ld	a5,0(a5)
	sd	a5,-24(s0)
	.loc 1 67 79
	.loc 1 67 121
	ld	a5,-24(s0)
.LBE3:
	.loc 1 67 7
	sd	a5,-32(s0)
	.loc 1 68 3
	ld	a5,-56(s0)
	ld	a4,0(a5)
	ld	a5,-56(s0)
	lw	a5,28(a5)
	ld	a2,-32(s0)
	mv	a1,a5
	mv	a0,a4
	call	emul_writereg
.L23:
	.loc 1 70 1
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
.LFE6:
	.size	emu_mmio_rw_reg64, .-emu_mmio_rw_reg64
	.align	2
	.globl	emu_mmio_ro_reg64
	.type	emu_mmio_ro_reg64, @function
emu_mmio_ro_reg64:
.LFB7:
	.loc 1 73 1
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
	.loc 1 76 14
	ld	a5,-40(s0)
	lw	a5,16(a5)
	.loc 1 76 5
	bnez	a5,.L27
.LBB4:
	.loc 1 79 68
	ld	a5,-40(s0)
	ld	a5,8(a5)
	.loc 1 79 25
	ld	a5,0(a5)
	sd	a5,-24(s0)
	.loc 1 79 78
	.loc 1 79 120
	ld	a5,-24(s0)
.LBE4:
	.loc 1 79 6
	sd	a5,-32(s0)
	.loc 1 80 2
	ld	a5,-40(s0)
	ld	a4,0(a5)
	ld	a5,-40(s0)
	lw	a5,28(a5)
	ld	a2,-32(s0)
	mv	a1,a5
	mv	a0,a4
	call	emul_writereg
	j	.L24
.L27:
	.loc 1 77 3
	nop
.L24:
	.loc 1 81 1
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE7:
	.size	emu_mmio_ro_reg64, .-emu_mmio_ro_reg64
	.align	2
	.globl	emu_mmio_w_reg64
	.type	emu_mmio_w_reg64, @function
emu_mmio_w_reg64:
.LFB8:
	.loc 1 84 1
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
	.loc 1 87 15
	ld	a5,-40(s0)
	lw	a5,16(a5)
	.loc 1 87 5
	beqz	a5,.L31
	.loc 1 90 8
	ld	a5,-40(s0)
	ld	a4,0(a5)
	ld	a5,-40(s0)
	lw	a5,28(a5)
	mv	a1,a5
	mv	a0,a4
	call	emul_readreg
	sd	a0,-24(s0)
.LBB5:
	.loc 1 91 19
	ld	a5,-24(s0)
	sd	a5,-32(s0)
	.loc 1 91 30
	.loc 1 91 109
	ld	a5,-40(s0)
	ld	a5,8(a5)
	.loc 1 91 74
	mv	a4,a5
	.loc 1 91 117
	ld	a5,-32(s0)
	sd	a5,0(a4)
	j	.L28
.L31:
.LBE5:
	.loc 1 88 3
	nop
.L28:
	.loc 1 92 1
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	emu_mmio_w_reg64, .-emu_mmio_w_reg64
	.align	2
	.globl	emu_mmio_rw_reg32
	.type	emu_mmio_rw_reg32, @function
emu_mmio_rw_reg32:
.LFB9:
	.loc 1 95 1
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
	.loc 1 98 14
	ld	a5,-40(s0)
	lw	a5,16(a5)
	.loc 1 98 5
	beqz	a5,.L33
	.loc 1 99 9
	ld	a5,-40(s0)
	ld	a4,0(a5)
	ld	a5,-40(s0)
	lw	a5,28(a5)
	mv	a1,a5
	mv	a0,a4
	call	emul_readreg
	mv	a5,a0
	.loc 1 99 7
	sw	a5,-24(s0)
.LBB6:
	.loc 1 100 19
	lw	a5,-24(s0)
	sw	a5,-28(s0)
	.loc 1 100 30
	.loc 1 100 123
	ld	a5,-40(s0)
	ld	a5,8(a5)
	.loc 1 100 74
	mv	a4,a5
	.loc 1 100 131
	lw	a5,-28(s0)
	sw	a5,0(a4)
	sext.w	a5,a5
.LBE6:
	.loc 1 105 1
	j	.L35
.L33:
.LBB7:
	.loc 1 102 82
	ld	a5,-40(s0)
	ld	a5,8(a5)
	.loc 1 102 25
	lw	a5,0(a5)
	sw	a5,-20(s0)
	.loc 1 102 92
	.loc 1 102 134
	lw	a5,-20(s0)
.LBE7:
	.loc 1 102 7
	sw	a5,-24(s0)
	.loc 1 103 3
	ld	a5,-40(s0)
	ld	a4,0(a5)
	ld	a5,-40(s0)
	lw	a5,28(a5)
	lwu	a3,-24(s0)
	mv	a2,a3
	mv	a1,a5
	mv	a0,a4
	call	emul_writereg
.L35:
	.loc 1 105 1
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
.LFE9:
	.size	emu_mmio_rw_reg32, .-emu_mmio_rw_reg32
	.align	2
	.globl	emu_mmio_ro_reg32
	.type	emu_mmio_ro_reg32, @function
emu_mmio_ro_reg32:
.LFB10:
	.loc 1 108 1
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
	.loc 1 111 14
	ld	a5,-40(s0)
	lw	a5,16(a5)
	.loc 1 111 5
	bnez	a5,.L39
.LBB8:
	.loc 1 114 81
	ld	a5,-40(s0)
	ld	a5,8(a5)
	.loc 1 114 24
	lw	a5,0(a5)
	sw	a5,-20(s0)
	.loc 1 114 91
	.loc 1 114 133
	lw	a5,-20(s0)
.LBE8:
	.loc 1 114 6
	sw	a5,-24(s0)
	.loc 1 115 2
	ld	a5,-40(s0)
	ld	a4,0(a5)
	ld	a5,-40(s0)
	lw	a5,28(a5)
	lwu	a3,-24(s0)
	mv	a2,a3
	mv	a1,a5
	mv	a0,a4
	call	emul_writereg
	j	.L36
.L39:
	.loc 1 112 3
	nop
.L36:
	.loc 1 116 1
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	emu_mmio_ro_reg32, .-emu_mmio_ro_reg32
	.align	2
	.globl	emu_mmio_w_reg32
	.type	emu_mmio_w_reg32, @function
emu_mmio_w_reg32:
.LFB11:
	.loc 1 119 1
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
	.loc 1 122 15
	ld	a5,-40(s0)
	lw	a5,16(a5)
	.loc 1 122 5
	beqz	a5,.L43
	.loc 1 125 8
	ld	a5,-40(s0)
	ld	a4,0(a5)
	ld	a5,-40(s0)
	lw	a5,28(a5)
	mv	a1,a5
	mv	a0,a4
	call	emul_readreg
	mv	a5,a0
	.loc 1 125 6
	sw	a5,-20(s0)
.LBB9:
	.loc 1 126 18
	lw	a5,-20(s0)
	sw	a5,-24(s0)
	.loc 1 126 29
	.loc 1 126 122
	ld	a5,-40(s0)
	ld	a5,8(a5)
	.loc 1 126 73
	mv	a4,a5
	.loc 1 126 130
	lw	a5,-24(s0)
	sw	a5,0(a4)
	sext.w	a5,a5
	j	.L40
.L43:
.LBE9:
	.loc 1 123 3
	nop
.L40:
	.loc 1 127 1
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE11:
	.size	emu_mmio_w_reg32, .-emu_mmio_w_reg32
	.align	2
	.globl	emu_mmio_rw_reg8
	.type	emu_mmio_rw_reg8, @function
emu_mmio_rw_reg8:
.LFB12:
	.loc 1 130 1
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
	.loc 1 133 14
	ld	a5,-40(s0)
	lw	a5,16(a5)
	.loc 1 133 5
	beqz	a5,.L45
	.loc 1 134 9
	ld	a5,-40(s0)
	ld	a4,0(a5)
	ld	a5,-40(s0)
	lw	a5,28(a5)
	mv	a1,a5
	mv	a0,a4
	call	emul_readreg
	mv	a5,a0
	.loc 1 134 7
	sb	a5,-18(s0)
.LBB10:
	.loc 1 135 20
	lbu	a5,-18(s0)
	sb	a5,-19(s0)
	.loc 1 135 31
	.loc 1 135 110
	ld	a5,-40(s0)
	ld	a5,8(a5)
	.loc 1 135 75
	mv	a4,a5
	.loc 1 135 118
	lbu	a5,-19(s0)
	sb	a5,0(a4)
.LBE10:
	.loc 1 140 1
	j	.L47
.L45:
.LBB11:
	.loc 1 137 69
	ld	a5,-40(s0)
	ld	a5,8(a5)
	.loc 1 137 26
	lbu	a5,0(a5)
	sb	a5,-17(s0)
	.loc 1 137 79
	.loc 1 137 121
	lbu	a5,-17(s0)
.LBE11:
	.loc 1 137 7
	sb	a5,-18(s0)
	.loc 1 138 3
	ld	a5,-40(s0)
	ld	a4,0(a5)
	ld	a5,-40(s0)
	lw	a5,28(a5)
	lbu	a3,-18(s0)
	mv	a2,a3
	mv	a1,a5
	mv	a0,a4
	call	emul_writereg
.L47:
	.loc 1 140 1
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
.LFE12:
	.size	emu_mmio_rw_reg8, .-emu_mmio_rw_reg8
	.align	2
	.globl	emu_mmio_ro_reg8
	.type	emu_mmio_ro_reg8, @function
emu_mmio_ro_reg8:
.LFB13:
	.loc 1 143 1
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
	.loc 1 146 14
	ld	a5,-40(s0)
	lw	a5,16(a5)
	.loc 1 146 5
	bnez	a5,.L51
.LBB12:
	.loc 1 149 68
	ld	a5,-40(s0)
	ld	a5,8(a5)
	.loc 1 149 25
	lbu	a5,0(a5)
	sb	a5,-17(s0)
	.loc 1 149 78
	.loc 1 149 120
	lbu	a5,-17(s0)
.LBE12:
	.loc 1 149 6
	sb	a5,-18(s0)
	.loc 1 150 2
	ld	a5,-40(s0)
	ld	a4,0(a5)
	ld	a5,-40(s0)
	lw	a5,28(a5)
	lbu	a3,-18(s0)
	mv	a2,a3
	mv	a1,a5
	mv	a0,a4
	call	emul_writereg
	j	.L48
.L51:
	.loc 1 147 3
	nop
.L48:
	.loc 1 151 1
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE13:
	.size	emu_mmio_ro_reg8, .-emu_mmio_ro_reg8
	.align	2
	.globl	emu_mmio_w_reg8
	.type	emu_mmio_w_reg8, @function
emu_mmio_w_reg8:
.LFB14:
	.loc 1 154 1
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
	.loc 1 157 15
	ld	a5,-40(s0)
	lw	a5,16(a5)
	.loc 1 157 5
	beqz	a5,.L55
	.loc 1 160 8
	ld	a5,-40(s0)
	ld	a4,0(a5)
	ld	a5,-40(s0)
	lw	a5,28(a5)
	mv	a1,a5
	mv	a0,a4
	call	emul_readreg
	mv	a5,a0
	.loc 1 160 6
	sb	a5,-17(s0)
.LBB13:
	.loc 1 161 19
	lbu	a5,-17(s0)
	sb	a5,-18(s0)
	.loc 1 161 30
	.loc 1 161 109
	ld	a5,-40(s0)
	ld	a5,8(a5)
	.loc 1 161 74
	mv	a4,a5
	.loc 1 161 117
	lbu	a5,-18(s0)
	sb	a5,0(a4)
	j	.L52
.L55:
.LBE13:
	.loc 1 158 3
	nop
.L52:
	.loc 1 162 1
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE14:
	.size	emu_mmio_w_reg8, .-emu_mmio_w_reg8
	.align	2
	.globl	emu_uart
	.type	emu_uart, @function
emu_uart:
.LFB15:
	.loc 1 165 1
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
	.loc 1 166 18
	ld	a5,-24(s0)
	ld	a5,8(a5)
	.loc 1 166 2
	li	a4,268435456
	beq	a5,a4,.L57
	li	a4,268435456
	addi	a4,a4,5
	bne	a5,a4,.L58
	.loc 1 168 3
	ld	a0,-24(s0)
	call	emu_mmio_ro_reg8
	.loc 1 169 3
	j	.L58
.L57:
	.loc 1 171 3
	ld	a0,-24(s0)
	call	emu_mmio_rw_reg8
	.loc 1 172 3
	nop
.L58:
	.loc 1 175 9
	li	a5,0
	.loc 1 177 1
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
.LFE15:
	.size	emu_uart, .-emu_uart
	.section	.rodata
	.align	3
.LC0:
	.string	"not support compressed instruction yet\n"
	.text
	.align	2
	.globl	emul_device
	.type	emul_device, @function
emul_device:
.LFB16:
	.loc 1 180 1
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
	.loc 1 184 18
	ld	a5,-80(s0)
	andi	a4,a5,3
	.loc 1 184 5
	li	a5,3
	beq	a4,a5,.L61
.LBB14:
	.loc 1 185 3
	lla	a0,.LC0
	call	printk
	.loc 1 186 10
	li	a5,-1
	j	.L60
.L61:
.LBE14:
	.loc 1 189 16
	ld	a5,-80(s0)
	andi	a4,a5,127
	.loc 1 189 5
	li	a5,3
	beq	a4,a5,.L63
	.loc 1 190 14 discriminator 1
	ld	a5,-80(s0)
	andi	a4,a5,127
	.loc 1 189 33 discriminator 1
	li	a5,35
	beq	a4,a5,.L63
	.loc 1 191 10
	li	a5,-1
	j	.L60
.L63:
	.loc 1 193 16
	ld	a5,-72(s0)
	sd	a5,-48(s0)
	.loc 1 194 16
	ld	a5,-88(s0)
	sd	a5,-56(s0)
	.loc 1 196 21
	ld	a5,-80(s0)
	srli	a5,a5,12
	.loc 1 196 28
	sext.w	a5,a5
	.loc 1 196 9
	andi	a5,a5,7
	sw	a5,-20(s0)
	.loc 1 197 17
	lw	a5,-20(s0)
	andi	a5,a5,3
	sext.w	a5,a5
	.loc 1 197 2
	mv	a3,a5
	li	a4,3
	beq	a3,a4,.L64
	mv	a3,a5
	li	a4,3
	bgt	a3,a4,.L65
	mv	a3,a5
	li	a4,2
	beq	a3,a4,.L66
	mv	a3,a5
	li	a4,2
	bgt	a3,a4,.L65
	beqz	a5,.L67
	mv	a4,a5
	li	a5,1
	beq	a4,a5,.L68
	j	.L65
.L67:
	.loc 1 199 18
	li	a5,1
	sw	a5,-32(s0)
	.loc 1 200 3
	j	.L65
.L68:
	.loc 1 202 18
	li	a5,2
	sw	a5,-32(s0)
	.loc 1 203 3
	j	.L65
.L66:
	.loc 1 205 18
	li	a5,4
	sw	a5,-32(s0)
	.loc 1 206 3
	j	.L65
.L64:
	.loc 1 208 18
	li	a5,8
	sw	a5,-32(s0)
	.loc 1 209 3
	nop
.L65:
	.loc 1 212 30
	ld	a5,-80(s0)
	andi	a5,a5,127
	.loc 1 212 37
	addi	a5,a5,-35
	seqz	a5,a5
	andi	a5,a5,0xff
	sext.w	a5,a5
	.loc 1 212 17
	sw	a5,-40(s0)
	.loc 1 214 25
	lw	a5,-40(s0)
	.loc 1 214 15
	beqz	a5,.L69
	.loc 1 214 46 discriminator 1
	ld	a5,-80(s0)
	srli	a5,a5,20
	.loc 1 214 53 discriminator 1
	sext.w	a5,a5
	.loc 1 214 15 discriminator 1
	andi	a5,a5,31
	sext.w	a5,a5
	j	.L70
.L69:
	.loc 1 214 75 discriminator 2
	ld	a5,-80(s0)
	srli	a5,a5,7
	.loc 1 214 81 discriminator 2
	sext.w	a5,a5
	.loc 1 214 15 discriminator 2
	andi	a5,a5,31
	sext.w	a5,a5
.L70:
	.loc 1 214 15 is_stmt 0 discriminator 4
	sw	a5,-28(s0)
	.loc 1 215 31 is_stmt 1 discriminator 4
	lw	a5,-20(s0)
	andi	a5,a5,4
	sext.w	a5,a5
	.loc 1 215 22 discriminator 4
	seqz	a5,a5
	andi	a5,a5,0xff
	sext.w	a5,a5
	.loc 1 215 20 discriminator 4
	sw	a5,-36(s0)
	.loc 1 217 6 discriminator 4
	ld	a0,-72(s0)
	call	check_uart_mmio_range
	mv	a5,a0
	.loc 1 217 5 discriminator 4
	beqz	a5,.L71
	.loc 1 218 3
	addi	a5,s0,-56
	mv	a0,a5
	call	emu_uart
	j	.L72
.L71:
	.loc 1 219 11
	ld	a0,-72(s0)
	call	check_plic_mmio_range
	mv	a5,a0
	.loc 1 219 10
	beqz	a5,.L72
.LBB15:
	.loc 1 220 3
	addi	a5,s0,-56
	mv	a0,a5
	call	emu_plic
.L72:
.L60:
.LBE15:
	.loc 1 221 1
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
.LFE16:
	.size	emul_device, .-emul_device
.Letext0:
	.file 2 "include/asm/ptregs.h"
	.file 3 "include/virt.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x83b
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF35
	.byte	0xc
	.4byte	.LASF36
	.4byte	.LASF37
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF5
	.2byte	0x120
	.byte	0x2
	.byte	0xe
	.byte	0x8
	.4byte	0x1f7
	.byte	0x3
	.4byte	.LASF0
	.byte	0x2
	.byte	0x10
	.byte	0x10
	.4byte	0x1f7
	.byte	0
	.byte	0x4
	.string	"ra"
	.byte	0x2
	.byte	0x11
	.byte	0x10
	.4byte	0x1f7
	.byte	0x8
	.byte	0x4
	.string	"sp"
	.byte	0x2
	.byte	0x12
	.byte	0x10
	.4byte	0x1f7
	.byte	0x10
	.byte	0x4
	.string	"gp"
	.byte	0x2
	.byte	0x13
	.byte	0x10
	.4byte	0x1f7
	.byte	0x18
	.byte	0x4
	.string	"tp"
	.byte	0x2
	.byte	0x14
	.byte	0x10
	.4byte	0x1f7
	.byte	0x20
	.byte	0x4
	.string	"t0"
	.byte	0x2
	.byte	0x15
	.byte	0x10
	.4byte	0x1f7
	.byte	0x28
	.byte	0x4
	.string	"t1"
	.byte	0x2
	.byte	0x16
	.byte	0x10
	.4byte	0x1f7
	.byte	0x30
	.byte	0x4
	.string	"t2"
	.byte	0x2
	.byte	0x17
	.byte	0x10
	.4byte	0x1f7
	.byte	0x38
	.byte	0x4
	.string	"s0"
	.byte	0x2
	.byte	0x18
	.byte	0x10
	.4byte	0x1f7
	.byte	0x40
	.byte	0x4
	.string	"s1"
	.byte	0x2
	.byte	0x19
	.byte	0x10
	.4byte	0x1f7
	.byte	0x48
	.byte	0x4
	.string	"a0"
	.byte	0x2
	.byte	0x1a
	.byte	0x10
	.4byte	0x1f7
	.byte	0x50
	.byte	0x4
	.string	"a1"
	.byte	0x2
	.byte	0x1b
	.byte	0x10
	.4byte	0x1f7
	.byte	0x58
	.byte	0x4
	.string	"a2"
	.byte	0x2
	.byte	0x1c
	.byte	0x10
	.4byte	0x1f7
	.byte	0x60
	.byte	0x4
	.string	"a3"
	.byte	0x2
	.byte	0x1d
	.byte	0x10
	.4byte	0x1f7
	.byte	0x68
	.byte	0x4
	.string	"a4"
	.byte	0x2
	.byte	0x1e
	.byte	0x10
	.4byte	0x1f7
	.byte	0x70
	.byte	0x4
	.string	"a5"
	.byte	0x2
	.byte	0x1f
	.byte	0x10
	.4byte	0x1f7
	.byte	0x78
	.byte	0x4
	.string	"a6"
	.byte	0x2
	.byte	0x20
	.byte	0x10
	.4byte	0x1f7
	.byte	0x80
	.byte	0x4
	.string	"a7"
	.byte	0x2
	.byte	0x21
	.byte	0x10
	.4byte	0x1f7
	.byte	0x88
	.byte	0x4
	.string	"s2"
	.byte	0x2
	.byte	0x22
	.byte	0x10
	.4byte	0x1f7
	.byte	0x90
	.byte	0x4
	.string	"s3"
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.4byte	0x1f7
	.byte	0x98
	.byte	0x4
	.string	"s4"
	.byte	0x2
	.byte	0x24
	.byte	0x10
	.4byte	0x1f7
	.byte	0xa0
	.byte	0x4
	.string	"s5"
	.byte	0x2
	.byte	0x25
	.byte	0x10
	.4byte	0x1f7
	.byte	0xa8
	.byte	0x4
	.string	"s6"
	.byte	0x2
	.byte	0x26
	.byte	0x10
	.4byte	0x1f7
	.byte	0xb0
	.byte	0x4
	.string	"s7"
	.byte	0x2
	.byte	0x27
	.byte	0x10
	.4byte	0x1f7
	.byte	0xb8
	.byte	0x4
	.string	"s8"
	.byte	0x2
	.byte	0x28
	.byte	0x10
	.4byte	0x1f7
	.byte	0xc0
	.byte	0x4
	.string	"s9"
	.byte	0x2
	.byte	0x29
	.byte	0x10
	.4byte	0x1f7
	.byte	0xc8
	.byte	0x4
	.string	"s10"
	.byte	0x2
	.byte	0x2a
	.byte	0x10
	.4byte	0x1f7
	.byte	0xd0
	.byte	0x4
	.string	"s11"
	.byte	0x2
	.byte	0x2b
	.byte	0x10
	.4byte	0x1f7
	.byte	0xd8
	.byte	0x4
	.string	"t3"
	.byte	0x2
	.byte	0x2c
	.byte	0x10
	.4byte	0x1f7
	.byte	0xe0
	.byte	0x4
	.string	"t4"
	.byte	0x2
	.byte	0x2d
	.byte	0x10
	.4byte	0x1f7
	.byte	0xe8
	.byte	0x4
	.string	"t5"
	.byte	0x2
	.byte	0x2e
	.byte	0x10
	.4byte	0x1f7
	.byte	0xf0
	.byte	0x4
	.string	"t6"
	.byte	0x2
	.byte	0x2f
	.byte	0x10
	.4byte	0x1f7
	.byte	0xf8
	.byte	0x5
	.4byte	.LASF1
	.byte	0x2
	.byte	0x31
	.byte	0x10
	.4byte	0x1f7
	.2byte	0x100
	.byte	0x5
	.4byte	.LASF2
	.byte	0x2
	.byte	0x32
	.byte	0x10
	.4byte	0x1f7
	.2byte	0x108
	.byte	0x5
	.4byte	.LASF3
	.byte	0x2
	.byte	0x33
	.byte	0x10
	.4byte	0x1f7
	.2byte	0x110
	.byte	0x5
	.4byte	.LASF4
	.byte	0x2
	.byte	0x34
	.byte	0x10
	.4byte	0x1f7
	.2byte	0x118
	.byte	0
	.byte	0x6
	.byte	0x8
	.byte	0x7
	.4byte	.LASF12
	.byte	0x7
	.4byte	.LASF6
	.byte	0x20
	.byte	0x3
	.byte	0x4
	.byte	0x8
	.4byte	0x25a
	.byte	0x3
	.4byte	.LASF7
	.byte	0x3
	.byte	0x5
	.byte	0x12
	.4byte	0x25a
	.byte	0
	.byte	0x3
	.4byte	.LASF8
	.byte	0x3
	.byte	0x6
	.byte	0x10
	.4byte	0x1f7
	.byte	0x8
	.byte	0x3
	.4byte	.LASF9
	.byte	0x3
	.byte	0x7
	.byte	0x6
	.4byte	0x260
	.byte	0x10
	.byte	0x3
	.4byte	.LASF10
	.byte	0x3
	.byte	0x8
	.byte	0x6
	.4byte	0x260
	.byte	0x14
	.byte	0x3
	.4byte	.LASF11
	.byte	0x3
	.byte	0x9
	.byte	0x6
	.4byte	0x260
	.byte	0x18
	.byte	0x4
	.string	"reg"
	.byte	0x3
	.byte	0xa
	.byte	0x6
	.4byte	0x260
	.byte	0x1c
	.byte	0
	.byte	0x8
	.byte	0x8
	.4byte	0x2d
	.byte	0x9
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0xa
	.4byte	.LASF19
	.byte	0x1
	.byte	0xb3
	.byte	0x5
	.4byte	0x260
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x31c
	.byte	0xb
	.4byte	.LASF13
	.byte	0x1
	.byte	0xb3
	.byte	0x1f
	.4byte	0x1f7
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0xb
	.4byte	.LASF14
	.byte	0x1
	.byte	0xb3
	.byte	0x39
	.4byte	0x1f7
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0xb
	.4byte	.LASF7
	.byte	0x1
	.byte	0xb3
	.byte	0x52
	.4byte	0x25a
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0xc
	.4byte	.LASF15
	.byte	0x1
	.byte	0xb5
	.byte	0x19
	.4byte	0x1fe
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xc
	.4byte	.LASF16
	.byte	0x1
	.byte	0xb6
	.byte	0x6
	.4byte	0x260
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0xd
	.8byte	.LBB14
	.8byte	.LBE14-.LBB14
	.4byte	0x2fb
	.byte	0xe
	.4byte	.LASF17
	.byte	0x1
	.byte	0xb9
	.byte	0x3
	.4byte	0x260
	.byte	0xf
	.byte	0
	.byte	0
	.byte	0x10
	.8byte	.LBB15
	.8byte	.LBE15-.LBB15
	.byte	0xe
	.4byte	.LASF18
	.byte	0x1
	.byte	0xdc
	.byte	0x3
	.4byte	0x260
	.byte	0xf
	.byte	0
	.byte	0
	.byte	0
	.byte	0xa
	.4byte	.LASF20
	.byte	0x1
	.byte	0xa4
	.byte	0x5
	.4byte	0x260
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0x34e
	.byte	0xb
	.4byte	.LASF15
	.byte	0x1
	.byte	0xa4
	.byte	0x26
	.4byte	0x34e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x8
	.byte	0x8
	.4byte	0x1fe
	.byte	0x11
	.4byte	.LASF22
	.byte	0x1
	.byte	0x99
	.byte	0x6
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0x3b2
	.byte	0xb
	.4byte	.LASF15
	.byte	0x1
	.byte	0x99
	.byte	0x2e
	.4byte	0x34e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x12
	.string	"val"
	.byte	0x1
	.byte	0x9b
	.byte	0x10
	.4byte	0x3b2
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0x10
	.8byte	.LBB13
	.8byte	.LBE13-.LBB13
	.byte	0x12
	.string	"__v"
	.byte	0x1
	.byte	0xa1
	.byte	0x13
	.4byte	0x3b2
	.byte	0x2
	.byte	0x91
	.byte	0x6e
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF21
	.byte	0x11
	.4byte	.LASF23
	.byte	0x1
	.byte	0x8e
	.byte	0x6
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.4byte	0x417
	.byte	0xb
	.4byte	.LASF15
	.byte	0x1
	.byte	0x8e
	.byte	0x2f
	.4byte	0x34e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x12
	.string	"val"
	.byte	0x1
	.byte	0x90
	.byte	0x10
	.4byte	0x3b2
	.byte	0x2
	.byte	0x91
	.byte	0x6e
	.byte	0x10
	.8byte	.LBB12
	.8byte	.LBE12-.LBB12
	.byte	0x12
	.string	"__v"
	.byte	0x1
	.byte	0x95
	.byte	0x19
	.4byte	0x3b2
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0
	.byte	0
	.byte	0x11
	.4byte	.LASF24
	.byte	0x1
	.byte	0x81
	.byte	0x6
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0x49a
	.byte	0xb
	.4byte	.LASF15
	.byte	0x1
	.byte	0x81
	.byte	0x2f
	.4byte	0x34e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x12
	.string	"val"
	.byte	0x1
	.byte	0x83
	.byte	0x10
	.4byte	0x3b2
	.byte	0x2
	.byte	0x91
	.byte	0x6e
	.byte	0xd
	.8byte	.LBB10
	.8byte	.LBE10-.LBB10
	.4byte	0x478
	.byte	0x12
	.string	"__v"
	.byte	0x1
	.byte	0x87
	.byte	0x14
	.4byte	0x3b2
	.byte	0x2
	.byte	0x91
	.byte	0x6d
	.byte	0
	.byte	0x10
	.8byte	.LBB11
	.8byte	.LBE11-.LBB11
	.byte	0x12
	.string	"__v"
	.byte	0x1
	.byte	0x89
	.byte	0x1a
	.4byte	0x3b2
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0
	.byte	0
	.byte	0x11
	.4byte	.LASF25
	.byte	0x1
	.byte	0x76
	.byte	0x6
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.4byte	0x4f8
	.byte	0xb
	.4byte	.LASF15
	.byte	0x1
	.byte	0x76
	.byte	0x2f
	.4byte	0x34e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x12
	.string	"val"
	.byte	0x1
	.byte	0x78
	.byte	0xf
	.4byte	0x4f8
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x10
	.8byte	.LBB9
	.8byte	.LBE9-.LBB9
	.byte	0x12
	.string	"__v"
	.byte	0x1
	.byte	0x7e
	.byte	0x12
	.4byte	0x4f8
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF26
	.byte	0x11
	.4byte	.LASF27
	.byte	0x1
	.byte	0x6b
	.byte	0x6
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0x55d
	.byte	0xb
	.4byte	.LASF15
	.byte	0x1
	.byte	0x6b
	.byte	0x30
	.4byte	0x34e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x12
	.string	"val"
	.byte	0x1
	.byte	0x6d
	.byte	0xf
	.4byte	0x4f8
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x10
	.8byte	.LBB8
	.8byte	.LBE8-.LBB8
	.byte	0x12
	.string	"__v"
	.byte	0x1
	.byte	0x72
	.byte	0x18
	.4byte	0x4f8
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0
	.byte	0x11
	.4byte	.LASF28
	.byte	0x1
	.byte	0x5e
	.byte	0x6
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0x5e0
	.byte	0xb
	.4byte	.LASF15
	.byte	0x1
	.byte	0x5e
	.byte	0x30
	.4byte	0x34e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x12
	.string	"val"
	.byte	0x1
	.byte	0x60
	.byte	0xf
	.4byte	0x4f8
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xd
	.8byte	.LBB6
	.8byte	.LBE6-.LBB6
	.4byte	0x5be
	.byte	0x12
	.string	"__v"
	.byte	0x1
	.byte	0x64
	.byte	0x13
	.4byte	0x4f8
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0
	.byte	0x10
	.8byte	.LBB7
	.8byte	.LBE7-.LBB7
	.byte	0x12
	.string	"__v"
	.byte	0x1
	.byte	0x66
	.byte	0x19
	.4byte	0x4f8
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0
	.byte	0x11
	.4byte	.LASF29
	.byte	0x1
	.byte	0x53
	.byte	0x6
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0x63e
	.byte	0xb
	.4byte	.LASF15
	.byte	0x1
	.byte	0x53
	.byte	0x2f
	.4byte	0x34e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x12
	.string	"val"
	.byte	0x1
	.byte	0x55
	.byte	0x10
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x10
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.byte	0x12
	.string	"__v"
	.byte	0x1
	.byte	0x5b
	.byte	0x13
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0
	.byte	0x11
	.4byte	.LASF30
	.byte	0x1
	.byte	0x48
	.byte	0x6
	.8byte	.LFB7
	.8byte	.LFE7-.LFB7
	.byte	0x1
	.byte	0x9c
	.4byte	0x69c
	.byte	0xb
	.4byte	.LASF15
	.byte	0x1
	.byte	0x48
	.byte	0x30
	.4byte	0x34e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x12
	.string	"val"
	.byte	0x1
	.byte	0x4a
	.byte	0x10
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x10
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.byte	0x12
	.string	"__v"
	.byte	0x1
	.byte	0x4f
	.byte	0x19
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0x11
	.4byte	.LASF31
	.byte	0x1
	.byte	0x3b
	.byte	0x6
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0x71f
	.byte	0xb
	.4byte	.LASF15
	.byte	0x1
	.byte	0x3b
	.byte	0x30
	.4byte	0x34e
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x12
	.string	"val"
	.byte	0x1
	.byte	0x3d
	.byte	0x10
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xd
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.4byte	0x6fd
	.byte	0x12
	.string	"__v"
	.byte	0x1
	.byte	0x41
	.byte	0x14
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0x10
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0x12
	.string	"__v"
	.byte	0x1
	.byte	0x43
	.byte	0x1a
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0x13
	.4byte	.LASF32
	.byte	0x1
	.byte	0x33
	.byte	0x6
	.8byte	.LFB5
	.8byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.4byte	0x76b
	.byte	0xb
	.4byte	.LASF7
	.byte	0x1
	.byte	0x33
	.byte	0x24
	.4byte	0x25a
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x14
	.string	"reg"
	.byte	0x1
	.byte	0x33
	.byte	0x2e
	.4byte	0x260
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x14
	.string	"val"
	.byte	0x1
	.byte	0x33
	.byte	0x41
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0x15
	.4byte	.LASF33
	.byte	0x1
	.byte	0x2b
	.byte	0xf
	.4byte	0x1f7
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0x7ac
	.byte	0xb
	.4byte	.LASF7
	.byte	0x1
	.byte	0x2b
	.byte	0x2c
	.4byte	0x25a
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x14
	.string	"reg"
	.byte	0x1
	.byte	0x2b
	.byte	0x36
	.4byte	0x260
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0
	.byte	0xa
	.4byte	.LASF34
	.byte	0x1
	.byte	0x23
	.byte	0x5
	.4byte	0x260
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x7de
	.byte	0xb
	.4byte	.LASF8
	.byte	0x1
	.byte	0x23
	.byte	0x29
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x16
	.4byte	.LASF38
	.byte	0x1
	.byte	0x1b
	.byte	0xc
	.4byte	0x260
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x810
	.byte	0xb
	.4byte	.LASF8
	.byte	0x1
	.byte	0x1b
	.byte	0x30
	.4byte	0x1f7
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x17
	.4byte	.LASF39
	.byte	0x1
	.byte	0x13
	.byte	0xc
	.4byte	0x260
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.byte	0xb
	.4byte	.LASF8
	.byte	0x1
	.byte	0x13
	.byte	0x30
	.4byte	0x1f7
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
	.byte	0x3
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
	.byte	0x4
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
	.byte	0x5
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
	.byte	0x6
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
	.byte	0x7
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
	.byte	0x8
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0xa
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
	.byte	0xb
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
	.byte	0xc
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
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x18
	.byte	0
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
	.byte	0x12
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
	.byte	0x13
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
	.byte	0x14
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
	.byte	0x15
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
.LASF19:
	.string	"emul_device"
.LASF16:
	.string	"funct3"
.LASF2:
	.string	"sbadaddr"
.LASF31:
	.string	"emu_mmio_rw_reg64"
.LASF3:
	.string	"scause"
.LASF8:
	.string	"addr"
.LASF21:
	.string	"unsigned char"
.LASF34:
	.string	"check_emul_mmio_range"
.LASF14:
	.string	"ins_val"
.LASF4:
	.string	"hstatus"
.LASF5:
	.string	"pt_regs"
.LASF15:
	.string	"emu_mmio"
.LASF1:
	.string	"sstatus"
.LASF30:
	.string	"emu_mmio_ro_reg64"
.LASF12:
	.string	"long unsigned int"
.LASF39:
	.string	"check_uart_mmio_range"
.LASF24:
	.string	"emu_mmio_rw_reg8"
.LASF35:
	.string	"GNU C17 9.4.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF33:
	.string	"emul_readreg"
.LASF9:
	.string	"write"
.LASF0:
	.string	"sepc"
.LASF6:
	.string	"emu_mmio_access"
.LASF37:
	.string	"/home/acetab/\346\241\214\351\235\242/benos"
.LASF32:
	.string	"emul_writereg"
.LASF23:
	.string	"emu_mmio_ro_reg8"
.LASF20:
	.string	"emu_uart"
.LASF38:
	.string	"check_plic_mmio_range"
.LASF27:
	.string	"emu_mmio_ro_reg32"
.LASF11:
	.string	"width"
.LASF26:
	.string	"unsigned int"
.LASF7:
	.string	"regs"
.LASF17:
	.string	"printk"
.LASF29:
	.string	"emu_mmio_w_reg64"
.LASF25:
	.string	"emu_mmio_w_reg32"
.LASF10:
	.string	"sign_ext"
.LASF28:
	.string	"emu_mmio_rw_reg32"
.LASF18:
	.string	"emu_plic"
.LASF13:
	.string	"fault_addr"
.LASF36:
	.string	"virt/vs_device_emul.c"
.LASF22:
	.string	"emu_mmio_w_reg8"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
