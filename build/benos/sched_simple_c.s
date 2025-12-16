	.file	"sched_simple.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.type	__list_add, @function
__list_add:
.LFB27:
	.file 1 "include/list.h"
	.loc 1 24 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	sd	a2,-40(s0)
	.loc 1 25 13
	ld	a5,-40(s0)
	ld	a4,-24(s0)
	sd	a4,8(a5)
	.loc 1 26 12
	ld	a5,-24(s0)
	ld	a4,-40(s0)
	sd	a4,0(a5)
	.loc 1 27 12
	ld	a5,-24(s0)
	ld	a4,-32(s0)
	sd	a4,8(a5)
	.loc 1 28 13
	ld	a5,-32(s0)
	ld	a4,-24(s0)
	sd	a4,0(a5)
	.loc 1 29 1
	nop
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE27:
	.size	__list_add, .-__list_add
	.align	2
	.type	list_add, @function
list_add:
.LFB28:
	.loc 1 32 1
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
	sd	a1,-32(s0)
	.loc 1 33 2
	ld	a5,-32(s0)
	ld	a5,0(a5)
	mv	a2,a5
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	__list_add
	.loc 1 34 1
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
	.size	list_add, .-list_add
	.align	2
	.type	__list_del, @function
__list_del:
.LFB30:
	.loc 1 42 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	.loc 1 43 13
	ld	a5,-32(s0)
	ld	a4,-24(s0)
	sd	a4,8(a5)
	.loc 1 44 13
	ld	a5,-24(s0)
	ld	a4,-32(s0)
	sd	a4,0(a5)
	.loc 1 46 1
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE30:
	.size	__list_del, .-__list_del
	.align	2
	.type	list_del, @function
list_del:
.LFB31:
	.loc 1 49 1
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
	.loc 1 50 2
	ld	a5,-24(s0)
	ld	a4,8(a5)
	ld	a5,-24(s0)
	ld	a5,0(a5)
	mv	a1,a5
	mv	a0,a4
	call	__list_del
	.loc 1 51 14
	ld	a5,-24(s0)
	lla	a4,.LC0
	ld	a4,0(a4)
	sd	a4,0(a5)
	.loc 1 52 14
	ld	a5,-24(s0)
	lla	a4,.LC1
	ld	a4,0(a4)
	sd	a4,8(a5)
	.loc 1 53 1
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
.LFE31:
	.size	list_del, .-list_del
	.align	2
	.type	get_current, @function
get_current:
.LFB34:
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
.LFE34:
	.size	get_current, .-get_current
	.align	2
	.type	dequeue_task_simple, @function
dequeue_task_simple:
.LFB39:
	.file 3 "src/sched_simple.c"
	.loc 3 7 1
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
	sd	a1,-32(s0)
	.loc 3 8 4
	ld	a5,-24(s0)
	lw	a5,16(a5)
	.loc 3 8 16
	addiw	a5,a5,-1
	sext.w	a4,a5
	ld	a5,-24(s0)
	sw	a4,16(a5)
	.loc 3 9 2
	ld	a5,-32(s0)
	addi	a5,a5,152
	mv	a0,a5
	call	list_del
	.loc 3 10 1
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
.LFE39:
	.size	dequeue_task_simple, .-dequeue_task_simple
	.align	2
	.type	enqueue_task_simple, @function
enqueue_task_simple:
.LFB40:
	.loc 3 14 1
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
	sd	a1,-32(s0)
	.loc 3 15 2
	ld	a5,-32(s0)
	addi	a5,a5,152
	ld	a4,-24(s0)
	mv	a1,a4
	mv	a0,a5
	call	list_add
	.loc 3 16 4
	ld	a5,-24(s0)
	lw	a5,16(a5)
	.loc 3 16 16
	addiw	a5,a5,1
	sext.w	a4,a5
	ld	a5,-24(s0)
	sw	a4,16(a5)
	.loc 3 17 1
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
.LFE40:
	.size	enqueue_task_simple, .-enqueue_task_simple
	.align	2
	.type	goodness, @function
