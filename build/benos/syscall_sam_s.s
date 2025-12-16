# 1 "src/syscall_sam.S"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "src/syscall_sam.S"
# 1 "include/asm/asm-offsets.h" 1
# 2 "src/syscall_sam.S" 2

.section .text
.align 2
.global sys_show_student_info





sys_show_student_info:

    addi sp, sp, -16
    sd ra, 0(sp)



    la a0, student_info_str
    call printk


    ld ra, 0(sp)
    addi sp, sp, 16


    li a0, 3
    ret

.section .rodata
student_info_str:
    .string "Student ID: 2023307220918 Name: Yuxianze\n"
