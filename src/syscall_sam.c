#include "asm/asm-offsets.h"

.section .text
.align 2
.global sys_show_student_info

/* * 系统调用实现函数
 * 功能：打印信息
 * 返回值：a0 = 班级号 (例如 1)
 */
sys_show_student_info:
    /* 保存返回地址 ra */
    addi sp, sp, -16
    sd ra, 0(sp)

    /* 调用 printk 显示学号和姓名拼音 */
    /* 注意：printk 第一个参数是格式化字符串地址 */
    la a0, student_info_str
    call printk

    /* 恢复返回地址 */
    ld ra, 0(sp)
    addi sp, sp, 16

    /* 设置返回值 a0 = 班级号 (例如 1 班) */
    li a0, 3
    ret

.section .rodata
student_info_str:
    .string "Student ID: 2023307220918 Name: Yuxianze\n"