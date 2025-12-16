# 1 "src/boot.S"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "src/boot.S"
# 1 "include/asm/pgtable_hwdef.h" 1
# 2 "src/boot.S" 2
# 1 "include/mm.h" 1
# 3 "src/boot.S" 2
# 1 "include/asm/memory.h" 1
# 4 "src/boot.S" 2
# 1 "include/sched.h" 1
# 5 "src/boot.S" 2

.section ".text.boot"

.globl _start
_start:

 csrw sie, zero

 call __init_uart
 call print_asm


 la sp, init_task_union
 li t0, (1 * (1 << 12))
 add sp, sp, t0
 la tp, init_task_union





 tail kernel_main

print_asm:

 mv s1, ra

 la a0, boot_string
 call put_string_uart


 mv ra, s1
 ret

.global create_page_table
create_page_table:
 addi sp, sp, -16
 sd ra, 8(sp)



 la a0, idmap_pg_dir
 la a1, idmap_pg_end
.loop1:
 sd x0, (a0)
 addi a0, a0, 8
 blt a0, a1, .loop1


 la t0, (~((1UL << 21)-1))
 la t1, (1UL << 21)
 li t2, 1

 la a0, idmap_pg_dir
 la a1, _text_boot
 and a1, a1, t0
 mv a2, a1
 li a3, (0x80000000UL + (16 * 0x100000UL))
 add a3, a3, t1
 sub a3, a3, t2
 and a3, a3, t0
 la a4, ((1 << 0) | (1 << 6) | (1 << 1) | (1 << 3) | (1 << 2) | (1 << 7))

 call __create_section_mapping

 ld ra, 8(sp)
 addi sp, sp, 16

 ret
# 82 "src/boot.S"
__create_section_mapping:
 addi sp, sp, -16
 sd ra, 8(sp)



 srli t0, a2, 30
 slli a5, t0, 3


 li t0, (1 << 12)
 add a6, a0, t0


 srli t1, a6, 12
 slli t1, t1, 10


 ori t1, t1, (1 << 0)


 add t2, a0, a5
 sd t1, (t2)


.loop2:

 srli t0, a2, 21
 li t1, (1 << (30 - 21)) - 1
 and t0, t0, t1
 slli a7, t0, 3


 srli t1, a1, 12
 slli t1, t1, 10
 or t1, t1, a4


 add t2, a6, a7
 sd t1, (t2)

 la t1, (1UL << 21)
 add a2, a2, t1
 add a1, a1, t1
 blt a2, a3, .loop2

 ld ra, 8(sp)
 addi sp, sp, 16

 ret

.section .rodata
.align 3
.globl boot_string
boot_string:
       .string "Booting at asm\n"
