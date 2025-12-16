	.file	"printk.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.local	print_buf
	.comm	print_buf,1024,8
	.local	log_buf
	.comm	log_buf,131072,8
	.local	g_printk_status
	.comm	g_printk_status,4,4
	.section	.sdata,"aw"
	.align	3
	.type	g_record, @object
	.size	g_record, 8
g_record:
	.dword	log_buf
	.local	g_record_len
	.comm	g_record_len,8,8
	.text
	.align	2
	.type	scan_number, @function
scan_number:
.LFB3:
	.file 1 "lib/printk.c"
	.loc 1 41 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	.loc 1 42 6
	sw	zero,-20(s0)
	.loc 1 44 8
	j	.L2
.L4:
	.loc 1 45 7
	lw	a4,-20(s0)
	mv	a5,a4
	slliw	a5,a5,2
	addw	a5,a5,a4
	slliw	a5,a5,1
	sw	a5,-20(s0)
	.loc 1 46 18
	ld	a5,-40(s0)
	addi	a4,a5,1
	sd	a4,-40(s0)
	.loc 1 46 10
	lbu	a5,0(a5)
	sext.w	a5,a5
	.loc 1 46 22
	addiw	a5,a5,-48
	sext.w	a5,a5
	.loc 1 46 7
	lw	a4,-20(s0)
	addw	a5,a4,a5
	sw	a5,-20(s0)
.L2:
	.loc 1 44 11
	ld	a5,-40(s0)
	lbu	a5,0(a5)
	.loc 1 44 8
	mv	a4,a5
	li	a5,47
	bleu	a4,a5,.L3
	.loc 1 44 31 discriminator 1
	ld	a5,-40(s0)
	lbu	a5,0(a5)
	.loc 1 44 27 discriminator 1
	mv	a4,a5
	li	a5,57
	bleu	a4,a5,.L4
.L3:
	.loc 1 49 10
	ld	a5,-48(s0)
	lw	a4,-20(s0)
	sw	a4,0(a5)
	.loc 1 50 9
	ld	a5,-40(s0)
	.loc 1 51 1
	mv	a0,a5
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE3:
	.size	scan_number, .-scan_number
	.section	.rodata
	.align	3
.LC0:
	.string	"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	.align	3
.LC1:
	.string	"0123456789abcdefghijklmnopqrstuvwxyz"
	.text
	.align	2
	.type	number, @function
number:
.LFB4:
	.loc 1 55 1
	.cfi_startproc
	addi	sp,sp,-224
	.cfi_def_cfa_offset 224
	sd	s0,216(sp)
	.cfi_offset 8, -8
	addi	s0,sp,224
	.cfi_def_cfa 8, 0
	sd	a0,-200(s0)
	sd	a1,-208(s0)
	mv	a1,a2
	mv	a2,a3
	mv	a3,a4
	mv	a4,a5
	mv	a5,a1
	sw	a5,-212(s0)
	mv	a5,a2
	sw	a5,-216(s0)
	mv	a5,a3
	sw	a5,-220(s0)
	mv	a5,a4
	sw	a5,-224(s0)
	.loc 1 56 10
	sb	zero,-17(s0)
	.loc 1 59 14
	lla	a5,.LC0
	sd	a5,-32(s0)
	.loc 1 62 11
	lw	a5,-224(s0)
	andi	a5,a5,64
	sext.w	a5,a5
	.loc 1 62 5
	beqz	a5,.L7
	.loc 1 63 10
	lla	a5,.LC1
	sd	a5,-32(s0)
.L7:
	.loc 1 64 11
	lw	a5,-224(s0)
	andi	a5,a5,16
	sext.w	a5,a5
	.loc 1 64 5
	beqz	a5,.L8
	.loc 1 65 8
	lw	a5,-224(s0)
	andi	a5,a5,-2
	sw	a5,-224(s0)
.L8:
	.loc 1 66 5
	lw	a5,-212(s0)
	sext.w	a4,a5
	li	a5,1
	ble	a4,a5,.L9
	.loc 1 66 15 discriminator 1
	lw	a5,-212(s0)
	sext.w	a4,a5
	li	a5,36
	ble	a4,a5,.L10
.L9:
	.loc 1 67 10
	li	a5,0
	j	.L39
.L10:
	.loc 1 69 12
	lw	a5,-224(s0)
	andi	a5,a5,1
	sext.w	a5,a5
	.loc 1 69 4
	beqz	a5,.L12
	.loc 1 69 4 is_stmt 0 discriminator 1
	li	a5,48
	j	.L13
.L12:
	.loc 1 69 4 discriminator 2
	li	a5,32
.L13:
	.loc 1 69 4 discriminator 4
	sb	a5,-37(s0)
	.loc 1 71 11 is_stmt 1 discriminator 4
	lw	a5,-224(s0)
	andi	a5,a5,2
	sext.w	a5,a5
	.loc 1 71 5 discriminator 4
	beqz	a5,.L14
	.loc 1 72 8
	ld	a5,-208(s0)
	sd	a5,-48(s0)
	.loc 1 73 6
	ld	a5,-48(s0)
	bgez	a5,.L15
	.loc 1 74 9
	li	a5,45
	sb	a5,-17(s0)
	.loc 1 75 10
	ld	a5,-48(s0)
	neg	a5,a5
	.loc 1 75 8
	sd	a5,-208(s0)
	j	.L14
.L15:
	.loc 1 76 19
	lw	a5,-224(s0)
	andi	a5,a5,4
	sext.w	a5,a5
	.loc 1 76 13
	beqz	a5,.L16
	.loc 1 77 9
	li	a5,43
	sb	a5,-17(s0)
	.loc 1 78 8
	lw	a5,-216(s0)
	addiw	a5,a5,-1
	sw	a5,-216(s0)
	j	.L14
.L16:
	.loc 1 79 19
	lw	a5,-224(s0)
	andi	a5,a5,8
	sext.w	a5,a5
	.loc 1 79 13
	beqz	a5,.L14
	.loc 1 80 9
	li	a5,32
	sb	a5,-17(s0)
	.loc 1 81 8
	lw	a5,-216(s0)
	addiw	a5,a5,-1
	sw	a5,-216(s0)
