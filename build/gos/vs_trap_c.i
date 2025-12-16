# 1 "gos/vs_trap.c"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "gos/vs_trap.c"
# 1 "include/asm/csr.h" 1
# 2 "gos/vs_trap.c" 2
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
# 3 "gos/vs_trap.c" 2
# 1 "include/printk.h" 1



void init_printk_done(void (*fn)(char c));

int printk(const char *fmt, ...);

struct pt_regs;
void print_symbol(unsigned long addr);
void panic(void);
void dump_stack(struct pt_regs *regs);
# 4 "gos/vs_trap.c" 2
# 1 "include/io.h" 1
# 49 "include/io.h"
static inline void delay(unsigned int n)
{
 while(n--)
  ;
}
# 5 "gos/vs_trap.c" 2
# 1 "include/type.h" 1





typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long u64;

typedef unsigned int size_t;

typedef _Bool bool;





enum {
 false = 0,
 true = 1
};
# 6 "gos/vs_trap.c" 2
# 1 "include/asm/trap.h" 1
# 7 "gos/vs_trap.c" 2
# 1 "gos/gos.h" 1



void vs_trap_init(void);
void vs_handle_timer_irq(void);
void vs_timer_init(void);
# 8 "gos/vs_trap.c" 2
# 1 "include/asm/plic.h" 1
# 34 "include/asm/plic.h"
int plic_init();
void plic_set_prority(int hwirq, int pro);
void plic_enable_irq(int cpu, int hwirq, int enable);
void plic_handle_irq(struct pt_regs *regs);
# 9 "gos/vs_trap.c" 2
extern void vs_exception_vector(void);

struct fault_info {
 int (*fn)(struct pt_regs *regs, const char *name);
 const char *name;
};

static void vs_panic()
{
 printk("VS Kernel panic\n");
 while(1)
  ;
}

static void vs_show_regs(struct pt_regs *regs)
{
 printk("sepc: %016lx ra : %016lx sp : %016lx\n",
  regs->sepc, regs->ra, regs->sp);
 printk(" gp : %016lx tp : %016lx t0 : %016lx\n",
  regs->gp, regs->tp, regs->t0);
 printk(" t1 : %016lx t2 : %016lx t3 : %016lx\n",
  regs->t1, regs->t2, regs->s0);
 printk(" s1 : %016lx a0 : %016lx a1 : %016lx\n",
  regs->s1, regs->a0, regs->a1);
 printk(" a2 : %016lx a3 : %016lx a4 : %016lx\n",
  regs->a2, regs->a3, regs->a4);
 printk(" a5 : %016lx a6 : %016lx a7 : %016lx\n",
  regs->a5, regs->a6, regs->a7);
 printk(" s2 : %016lx s3 : %016lx s4 : %016lx\n",
  regs->s2, regs->s3, regs->s4);
 printk(" s5 : %016lx s6 : %016lx s7 : %016lx\n",
  regs->s5, regs->s6, regs->s7);
 printk(" s8 : %016lx s9 : %016lx s10: %016lx\n",
  regs->s8, regs->s9, regs->s10);
 printk(" s11: %016lx t3 : %016lx t4: %016lx\n",
  regs->s11, regs->t3, regs->t4);
 printk(" t5 : %016lx t6 : %016lx\n",
  regs->t5, regs->t6);
}

static void vs_trap_error(struct pt_regs *regs, const char *str)
{
 printk("Oops - %s\n", str);

 vs_show_regs(regs);
 printk("sstatus:0x%016lx  sbadaddr:0x%016lx  scause:0x%016lx\n",
   regs->sstatus, regs->sbadaddr, regs->scause);
 vs_panic();
}
# 66 "gos/vs_trap.c"
int vs_trap_unknown(struct pt_regs *regs, const char *str) { vs_trap_error(regs, str); return 0; };
int vs_trap_insn_misaligned(struct pt_regs *regs, const char *str) { vs_trap_error(regs, str); return 0; };
int vs_trap_insn_fault(struct pt_regs *regs, const char *str) { vs_trap_error(regs, str); return 0; };
int vs_trap_insn_illegal(struct pt_regs *regs, const char *str) { vs_trap_error(regs, str); return 0; };
int vs_trap_load_misaligned(struct pt_regs *regs, const char *str) { vs_trap_error(regs, str); return 0; };
int vs_trap_load_fault(struct pt_regs *regs, const char *str) { vs_trap_error(regs, str); return 0; };
int vs_trap_store_misaligned(struct pt_regs *regs, const char *str) { vs_trap_error(regs, str); return 0; };
int vs_trap_store_fault(struct pt_regs *regs, const char *str) { vs_trap_error(regs, str); return 0; };
int vs_trap_ecall_u(struct pt_regs *regs, const char *str) { vs_trap_error(regs, str); return 0; };
int vs_trap_ecall_s(struct pt_regs *regs, const char *str) { vs_trap_error(regs, str); return 0; };
int vs_trap_break(struct pt_regs *regs, const char *str) { vs_trap_error(regs, str); return 0; };
int vs_page_fault(struct pt_regs *regs, const char *str) { vs_trap_error(regs, str); return 0; };

static const struct fault_info fault_info[] = {
 {vs_trap_insn_misaligned, "Instruction address misaligned"},
 {vs_trap_insn_fault, "Instruction access fault"},
 {vs_trap_insn_illegal, "Illegal instruction"},
 {vs_trap_break, "Breakpoint"},
 {vs_trap_load_misaligned, "Load address misaligned"},
 {vs_trap_load_fault, "Load access fault"},
 {vs_trap_store_misaligned, "Store/AMO address misaligned"},
 {vs_trap_store_fault, "Store/AMO access fault"},
 {vs_trap_ecall_u, "Environment call from U-mode"},
 {vs_trap_ecall_s, "Environment call from S-mode"},
 {vs_trap_unknown, "unknown 10"},
 {vs_trap_unknown, "unknown 11"},
 {vs_page_fault, "Instruction page fault"},
 {vs_page_fault, "Load page fault"},
 {vs_trap_unknown, "unknown 14"},
 {vs_page_fault, "Store/AMO page fault"},
};

static inline const struct fault_info *ec_to_fault_info(unsigned int scause)
{
 return fault_info + (scause & (0xf));
}

void do_vs_exception(struct pt_regs *regs, unsigned long scause)
{
 const struct fault_info *inf;



 if ((scause & (1UL << 63))) {
  switch (scause &~ (1UL << 63)) {
  case 5:
   vs_handle_timer_irq();
   break;
  case 9:
   plic_handle_irq(regs);
   break;
  default:
   printk("vs unexpected interrupt cause");
   vs_panic();
  }

 } else {
  inf = ec_to_fault_info(scause);

  if (!inf->fn(regs, inf->name))
   return;
 }
}

void vs_trap_init(void)
{
 ({ unsigned long __v = (unsigned long)(0); __asm__ __volatile__ ("csrw ""sscratch"", %0" : : "rK" (__v) : "memory"); });

 ({ unsigned long __v = (unsigned long)(vs_exception_vector); __asm__ __volatile__ ("csrw ""stvec"", %0" : : "rK" (__v) : "memory"); });


 ({ unsigned long __v = (unsigned long)(-1); __asm__ __volatile__ ("csrw ""sie"", %0" : : "rK" (__v) : "memory"); });
}
