	.file	"sched.c"
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
	.type	arch_local_irq_disable, @function
arch_local_irq_disable:
.LFB1:
	.loc 1 16 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
.LBB3:
	.loc 1 17 19
	li	a5,2
	sd	a5,-24(s0)
	.loc 1 17 49
	ld	a5,-24(s0)
#APP
# 17 "include/asm/irq.h" 1
	csrc sstatus, a5
# 0 "" 2
#NO_APP
.LBE3:
	.loc 1 18 1
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	arch_local_irq_disable, .-arch_local_irq_disable
	.align	2
	.type	INIT_LIST_HEAD, @function
INIT_LIST_HEAD:
.LFB26:
	.file 2 "include/list.h"
	.loc 2 17 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 2 18 13
	ld	a5,-24(s0)
	ld	a4,-24(s0)
	sd	a4,0(a5)
	.loc 2 19 13
	ld	a5,-24(s0)
	ld	a4,-24(s0)
	sd	a4,8(a5)
	.loc 2 20 1
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE26:
	.size	INIT_LIST_HEAD, .-INIT_LIST_HEAD
	.align	2
	.type	clear_task_resched, @function
clear_task_resched:
.LFB33:
	.file 3 "include/sched.h"
	.loc 3 128 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 3 129 18
	ld	a5,-24(s0)
	sw	zero,116(a5)
	.loc 3 130 1
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE33:
	.size	clear_task_resched, .-clear_task_resched
	.align	2
	.type	get_current, @function
get_current:
.LFB34:
	.file 4 "include/asm/current.h"
	.loc 4 5 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	s0,8(sp)
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 4 7 9
	mv	a5,tp
	.loc 4 8 1
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
	.type	preempt_disable, @function
preempt_disable:
.LFB35:
	.loc 3 157 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 3 158 2
	call	get_current
	mv	a5,a0
	.loc 3 158 15
	lw	a4,112(a5)
	.loc 3 158 30
	addiw	a4,a4,1
	sext.w	a4,a4
	sw	a4,112(a5)
	.loc 3 159 1
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
.LFE35:
	.size	preempt_disable, .-preempt_disable
	.align	2
	.type	preempt_enable, @function
preempt_enable:
.LFB36:
	.loc 3 162 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 3 163 2
	call	get_current
	mv	a5,a0
	.loc 3 163 15
	lw	a4,112(a5)
	.loc 3 163 30
	addiw	a4,a4,-1
	sext.w	a4,a4
	sw	a4,112(a5)
	.loc 3 164 1
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
.LFE36:
	.size	preempt_enable, .-preempt_enable
	.comm	g_rq,40,8
	.align	2
	.globl	pick_next_task
	.type	pick_next_task, @function
pick_next_task:
.LFB39:
	.file 5 "src/sched.c"
	.loc 5 10 1
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
	.loc 5 11 28
	lla	a5,simple_sched_class
	sd	a5,-24(s0)
	.loc 5 13 14
	ld	a5,-24(s0)
	ld	a5,40(a5)
	.loc 5 13 9
	ld	a1,-48(s0)
	ld	a0,-40(s0)
	jalr	a5
.LVL0:
	mv	a5,a0
	.loc 5 14 1
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
.LFE39:
	.size	pick_next_task, .-pick_next_task
	.align	2
	.globl	dequeue_task
	.type	dequeue_task, @function
dequeue_task:
.LFB40:
	.loc 5 17 1
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
	.loc 5 18 28
	lla	a5,simple_sched_class
	sd	a5,-24(s0)
	.loc 5 20 14
	ld	a5,-24(s0)
	ld	a5,24(a5)
	.loc 5 20 9
	ld	a1,-48(s0)
	ld	a0,-40(s0)
	jalr	a5
.LVL1:
	.loc 5 21 1
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE40:
	.size	dequeue_task, .-dequeue_task
	.align	2
	.globl	enqueue_task
	.type	enqueue_task, @function
enqueue_task:
.LFB41:
	.loc 5 24 1
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
	.loc 5 25 28
	lla	a5,simple_sched_class
	sd	a5,-24(s0)
	.loc 5 27 14
	ld	a5,-24(s0)
	ld	a5,16(a5)
	.loc 5 27 9
	ld	a1,-48(s0)
	ld	a0,-40(s0)
	jalr	a5
