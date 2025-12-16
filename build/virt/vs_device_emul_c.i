# 1 "virt/vs_device_emul.c"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "virt/vs_device_emul.c"
# 1 "include/asm/uart.h" 1
# 2 "virt/vs_device_emul.c" 2
# 1 "include/io.h" 1
# 49 "include/io.h"
static inline void delay(unsigned int n)
{
 while(n--)
  ;
}
# 3 "virt/vs_device_emul.c" 2
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
# 4 "virt/vs_device_emul.c" 2
# 1 "include/asm/plic.h" 1
# 34 "include/asm/plic.h"
int plic_init();
void plic_set_prority(int hwirq, int pro);
void plic_enable_irq(int cpu, int hwirq, int enable);
void plic_handle_irq(struct pt_regs *regs);
# 5 "virt/vs_device_emul.c" 2
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
# 6 "virt/vs_device_emul.c" 2
# 19 "virt/vs_device_emul.c"
static int check_uart_mmio_range(unsigned long addr)
{
 if (addr >= 0x10000000 && addr <= (0x10000000 + 0x1000))
  return 1;
 else
  return 0;
}

static int check_plic_mmio_range(unsigned long addr)
{
 if (addr >= 0xc000000UL && addr <= 0x10000000UL)
  return 1;
 else
  return 0;
}

int check_emul_mmio_range(unsigned long addr)
{
 if (check_uart_mmio_range(addr) || check_plic_mmio_range(addr))
  return 1;
 else
  return 0;
}

unsigned long emul_readreg(struct pt_regs *regs, int reg)
{
    if ((reg <= 0) || (reg > 31))
     return 0;

    return *(unsigned long *)((unsigned long)regs + reg * 8);
}

void emul_writereg(struct pt_regs *regs, int reg, unsigned long val)
{
    if ((reg <= 0) || (reg > 31))
     return;

    *(unsigned long *)((unsigned long)regs + reg * 8) = val;
}

void emu_mmio_rw_reg64(struct emu_mmio_access *emu_mmio)
{
 unsigned long val;

 if (emu_mmio->write) {
  val = emul_readreg(emu_mmio->regs, emu_mmio->reg);
  ({ unsigned long __v = val; __asm__ __volatile__ ("" : : : "memory"); (*(volatile unsigned long *)(emu_mmio->addr) = (__v));});
 } else {
  val = ({ unsigned long __v = (*(volatile unsigned long *)(emu_mmio->addr)); __asm__ __volatile__ ("" : : : "memory"); __v; });
  emul_writereg(emu_mmio->regs, emu_mmio->reg, val);
 }
}

void emu_mmio_ro_reg64(struct emu_mmio_access *emu_mmio)
{
 unsigned long val;

 if (emu_mmio->write)
  return;

 val = ({ unsigned long __v = (*(volatile unsigned long *)(emu_mmio->addr)); __asm__ __volatile__ ("" : : : "memory"); __v; });
 emul_writereg(emu_mmio->regs, emu_mmio->reg, val);
}

void emu_mmio_w_reg64(struct emu_mmio_access *emu_mmio)
{
 unsigned long val;

 if (!emu_mmio->write)
  return;

 val = emul_readreg(emu_mmio->regs, emu_mmio->reg);
 ({ unsigned long __v = val; __asm__ __volatile__ ("" : : : "memory"); (*(volatile unsigned long *)(emu_mmio->addr) = (__v));});
}

void emu_mmio_rw_reg32(struct emu_mmio_access *emu_mmio)
{
 unsigned int val;

 if (emu_mmio->write) {
  val = emul_readreg(emu_mmio->regs, emu_mmio->reg);
  ({ unsigned int __v = val; __asm__ __volatile__ ("" : : : "memory"); (*(volatile unsigned int *)((unsigned long)emu_mmio->addr) = (__v));});
 } else {
  val = ({ unsigned int __v = (*(volatile unsigned int *)((unsigned long)emu_mmio->addr)); __asm__ __volatile__ ("" : : : "memory"); __v; });
  emul_writereg(emu_mmio->regs, emu_mmio->reg, val);
 }
}

