	.file	"timer.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.type	sbi_set_timer, @function
sbi_set_timer:
.LFB0:
	.file 1 "include/asm/sbi.h"
	.loc 1 33 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
.LBB2:
	.loc 1 34 28
	ld	a0,-24(s0)
	.loc 1 34 97
	li	a1,0
	.loc 1 34 156
	li	a2,0
	.loc 1 34 215
	li	a7,0
	.loc 1 34 251
#APP
# 34 "include/asm/sbi.h" 1
	ecall
# 0 "" 2
#NO_APP
.LBE2:
	.loc 1 35 1
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	sbi_set_timer, .-sbi_set_timer
	.comm	jiffies,8,64
	.comm	vcpu_time_delta,8,8
	.comm	vcpu_next_cycle,8,8
	.comm	vcpu_timer_init,4,4
	.align	2
	.globl	riscv_vcpu_current_cycles
	.type	riscv_vcpu_current_cycles, @function
riscv_vcpu_current_cycles:
.LFB4:
	.file 2 "src/timer.c"
	.loc 2 20 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 21 9
	call	get_cycles
	mv	a4,a0
	.loc 2 21 22
	lla	a5,vcpu_time_delta
	ld	a5,0(a5)
	add	a5,a4,a5
	.loc 2 22 1
	mv	a0,a5
	ld	ra,8(sp)
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	riscv_vcpu_current_cycles, .-riscv_vcpu_current_cycles
	.align	2
	.globl	riscv_vcpu_timer_event_start
	.type	riscv_vcpu_timer_event_start, @function
riscv_vcpu_timer_event_start:
.LFB5:
	.loc 2 25 1
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
	.loc 2 26 2
	li	a0,6
	call	riscv_vcpu_clear_interrupt
	.loc 2 27 18
	lla	a5,vcpu_next_cycle
	ld	a4,-24(s0)
	sd	a4,0(a5)
	.loc 2 28 18
	lla	a5,vcpu_timer_init
	li	a4,1
	sw	a4,0(a5)
	.loc 2 29 1
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
.LFE5:
	.size	riscv_vcpu_timer_event_start, .-riscv_vcpu_timer_event_start
	.align	2
	.globl	riscv_vcpu_set_interrupt
	.type	riscv_vcpu_set_interrupt, @function
riscv_vcpu_set_interrupt:
.LFB6:
	.loc 2 32 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sw	a5,-36(s0)
.LBB3:
	.loc 2 33 19
	lw	a5,-36(s0)
	li	a4,1
	sll	a5,a4,a5
	sd	a5,-24(s0)
	.loc 2 33 55
	ld	a5,-24(s0)
#APP
# 33 "src/timer.c" 1
	csrs 0x645, a5
# 0 "" 2
#NO_APP
.LBE3:
	.loc 2 34 1
	nop
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE6:
	.size	riscv_vcpu_set_interrupt, .-riscv_vcpu_set_interrupt
	.align	2
	.globl	riscv_vcpu_clear_interrupt
	.type	riscv_vcpu_clear_interrupt, @function
riscv_vcpu_clear_interrupt:
.LFB7:
	.loc 2 37 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sw	a5,-36(s0)
.LBB4:
	.loc 2 38 19
	lw	a5,-36(s0)
	li	a4,1
	sll	a5,a4,a5
	sd	a5,-24(s0)
	.loc 2 38 55
	ld	a5,-24(s0)
#APP
# 38 "src/timer.c" 1
	csrc 0x645, a5
# 0 "" 2
#NO_APP
.LBE4:
	.loc 2 39 1
	nop
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE7:
	.size	riscv_vcpu_clear_interrupt, .-riscv_vcpu_clear_interrupt
	.align	2
	.globl	riscv_vcpu_check_timer_expired
	.type	riscv_vcpu_check_timer_expired, @function
riscv_vcpu_check_timer_expired:
.LFB8:
	.loc 2 42 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 45 6
	lla	a5,vcpu_timer_init
	lw	a5,0(a5)
	.loc 2 45 5
	beqz	a5,.L11
	.loc 2 47 8
	call	riscv_vcpu_current_cycles
	sd	a0,-24(s0)
	.loc 2 49 10
	lla	a5,vcpu_next_cycle
	ld	a5,0(a5)
	.loc 2 49 5
	ld	a4,-24(s0)
	bltu	a4,a5,.L12
	.loc 2 53 2
	li	a0,6
	call	riscv_vcpu_set_interrupt
	.loc 2 54 18
	lla	a5,vcpu_timer_init
	sw	zero,0(a5)
	j	.L7
.L11:
	.loc 2 46 3
	nop
	j	.L7
.L12:
	.loc 2 50 3
	nop
.L7:
	.loc 2 55 1
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	riscv_vcpu_check_timer_expired, .-riscv_vcpu_check_timer_expired
	.align	2
	.globl	riscv_vcpu_timer_init
	.type	riscv_vcpu_timer_init, @function
riscv_vcpu_timer_init:
.LFB9:
	.loc 2 58 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 59 18
	lla	a5,vcpu_time_delta
	sd	zero,0(a5)
