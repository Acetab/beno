# 1 "src/vmm.c"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "src/vmm.c"

unsigned long hlvwu(unsigned long addr)
{
    unsigned long value;
    asm volatile(
        ".insn r 0x73, 0x4, 0x34, %0, %1, x1\n\t"
        : "=r"(value): "r"(addr) : "memory", "x1");
    return value;
}

unsigned long hlvxwu(unsigned long addr)
{
    unsigned long value;
    asm volatile(
        ".insn r 0x73, 0x4, 0x34, %0, %1, x3\n\t"
        : "=r"(value): "r"(addr) : "memory", "x3");
    return value;
}

void hsvw(unsigned long addr, unsigned long value)
{
    asm volatile(
        ".insn r 0x73, 0x4, 0x35, x0, %1, %0\n\t"
        : "+r"(value): "r"(addr) : "memory");
}