void emu_mmio_ro_reg32(struct emu_mmio_access *emu_mmio)
{
 unsigned int val;

 if (emu_mmio->write)
  return;

 val = ({ unsigned int __v = (*(volatile unsigned int *)((unsigned long)emu_mmio->addr)); __asm__ __volatile__ ("" : : : "memory"); __v; });
 emul_writereg(emu_mmio->regs, emu_mmio->reg, val);
}

void emu_mmio_w_reg32(struct emu_mmio_access *emu_mmio)
{
 unsigned int val;

 if (!emu_mmio->write)
  return;

 val = emul_readreg(emu_mmio->regs, emu_mmio->reg);
 ({ unsigned int __v = val; __asm__ __volatile__ ("" : : : "memory"); (*(volatile unsigned int *)((unsigned long)emu_mmio->addr) = (__v));});
}

void emu_mmio_rw_reg8(struct emu_mmio_access *emu_mmio)
{
 unsigned char val;

 if (emu_mmio->write) {
  val = emul_readreg(emu_mmio->regs, emu_mmio->reg);
  ({ unsigned char __v = val; __asm__ __volatile__ ("" : : : "memory"); (*(volatile unsigned char *)(emu_mmio->addr) = (__v));});
 } else {
  val = ({ unsigned char __v = (*(volatile unsigned char *)(emu_mmio->addr)); __asm__ __volatile__ ("" : : : "memory"); __v; });
  emul_writereg(emu_mmio->regs, emu_mmio->reg, val);
 }
}

void emu_mmio_ro_reg8(struct emu_mmio_access *emu_mmio)
{
 unsigned char val;

 if (emu_mmio->write)
  return;

 val = ({ unsigned char __v = (*(volatile unsigned char *)(emu_mmio->addr)); __asm__ __volatile__ ("" : : : "memory"); __v; });
 emul_writereg(emu_mmio->regs, emu_mmio->reg, val);
}

void emu_mmio_w_reg8(struct emu_mmio_access *emu_mmio)
{
 unsigned char val;

 if (!emu_mmio->write)
  return;

 val = emul_readreg(emu_mmio->regs, emu_mmio->reg);
 ({ unsigned char __v = val; __asm__ __volatile__ ("" : : : "memory"); (*(volatile unsigned char *)(emu_mmio->addr) = (__v));});
}

int emu_uart(struct emu_mmio_access *emu_mmio)
{
 switch (emu_mmio->addr) {
 case (0x10000000 +0x05):
  emu_mmio_ro_reg8(emu_mmio);
  break;
 case (0x10000000 +0x00):
  emu_mmio_rw_reg8(emu_mmio);
  break;
 }

 return 0;

}

int emul_device(unsigned long fault_addr, unsigned long ins_val, struct pt_regs *regs)
{
 struct emu_mmio_access emu_mmio;
 int funct3;

 if ((!((ins_val & 3) == 3))) {
  printk("not support compressed instruction yet\n");
  return -1;
 }

 if (((ins_val)&0x7f) != (0x03) &&
   ((ins_val)&0x7f) != (0x23))
  return -1;

 emu_mmio.addr = fault_addr;
 emu_mmio.regs = regs;

 funct3 = ((ins_val >> 12) & 0x7);
 switch (funct3 & 0x3) {
 case 0:
  emu_mmio.width = 1;
  break;
 case 1:
  emu_mmio.width = 2;
  break;
 case 2:
  emu_mmio.width = 4;
  break;
 case 3:
  emu_mmio.width = 8;
  break;
 }

 emu_mmio.write = (((ins_val)&0x7f) == (0x23));

 emu_mmio.reg = emu_mmio.write ? (((ins_val) >> 20) & 0x1f) : (((ins_val) >> 7) & 0x1f);
 emu_mmio.sign_ext = !(funct3 & 0x4);

 if (check_uart_mmio_range(fault_addr))
  emu_uart(&emu_mmio);
 else if (check_plic_mmio_range(fault_addr))
  emu_plic(&emu_mmio);
}