.LBB5:
	.loc 2 60 19
	lla	a5,vcpu_time_delta
	ld	a5,0(a5)
	sd	a5,-24(s0)
	.loc 2 60 59
	ld	a5,-24(s0)
#APP
# 60 "src/timer.c" 1
	csrw 0x605, a5
# 0 "" 2
#NO_APP
.LBE5:
	.loc 2 61 1
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE9:
	.size	riscv_vcpu_timer_init, .-riscv_vcpu_timer_init
	.align	2
	.globl	get_cycles
	.type	get_cycles, @function
get_cycles:
.LFB10:
	.loc 2 75 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
.LBB6:
	.loc 2 76 33
	li	a5,33603584
	addi	a5,a5,-8
	.loc 2 76 26
	ld	a5,0(a5)
	sd	a5,-24(s0)
	.loc 2 76 85
	.loc 2 76 127
	ld	a5,-24(s0)
.LBE6:
	.loc 2 77 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	get_cycles, .-get_cycles
	.align	2
	.globl	reset_timer
	.type	reset_timer, @function
reset_timer:
.LFB11:
	.loc 2 81 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
.LBB7:
	.loc 2 83 19
	li	a5,32
	sd	a5,-24(s0)
	.loc 2 83 50
	ld	a5,-24(s0)
#APP
# 83 "src/timer.c" 1
	csrs sie, a5
# 0 "" 2
#NO_APP
.LBE7:
	.loc 2 84 16
	call	get_cycles
	mv	a4,a0
	.loc 2 84 2
	li	a5,98304
	addi	a5,a5,1696
	add	a5,a4,a5
	mv	a0,a5
	call	sbi_set_timer
	.loc 2 85 1
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
.LFE11:
	.size	reset_timer, .-reset_timer
	.align	2
	.globl	timer_init
	.type	timer_init, @function
timer_init:
.LFB12:
	.loc 2 89 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 90 2
	call	reset_timer
	.loc 2 91 1
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
.LFE12:
	.size	timer_init, .-timer_init
	.align	2
	.globl	handle_timer_irq
	.type	handle_timer_irq, @function
handle_timer_irq:
.LFB13:
	.loc 2 94 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
.LBB8:
	.loc 2 95 19
	li	a5,32
	sd	a5,-24(s0)
	.loc 2 95 50
	ld	a5,-24(s0)
#APP
# 95 "src/timer.c" 1
	csrc sie, a5