.LVL2:
	.loc 5 28 1
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE41:
	.size	enqueue_task, .-enqueue_task
	.align	2
	.globl	task_tick
	.type	task_tick, @function
task_tick:
.LFB42:
	.loc 5 31 1
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
	.loc 5 32 28
	lla	a5,simple_sched_class
	sd	a5,-24(s0)
	.loc 5 34 14
	ld	a5,-24(s0)
	ld	a5,32(a5)
	.loc 5 34 9
	ld	a1,-48(s0)
	ld	a0,-40(s0)
	jalr	a5
.LVL3:
	.loc 5 35 1
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE42:
	.size	task_tick, .-task_tick
	.align	2
	.globl	switch_to
	.type	switch_to, @function
switch_to:
.LFB43:
	.loc 5 39 1
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
	.loc 5 40 5
	ld	a4,-24(s0)
	ld	a5,-32(s0)
	bne	a4,a5,.L18
	.loc 5 41 10
	li	a5,0
	j	.L19
.L18:
	.loc 5 43 9
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	cpu_switch_to
	mv	a5,a0
.L19:
	.loc 5 44 1
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
.LFE43:
	.size	switch_to, .-switch_to
	.align	2
	.globl	schedule_tail
	.type	schedule_tail, @function
schedule_tail:
.LFB44:
	.loc 5 55 1
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
	.loc 5 57 2
	call	arch_local_irq_enable
	.loc 5 58 1
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
.LFE44:
	.size	schedule_tail, .-schedule_tail
	.align	2
	.globl	tick_handle_periodic
	.type	tick_handle_periodic, @function
tick_handle_periodic:
.LFB45:
	.loc 5 61 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 5 62 20
	lla	a5,g_rq
	sd	a5,-24(s0)
	.loc 5 64 2
	call	get_current
	mv	a5,a0
	mv	a1,a5
	ld	a0,-24(s0)
	call	task_tick
	.loc 5 65 1
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
.LFE45:
	.size	tick_handle_periodic, .-tick_handle_periodic
	.section	.rodata
	.align	3
.LC0:
	.string	"BUG: scheduling while atomic: %d, 0x%x\n"
	.text
	.align	2
	.type	schedule_debug, @function
schedule_debug:
.LFB46:
	.loc 5 74 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	.loc 5 75 8
	call	get_current
	mv	a5,a0
	.loc 5 75 21
	lw	a5,112(a5)
	.loc 5 75 5
	mv	a4,a5
	li	a5,1
	beq	a4,a5,.L24
	.loc 5 76 3
	ld	a5,-40(s0)
	lw	s1,144(a5)
	.loc 5 77 14
	call	get_current
	mv	a5,a0
	.loc 5 76 3
	lw	a5,112(a5)
	mv	a2,a5
	mv	a1,s1
	lla	a0,.LC0
	call	printk
.L24:
	.loc 5 78 1
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	ld	s1,24(sp)
	.cfi_restore 9
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE46:
	.size	schedule_debug, .-schedule_debug
	.align	2
	.type	__schedule, @function
__schedule:
.LFB47:
	.loc 5 81 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	.loc 5 83 20
	lla	a5,g_rq
	sd	a5,-24(s0)
	.loc 5 85 9
	call	get_current
	sd	a0,-32(s0)
	.loc 5 88 2
	ld	a0,-32(s0)
	call	schedule_debug
	.loc 5 91 2
	call	arch_local_irq_disable
	.loc 5 93 10
	ld	a5,-32(s0)
	lw	a5,136(a5)
	.loc 5 93 5
	beqz	a5,.L26
	.loc 5 94 3
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	dequeue_task
.L26:
	.loc 5 96 9
	ld	a1,-32(s0)
	ld	a0,-24(s0)
	call	pick_next_task
	sd	a0,-40(s0)
	.loc 5 97 2
	ld	a0,-32(s0)
	call	clear_task_resched
	.loc 5 98 5
	ld	a4,-40(s0)
	ld	a5,-32(s0)
	beq	a4,a5,.L28
	.loc 5 99 10
	ld	a1,-40(s0)
	ld	a0,-32(s0)
	call	switch_to
	sd	a0,-48(s0)
	.loc 5 111 5
	ld	a5,-24(s0)
	ld	a5,24(a5)
	.loc 5 111 18
	addi	a4,a5,1
	ld	a5,-24(s0)
	sd	a4,24(a5)
	.loc 5 112 14
	call	get_current
	mv	a4,a0
	.loc 5 112 12
	ld	a5,-24(s0)
	sd	a4,32(a5)
	.loc 5 115 3
	ld	a0,-48(s0)
	call	schedule_tail
