# 1 "usr/app_tset.S"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "usr/app_tset.S"
.section .Yuxianze
.global my_user_app

my_user_app:


    li s7, 100


    ecall




    mv a1, a0
    la a0, result_fmt
    call printk


    j .

.section .rodata
result_fmt:
    .string "Syscall returned class number: %d\n"
