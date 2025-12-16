# 1 "virt/vs_entry.S"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "virt/vs_entry.S"
# 1 "include/asm/asm-offsets.h" 1
# 2 "virt/vs_entry.S" 2
# 1 "include/asm/csr.h" 1
# 3 "virt/vs_entry.S" 2
# 1 "include/asm/processor.h" 1
# 4 "virt/vs_entry.S" 2




.global jump_to_vs_mode
jump_to_vs_mode:





 sd sp, 120(tp)
 csrw sscratch, tp
 csrw sepc, a0
 sret