.L28:
	.loc 5 117 1
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
.LFE47:
	.size	__schedule, .-__schedule
	.align	2
	.globl	schedule
	.type	schedule, @function
schedule:
.LFB48:
	.loc 5 121 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 5 123 2
	call	preempt_disable
	.loc 5 124 2
	call	__schedule
	.loc 5 125 2
	call	preempt_enable
	.loc 5 126 1
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
.LFE48:
	.size	schedule, .-schedule
	.section	.rodata
	.align	3
.LC1:
	.string	"BUG: %s incorrect preempt count: 0x%x\n"
	.text
	.align	2
	.globl	preempt_schedule_irq
	.type	preempt_schedule_irq, @function
preempt_schedule_irq:
.LFB49:
	.loc 5 133 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 5 135 7
	call	get_current
	mv	a5,a0
	.loc 5 135 20
	lw	a5,112(a5)
	.loc 5 135 5
	beqz	a5,.L31
	.loc 5 137 16
	call	get_current
	mv	a5,a0
	.loc 5 136 3
	lw	a5,112(a5)
	mv	a2,a5
	lla	a1,__func__.1900
	lla	a0,.LC1
	call	printk
.L31:
	.loc 5 140 2
	call	preempt_disable
	.loc 5 148 2
	call	arch_local_irq_enable
	.loc 5 149 2
	call	__schedule
	.loc 5 150 2
	call	arch_local_irq_disable
	.loc 5 151 2
	call	preempt_enable
	.loc 5 152 1
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
.LFE49:
	.size	preempt_schedule_irq, .-preempt_schedule_irq
	.align	2
	.globl	wake_up_process
	.type	wake_up_process, @function
wake_up_process:
.LFB50:
	.loc 5 155 1
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
	.loc 5 156 20
	lla	a5,g_rq
	sd	a5,-24(s0)
	.loc 5 158 11
	ld	a5,-40(s0)
	sw	zero,136(a5)
	.loc 5 160 2
	ld	a1,-40(s0)
	ld	a0,-24(s0)
	call	enqueue_task
	.loc 5 161 1
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
.LFE50:
	.size	wake_up_process, .-wake_up_process
	.align	2
	.globl	sched_init
	.type	sched_init, @function
sched_init:
.LFB51:
	.loc 5 164 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 5 165 20
	lla	a5,g_rq
	sd	a5,-24(s0)
	.loc 5 167 2
	ld	a5,-24(s0)
	mv	a0,a5
	call	INIT_LIST_HEAD
	.loc 5 168 17
	ld	a5,-24(s0)
	sw	zero,16(a5)
	.loc 5 169 18
	ld	a5,-24(s0)
	sd	zero,24(a5)
	.loc 5 170 11
	ld	a5,-24(s0)
	sd	zero,32(a5)
	.loc 5 171 1
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
.LFE51:
	.size	sched_init, .-sched_init
	.section	.rodata
	.align	3
	.type	__func__.1900, @object
	.size	__func__.1900, 21
__func__.1900:
	.string	"preempt_schedule_irq"
	.text
