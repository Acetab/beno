# 1 "gos/kernel.c"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "gos/kernel.c"
# 1 "include/uart.h" 1



void uart_init ( void );
char uart_recv ( void );
void uart_send ( char c );
void uart_send_string(char* str);
void putchar(char c);

void enable_uart_plic();
# 2 "gos/kernel.c" 2
# 1 "include/asm/irq.h" 1



# 1 "include/asm/csr.h" 1
# 5 "include/asm/irq.h" 2

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
# 3 "gos/kernel.c" 2
# 1 "gos/gos.h" 1



void vs_trap_init(void);
void vs_handle_timer_irq(void);
void vs_timer_init(void);
# 4 "gos/kernel.c" 2
# 1 "include/memset.h" 1



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
# 5 "include/memset.h" 2

void *memset(void *s, int c, size_t count);
# 5 "gos/kernel.c" 2
# 1 "include/printk.h" 1



void init_printk_done(void (*fn)(char c));

int printk(const char *fmt, ...);

struct pt_regs;
void print_symbol(unsigned long addr);
void panic(void);
void dump_stack(struct pt_regs *regs);
# 6 "gos/kernel.c" 2
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
# 7 "gos/kernel.c" 2
extern char bss_begin[], bss_end[];
static void clean_bss(void)
{
 unsigned long start = (unsigned long)bss_begin;
 unsigned long end = (unsigned long)bss_end;
 unsigned size = end - start;

 memset((void *)start, 0, size);
}

void kernel_main(void)
{
 clean_bss();
 uart_init();
 uart_send_string("Welcome GuestOS!\r\n");
 init_printk_done(putchar);
 printk("printk init done\n");

 vs_trap_init();

 plic_init();
 enable_uart_plic();
 arch_local_irq_enable();

 while (1) {
  ;
 }
}