.L14:
	.loc 1 85 11
	lw	a5,-224(s0)
	andi	a5,a5,32
	sext.w	a5,a5
	.loc 1 85 5
	beqz	a5,.L17
	.loc 1 86 6
	lw	a5,-212(s0)
	sext.w	a4,a5
	li	a5,16
	bne	a4,a5,.L18
	.loc 1 87 9
	lw	a5,-216(s0)
	addiw	a5,a5,-2
	sw	a5,-216(s0)
	j	.L17
.L18:
	.loc 1 88 11
	lw	a5,-212(s0)
	sext.w	a4,a5
	li	a5,8
	bne	a4,a5,.L17
	.loc 1 89 8
	lw	a5,-216(s0)
	addiw	a5,a5,-1
	sw	a5,-216(s0)
.L17:
	.loc 1 92 4
	sw	zero,-36(s0)
	.loc 1 93 5
	ld	a5,-208(s0)
	bnez	a5,.L21
	.loc 1 94 8
	lw	a5,-36(s0)
	addiw	a4,a5,1
	sw	a4,-36(s0)
	.loc 1 94 12
	addi	a4,s0,-16
	add	a5,a4,a5
	li	a4,48
	sb	a4,-168(a5)
	j	.L20
.L22:
.LBB2:
	.loc 1 97 38
	lw	a5,-212(s0)
	sw	a5,-52(s0)
	.loc 1 97 106
	lwu	a5,-52(s0)
	ld	a4,-208(s0)
	remu	a5,a4,a5
	.loc 1 97 81
	sw	a5,-56(s0)
	.loc 1 97 147
	lwu	a5,-52(s0)
	.loc 1 97 122
	ld	a4,-208(s0)
	divu	a5,a4,a5
	sd	a5,-208(s0)
	.loc 1 97 157
	lw	a5,-56(s0)
.LBE2:
	.loc 1 97 23
	slli	a5,a5,32
	srli	a5,a5,32
	.loc 1 97 21
	ld	a4,-32(s0)
	add	a4,a4,a5
	.loc 1 97 9
	lw	a5,-36(s0)
	addiw	a3,a5,1
	sw	a3,-36(s0)
	.loc 1 97 21
	lbu	a4,0(a4)
	.loc 1 97 13
	addi	a3,s0,-16
	add	a5,a3,a5
	sb	a4,-168(a5)
.L21:
	.loc 1 96 9
	ld	a5,-208(s0)
	bnez	a5,.L22
