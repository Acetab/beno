# 1 "gos/boot.S"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "gos/boot.S"
.section ".text.boot"

.globl _start
_start:

 csrw sie, zero


 la sp, stacks_start
 li t0, 4096
 add sp, sp, t0


 tail kernel_main

.section .data
.align 12
.global stacks_start
stacks_start:
 .skip 4096