.Letext0:
	.file 6 "include/asm/processor.h"
	.file 7 "include/type.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x79d
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF63
	.byte	0xc
	.4byte	.LASF64
	.4byte	.LASF65
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
	.byte	0x6
	.byte	0xf
	.byte	0x8
	.4byte	0x8d
	.byte	0x5
	.string	"ra"
	.byte	0x6
	.byte	0x10
	.byte	0x10
	.4byte	0x4e
	.byte	0
	.byte	0x5
	.string	"sp"
	.byte	0x6
	.byte	0x11
	.byte	0x10
	.4byte	0x4e
	.byte	0x8
	.byte	0x5
	.string	"s"
	.byte	0x6
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
	.byte	0x2
	.byte	0x3
	.byte	0x8
	.4byte	0xc5
	.byte	0x8
	.4byte	.LASF7
	.byte	0x2
	.byte	0x4
	.byte	0x14
	.4byte	0xc5
	.byte	0
	.byte	0x8
	.4byte	.LASF8
	.byte	0x2
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
	.byte	0x3
	.byte	0x13
	.byte	0x8
	.4byte	0x127
	.byte	0x8
	.4byte	.LASF7
	.byte	0x3
	.byte	0x14
	.byte	0x1c
	.4byte	0x12c
	.byte	0
	.byte	0x8
	.4byte	.LASF10
	.byte	0x3
	.byte	0x16
	.byte	0x9
	.4byte	0x1fa
	.byte	0x8
	.byte	0x8
	.4byte	.LASF11
	.byte	0x3
	.byte	0x17
	.byte	0x9
	.4byte	0x258
	.byte	0x10
	.byte	0x8
	.4byte	.LASF12
	.byte	0x3
	.byte	0x18
	.byte	0x9
	.4byte	0x258
	.byte	0x18
	.byte	0x8
	.4byte	.LASF13
	.byte	0x3
	.byte	0x19
	.byte	0x9
	.4byte	0x258
	.byte	0x20
	.byte	0x8
	.4byte	.LASF14
	.byte	0x3
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
	.byte	0x3
	.byte	0x32
	.byte	0x8
	.4byte	0x1fa
	.byte	0x8
	.4byte	.LASF5
	.byte	0x3
	.byte	0x33
	.byte	0x15
	.4byte	0x5c
	.byte	0
	.byte	0x8
	.4byte	.LASF16
	.byte	0x3
	.byte	0x34
	.byte	0x6
	.4byte	0x2c2
	.byte	0x70
	.byte	0x8
	.4byte	.LASF17
	.byte	0x3
	.byte	0x35
	.byte	0x6
	.4byte	0x2c2
	.byte	0x74
	.byte	0x8
	.4byte	.LASF18
	.byte	0x3
	.byte	0x36
	.byte	0x10
	.4byte	0x4e
	.byte	0x78
	.byte	0x8
	.4byte	.LASF19
	.byte	0x3
	.byte	0x37
	.byte	0x10
	.4byte	0x4e
	.byte	0x80
	.byte	0x8
	.4byte	.LASF20
	.byte	0x3
	.byte	0x38
	.byte	0x12
	.4byte	0x278
	.byte	0x88
	.byte	0x8
	.4byte	.LASF21
	.byte	0x3
	.byte	0x39
	.byte	0x12
	.4byte	0x2a9
	.byte	0x8c
	.byte	0x5
	.string	"pid"
	.byte	0x3
	.byte	0x3a
	.byte	0x6
	.4byte	0x2c2
	.byte	0x90
	.byte	0x8
	.4byte	.LASF22
	.byte	0x3
	.byte	0x3b
	.byte	0x13
	.4byte	0x9d
	.byte	0x98
	.byte	0x8
	.4byte	.LASF23
	.byte	0x3
	.byte	0x3c
	.byte	0x6
	.4byte	0x2c2
	.byte	0xa8
	.byte	0x8
	.4byte	.LASF24
	.byte	0x3
	.byte	0x3d
	.byte	0x6
	.4byte	0x2c2
	.byte	0xac
	.byte	0x8
	.4byte	.LASF25
	.byte	0x3
	.byte	0x3e
	.byte	0x16
	.4byte	0x13d
	.byte	0xb0
	.byte	0x8
	.4byte	.LASF26
	.byte	0x3
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
	.byte	0x3
	.byte	0x1e
	.byte	0x8
	.4byte	0x258
	.byte	0x8
	.4byte	.LASF28
	.byte	0x3
	.byte	0x1f
	.byte	0x13
	.4byte	0x9d
	.byte	0
	.byte	0x8
	.4byte	.LASF29
	.byte	0x3
	.byte	0x20
	.byte	0xf
	.4byte	0x3b
	.byte	0x10
	.byte	0x8
	.4byte	.LASF30
	.byte	0x3
	.byte	0x21
	.byte	0x6
	.4byte	0x42
	.byte	0x18
	.byte	0x8
	.4byte	.LASF31
	.byte	0x3
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
	.byte	0x3
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
	.byte	0x3
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
	.4byte	.LASF66
	.2byte	0x1000
	.byte	0x3
	.byte	0x46
	.byte	0x7
	.4byte	0x2f0
	.byte	0x12
	.4byte	.LASF40
	.byte	0x3
	.byte	0x47
	.byte	0x15
	.4byte	0x143
	.byte	0x12
	.4byte	.LASF41
	.byte	0x3
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
	.byte	0x3
	.byte	0x5b
	.byte	0x1c
	.4byte	0x301
	.byte	0x15
	.4byte	.LASF43
	.byte	0x3
	.byte	0x5d
	.byte	0x19
	.4byte	0x2c9
	.byte	0x15
	.4byte	.LASF44
	.byte	0x3
	.byte	0x6c
	.byte	0x21
	.4byte	0x127
	.byte	0x16
	.4byte	.LASF45
	.byte	0x5
	.byte	0x6
	.byte	0x12
	.4byte	0x216
	.byte	0x9
	.byte	0x3
	.8byte	g_rq
	.byte	0x17
	.4byte	.LASF46
	.byte	0x5
	.byte	0xa3
	.byte	0x6
	.8byte	.LFB51
	.8byte	.LFE51-.LFB51
	.byte	0x1
	.byte	0x9c
	.4byte	0x373
	.byte	0x18
	.string	"rq"
	.byte	0x5
	.byte	0xa5
	.byte	0x14
	.4byte	0x210
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x17
	.4byte	.LASF47
	.byte	0x5
	.byte	0x9a
	.byte	0x6
	.8byte	.LFB50
	.8byte	.LFE50-.LFB50
	.byte	0x1
	.byte	0x9c
	.4byte	0x3ad
	.byte	0x19
	.string	"p"
	.byte	0x5
	.byte	0x9a
	.byte	0x2a
	.4byte	0x13d
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x18
	.string	"rq"
	.byte	0x5
	.byte	0x9c
	.byte	0x14
	.4byte	0x210
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x17
	.4byte	.LASF48
	.byte	0x5
	.byte	0x84
	.byte	0x6
	.8byte	.LFB49
	.8byte	.LFE49-.LFB49
	.byte	0x1
	.byte	0x9c
	.4byte	0x3df
	.byte	0x1a
	.4byte	.LASF67
	.4byte	0x3ef
	.byte	0x9
	.byte	0x3
	.8byte	__func__.1900
	.byte	0
	.byte	0x6
	.4byte	0x3fb
	.4byte	0x3ef
	.byte	0x7
	.4byte	0x4e
	.byte	0x14
	.byte	0
	.byte	0xa
	.4byte	0x3df
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF49
	.byte	0xa
	.4byte	0x3f4
	.byte	0x1b
	.4byte	.LASF68
	.byte	0x5
	.byte	0x78
	.byte	0x6
	.8byte	.LFB48
	.8byte	.LFE48-.LFB48
	.byte	0x1
	.byte	0x9c
	.byte	0x1c
	.4byte	.LASF51
	.byte	0x5
	.byte	0x50
	.byte	0xd
	.8byte	.LFB47
	.8byte	.LFE47-.LFB47
	.byte	0x1
	.byte	0x9c
	.4byte	0x474
	.byte	0x1d
	.4byte	.LASF8
	.byte	0x5
	.byte	0x52
	.byte	0x16
	.4byte	0x13d
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x1d
	.4byte	.LASF7
	.byte	0x5
	.byte	0x52
	.byte	0x1d
	.4byte	0x13d
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1d
	.4byte	.LASF50
	.byte	0x5
	.byte	0x52
	.byte	0x24
	.4byte	0x13d
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x18
	.string	"rq"
	.byte	0x5
	.byte	0x53
	.byte	0x14
	.4byte	0x210
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1c
	.4byte	.LASF52
	.byte	0x5
	.byte	0x49
	.byte	0xd
	.8byte	.LFB46
	.8byte	.LFE46-.LFB46
	.byte	0x1
	.byte	0x9c
	.4byte	0x4a0
	.byte	0x19
	.string	"p"
	.byte	0x5
	.byte	0x49
	.byte	0x30
	.4byte	0x13d
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0x17
	.4byte	.LASF53
	.byte	0x5
	.byte	0x3c
	.byte	0x6
	.8byte	.LFB45
	.8byte	.LFE45-.LFB45
	.byte	0x1
	.byte	0x9c
	.4byte	0x4cd
	.byte	0x18
	.string	"rq"
	.byte	0x5
	.byte	0x3e
	.byte	0x14
	.4byte	0x210
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x17
	.4byte	.LASF54
	.byte	0x5
	.byte	0x36
	.byte	0x6
	.8byte	.LFB44
	.8byte	.LFE44-.LFB44
	.byte	0x1
	.byte	0x9c
	.4byte	0x4fb
	.byte	0x1e
	.4byte	.LASF8
	.byte	0x5
	.byte	0x36
	.byte	0x28
	.4byte	0x13d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1f
	.4byte	.LASF56
	.byte	0x5
	.byte	0x25
	.byte	0x16
	.4byte	0x13d
	.8byte	.LFB43
	.8byte	.LFE43-.LFB43
	.byte	0x1
	.byte	0x9c
	.4byte	0x53c
	.byte	0x1e
	.4byte	.LASF8
	.byte	0x5
	.byte	0x25
	.byte	0x34
	.4byte	0x13d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1e
	.4byte	.LASF7
	.byte	0x5
	.byte	0x26
	.byte	0x17
	.4byte	0x13d
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x17
	.4byte	.LASF13
	.byte	0x5
	.byte	0x1e
	.byte	0x6
	.8byte	.LFB42
	.8byte	.LFE42-.LFB42
	.byte	0x1
	.byte	0x9c
	.4byte	0x585
	.byte	0x19
	.string	"rq"
	.byte	0x5
	.byte	0x1e
	.byte	0x22
	.4byte	0x210
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x19
	.string	"p"
	.byte	0x5
	.byte	0x1e
	.byte	0x3a
	.4byte	0x13d
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x1d
	.4byte	.LASF55
	.byte	0x5
	.byte	0x20
	.byte	0x1c
	.4byte	0x12c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x17
	.4byte	.LASF11
	.byte	0x5
	.byte	0x17
	.byte	0x6
	.8byte	.LFB41
	.8byte	.LFE41-.LFB41
	.byte	0x1
	.byte	0x9c
	.4byte	0x5ce
	.byte	0x19
	.string	"rq"
	.byte	0x5
	.byte	0x17
	.byte	0x25
	.4byte	0x210
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x19
	.string	"p"
	.byte	0x5
	.byte	0x17
	.byte	0x3d
	.4byte	0x13d
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x1d
	.4byte	.LASF55
	.byte	0x5
	.byte	0x19
	.byte	0x1c
	.4byte	0x12c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x17
	.4byte	.LASF12
	.byte	0x5
	.byte	0x10
	.byte	0x6
	.8byte	.LFB40
	.8byte	.LFE40-.LFB40
	.byte	0x1
	.byte	0x9c
	.4byte	0x617
	.byte	0x19
	.string	"rq"
	.byte	0x5
	.byte	0x10
	.byte	0x25
	.4byte	0x210
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x19
	.string	"p"
	.byte	0x5
	.byte	0x10
	.byte	0x3d
	.4byte	0x13d
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x1d
	.4byte	.LASF55
	.byte	0x5
	.byte	0x12
	.byte	0x1c
	.4byte	0x12c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1f
	.4byte	.LASF14
	.byte	0x5
	.byte	0x8
	.byte	0x15
	.4byte	0x13d
	.8byte	.LFB39
	.8byte	.LFE39-.LFB39
	.byte	0x1
	.byte	0x9c
	.4byte	0x666
	.byte	0x19
	.string	"rq"
	.byte	0x5
	.byte	0x8
	.byte	0x36
	.4byte	0x210
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1e
	.4byte	.LASF8
	.byte	0x5
	.byte	0x9
	.byte	0x17
	.4byte	0x13d
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x1d
	.4byte	.LASF55
	.byte	0x5
	.byte	0xb
	.byte	0x1c
	.4byte	0x12c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x20
	.4byte	.LASF57
	.byte	0x3
	.byte	0xa1
	.byte	0x14
	.8byte	.LFB36
	.8byte	.LFE36-.LFB36
	.byte	0x1
	.byte	0x9c
	.byte	0x20
	.4byte	.LASF58
	.byte	0x3
	.byte	0x9c
	.byte	0x14
	.8byte	.LFB35
	.8byte	.LFE35-.LFB35
	.byte	0x1
	.byte	0x9c
	.byte	0x21
	.4byte	.LASF69
	.byte	0x4
	.byte	0x4
	.byte	0x1c
	.4byte	0x13d
	.8byte	.LFB34
	.8byte	.LFE34-.LFB34
	.byte	0x1
	.byte	0x9c
	.4byte	0x6ca
	.byte	0x18
	.string	"tp"
	.byte	0x4
	.byte	0x6
	.byte	0x1f
	.4byte	0x13d
	.byte	0x1
	.byte	0x54
	.byte	0
	.byte	0x22
	.4byte	.LASF59
	.byte	0x3
	.byte	0x7f
	.byte	0x14
	.8byte	.LFB33
	.8byte	.LFE33-.LFB33
	.byte	0x1
	.byte	0x9c
	.4byte	0x6f6
	.byte	0x19
	.string	"p"
	.byte	0x3
	.byte	0x7f
	.byte	0x3b
	.4byte	0x13d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x22
	.4byte	.LASF60
	.byte	0x2
	.byte	0x10
	.byte	0x14
	.8byte	.LFB26
	.8byte	.LFE26-.LFB26
	.byte	0x1
	.byte	0x9c
	.4byte	0x724
	.byte	0x1e
	.4byte	.LASF61
	.byte	0x2
	.byte	0x10
	.byte	0x35
	.4byte	0xc5
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x22
	.4byte	.LASF62
	.byte	0x1
	.byte	0xf
	.byte	0x14
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x764
	.byte	0x23
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0x18
	.string	"__v"
	.byte	0x1
	.byte	0x11
	.byte	0x13
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0x24
	.4byte	.LASF70
	.byte	0x1
	.byte	0x9
	.byte	0x14
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x23
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x18
	.string	"__v"
	.byte	0x1
	.byte	0xb
	.byte	0x13
	.4byte	0x4e
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
	.byte	0x17
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
	.byte	0x18
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
	.byte	0x19
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
	.byte	0x1a
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x49
	.byte	0x13
	.byte	0x34
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1b
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
	.byte	0x1c
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
	.byte	0x1d
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
	.byte	0x20
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
	.byte	0x21
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x23
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x24
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
.LASF65:
	.string	"/home/acetab/\346\241\214\351\235\242/benos"
