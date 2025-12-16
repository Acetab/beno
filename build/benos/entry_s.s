# 1 "src/entry.S"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "src/entry.S"
# 1 "include/asm/asm-offsets.h" 1
# 2 "src/entry.S" 2
# 1 "include/asm/csr.h" 1
# 3 "src/entry.S" 2
# 1 "include/mm.h" 1
# 4 "src/entry.S" 2
# 1 "include/asm/processor.h" 1
# 5 "src/entry.S" 2

.macro kernel_entry






 csrrw tp, sscratch, tp
 bnez tp, _save_user_sp

_save_kernel_sp:
 csrr tp, sscratch
 sd sp, 120(tp)
_save_user_sp:

 sd sp, 128(tp)

 ld sp, 120(tp)

 addi sp, sp, -(288)
 sd x1, 8(sp)
 sd x3, 24(sp)
 sd x5, 40(sp)
 sd x6, 48(sp)
 sd x7, 56(sp)
 sd x8, 64(sp)
 sd x9, 72(sp)
 sd x10, 80(sp)
 sd x11, 88(sp)
 sd x12, 96(sp)
 sd x13, 104(sp)
 sd x14, 112(sp)
 sd x15, 120(sp)
 sd x16, 128(sp)
 sd x17, 136(sp)
 sd x18, 144(sp)
 sd x19, 152(sp)
 sd x20, 160(sp)
 sd x21, 168(sp)
 sd x22, 176(sp)
 sd x23, 184(sp)
 sd x24, 192(sp)
 sd x25, 200(sp)
 sd x26, 208(sp)
 sd x27, 216(sp)
 sd x28, 224(sp)
 sd x29, 232(sp)
 sd x30, 240(sp)
 sd x31, 248(sp)






 ld s0, 128(tp)
 sd s0, 16(sp)

 csrr s1, sstatus
 sd s1, 256(sp)


 csrr s2, sepc
 sd s2, 0(sp)


 csrr s3, sbadaddr
 sd s3, 264(sp)


 csrr s4, scause
 sd s4, 272(sp)


 csrr s5, sscratch
 sd s5, 32(sp)


 csrr s5, 0x600
 sd s5, 280(sp)
.endm

.macro kernel_exit
 ld a0, 256(sp)
 csrw sstatus, a0

 ld a2, 0(sp)
 csrw sepc, a2

 ld a2, 280(sp)
 csrw 0x600, a2

 ld x1, 8(sp)
 ld x3, 24(sp)
 ld x4, 32(sp)
 ld x5, 40(sp)
 ld x6, 48(sp)
 ld x7, 56(sp)
 ld x8, 64(sp)
 ld x9, 72(sp)
 ld x10, 80(sp)
 ld x11, 88(sp)
 ld x12, 96(sp)
 ld x13, 104(sp)
 ld x14, 112(sp)
 ld x15, 120(sp)
 ld x16, 128(sp)
 ld x17, 136(sp)
 ld x18, 144(sp)
 ld x19, 152(sp)
 ld x20, 160(sp)
 ld x21, 168(sp)
 ld x22, 176(sp)
 ld x23, 184(sp)
 ld x24, 192(sp)
 ld x25, 200(sp)
 ld x26, 208(sp)
 ld x27, 216(sp)
 ld x28, 224(sp)
 ld x29, 232(sp)
 ld x30, 240(sp)
 ld x31, 248(sp)

 ld x2, 16(sp)
.endm





.align 2
.global do_exception_vector
do_exception_vector:

 kernel_entry

 csrw sscratch, x0

 la ra, ret_from_exception

 mv a0, sp
 mv a1, s4
 tail do_exception

ret_from_exception:
 ld s0, 280(sp)
 csrc sstatus, 0x2UL





 andi s0, s0, (1UL << 7)
 bnez s0, ret_to_user






 ld s0, 256(sp)
 andi s0, s0, 0x100UL
 bnez s0, ret_to_kernel




ret_to_user:

 lw s0, 116(tp)
 andi s0, s0, (1)
 bnez s0, work_resched
no_work_pending:





 addi s0, sp, 288
        sd s0, 120(tp)
 csrw sscratch, tp
 j restore_all

work_resched:
 call schedule
 j no_work_pending




ret_to_kernel:


 lw s0, 112(tp)
 bnez s0, restore_all
need_resched:

 lw s0, 116(tp)
 andi s0, s0, (1)
 beqz s0, restore_all

 call preempt_schedule_irq
 j need_resched
restore_all:

 kernel_exit
 sret

.global trigger_load_access_fault
trigger_load_access_fault:
 li a0, 0x80000000
 ld a0, (a0)
 ret

.global enable_mmu_relocate
enable_mmu_relocate:
 la a2, idmap_pg_dir
 srl a2, a2, 12
 li a1, (1UL << 63)
 or a2, a2, a1
 sfence.vma
 csrw satp, a2
 ret
# 241 "src/entry.S"
.align 2
.global cpu_switch_to
cpu_switch_to:
 li a4, 0
 add a3, a0, a4
 add a4, a1, a4


 sd ra, 0(a3)
 sd sp, 8(a3)
 sd s0, 16(a3)
 sd s1, 24(a3)
 sd s2, 32(a3)
 sd s3, 40(a3)
 sd s4, 48(a3)
 sd s5, 56(a3)
 sd s6, 64(a3)
 sd s7, 72(a3)
 sd s8, 80(a3)
 sd s9, 88(a3)
 sd s10, 96(a3)
 sd s11, 104(a3)


 ld ra, 0(a4)
 ld sp, 8(a4)
 ld s0, 16(a4)
 ld s1, 24(a4)
 ld s2, 32(a4)
 ld s3, 40(a4)
 ld s4, 48(a4)
 ld s5, 56(a4)
 ld s6, 64(a4)
 ld s7, 72(a4)
 ld s8, 80(a4)
 ld s9, 88(a4)
 ld s10, 96(a4)
 ld s11, 104(a4)


 move tp, a1

 ret




.align 2
.global ret_from_kernel_thread
ret_from_kernel_thread:


 call schedule_tail

 la ra, ret_from_exception
 move a0, s1
 jr s0




.global ret_from_fork
ret_from_fork:
 la ra, ret_from_exception
 tail schedule_tail
