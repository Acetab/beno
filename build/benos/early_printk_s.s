# 1 "src/early_printk.S"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "src/early_printk.S"
# 1 "include/asm/uart.h" 1
# 2 "src/early_printk.S" 2

.align 2
.globl __init_uart
__init_uart:

 la t0, (0x10000000 +0x01)
 sb x0, (t0)


 la t0, (0x10000000 +0x03)
 li t1, 0x80
 sb t1, (t0)

 la t0, (0x10000000 +0x00)
 li t1, 1
 sb t1, (t0)

 la t0, (0x10000000 +0x01)
 sb x0, (t0)


 la t0, (0x10000000 +0x03)
 li t1, 3
 sb t1, (t0)


 la t0, (0x10000000 +0x02)
 li t1, 0xc7
 sb t1, (t0)

 ret

.global put_uart
put_uart:
.loop:
 la t0, (0x10000000 +0x05)
 lbu t1, (t0)

 andi t1,t1, 0x40
 beqz t1, .loop

 la t0, (0x10000000 +0x00)
 sb a0, (t0)

 ret

.global put_string_uart
put_string_uart:

 mv s8, ra
 mv a5, a0

.loop1:
 lbu a0,(a5)
 beqz a0, .L2
 call put_uart
 addi a5,a5,1
 j .loop1
.L2:

 mv ra, s8
 ret