goodness:
.LFB41:
	.loc 3 20 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	.loc 3 23 9
	ld	a5,-40(s0)
	lw	a5,168(a5)
	sw	a5,-20(s0)
	.loc 3 25 9
	lw	a5,-20(s0)
	.loc 3 26 1
	mv	a0,a5
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE41:
	.size	goodness, .-goodness
	.align	2
	.type	reset_score, @function
reset_score:
.LFB42:
	.loc 3 29 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 3 32 9
	lla	a5,init_task_union
	sd	a5,-24(s0)
	.loc 3 32 2
	j	.L12
.L13:
	.loc 3 33 22
	ld	a5,-24(s0)
	lw	a5,172(a5)
	.loc 3 33 19
	addiw	a5,a5,10
	sext.w	a4,a5
	.loc 3 33 14
	ld	a5,-24(s0)
	sw	a4,168(a5)
.L12:
	.loc 3 32 39 discriminator 1
	ld	a5,-24(s0)
	ld	a5,176(a5)
	sd	a5,-24(s0)
	.loc 3 32 2 discriminator 1
	ld	a4,-24(s0)
	lla	a5,init_task_union
	bne	a4,a5,.L13
	.loc 3 36 1
	nop
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE42:
	.size	reset_score, .-reset_score
	.align	2
	.type	pick_next_task_simple, @function
