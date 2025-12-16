.section .Yuxianze  /* 替换为你名字的拼音 */
.global my_user_app

my_user_app:
    /* 1. 准备系统调用参数 */
    /* 实验要求：功能号放在 s7 中 */
    li s7, 100

    /* 2. 执行系统调用 */
    ecall

    /* 3. 系统调用返回后，返回值在 a0 中 (即班级号) */
    /* 调用 printk 显示返回值 (因为未开启MMU，U模式可以直接调用内核的printk) */
    /* 备份返回值 */
    mv a1, a0 
    la a0, result_fmt
    call printk

    /* 死循环，防止跑飞 */
    j .

.section .rodata
result_fmt:
    .string "Syscall returned class number: %d\n"