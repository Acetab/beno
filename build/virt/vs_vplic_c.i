# 1 "virt/vs_vplic.c"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "virt/vs_vplic.c"
# 1 "include/virt.h" 1



struct emu_mmio_access {
 struct pt_regs *regs;
 unsigned long addr;
 int write;
 int sign_ext;
 int width;
 int reg;
};


int check_emul_mmio_range(unsigned long addr);
int emul_device(unsigned long fault_addr, unsigned long ins_val,
  struct pt_regs *regs);
unsigned long emul_readreg(struct pt_regs *regs, int reg);
void emul_writereg(struct pt_regs *regs, int reg, unsigned long val);

void emu_mmio_rw_reg64(struct emu_mmio_access *emu_mmio);
void emu_mmio_ro_reg64(struct emu_mmio_access *emu_mmio);
void emu_mmio_w_reg64(struct emu_mmio_access *emu_mmio);
void emu_mmio_rw_reg32(struct emu_mmio_access *emu_mmio);
void emu_mmio_ro_reg32(struct emu_mmio_access *emu_mmio);
void emu_mmio_w_reg32(struct emu_mmio_access *emu_mmio);
void emu_mmio_rw_reg8(struct emu_mmio_access *emu_mmio);
void emu_mmio_ro_reg8(struct emu_mmio_access *emu_mmio);
void emu_mmio_w_reg8(struct emu_mmio_access *emu_mmio);
# 2 "virt/vs_vplic.c" 2
# 1 "include/io.h" 1
# 49 "include/io.h"
static inline void delay(unsigned int n)
{
 while(n--)
  ;
}
# 3 "virt/vs_vplic.c" 2
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
# 4 "virt/vs_vplic.c" 2
# 1 "include/asm/trap.h" 1
# 5 "virt/vs_vplic.c" 2
# 1 "include/asm/csr.h" 1
# 6 "virt/vs_vplic.c" 2

extern int vhwirq;

int emu_plic_basic(struct emu_mmio_access *emu_mmio)
{
 unsigned long addr = emu_mmio->addr;
 int reg = (addr >> 12) & 0x3;

 switch (reg) {
 case 0:
  emu_mmio_rw_reg32(emu_mmio);
  break;
 case 1:
  emu_mmio_ro_reg32(emu_mmio);
  break;
 case 2:
  emu_mmio_rw_reg32(emu_mmio);
  break;
 }

 return 0;
}

static void emu_mmio_plic_claim(struct emu_mmio_access *emu_mmio)
{
 unsigned int val;

 if (emu_mmio->write) {
  vhwirq = 0;
 } else {
  emul_writereg(emu_mmio->regs, emu_mmio->reg, vhwirq);
 }
}

static void emu_plic_claim(struct emu_mmio_access *emu_mmio)
{
 unsigned long addr = emu_mmio->addr;
 int reg = addr & 0xf;

 switch (reg) {
 case 0:
  emu_mmio_rw_reg32(emu_mmio);
  break;
 case 4:
  emu_mmio_plic_claim(emu_mmio);
  break;
 }
}

int emu_plic(struct emu_mmio_access *emu_mmio)
{
 if (emu_mmio->addr > 0xc000000UL + 0x200000UL)
  emu_plic_claim(emu_mmio);
 else
  emu_plic_basic(emu_mmio);

 return 0;
}
