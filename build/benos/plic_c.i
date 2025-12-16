# 1 "src/plic.c"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "src/plic.c"
# 1 "include/io.h" 1
# 49 "include/io.h"
static inline void delay(unsigned int n)
{
 while(n--)
  ;
}
# 2 "src/plic.c" 2
# 1 "include/asm/plic.h" 1



# 1 "include/asm/ptregs.h" 1
# 14 "include/asm/ptregs.h"
struct pt_regs {

 unsigned long sepc;
 unsigned long ra;
 unsigned long sp;
 unsigned long gp;
 unsigned long tp;
 unsigned long t0;
 unsigned long t1;
 unsigned long t2;
 unsigned long s0;
 unsigned long s1;
 unsigned long a0;
 unsigned long a1;
 unsigned long a2;
 unsigned long a3;
 unsigned long a4;
 unsigned long a5;
 unsigned long a6;
 unsigned long a7;
 unsigned long s2;
 unsigned long s3;
 unsigned long s4;
 unsigned long s5;
 unsigned long s6;
 unsigned long s7;
 unsigned long s8;
 unsigned long s9;
 unsigned long s10;
 unsigned long s11;
 unsigned long t3;
 unsigned long t4;
 unsigned long t5;
 unsigned long t6;

 unsigned long sstatus;
 unsigned long sbadaddr;
 unsigned long scause;
 unsigned long hstatus;
};
# 5 "include/asm/plic.h" 2
# 34 "include/asm/plic.h"
int plic_init();
void plic_set_prority(int hwirq, int pro);
void plic_enable_irq(int cpu, int hwirq, int enable);
void plic_handle_irq(struct pt_regs *regs);
# 3 "src/plic.c" 2
# 1 "include/asm/csr.h" 1
# 4 "src/plic.c" 2

# 1 "include/asm/irq.h" 1





extern void handle_uart_irq(void);


static inline void arch_local_irq_enable(void)
{
 ({ unsigned long __v = (unsigned long)(0x2UL); __asm__ __volatile__ ("csrs ""sstatus"", %0" : : "rK" (__v) : "memory"); });
}


static inline void arch_local_irq_disable(void)
{
 ({ unsigned long __v = (unsigned long)(0x2UL); __asm__ __volatile__ ("csrc ""sstatus"", %0" : : "rK" (__v) : "memory"); });
}

static inline void enable_external_irq(void)
{
 ({ unsigned long __v = (unsigned long)(0x200UL); __asm__ __volatile__ ("csrs ""sie"", %0" : : "rK" (__v) : "memory"); });
}
# 6 "src/plic.c" 2
# 1 "include/printk.h" 1



void init_printk_done(void (*fn)(char c));

int printk(const char *fmt, ...);

struct pt_regs;
void print_symbol(unsigned long addr);
void panic(void);
void dump_stack(struct pt_regs *regs);
# 7 "src/plic.c" 2
# 1 "include/asm/trap.h" 1
# 8 "src/plic.c" 2





int vhwirq;

void plic_set_prority(int hwirq, int pro)
{
 unsigned int reg = (0xc000000UL + (hwirq) * 4);

 ({ unsigned int __v = 1; __asm__ __volatile__ ("" : : : "memory"); (*(volatile unsigned int *)((unsigned long)reg) = (__v));});
}

void plic_enable_irq(int cpu, int hwirq, int enable)
{
 unsigned int hwirq_mask = 1 << (hwirq % 32);
 int hart = (2 * cpu + 1);
 unsigned int reg = (0xc000000UL + 0x2000 + (hart) * 0x80) + 4*(hwirq / 32);

 printk("reg: 0x%x, hwirq:%d\n", reg, hwirq);

 if (enable)
  ({ unsigned int __v = ({ unsigned int __v = (*(volatile unsigned int *)((unsigned long)reg)); __asm__ __volatile__ ("" : : : "memory"); __v; }) | hwirq_mask; __asm__ __volatile__ ("" : : : "memory"); (*(volatile unsigned int *)((unsigned long)reg) = (__v));});
 else
  ({ unsigned int __v = ({ unsigned int __v = (*(volatile unsigned int *)((unsigned long)reg)); __asm__ __volatile__ ("" : : : "memory"); __v; }) & ~hwirq_mask; __asm__ __volatile__ ("" : : : "memory"); (*(volatile unsigned int *)((unsigned long)reg) = (__v));});
}

void plic_handle_irq(struct pt_regs *regs)
{
 int hwirq;

 int hart = (2 * 0 + 1);

 unsigned int claim_reg = (0xc000000UL + 0x200004 + (hart) * 0x1000);

 ({ unsigned long __v = (unsigned long)(0x200UL); __asm__ __volatile__ ("csrc ""sie"", %0" : : "rK" (__v) : "memory"); });

 while((hwirq = ({ unsigned int __v = (*(volatile unsigned int *)((unsigned long)claim_reg)); __asm__ __volatile__ ("" : : : "memory"); __v; }))) {
  vhwirq = hwirq;
  ({ unsigned long __v = (unsigned long)(1UL << 10); __asm__ __volatile__ ("csrs ""0x645"", %0" : : "rK" (__v) : "memory"); });

  ({ unsigned int __v = hwirq; __asm__ __volatile__ ("" : : : "memory"); (*(volatile unsigned int *)((unsigned long)claim_reg) = (__v));});
 }
 ({ unsigned long __v = (unsigned long)(0x200UL); __asm__ __volatile__ ("csrs ""sie"", %0" : : "rK" (__v) : "memory"); });
}

int plic_init(void)
{
 int i;
 int hwirq;

 for (i = 0; i < 1; i++) {

  ({ unsigned int __v = 0; __asm__ __volatile__ ("" : : : "memory"); (*(volatile unsigned int *)((unsigned long)(0xc000000UL + 0x200000 + ((2 * i + 1)) * 0x1000)) = (__v));});

  for (hwirq = 1; hwirq <= 53; hwirq++) {

   plic_enable_irq(i, hwirq, 0);


   plic_set_prority(hwirq, 1);
  }
 }

 ({ unsigned long __v = (unsigned long)(0x200UL); __asm__ __volatile__ ("csrs ""sie"", %0" : : "rK" (__v) : "memory"); });

 return 0;
}