pick_next_task_simple:
.LFB43:
	.loc 3 41 1
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	sd	s0,64(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,80
	.cfi_def_cfa 8, 0
	sd	a0,-72(s0)
	sd	a1,-80(s0)
.L15:
	.loc 3 48 4
	li	a5,-1000
	sw	a5,-36(s0)
	.loc 3 49 11
	ld	a5,-72(s0)
	ld	a5,0(a5)
	sd	a5,-32(s0)
	.loc 3 49 2
	j	.L16
.L18:
	.loc 3 50 5
	ld	a5,-32(s0)
	addi	a5,a5,-152
	sd	a5,-48(s0)
	.loc 3 51 12
	ld	a0,-48(s0)
	call	goodness
	mv	a5,a0
	sw	a5,-52(s0)
	.loc 3 52 6
	lw	a4,-52(s0)
	lw	a5,-36(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	ble	a4,a5,.L17
	.loc 3 53 6
	lw	a5,-52(s0)
	sw	a5,-36(s0)
	.loc 3 54 9
	ld	a5,-48(s0)
	sd	a5,-24(s0)
.L17:
	.loc 3 49 62 discriminator 2
	ld	a5,-32(s0)
	ld	a5,0(a5)
	sd	a5,-32(s0)
.L16:
	.loc 3 49 43 discriminator 1
	ld	a5,-72(s0)
	.loc 3 49 2 discriminator 1
	ld	a4,-32(s0)
	bne	a4,a5,.L18
	.loc 3 58 5
	lw	a5,-36(s0)
	sext.w	a5,a5
	bnez	a5,.L19
	.loc 3 59 3
	call	reset_score
	.loc 3 60 3
	j	.L15
.L19:
	.loc 3 65 9
	ld	a5,-24(s0)
	.loc 3 66 1
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
.LFE43:
	.size	pick_next_task_simple, .-pick_next_task_simple
	.align	2
	.type	task_tick_simple, @function
task_tick_simple:
.LFB44:
	.loc 3 69 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	.loc 3 70 9
	ld	a5,-32(s0)
	lw	a5,168(a5)
	.loc 3 70 6
	addiw	a5,a5,-1
	sext.w	a4,a5
	.loc 3 70 5
	ld	a5,-32(s0)
	sw	a4,168(a5)
	.loc 3 70 9
	ld	a5,-32(s0)
	lw	a5,168(a5)
	.loc 3 70 5
	bgtz	a5,.L23
	.loc 3 71 14
	ld	a5,-32(s0)
	sw	zero,168(a5)
	.loc 3 72 19
	ld	a5,-32(s0)
	li	a4,1
	sw	a4,116(a5)
.L23:
	.loc 3 75 1
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE44:
	.size	task_tick_simple, .-task_tick_simple
	.globl	simple_sched_class
	.section	.rodata
	.align	3
	.type	simple_sched_class, @object
	.size	simple_sched_class, 48
simple_sched_class:
	.dword	0
	.zero	8
	.dword	enqueue_task_simple
	.dword	dequeue_task_simple
	.dword	task_tick_simple
	.dword	pick_next_task_simple
	.align	3
.LC0:
	.dword	-2401263026317557504
	.align	3
.LC1:
	.dword	-2401263026316508672
	.text
.Letext0:
	.file 4 "include/asm/processor.h"
	.file 5 "include/sched.h"
	.file 6 "include/type.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x611
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF58
	.byte	0xc
	.4byte	.LASF59
	.4byte	.LASF60
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
	.byte	0x6
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
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.4byte	0xc5
	.byte	0x8
	.4byte	.LASF7
	.byte	0x1
	.byte	0x4
	.byte	0x14
	.4byte	0xc5
	.byte	0
	.byte	0x8
	.4byte	.LASF8
	.byte	0x1
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
	.byte	0x5
	.byte	0x13
	.byte	0x8
	.4byte	0x127
	.byte	0x8
	.4byte	.LASF7
	.byte	0x5
	.byte	0x14
	.byte	0x1c
	.4byte	0x12c
	.byte	0
	.byte	0x8
	.4byte	.LASF10
	.byte	0x5
	.byte	0x16
	.byte	0x9
	.4byte	0x1fa
	.byte	0x8
	.byte	0x8
	.4byte	.LASF11
	.byte	0x5
	.byte	0x17
	.byte	0x9
	.4byte	0x258
	.byte	0x10
	.byte	0x8
	.4byte	.LASF12
	.byte	0x5
	.byte	0x18
	.byte	0x9
	.4byte	0x258
	.byte	0x18
	.byte	0x8
	.4byte	.LASF13
	.byte	0x5
	.byte	0x19
	.byte	0x9
	.4byte	0x258
	.byte	0x20
	.byte	0x8
	.4byte	.LASF14
	.byte	0x5
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
	.byte	0x5
	.byte	0x32
	.byte	0x8
	.4byte	0x1fa
	.byte	0x8
	.4byte	.LASF5
	.byte	0x5
	.byte	0x33
	.byte	0x15
	.4byte	0x5c
	.byte	0
	.byte	0x8
	.4byte	.LASF16
	.byte	0x5
	.byte	0x34
	.byte	0x6
	.4byte	0x2c2
	.byte	0x70
	.byte	0x8
	.4byte	.LASF17
	.byte	0x5
	.byte	0x35
	.byte	0x6
	.4byte	0x2c2
	.byte	0x74
	.byte	0x8
	.4byte	.LASF18
	.byte	0x5
	.byte	0x36
	.byte	0x10
	.4byte	0x4e
	.byte	0x78
	.byte	0x8
	.4byte	.LASF19
	.byte	0x5
	.byte	0x37
	.byte	0x10
	.4byte	0x4e
	.byte	0x80
	.byte	0x8
	.4byte	.LASF20
	.byte	0x5
	.byte	0x38
	.byte	0x12
	.4byte	0x278
	.byte	0x88
	.byte	0x8
	.4byte	.LASF21
	.byte	0x5
	.byte	0x39
	.byte	0x12
	.4byte	0x2a9
	.byte	0x8c
	.byte	0x5
	.string	"pid"
	.byte	0x5
	.byte	0x3a
	.byte	0x6
	.4byte	0x2c2
	.byte	0x90
	.byte	0x8
	.4byte	.LASF22
	.byte	0x5
	.byte	0x3b
	.byte	0x13
	.4byte	0x9d
	.byte	0x98
	.byte	0x8
	.4byte	.LASF23
	.byte	0x5
	.byte	0x3c
	.byte	0x6
	.4byte	0x2c2
	.byte	0xa8
	.byte	0x8
	.4byte	.LASF24
	.byte	0x5
	.byte	0x3d
	.byte	0x6
	.4byte	0x2c2
	.byte	0xac
	.byte	0x8
	.4byte	.LASF25
	.byte	0x5
	.byte	0x3e
	.byte	0x16
	.4byte	0x13d
	.byte	0xb0
	.byte	0x8
	.4byte	.LASF26
	.byte	0x5
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
	.byte	0x5
	.byte	0x1e
	.byte	0x8
	.4byte	0x258
	.byte	0x8
	.4byte	.LASF28
	.byte	0x5
	.byte	0x1f
	.byte	0x13
	.4byte	0x9d
	.byte	0
	.byte	0x8
	.4byte	.LASF29
	.byte	0x5
	.byte	0x20
	.byte	0xf
	.4byte	0x3b
	.byte	0x10
	.byte	0x8
	.4byte	.LASF30
	.byte	0x5
	.byte	0x21
	.byte	0x6
	.4byte	0x42
	.byte	0x18
	.byte	0x8
	.4byte	.LASF31
	.byte	0x5
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
	.byte	0x5
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
	.byte	0x5
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
	.4byte	.LASF61
	.2byte	0x1000
	.byte	0x5
	.byte	0x46
	.byte	0x7
	.4byte	0x2f0
	.byte	0x12
	.4byte	.LASF40
	.byte	0x5
	.byte	0x47
	.byte	0x15
	.4byte	0x143
	.byte	0x12
	.4byte	.LASF41
	.byte	0x5
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
	.byte	0x5
	.byte	0x5b
	.byte	0x1c
	.4byte	0x301
	.byte	0x15
	.4byte	.LASF43
	.byte	0x5
	.byte	0x5d
	.byte	0x19
	.4byte	0x2c9
	.byte	0x15
	.4byte	.LASF44
	.byte	0x5
	.byte	0x6c
	.byte	0x21
	.4byte	0x127
	.byte	0x16
	.4byte	0x324
	.byte	0x3
	.byte	0x4d
	.byte	0x1a
	.byte	0x9
	.byte	0x3
	.8byte	simple_sched_class
	.byte	0x17
	.4byte	.LASF46
	.byte	0x3
	.byte	0x44
	.byte	0xd
	.8byte	.LFB44
	.8byte	.LFE44-.LFB44
	.byte	0x1
	.byte	0x9c
	.4byte	0x37c
	.byte	0x18
	.string	"rq"
	.byte	0x3
	.byte	0x44
	.byte	0x30
	.4byte	0x210
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x18
	.string	"p"
	.byte	0x3
	.byte	0x44
	.byte	0x48
	.4byte	0x13d
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x19
	.4byte	.LASF48
	.byte	0x3
	.byte	0x27
	.byte	0x1c
	.4byte	0x13d
	.8byte	.LFB43
	.8byte	.LFE43-.LFB43
	.byte	0x1
	.byte	0x9c
	.4byte	0x415
	.byte	0x18
	.string	"rq"
	.byte	0x3
	.byte	0x27
	.byte	0x44
	.4byte	0x210
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x1a
	.4byte	.LASF8
	.byte	0x3
	.byte	0x28
	.byte	0x17
	.4byte	0x13d
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x1b
	.string	"p"
	.byte	0x3
	.byte	0x2a
	.byte	0x16
	.4byte	0x13d
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x1c
	.4byte	.LASF7
	.byte	0x3
	.byte	0x2a
	.byte	0x1a
	.4byte	0x13d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1b
	.string	"tmp"
	.byte	0x3
	.byte	0x2b
	.byte	0x14
	.4byte	0xc5
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x1c
	.4byte	.LASF45
	.byte	0x3
	.byte	0x2c
	.byte	0x6
	.4byte	0x2c2
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0x1b
	.string	"c"
	.byte	0x3
	.byte	0x2d
	.byte	0x6
	.4byte	0x2c2
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x1d
	.4byte	.LASF62
	.byte	0x3
	.byte	0x2f
	.byte	0x1
	.8byte	.L15
	.byte	0
	.byte	0x17
	.4byte	.LASF47
	.byte	0x3
	.byte	0x1c
	.byte	0xd
	.8byte	.LFB42
	.8byte	.LFE42-.LFB42
	.byte	0x1
	.byte	0x9c
	.4byte	0x441
	.byte	0x1b
	.string	"p"
	.byte	0x3
	.byte	0x1e
	.byte	0x16
	.4byte	0x13d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1e
	.4byte	.LASF49
	.byte	0x3
	.byte	0x13
	.byte	0xc
	.4byte	0x2c2
	.8byte	.LFB41
	.8byte	.LFE41-.LFB41
	.byte	0x1
	.byte	0x9c
	.4byte	0x480
	.byte	0x18
	.string	"p"
	.byte	0x3
	.byte	0x13
	.byte	0x29
	.4byte	0x13d
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1c
	.4byte	.LASF45
	.byte	0x3
	.byte	0x15
	.byte	0x6
	.4byte	0x2c2
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x1f
	.4byte	.LASF50
	.byte	0x3
	.byte	0xc
	.byte	0xd
	.8byte	.LFB40
	.8byte	.LFE40-.LFB40
	.byte	0x1
	.byte	0x9c
	.4byte	0x4ba
	.byte	0x18
	.string	"rq"
	.byte	0x3
	.byte	0xc
	.byte	0x33
	.4byte	0x210
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x18
	.string	"p"
	.byte	0x3
	.byte	0xd
	.byte	0x17
	.4byte	0x13d
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x1f
	.4byte	.LASF51
	.byte	0x3
	.byte	0x5
	.byte	0xd
	.8byte	.LFB39
	.8byte	.LFE39-.LFB39
	.byte	0x1
	.byte	0x9c
	.4byte	0x4f4
	.byte	0x18
	.string	"rq"
	.byte	0x3
	.byte	0x5
	.byte	0x33
	.4byte	0x210
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x18
	.string	"p"
	.byte	0x3
	.byte	0x6
	.byte	0x17
	.4byte	0x13d
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x1e
	.4byte	.LASF52
	.byte	0x2
	.byte	0x4
	.byte	0x1c
	.4byte	0x13d
	.8byte	.LFB34
	.8byte	.LFE34-.LFB34
	.byte	0x1
	.byte	0x9c
	.4byte	0x524
	.byte	0x1b
	.string	"tp"
	.byte	0x2
	.byte	0x6
	.byte	0x1f
	.4byte	0x13d
	.byte	0x1
	.byte	0x54
	.byte	0
	.byte	0x1f
	.4byte	.LASF53
	.byte	0x1
	.byte	0x30
	.byte	0x14
	.8byte	.LFB31
	.8byte	.LFE31-.LFB31
	.byte	0x1
	.byte	0x9c
	.4byte	0x552
	.byte	0x1a
	.4byte	.LASF54
	.byte	0x1
	.byte	0x30
	.byte	0x2f
	.4byte	0xc5
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x17
	.4byte	.LASF55
	.byte	0x1
	.byte	0x29
	.byte	0x14
	.8byte	.LFB30
	.8byte	.LFE30-.LFB30
	.byte	0x1
	.byte	0x9c
	.4byte	0x58f
	.byte	0x1a
	.4byte	.LASF8
	.byte	0x1
	.byte	0x29
	.byte	0x31
	.4byte	0xc5
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1a
	.4byte	.LASF7
	.byte	0x1
	.byte	0x29
	.byte	0x49
	.4byte	0xc5
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x1f
	.4byte	.LASF56
	.byte	0x1
	.byte	0x1f
	.byte	0x14
	.8byte	.LFB28
	.8byte	.LFE28-.LFB28
	.byte	0x1
	.byte	0x9c
	.4byte	0x5cc
	.byte	0x18
	.string	"new"
	.byte	0x1
	.byte	0x1f
	.byte	0x2f
	.4byte	0xc5
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1a
	.4byte	.LASF57
	.byte	0x1
	.byte	0x1f
	.byte	0x46
	.4byte	0xc5
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x20
	.4byte	.LASF63
	.byte	0x1
	.byte	0x16
	.byte	0x14
	.8byte	.LFB27
	.8byte	.LFE27-.LFB27
	.byte	0x1
	.byte	0x9c
	.byte	0x18
	.string	"new"
	.byte	0x1
	.byte	0x16
	.byte	0x31
	.4byte	0xc5
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1a
	.4byte	.LASF8
	.byte	0x1
	.byte	0x16
	.byte	0x48
	.4byte	0xc5
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x1a
	.4byte	.LASF7
	.byte	0x1
	.byte	0x17
	.byte	0x15
	.4byte	0xc5
	.byte	0x2
	.byte	0x91
	.byte	0x58
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
	.byte	0x34
	.byte	0
	.byte	0x47
	.byte	0x13
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x2
	.byte	0x18
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
	.byte	0x1b
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
	.byte	0x1c
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
	.byte	0x1d
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
	.byte	0x1e
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
	.byte	0x1f
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
.LASF60:
	.string	"/home/acetab/\346\241\214\351\235\242/benos"
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
.LASF53:
	.string	"list_del"
.LASF40:
	.string	"task"
.LASF15:
	.string	"task_struct"
.LASF62:
	.string	"repeat"
.LASF16:
	.string	"preempt_count"
.LASF32:
	.string	"TASK_RUNNING"
.LASF57:
	.string	"head"
.LASF55:
	.string	"__list_del"
.LASF46:
	.string	"task_tick_simple"
.LASF14:
	.string	"pick_next_task"
.LASF63:
	.string	"__list_add"
.LASF45:
	.string	"weight"
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
.LASF13:
	.string	"task_tick"
.LASF26:
	.string	"prev_task"
.LASF22:
	.string	"run_list"
.LASF28:
	.string	"rq_head"
.LASF54:
	.string	"entry"
.LASF59:
	.string	"src/sched_simple.c"
.LASF0:
	.string	"unsigned char"
.LASF23:
	.string	"counter"
.LASF21:
	.string	"flags"
.LASF2:
	.string	"unsigned int"
.LASF35:
	.string	"TASK_ZOMBIE"
.LASF41:
	.string	"stack"
.LASF49:
	.string	"goodness"
.LASF1:
	.string	"short unsigned int"
.LASF50:
	.string	"enqueue_task_simple"
.LASF56:
	.string	"list_add"
.LASF52:
	.string	"get_current"
.LASF31:
	.string	"curr"
.LASF61:
	.string	"task_union"
.LASF4:
	.string	"_Bool"
.LASF38:
	.string	"task_flags"
.LASF43:
	.string	"init_task_union"
.LASF3:
	.string	"long unsigned int"
.LASF37:
	.string	"task_state"
.LASF19:
	.string	"user_sp"
.LASF30:
	.string	"nr_switches"
.LASF44:
	.string	"simple_sched_class"
.LASF48:
	.string	"pick_next_task_simple"
.LASF42:
	.string	"g_task"
.LASF58:
	.string	"GNU C17 9.4.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF36:
	.string	"TASK_STOPPED"
.LASF29:
	.string	"nr_running"
.LASF47:
	.string	"reset_score"
.LASF9:
	.string	"sched_class"
.LASF8:
	.string	"prev"
.LASF34:
	.string	"TASK_UNINTERRUPTIBLE"
.LASF25:
	.string	"next_task"
.LASF11:
	.string	"enqueue_task"
.LASF33:
	.string	"TASK_INTERRUPTIBLE"
.LASF7:
	.string	"next"
.LASF51:
	.string	"dequeue_task_simple"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