.L20:
	.loc 1 98 5
	lw	a4,-36(s0)
	lw	a5,-220(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	ble	a4,a5,.L23
	.loc 1 99 13
	lw	a5,-36(s0)
	sw	a5,-220(s0)
.L23:
	.loc 1 100 7
	lw	a4,-216(s0)
	lw	a5,-220(s0)
	subw	a5,a4,a5
	sw	a5,-216(s0)
	.loc 1 101 12
	lw	a5,-224(s0)
	andi	a5,a5,17
	sext.w	a5,a5
	.loc 1 101 5
	bnez	a5,.L24
	.loc 1 102 9
	j	.L25
.L26:
	.loc 1 103 8
	ld	a5,-200(s0)
	addi	a4,a5,1
	sd	a4,-200(s0)
	.loc 1 103 11
	li	a4,32
	sb	a4,0(a5)
.L25:
	.loc 1 102 14
	lw	a5,-216(s0)
	addiw	a4,a5,-1
	sw	a4,-216(s0)
	.loc 1 102 9
	bgtz	a5,.L26
.L24:
	.loc 1 104 5
	lbu	a5,-17(s0)
	andi	a5,a5,0xff
	beqz	a5,.L27
	.loc 1 105 7
	ld	a5,-200(s0)
	addi	a4,a5,1
	sd	a4,-200(s0)
	.loc 1 105 10
	lbu	a4,-17(s0)
	sb	a4,0(a5)
.L27:
	.loc 1 107 11
	lw	a5,-224(s0)
	andi	a5,a5,32
	sext.w	a5,a5
	.loc 1 107 5
	beqz	a5,.L28
	.loc 1 108 6
	lw	a5,-212(s0)
	sext.w	a4,a5
	li	a5,8
	bne	a4,a5,.L29
	.loc 1 109 8
	ld	a5,-200(s0)
	addi	a4,a5,1
	sd	a4,-200(s0)
	.loc 1 109 11
	li	a4,48
	sb	a4,0(a5)
	j	.L28
.L29:
	.loc 1 110 11
	lw	a5,-212(s0)
	sext.w	a4,a5
	li	a5,16
	bne	a4,a5,.L28
	.loc 1 111 8
	ld	a5,-200(s0)
	addi	a4,a5,1
	sd	a4,-200(s0)
	.loc 1 111 11
	li	a4,48
	sb	a4,0(a5)
	.loc 1 112 8
	ld	a5,-200(s0)
	addi	a4,a5,1
	sd	a4,-200(s0)
	.loc 1 112 11
	ld	a4,-32(s0)
	lbu	a4,33(a4)
	sb	a4,0(a5)
.L28:
	.loc 1 116 13
	lw	a5,-224(s0)
	andi	a5,a5,16
	sext.w	a5,a5
	.loc 1 116 5
	bnez	a5,.L33
	.loc 1 117 9
	j	.L31
.L32:
	.loc 1 118 8
	ld	a5,-200(s0)
	addi	a4,a5,1
	sd	a4,-200(s0)
	.loc 1 118 11
	lbu	a4,-37(s0)
	sb	a4,0(a5)
.L31:
	.loc 1 117 14
	lw	a5,-216(s0)
	addiw	a4,a5,-1
	sw	a4,-216(s0)
	.loc 1 117 9
	bgtz	a5,.L32
	.loc 1 119 8
	j	.L33
.L34:
	.loc 1 120 7
	ld	a5,-200(s0)
	addi	a4,a5,1
	sd	a4,-200(s0)
	.loc 1 120 10
	li	a4,48
	sb	a4,0(a5)
.L33:
	.loc 1 119 22
	lw	a5,-220(s0)
	addiw	a4,a5,-1
	sw	a4,-220(s0)
	.loc 1 119 8
	lw	a4,-36(s0)
	sext.w	a4,a4
	blt	a4,a5,.L34
	.loc 1 121 8
	j	.L35
.L36:
	.loc 1 122 7
	ld	a5,-200(s0)
	addi	a4,a5,1
	sd	a4,-200(s0)
	.loc 1 122 15
	lw	a4,-36(s0)
	addi	a3,s0,-16
	add	a4,a3,a4
	lbu	a4,-168(a4)
	.loc 1 122 10
	sb	a4,0(a5)
.L35:
	.loc 1 121 10
	lw	a5,-36(s0)
	addiw	a4,a5,-1
	sw	a4,-36(s0)
	.loc 1 121 8
	bgtz	a5,.L36
	.loc 1 123 8
	j	.L37
.L38:
	.loc 1 124 7
	ld	a5,-200(s0)
	addi	a4,a5,1
	sd	a4,-200(s0)
	.loc 1 124 10
	li	a4,32
	sb	a4,0(a5)
.L37:
	.loc 1 123 13
	lw	a5,-216(s0)
	addiw	a4,a5,-1
	sw	a4,-216(s0)
	.loc 1 123 8
	bgtz	a5,.L38
	.loc 1 126 9
	ld	a5,-200(s0)
.L39:
	.loc 1 127 1 discriminator 1
	mv	a0,a5
	ld	s0,216(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 224
	addi	sp,sp,224
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	number, .-number
	.section	.rodata
	.align	3
.LC2:
	.string	"<NULL>"
	.text
	.align	2
	.globl	myprintf
	.type	myprintf, @function
myprintf:
.LFB5:
	.loc 1 146 1
	.cfi_startproc
	addi	sp,sp,-112
	.cfi_def_cfa_offset 112
	sd	ra,104(sp)
	sd	s0,96(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,112
	.cfi_def_cfa 8, 0
	sd	a0,-88(s0)
	mv	a5,a1
	sd	a2,-104(s0)
	sd	a3,-112(s0)
	sw	a5,-92(s0)
	.loc 1 159 6
	ld	a5,-88(s0)
	sd	a5,-24(s0)
	.loc 1 161 2
	j	.L41
.L98:
	.loc 1 162 7
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 1 162 6
	mv	a4,a5
	li	a5,37
	beq	a4,a5,.L42
	.loc 1 163 8
	ld	a5,-24(s0)
	addi	a4,a5,1
	sd	a4,-24(s0)
	.loc 1 163 13
	ld	a4,-104(s0)
	lbu	a4,0(a4)
	.loc 1 163 11
	sb	a4,0(a5)
	.loc 1 164 4
	j	.L43
.L42:
	.loc 1 168 9
	sw	zero,-28(s0)
.L44:
	.loc 1 170 3
	ld	a5,-104(s0)
	addi	a5,a5,1
	sd	a5,-104(s0)
	.loc 1 171 11
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	sext.w	a5,a5
	addiw	a3,a5,-32
	sext.w	a4,a3
	li	a5,16
	bgtu	a4,a5,.L45
	slli	a5,a3,32
	srli	a5,a5,32
	slli	a4,a5,2
	lla	a5,.L47
	add	a5,a4,a5
	lw	a5,0(a5)
	sext.w	a4,a5
	lla	a5,.L47
	add	a5,a4,a5
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L47:
	.word	.L51-.L47
	.word	.L45-.L47
	.word	.L45-.L47
	.word	.L50-.L47
	.word	.L45-.L47
	.word	.L45-.L47
	.word	.L45-.L47
	.word	.L45-.L47
	.word	.L45-.L47
	.word	.L45-.L47
	.word	.L45-.L47
	.word	.L49-.L47
	.word	.L45-.L47
	.word	.L48-.L47
	.word	.L45-.L47
	.word	.L45-.L47
	.word	.L46-.L47
	.text
.L48:
	.loc 1 173 10
	lw	a5,-28(s0)
	ori	a5,a5,16
	sw	a5,-28(s0)
	.loc 1 174 4
	j	.L44
.L49:
	.loc 1 176 10
	lw	a5,-28(s0)
	ori	a5,a5,4
	sw	a5,-28(s0)
	.loc 1 177 4
	j	.L44
.L51:
	.loc 1 179 10
	lw	a5,-28(s0)
	ori	a5,a5,8
	sw	a5,-28(s0)
	.loc 1 180 4
	j	.L44
.L50:
	.loc 1 182 10
	lw	a5,-28(s0)
	ori	a5,a5,32
	sw	a5,-28(s0)
	.loc 1 183 4
	j	.L44
.L46:
	.loc 1 185 10
	lw	a5,-28(s0)
	ori	a5,a5,1
	sw	a5,-28(s0)
	.loc 1 186 4
	j	.L44
.L45:
	.loc 1 190 15
	li	a5,-1
	sw	a5,-76(s0)
	.loc 1 191 9
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 1 191 6
	mv	a4,a5
	li	a5,47
	bleu	a4,a5,.L52
	.loc 1 191 26 discriminator 1
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 1 191 22 discriminator 1
	mv	a4,a5
	li	a5,57
	bgtu	a4,a5,.L52
	.loc 1 192 10
	addi	a5,s0,-76
	mv	a1,a5
	ld	a0,-104(s0)
	call	scan_number
	sd	a0,-104(s0)
	.loc 1 192 8
	j	.L53
.L52:
	.loc 1 193 14
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 1 193 13
	mv	a4,a5
	li	a5,42
	bne	a4,a5,.L53
	.loc 1 194 17
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	lw	a5,0(a5)
	.loc 1 194 16
	sw	a5,-76(s0)
	.loc 1 195 20
	lw	a5,-76(s0)
	.loc 1 195 7
	bgez	a5,.L53
	.loc 1 196 19
	lw	a5,-76(s0)
	negw	a5,a5
	sext.w	a5,a5
	.loc 1 196 17
	sw	a5,-76(s0)
	.loc 1 197 11
	lw	a5,-28(s0)
	ori	a5,a5,16
	sw	a5,-28(s0)
.L53:
	.loc 1 202 13
	li	a5,-1
	sw	a5,-80(s0)
	.loc 1 203 7
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 1 203 6
	mv	a4,a5
	li	a5,46
	bne	a4,a5,.L54
	.loc 1 204 4
	ld	a5,-104(s0)
	addi	a5,a5,1
	sd	a5,-104(s0)
	.loc 1 205 10
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 1 205 7
	mv	a4,a5
	li	a5,47
	bleu	a4,a5,.L55
	.loc 1 205 27 discriminator 1
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 1 205 23 discriminator 1
	mv	a4,a5
	li	a5,57
	bgtu	a4,a5,.L55
	.loc 1 206 11
	addi	a5,s0,-80
	mv	a1,a5
	ld	a0,-104(s0)
	call	scan_number
	sd	a0,-104(s0)
	.loc 1 206 9
	j	.L56
.L55:
	.loc 1 207 13
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 1 207 12
	mv	a4,a5
	li	a5,42
	bne	a4,a5,.L56
	.loc 1 208 16
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	lw	a5,0(a5)
	.loc 1 208 15
	sw	a5,-80(s0)
.L56:
	.loc 1 209 18
	lw	a5,-80(s0)
	.loc 1 209 7
	bgez	a5,.L54
	.loc 1 210 15
	sw	zero,-80(s0)
.L54:
	.loc 1 217 13
	li	a5,-1
	sw	a5,-32(s0)
	.loc 1 218 7
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 1 218 6
	mv	a4,a5
	li	a5,104
	beq	a4,a5,.L57
	.loc 1 218 22 discriminator 1
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 1 218 19 discriminator 1
	mv	a4,a5
	li	a5,108
	beq	a4,a5,.L57
	.loc 1 218 37 discriminator 2
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 1 218 34 discriminator 2
	mv	a4,a5
	li	a5,76
	bne	a4,a5,.L58
.L57:
	.loc 1 219 16
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 1 219 14
	sw	a5,-32(s0)
	.loc 1 220 4
	ld	a5,-104(s0)
	addi	a5,a5,1
	sd	a5,-104(s0)
	.loc 1 222 7
	lw	a5,-32(s0)
	sext.w	a4,a5
	li	a5,108
	bne	a4,a5,.L58
	.loc 1 222 28 discriminator 1
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 1 222 25 discriminator 1
	mv	a4,a5
	li	a5,108
	bne	a4,a5,.L58
	.loc 1 223 15
	li	a5,76
	sw	a5,-32(s0)
	.loc 1 224 5
	ld	a5,-104(s0)
	addi	a5,a5,1
	sd	a5,-104(s0)
.L58:
	.loc 1 228 11
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	sext.w	a5,a5
	addiw	a3,a5,-88
	sext.w	a4,a3
	li	a5,32
	bgtu	a4,a5,.L59
	slli	a5,a3,32
	srli	a5,a5,32
	slli	a4,a5,2
	lla	a5,.L61
	add	a5,a4,a5
	lw	a5,0(a5)
	sext.w	a4,a5
	lla	a5,.L61
	add	a5,a4,a5
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L61:
	.word	.L69-.L61
	.word	.L59-.L61
	.word	.L59-.L61
	.word	.L59-.L61
	.word	.L59-.L61
	.word	.L59-.L61
	.word	.L59-.L61
	.word	.L59-.L61
	.word	.L59-.L61
	.word	.L59-.L61
	.word	.L59-.L61
	.word	.L68-.L61
	.word	.L67-.L61
	.word	.L59-.L61
	.word	.L59-.L61
	.word	.L59-.L61
	.word	.L59-.L61
	.word	.L67-.L61
	.word	.L59-.L61
	.word	.L59-.L61
	.word	.L59-.L61
	.word	.L59-.L61
	.word	.L66-.L61
	.word	.L65-.L61
	.word	.L64-.L61
	.word	.L59-.L61
	.word	.L59-.L61
	.word	.L63-.L61
	.word	.L59-.L61
	.word	.L62-.L61
	.word	.L59-.L61
	.word	.L59-.L61
	.word	.L60-.L61
	.text
.L68:
	.loc 1 231 16
	lw	a5,-28(s0)
	andi	a5,a5,16
	sext.w	a5,a5
	.loc 1 231 7
	bnez	a5,.L70
	.loc 1 232 11
	j	.L71
.L72:
	.loc 1 233 10
	ld	a5,-24(s0)
	addi	a4,a5,1
	sd	a4,-24(s0)
	.loc 1 233 13
	li	a4,32
	sb	a4,0(a5)
.L71:
	.loc 1 232 12
	lw	a5,-76(s0)
	addiw	a5,a5,-1
	sext.w	a5,a5
	.loc 1 232 11
	sw	a5,-76(s0)
	.loc 1 232 12
	lw	a5,-76(s0)
	.loc 1 232 11
	bgtz	a5,.L72
.L70:
	.loc 1 234 27
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	lw	a3,0(a5)
	.loc 1 234 8
	ld	a5,-24(s0)
	addi	a4,a5,1
	sd	a4,-24(s0)
	.loc 1 234 13
	andi	a4,a3,0xff
	.loc 1 234 11
	sb	a4,0(a5)
	.loc 1 235 10
	j	.L73
.L74:
	.loc 1 236 9
	ld	a5,-24(s0)
	addi	a4,a5,1
	sd	a4,-24(s0)
	.loc 1 236 12
	li	a4,32
	sb	a4,0(a5)
.L73:
	.loc 1 235 11
	lw	a5,-76(s0)
	addiw	a5,a5,-1
	sext.w	a5,a5
	.loc 1 235 10
	sw	a5,-76(s0)
	.loc 1 235 11
	lw	a5,-76(s0)
	.loc 1 235 10
	bgtz	a5,.L74
	.loc 1 238 4
	j	.L43
.L63:
	.loc 1 242 6
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	ld	a5,0(a5)
	sd	a5,-40(s0)
	.loc 1 243 7
	ld	a5,-40(s0)
	bnez	a5,.L75
	.loc 1 244 7
	lla	a5,.LC2
	sd	a5,-40(s0)
.L75:
	.loc 1 245 10
	ld	a0,-40(s0)
	call	strlen
	mv	a5,a0
	sext.w	a5,a5
	.loc 1 245 8
	sw	a5,-48(s0)
	.loc 1 246 18
	lw	a5,-80(s0)
	.loc 1 246 7
	bgez	a5,.L76
	.loc 1 247 15
	lw	a5,-48(s0)
	sw	a5,-80(s0)
	j	.L77
.L76:
	.loc 1 248 17
	lw	a4,-80(s0)
	.loc 1 248 12
	lw	a5,-48(s0)
	sext.w	a5,a5
	ble	a5,a4,.L77
	.loc 1 249 9
	lw	a5,-80(s0)
	sw	a5,-48(s0)
.L77:
	.loc 1 251 16
	lw	a5,-28(s0)
	andi	a5,a5,16
	sext.w	a5,a5
	.loc 1 251 7
	bnez	a5,.L78
	.loc 1 252 11
	j	.L79
.L80:
	.loc 1 253 10
	ld	a5,-24(s0)
	addi	a4,a5,1
	sd	a4,-24(s0)
	.loc 1 253 13
	li	a4,32
	sb	a4,0(a5)
.L79:
	.loc 1 252 29
	lw	a5,-76(s0)
	addiw	a4,a5,-1
	sext.w	a4,a4
	sw	a4,-76(s0)
	.loc 1 252 11
	lw	a4,-48(s0)
	sext.w	a4,a4
	blt	a4,a5,.L80
.L78:
	.loc 1 254 11
	sw	zero,-44(s0)
	.loc 1 254 4
	j	.L81
.L82:
	.loc 1 255 16 discriminator 3
	ld	a4,-40(s0)
	addi	a5,a4,1
	sd	a5,-40(s0)
	.loc 1 255 9 discriminator 3
	ld	a5,-24(s0)
	addi	a3,a5,1
	sd	a3,-24(s0)
	.loc 1 255 14 discriminator 3
	lbu	a4,0(a4)
	.loc 1 255 12 discriminator 3
	sb	a4,0(a5)
	.loc 1 254 26 discriminator 3
	lw	a5,-44(s0)
	addiw	a5,a5,1
	sw	a5,-44(s0)
.L81:
	.loc 1 254 4 discriminator 1
	lw	a4,-44(s0)
	lw	a5,-48(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L82
	.loc 1 256 10
	j	.L83
.L84:
	.loc 1 257 9
	ld	a5,-24(s0)
	addi	a4,a5,1
	sd	a4,-24(s0)
	.loc 1 257 12
	li	a4,32
	sb	a4,0(a5)
.L83:
	.loc 1 256 28
	lw	a5,-76(s0)
	addiw	a4,a5,-1
	sext.w	a4,a4
	sw	a4,-76(s0)
	.loc 1 256 10
	lw	a4,-48(s0)
	sext.w	a4,a4
	blt	a4,a5,.L84
	.loc 1 258 4
	j	.L43
.L66:
	.loc 1 265 7
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	ld	a5,0(a5)
	sd	a5,-72(s0)
	.loc 1 266 15
	ld	a4,-24(s0)
	ld	a5,-88(s0)
	sub	a5,a4,a5
	.loc 1 266 8
	andi	a4,a5,0xff
	ld	a5,-72(s0)
	sb	a4,0(a5)
	.loc 1 267 4
	j	.L43
.L64:
	.loc 1 273 20
	lw	a5,-76(s0)
	.loc 1 273 7
	mv	a4,a5
	li	a5,-1
	bne	a4,a5,.L85
	.loc 1 274 17
	li	a5,16
	sw	a5,-76(s0)
	.loc 1 275 11
	lw	a5,-28(s0)
	ori	a5,a5,1
	sw	a5,-28(s0)
.L85:
	.loc 1 278 19
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	ld	a5,0(a5)
	.loc 1 277 10
	mv	a1,a5
	lw	a3,-76(s0)
	lw	a4,-80(s0)
	lw	a5,-28(s0)
	li	a2,16
	ld	a0,-24(s0)
	call	number
	sd	a0,-24(s0)
	.loc 1 280 4
	j	.L43
.L65:
	.loc 1 284 9
	li	a5,8
	sw	a5,-60(s0)
	.loc 1 285 4
	j	.L86
.L60:
	.loc 1 288 10
	lw	a5,-28(s0)
	ori	a5,a5,64
	sw	a5,-28(s0)
.L69:
	.loc 1 290 9
	li	a5,16
	sw	a5,-60(s0)
	.loc 1 291 4
	j	.L86
.L67:
	.loc 1 295 10
	lw	a5,-28(s0)
	ori	a5,a5,2
	sw	a5,-28(s0)
.L62:
	.loc 1 298 9
	li	a5,10
	sw	a5,-60(s0)
	.loc 1 299 4
	j	.L86
.L59:
	.loc 1 302 8
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 1 302 7
	mv	a4,a5
	li	a5,37
	beq	a4,a5,.L87
	.loc 1 303 9
	ld	a5,-24(s0)
	addi	a4,a5,1
	sd	a4,-24(s0)
	.loc 1 303 12
	li	a4,37
	sb	a4,0(a5)
.L87:
	.loc 1 304 8
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 1 304 7
	beqz	a5,.L88
	.loc 1 305 9
	ld	a5,-24(s0)
	addi	a4,a5,1
	sd	a4,-24(s0)
	.loc 1 305 14
	ld	a4,-104(s0)
	lbu	a4,0(a4)
	.loc 1 305 12
	sb	a4,0(a5)
	.loc 1 308 4
	j	.L100
.L88:
	.loc 1 307 5
	ld	a5,-104(s0)
	addi	a5,a5,-1
	sd	a5,-104(s0)
.L100:
	.loc 1 308 4
	nop
.L86:
	.loc 1 311 6
	lw	a5,-32(s0)
	sext.w	a4,a5
	li	a5,76
	bne	a4,a5,.L90
	.loc 1 312 14
	lw	a5,-28(s0)
	andi	a5,a5,2
	sext.w	a5,a5
	.loc 1 312 7
	beqz	a5,.L91
	.loc 1 313 10
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	ld	a5,0(a5)
	.loc 1 313 9
	sd	a5,-56(s0)
	j	.L92
.L91:
	.loc 1 315 10
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	ld	a5,0(a5)
	.loc 1 315 9
	sd	a5,-56(s0)
	j	.L92
.L90:
	.loc 1 316 13
	lw	a5,-32(s0)
	sext.w	a4,a5
	li	a5,104
	bne	a4,a5,.L93
	.loc 1 317 14
	lw	a5,-28(s0)
	andi	a5,a5,2
	sext.w	a5,a5
	.loc 1 317 7
	beqz	a5,.L94
	.loc 1 318 17
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	lw	a5,0(a5)
	.loc 1 318 11
	slliw	a5,a5,16
	sraiw	a5,a5,16
	.loc 1 318 9
	sd	a5,-56(s0)
	j	.L92
.L94:
	.loc 1 320 26
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	lw	a5,0(a5)
	.loc 1 320 11
	slli	a5,a5,48
	srli	a5,a5,48
	.loc 1 320 9
	sd	a5,-56(s0)
	j	.L92
.L93:
	.loc 1 321 13
	lw	a5,-32(s0)
	sext.w	a4,a5
	li	a5,108
	bne	a4,a5,.L95
	.loc 1 322 14
	lw	a5,-28(s0)
	andi	a5,a5,2
	sext.w	a5,a5
	.loc 1 322 7
	beqz	a5,.L96
	.loc 1 323 10
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	ld	a5,0(a5)
	.loc 1 323 9
	sd	a5,-56(s0)
	j	.L92
.L96:
	.loc 1 325 9
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	ld	a5,0(a5)
	sd	a5,-56(s0)
	j	.L92
.L95:
	.loc 1 327 14
	lw	a5,-28(s0)
	andi	a5,a5,2
	sext.w	a5,a5
	.loc 1 327 7
	beqz	a5,.L97
	.loc 1 328 11
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	lw	a5,0(a5)
	.loc 1 328 9
	sd	a5,-56(s0)
	j	.L92
.L97:
	.loc 1 330 10
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	lw	a5,0(a5)
	.loc 1 330 9
	slli	a5,a5,32
	srli	a5,a5,32
	sd	a5,-56(s0)
.L92:
	.loc 1 332 9
	lw	a3,-76(s0)
	lw	a4,-80(s0)
	lw	a5,-28(s0)
	lw	a2,-60(s0)
	ld	a1,-56(s0)
	ld	a0,-24(s0)
	call	number
	sd	a0,-24(s0)
.L43:
	.loc 1 161 18
	ld	a5,-104(s0)
	addi	a5,a5,1
	sd	a5,-104(s0)
.L41:
	.loc 1 161 9 discriminator 1
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 1 161 2 discriminator 1
	bnez	a5,.L98
	.loc 1 335 7
	ld	a5,-24(s0)
	sb	zero,0(a5)
	.loc 1 336 13
	ld	a4,-24(s0)
	ld	a5,-88(s0)
	sub	a5,a4,a5
	sext.w	a5,a5
	.loc 1 337 1
	mv	a0,a5
	ld	ra,104(sp)
	.cfi_restore 1
	ld	s0,96(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 112
	addi	sp,sp,112
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE5:
	.size	myprintf, .-myprintf
	.local	putchar_fn
	.comm	putchar_fn,8,8
	.align	2
	.globl	init_printk_done
	.type	init_printk_done, @function
init_printk_done:
.LFB6:
	.loc 1 342 1
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
	.loc 1 345 13
	lla	a5,putchar_fn
	ld	a4,-40(s0)
	sd	a4,0(a5)
	.loc 1 347 18
	lla	a5,g_printk_status
	li	a4,1
	sw	a4,0(a5)
	.loc 1 349 9
	sd	zero,-24(s0)
	.loc 1 349 2
	j	.L102
.L103:
	.loc 1 350 3 discriminator 3
	lla	a5,putchar_fn
	ld	a3,0(a5)
	lla	a4,log_buf
	ld	a5,-24(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	mv	a0,a5
	jalr	a3
.LVL0:
	.loc 1 349 33 discriminator 3
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
.L102:
	.loc 1 349 16 discriminator 1
	lla	a5,g_record_len
	ld	a5,0(a5)
	.loc 1 349 2 discriminator 1
	ld	a4,-24(s0)
	bltu	a4,a5,.L103
	.loc 1 352 11
	lla	a5,g_record
	lla	a4,log_buf
	sd	a4,0(a5)
	.loc 1 353 15
	lla	a5,g_record_len
	sd	zero,0(a5)
	.loc 1 354 1
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
	.size	init_printk_done, .-init_printk_done
	.align	2
	.globl	printk
	.type	printk, @function
printk:
.LFB7:
	.loc 1 357 1
	.cfi_startproc
	addi	sp,sp,-112
	.cfi_def_cfa_offset 112
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -72
	.cfi_offset 8, -80
	addi	s0,sp,48
	.cfi_def_cfa 8, 64
	sd	a0,-40(s0)
	sd	a1,8(s0)
	sd	a2,16(s0)
	sd	a3,24(s0)
	sd	a4,32(s0)
	sd	a5,40(s0)
	sd	a6,48(s0)
	sd	a7,56(s0)
	.loc 1 362 1
	addi	a5,s0,64
	sd	a5,-48(s0)
	ld	a5,-48(s0)
	addi	a5,a5,-56
	sd	a5,-32(s0)
	.loc 1 363 8
	ld	a5,-32(s0)
	mv	a3,a5
	ld	a2,-40(s0)
	li	a1,1024
	lla	a0,print_buf
	call	myprintf
	mv	a5,a0
	sw	a5,-24(s0)
	.loc 1 367 22
	lla	a5,g_printk_status
	lw	a5,0(a5)
	.loc 1 367 5
	bnez	a5,.L105
	.loc 1 368 3
	lla	a5,g_record
	ld	a5,0(a5)
	lw	a4,-24(s0)
	mv	a2,a4
	lla	a1,print_buf
	mv	a0,a5
	call	memcpy
	.loc 1 369 22
	lw	a4,-24(s0)
	lla	a5,log_buf
	add	a4,a4,a5
	.loc 1 369 12
	lla	a5,g_record
	sd	a4,0(a5)
	.loc 1 370 16
	lw	a4,-24(s0)
	lla	a5,g_record_len
	ld	a5,0(a5)
	add	a4,a4,a5
	lla	a5,g_record_len
	sd	a4,0(a5)
	.loc 1 372 10
	li	a5,0
	j	.L111
.L105:
	.loc 1 375 9
	sw	zero,-20(s0)
	.loc 1 375 2
	j	.L107
.L110:
	.loc 1 376 3
	lla	a5,putchar_fn
	ld	a3,0(a5)
	lla	a4,print_buf
	lw	a5,-20(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	mv	a0,a5
	jalr	a3
.LVL1:
	.loc 1 377 9
	lw	a5,-20(s0)
	.loc 1 377 6
	mv	a4,a5
	li	a5,1024
	bgtu	a4,a5,.L112
	.loc 1 375 24 discriminator 2
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L107:
	.loc 1 375 2 discriminator 1
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L110
	j	.L109
.L112:
	.loc 1 378 4
	nop
.L109:
	.loc 1 380 9
	lw	a5,-24(s0)
.L111:
	.loc 1 381 1 discriminator 1
	mv	a0,a5
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 112
	addi	sp,sp,112
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE7:
	.size	printk, .-printk
.Letext0:
	.file 2 "/usr/lib/gcc-cross/riscv64-linux-gnu/9/include/stdarg.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x494
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF34
	.byte	0xc
	.4byte	.LASF35
	.4byte	.LASF36
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF0
	.byte	0x2
	.byte	0x28
	.byte	0x1b
	.4byte	0x39
	.byte	0x3
	.byte	0x8
	.4byte	.LASF37
	.byte	0x2
	.4byte	.LASF1
	.byte	0x2
	.byte	0x63
	.byte	0x18
	.4byte	0x2d
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.byte	0x4
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.byte	0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF5
	.byte	0x4
	.byte	0x1
	.byte	0x2
	.4byte	.LASF6
	.byte	0x5
	.4byte	0x7f
	.4byte	0x7f
	.byte	0x6
	.4byte	0x60
	.2byte	0x3ff
	.byte	0
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF7
	.byte	0x7
	.4byte	0x7f
	.byte	0x8
	.4byte	.LASF8
	.byte	0x1
	.byte	0x6
	.byte	0xd
	.4byte	0x6e
	.byte	0x9
	.byte	0x3
	.8byte	print_buf
	.byte	0x5
	.4byte	0x7f
	.4byte	0xb4
	.byte	0x9
	.4byte	0x60
	.4byte	0x1ffff
	.byte	0
	.byte	0x8
	.4byte	.LASF9
	.byte	0x1
	.byte	0xb
	.byte	0xd
	.4byte	0xa1
	.byte	0x9
	.byte	0x3
	.8byte	log_buf
	.byte	0xa
	.4byte	.LASF38
	.byte	0x7
	.byte	0x4
	.4byte	0x59
	.byte	0x1
	.byte	0xd
	.byte	0x6
	.4byte	0xe9
	.byte	0xb
	.4byte	.LASF10
	.byte	0
	.byte	0xb
	.4byte	.LASF11
	.byte	0x1
	.byte	0
	.byte	0x8
	.4byte	.LASF12
	.byte	0x1
	.byte	0x12
	.byte	0x1b
	.4byte	0xca
	.byte	0x9
	.byte	0x3
	.8byte	g_printk_status
	.byte	0x8
	.4byte	.LASF13
	.byte	0x1
	.byte	0x13
	.byte	0xe
	.4byte	0x115
	.byte	0x9
	.byte	0x3
	.8byte	g_record
	.byte	0xc
	.byte	0x8
	.4byte	0x7f
	.byte	0x8
	.4byte	.LASF14
	.byte	0x1
	.byte	0x14
	.byte	0x16
	.4byte	0x60
	.byte	0x9
	.byte	0x3
	.8byte	g_record_len
	.byte	0xd
	.4byte	0x13c
	.byte	0xe
	.4byte	0x7f
	.byte	0
	.byte	0xf
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x153
	.byte	0xf
	.4byte	0x153
	.byte	0x9
	.byte	0x3
	.8byte	putchar_fn
	.byte	0xc
	.byte	0x8
	.4byte	0x131
	.byte	0x10
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x164
	.byte	0x5
	.4byte	0x1c0
	.8byte	.LFB7
	.8byte	.LFE7-.LFB7
	.byte	0x1
	.byte	0x9c
	.4byte	0x1c0
	.byte	0x11
	.string	"fmt"
	.byte	0x1
	.2byte	0x164
	.byte	0x18
	.4byte	0x1c7
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x7f
	.byte	0x12
	.byte	0x13
	.string	"arg"
	.byte	0x1
	.2byte	0x166
	.byte	0xa
	.4byte	0x3f
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x7f
	.byte	0x13
	.string	"len"
	.byte	0x1
	.2byte	0x167
	.byte	0x6
	.4byte	0x1c0
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0x13
	.string	"i"
	.byte	0x1
	.2byte	0x168
	.byte	0x6
	.4byte	0x1c0
	.byte	0x3
	.byte	0x91
	.byte	0xac,0x7f
	.byte	0
	.byte	0x14
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0xc
	.byte	0x8
	.4byte	0x86
	.byte	0x15
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x155
	.byte	0x6
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0x20a
	.byte	0x11
	.string	"fn"
	.byte	0x1
	.2byte	0x155
	.byte	0x1e
	.4byte	0x153
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x13
	.string	"i"
	.byte	0x1
	.2byte	0x157
	.byte	0x10
	.4byte	0x60
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x16
	.4byte	.LASF17
	.byte	0x1
	.byte	0x90
	.byte	0x5
	.4byte	0x1c0
	.8byte	.LFB5
	.8byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.4byte	0x320
	.byte	0x17
	.4byte	.LASF18
	.byte	0x1
	.byte	0x90
	.byte	0x14
	.4byte	0x115
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0x17
	.4byte	.LASF19
	.byte	0x1
	.byte	0x90
	.byte	0x29
	.4byte	0x59
	.byte	0x3
	.byte	0x91
	.byte	0xa4,0x7f
	.byte	0x18
	.string	"fmt"
	.byte	0x1
	.byte	0x91
	.byte	0xf
	.4byte	0x1c7
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x7f
	.byte	0x18
	.string	"arg"
	.byte	0x1
	.byte	0x91
	.byte	0x1c
	.4byte	0x3f
	.byte	0x3
	.byte	0x91
	.byte	0x90,0x7f
	.byte	0x19
	.string	"pos"
	.byte	0x1
	.byte	0x93
	.byte	0x8
	.4byte	0x115
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x8
	.4byte	.LASF20
	.byte	0x1
	.byte	0x94
	.byte	0x6
	.4byte	0x1c0
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x8
	.4byte	.LASF21
	.byte	0x1
	.byte	0x95
	.byte	0x6
	.4byte	0x1c0
	.byte	0x3
	.byte	0x91
	.byte	0xb4,0x7f
	.byte	0x8
	.4byte	.LASF22
	.byte	0x1
	.byte	0x96
	.byte	0x6
	.4byte	0x1c0
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x8
	.4byte	.LASF23
	.byte	0x1
	.byte	0x97
	.byte	0x6
	.4byte	0x1c0
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x19
	.string	"ip"
	.byte	0x1
	.byte	0x98
	.byte	0x8
	.4byte	0x115
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x19
	.string	"s"
	.byte	0x1
	.byte	0x99
	.byte	0x8
	.4byte	0x115
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x19
	.string	"i"
	.byte	0x1
	.byte	0x9a
	.byte	0x6
	.4byte	0x1c0
	.byte	0x2
	.byte	0x91
	.byte	0x54
	.byte	0x19
	.string	"len"
	.byte	0x1
	.byte	0x9b
	.byte	0x6
	.4byte	0x1c0
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x19
	.string	"num"
	.byte	0x1
	.byte	0x9c
	.byte	0x10
	.4byte	0x60
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x8
	.4byte	.LASF24
	.byte	0x1
	.byte	0x9d
	.byte	0x6
	.4byte	0x1c0
	.byte	0x2
	.byte	0x91
	.byte	0x44
	.byte	0x1a
	.4byte	.LASF40
	.byte	0x1
	.byte	0xa9
	.byte	0x1
	.8byte	.L44
	.byte	0
	.byte	0x1b
	.4byte	.LASF32
	.byte	0x1
	.byte	0x35
	.byte	0xe
	.4byte	0x115
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0x42a
	.byte	0x18
	.string	"str"
	.byte	0x1
	.byte	0x35
	.byte	0x1b
	.4byte	0x115
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7e
	.byte	0x18
	.string	"num"
	.byte	0x1
	.byte	0x35
	.byte	0x2e
	.4byte	0x60
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7e
	.byte	0x17
	.4byte	.LASF24
	.byte	0x1
	.byte	0x35
	.byte	0x37
	.4byte	0x1c0
	.byte	0x3
	.byte	0x91
	.byte	0xac,0x7e
	.byte	0x17
	.4byte	.LASF19
	.byte	0x1
	.byte	0x35
	.byte	0x41
	.4byte	0x1c0
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7e
	.byte	0x17
	.4byte	.LASF22
	.byte	0x1
	.byte	0x35
	.byte	0x4b
	.4byte	0x1c0
	.byte	0x3
	.byte	0x91
	.byte	0xa4,0x7e
	.byte	0x17
	.4byte	.LASF25
	.byte	0x1
	.byte	0x36
	.byte	0x8
	.4byte	0x1c0
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x7e
	.byte	0x19
	.string	"c"
	.byte	0x1
	.byte	0x38
	.byte	0x7
	.4byte	0x7f
	.byte	0x2
	.byte	0x91
	.byte	0x5b
	.byte	0x8
	.4byte	.LASF26
	.byte	0x1
	.byte	0x38
	.byte	0xa
	.4byte	0x7f
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0x19
	.string	"tmp"
	.byte	0x1
	.byte	0x38
	.byte	0x14
	.4byte	0x42a
	.byte	0x3
	.byte	0x91
	.byte	0xc8,0x7e
	.byte	0x8
	.4byte	.LASF27
	.byte	0x1
	.byte	0x39
	.byte	0x7
	.4byte	0x43a
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x8
	.4byte	.LASF28
	.byte	0x1
	.byte	0x3b
	.byte	0xe
	.4byte	0x1c7
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x19
	.string	"i"
	.byte	0x1
	.byte	0x3c
	.byte	0x6
	.4byte	0x1c0
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x1c
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x8
	.4byte	.LASF29
	.byte	0x1
	.byte	0x61
	.byte	0x26
	.4byte	0x59
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0x8
	.4byte	.LASF30
	.byte	0x1
	.byte	0x61
	.byte	0x44
	.4byte	0x59
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0
	.byte	0
	.byte	0x5
	.4byte	0x7f
	.4byte	0x43a
	.byte	0x1d
	.4byte	0x60
	.byte	0x7f
	.byte	0
	.byte	0x4
	.byte	0x8
	.byte	0x5
	.4byte	.LASF31
	.byte	0x1b
	.4byte	.LASF33
	.byte	0x1
	.byte	0x28
	.byte	0x14
	.4byte	0x1c7
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x491
	.byte	0x17
	.4byte	.LASF18
	.byte	0x1
	.byte	0x28
	.byte	0x2c
	.4byte	0x1c7
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x17
	.4byte	.LASF32
	.byte	0x1
	.byte	0x28
	.byte	0x39
	.4byte	0x491
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x19
	.string	"tmp"
	.byte	0x1
	.byte	0x2a
	.byte	0x6
	.4byte	0x1c0
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0xc
	.byte	0x8
	.4byte	0x1c0
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
	.byte	0x3
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x4
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
	.byte	0x5
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x26
	.byte	0
	.byte	0x49
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
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0xa
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
	.byte	0xb
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
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
	.byte	0x5
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
	.byte	0x5
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
	.byte	0x11
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x18
	.byte	0
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
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x14
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
	.byte	0x5
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
	.byte	0x17
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
	.byte	0x18
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
	.byte	0x1c
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x1d
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
.LASF35:
	.string	"lib/printk.c"
.LASF37:
	.string	"__builtin_va_list"
.LASF14:
	.string	"g_record_len"
.LASF23:
	.string	"qualifier"
.LASF11:
	.string	"PRINTK_STATUS_READY"
.LASF29:
	.string	"__base"
.LASF17:
	.string	"myprintf"
.LASF0:
	.string	"__gnuc_va_list"
.LASF2:
	.string	"unsigned char"
.LASF5:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF10:
	.string	"PRINTK_STATUS_DOWN"
.LASF1:
	.string	"va_list"
.LASF27:
	.string	"snum"
.LASF38:
	.string	"printk_status"
.LASF9:
	.string	"log_buf"
.LASF34:
	.string	"GNU C17 9.4.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF24:
	.string	"base"
.LASF4:
	.string	"unsigned int"
.LASF20:
	.string	"flags"
.LASF19:
	.string	"size"
.LASF13:
	.string	"g_record"
.LASF7:
	.string	"char"
.LASF8:
	.string	"print_buf"
.LASF40:
	.string	"repeat"
.LASF36:
	.string	"/home/acetab/\346\241\214\351\235\242/benos"
.LASF18:
	.string	"string"
.LASF22:
	.string	"precision"
.LASF28:
	.string	"digits"
.LASF33:
	.string	"scan_number"
.LASF25:
	.string	"type"
.LASF21:
	.string	"field_width"
.LASF16:
	.string	"printk"
.LASF32:
	.string	"number"
.LASF12:
	.string	"g_printk_status"
.LASF31:
	.string	"long int"
.LASF26:
	.string	"sign"
.LASF30:
	.string	"__rem"
.LASF39:
	.string	"init_printk_done"
.LASF15:
	.string	"putchar_fn"
.LASF6:
	.string	"_Bool"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