.LASF57:
	.string	"preempt_enable"
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
.LASF40:
	.string	"task"
.LASF15:
	.string	"task_struct"
.LASF16:
	.string	"preempt_count"
.LASF32:
	.string	"TASK_RUNNING"
.LASF60:
	.string	"INIT_LIST_HEAD"
.LASF68:
	.string	"schedule"
.LASF45:
	.string	"g_rq"
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
.LASF48:
	.string	"preempt_schedule_irq"
.LASF13:
	.string	"task_tick"
.LASF51:
	.string	"__schedule"
.LASF26:
	.string	"prev_task"
.LASF22:
	.string	"run_list"
.LASF56:
	.string	"switch_to"
.LASF28:
	.string	"rq_head"
.LASF0:
	.string	"unsigned char"
.LASF64:
	.string	"src/sched.c"
.LASF23:
	.string	"counter"
.LASF47:
	.string	"wake_up_process"
.LASF21:
	.string	"flags"
.LASF62:
	.string	"arch_local_irq_disable"
.LASF2:
	.string	"unsigned int"
.LASF35:
	.string	"TASK_ZOMBIE"
.LASF41:
	.string	"stack"
.LASF50:
	.string	"last"
.LASF67:
	.string	"__func__"
.LASF1:
	.string	"short unsigned int"
.LASF46:
	.string	"sched_init"
.LASF49:
	.string	"char"
.LASF53:
	.string	"tick_handle_periodic"
.LASF69:
	.string	"get_current"
.LASF61:
	.string	"list"
.LASF31:
	.string	"curr"
.LASF55:
	.string	"class"
.LASF66:
	.string	"task_union"
.LASF4:
	.string	"_Bool"
.LASF54:
	.string	"schedule_tail"
.LASF38:
	.string	"task_flags"
.LASF43:
	.string	"init_task_union"
.LASF52:
	.string	"schedule_debug"
.LASF3:
	.string	"long unsigned int"
.LASF37:
	.string	"task_state"
.LASF58:
	.string	"preempt_disable"
.LASF19:
	.string	"user_sp"
.LASF30:
	.string	"nr_switches"
.LASF59:
	.string	"clear_task_resched"
.LASF44:
	.string	"simple_sched_class"
.LASF70:
	.string	"arch_local_irq_enable"
.LASF42:
	.string	"g_task"
.LASF63:
	.string	"GNU C17 9.4.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF36:
	.string	"TASK_STOPPED"
.LASF29:
	.string	"nr_running"
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
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
