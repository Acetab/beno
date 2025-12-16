# 1 "src/stacktrace.c"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "src/stacktrace.c"
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
# 2 "src/stacktrace.c" 2
# 1 "include/printk.h" 1



void init_printk_done(void (*fn)(char c));

int printk(const char *fmt, ...);

struct pt_regs;
void print_symbol(unsigned long addr);
void panic(void);
void dump_stack(struct pt_regs *regs);
# 3 "src/stacktrace.c" 2
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
# 4 "src/stacktrace.c" 2

struct stackframe {
 unsigned long fp;
 unsigned long ra;
};

static bool print_trace_address(unsigned long pc, void *arg)
{
 print_symbol(pc);
 return false;
}

extern char _text[], _etext[];
static int kernel_text(unsigned long addr)
{
 if (addr >= (unsigned long)_text &&
     addr < (unsigned long)_etext)
  return 1;

 return 0;
}

static void walk_stackframe(struct pt_regs *regs, bool (*fn)(unsigned long, void *),
  void *arg)
{
 unsigned long sp, pc, fp;
 struct stackframe *frame;
 unsigned long low;

 if (regs) {
  pc = regs->sepc;
  sp = regs->sp;
  fp = regs->s0;
 } else {
  const register unsigned long current_sp __asm__ ("sp");
  sp = current_sp;
  pc = (unsigned long)walk_stackframe;
  fp = (unsigned long)__builtin_frame_address(0);
 }

 while (1) {
  if (!kernel_text(pc) || (fn)(pc, arg))
   break;


  low = sp + sizeof(struct stackframe);
  if ((fp < low || fp & 0x7))
   break;





  frame = (struct stackframe *)(fp - 16);
  sp = fp;
  fp = frame->fp;

  pc = frame->ra - 0x4;
 }
}

void show_stack(struct pt_regs *regs)
{
 printk("Call Trace:\n");
 walk_stackframe(regs, print_trace_address, ((void *)0));
}

void dump_stack(struct pt_regs *regs)
{
 show_stack(regs);
}