# 0 "" 2
#NO_APP
.LBE8:
	.loc 2 96 2
	call	riscv_vcpu_check_timer_expired
	.loc 2 97 9
	lla	a5,jiffies
	ld	a5,0(a5)
	addi	a4,a5,1
	lla	a5,jiffies
	sd	a4,0(a5)
	.loc 2 99 2
	call	tick_handle_periodic
	.loc 2 100 2
	call	reset_timer
	.loc 2 101 1
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
.LFE13:
	.size	handle_timer_irq, .-handle_timer_irq
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x36a
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF19
	.byte	0xc
	.4byte	.LASF20
	.4byte	.LASF21
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
	.4byte	0x42
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF4
	.byte	0x4
	.4byte	.LASF22
	.byte	0x2
	.byte	0xd
	.byte	0x39
	.4byte	0x49
	.byte	0x40
	.byte	0x9
	.byte	0x3
	.8byte	jiffies
	.byte	0x5
	.4byte	.LASF5
	.byte	0x2
	.byte	0xf
	.byte	0xf
	.4byte	0x42
	.byte	0x9
	.byte	0x3
	.8byte	vcpu_time_delta
	.byte	0x5
	.4byte	.LASF6
	.byte	0x2
	.byte	0x10
	.byte	0xf
	.4byte	0x42
	.byte	0x9
	.byte	0x3
	.8byte	vcpu_next_cycle
	.byte	0x5
	.4byte	.LASF7
	.byte	0x2
	.byte	0x11
	.byte	0x5
	.4byte	0xae
	.byte	0x9
	.byte	0x3
	.8byte	vcpu_timer_init
	.byte	0x6
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x7
	.4byte	.LASF8
	.byte	0x2
	.byte	0x5d
	.byte	0x6
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.4byte	0x107
	.byte	0x8
	.4byte	.LASF23
	.byte	0x2
	.byte	0x63
	.byte	0x2
	.4byte	0xae
	.4byte	0xe5
	.byte	0x9
	.byte	0
	.byte	0xa
	.8byte	.LBB8
	.8byte	.LBE8-.LBB8
	.byte	0xb
	.string	"__v"
	.byte	0x2
	.byte	0x5f
	.byte	0x13
	.4byte	0x42
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0xc
	.4byte	.LASF16
	.byte	0x2
	.byte	0x58
	.byte	0x6
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.byte	0xd
	.4byte	.LASF24
	.byte	0x2
	.byte	0x50
	.byte	0x6
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.4byte	0x161
	.byte	0xa
	.8byte	.LBB7
	.8byte	.LBE7-.LBB7
	.byte	0xb
	.string	"__v"
	.byte	0x2
	.byte	0x53
	.byte	0x13
	.4byte	0x42
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0xe
	.4byte	.LASF25
	.byte	0x2
	.byte	0x4a
	.byte	0xf
	.4byte	0x42
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0x1a5
	.byte	0xa
	.8byte	.LBB6
	.8byte	.LBE6-.LBB6
	.byte	0xb
	.string	"__v"
	.byte	0x2
	.byte	0x4c
	.byte	0x1a
	.4byte	0x42
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0xf
	.4byte	.LASF9
	.byte	0x2
	.byte	0x39
	.byte	0x6
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0x1e5
	.byte	0xa
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.byte	0xb
	.string	"__v"
	.byte	0x2
	.byte	0x3c
	.byte	0x13
	.4byte	0x42
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0x7
	.4byte	.LASF10
	.byte	0x2
	.byte	0x29
	.byte	0x6
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0x213
	.byte	0xb
	.string	"val"
	.byte	0x2
	.byte	0x2b
	.byte	0x10
	.4byte	0x42
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xf
	.4byte	.LASF11
	.byte	0x2
	.byte	0x24
	.byte	0x6
	.8byte	.LFB7
	.8byte	.LFE7-.LFB7
	.byte	0x1
	.byte	0x9c
	.4byte	0x262
	.byte	0x10
	.4byte	.LASF13
	.byte	0x2
	.byte	0x24
	.byte	0x25
	.4byte	0xae
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0xa
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.byte	0xb
	.string	"__v"
	.byte	0x2
	.byte	0x26
	.byte	0x13
	.4byte	0x42
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0xf
	.4byte	.LASF12
	.byte	0x2
	.byte	0x1f
	.byte	0x6
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0x2b1
	.byte	0x10
	.4byte	.LASF13
	.byte	0x2
	.byte	0x1f
	.byte	0x23
	.4byte	0xae
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0xa
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0xb
	.string	"__v"
	.byte	0x2
	.byte	0x21
	.byte	0x13
	.4byte	0x42
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0x7
	.4byte	.LASF14
	.byte	0x2
	.byte	0x18
	.byte	0x6
	.8byte	.LFB5
	.8byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.4byte	0x2df
	.byte	0x10
	.4byte	.LASF15
	.byte	0x2
	.byte	0x18
	.byte	0x31
	.4byte	0x42
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x11
	.4byte	.LASF17
	.byte	0x2
	.byte	0x13
	.byte	0xf
	.4byte	0x42
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.byte	0x12
	.4byte	.LASF26
	.byte	0x1
	.byte	0x20
	.byte	0x14
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x10
	.4byte	.LASF18
	.byte	0x1
	.byte	0x20
	.byte	0x30
	.4byte	0x42
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xa
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0xb
	.string	"a0"
	.byte	0x1
	.byte	0x22
	.byte	0x1c
	.4byte	0x42
	.byte	0x1
	.byte	0x5a
	.byte	0xb
	.string	"a1"
	.byte	0x1
	.byte	0x22
	.byte	0x61
	.4byte	0x42
	.byte	0x1
	.byte	0x5b
	.byte	0xb
	.string	"a2"
	.byte	0x1
	.byte	0x22
	.byte	0x9c
	.4byte	0x42
	.byte	0x1
	.byte	0x5c
	.byte	0xb
	.string	"a7"
	.byte	0x1
	.byte	0x22
	.byte	0xd7
	.4byte	0x42
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
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
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
	.byte	0xb
	.byte	0x2
	.byte	0x18
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
	.byte	0x9
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0xb
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
	.byte	0xc
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
	.byte	0x97,0x42
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
.LASF9:
	.string	"riscv_vcpu_timer_init"
.LASF2:
	.string	"unsigned int"
.LASF21:
	.string	"/home/acetab/\346\241\214\351\235\242/benos"
.LASF14:
	.string	"riscv_vcpu_timer_event_start"
.LASF25:
	.string	"get_cycles"
.LASF13:
	.string	"intr"
.LASF5:
	.string	"vcpu_time_delta"
.LASF10:
	.string	"riscv_vcpu_check_timer_expired"
.LASF3:
	.string	"long unsigned int"
.LASF12:
	.string	"riscv_vcpu_set_interrupt"
.LASF4:
	.string	"_Bool"
.LASF8:
	.string	"handle_timer_irq"
.LASF17:
	.string	"riscv_vcpu_current_cycles"
.LASF16:
	.string	"timer_init"
.LASF15:
	.string	"next_cycle"
.LASF26:
	.string	"sbi_set_timer"
.LASF0:
	.string	"unsigned char"
.LASF24:
	.string	"reset_timer"
.LASF20:
	.string	"src/timer.c"
.LASF23:
	.string	"tick_handle_periodic"
.LASF1:
	.string	"short unsigned int"
.LASF18:
	.string	"stime_value"
.LASF11:
	.string	"riscv_vcpu_clear_interrupt"
.LASF22:
	.string	"jiffies"
.LASF19:
	.string	"GNU C17 9.4.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF7:
	.string	"vcpu_timer_init"
.LASF6:
	.string	"vcpu_next_cycle"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
