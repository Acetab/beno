# 1 "usr/syscall.S"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "usr/syscall.S"
# 1 "include/uapi/syscall.h" 1
# 2 "usr/syscall.S" 2
# 15 "usr/syscall.S"
.global syscall
syscall:
 move t0, a0
 move a0, a1
 move a1, a2
 move a2, a3
 move a3, a4
 move a4, a5
 move a5, a6
 move a6, a7
 move a7, t0
 ecall
 ret







.align 2
.global __clone
__clone:

 addi a1, a1, -16
 sd a0, (a1)
 sd a3, 8(a1)


 move a0, a2

 li a7, 4
 scall
# 64 "usr/syscall.S"
 beqz a0, thread_start
 ret

.align 2
thread_start:

 ld a1, (sp)
 ld a0, 8(sp)


 jalr a1


 ret
