# 1 "src/timer.c"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "src/timer.c"
# 1 "include/asm/csr.h" 1
# 2 "src/timer.c" 2
# 1 "include/asm/sbi.h" 1
# 32 "include/asm/sbi.h"
static inline void sbi_set_timer(unsigned long stime_value)
{
 ({ register unsigned long a0 asm ("a0") = (unsigned long)(stime_value); register unsigned long a1 asm ("a1") = (unsigned long)(0); register unsigned long a2 asm ("a2") = (unsigned long)(0); register unsigned long a7 asm ("a7") = (unsigned long)(0); asm volatile ("ecall" : "+r" (a0) : "r" (a1), "r" (a2), "r" (a7) : "memory"); a0; });
}

static inline void sbi_putchar(char c)
{
 ({ register unsigned long a0 asm ("a0") = (unsigned long)(c); register unsigned long a1 asm ("a1") = (unsigned long)(0); register unsigned long a2 asm ("a2") = (unsigned long)(0); register unsigned long a7 asm ("a7") = (unsigned long)(0x1); asm volatile ("ecall" : "+r" (a0) : "r" (a1), "r" (a2), "r" (a7) : "memory"); a0; });
}

static inline void sbi_put_string(char *str)
{
 int i;

 for (i = 0; str[i] != '\0'; i++)
  sbi_putchar((char) str[i]);
}
# 3 "src/timer.c" 2
# 1 "include/printk.h" 1



void init_printk_done(void (*fn)(char c));

int printk(const char *fmt, ...);

struct pt_regs;
void print_symbol(unsigned long addr);
void panic(void);
void dump_stack(struct pt_regs *regs);
# 4 "src/timer.c" 2
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
# 5 "src/timer.c" 2
# 1 "include/asm/timer.h" 1






void handle_timer_irq(void);
void timer_init(void);
unsigned long get_cycles(void);
# 6 "src/timer.c" 2
# 1 "include/io.h" 1
# 49 "include/io.h"
static inline void delay(unsigned int n)
{
 while(n--)
  ;
}
# 7 "src/timer.c" 2
# 1 "include/asm/clint.h" 1
# 8 "src/timer.c" 2
# 1 "include/asm/trap.h" 1
# 9 "src/timer.c" 2

void riscv_vcpu_clear_interrupt(int intr);
void riscv_vcpu_timer_event_start(unsigned long next_cycle);

unsigned long volatile __attribute__((__aligned__(64))) jiffies;

unsigned long vcpu_time_delta;
unsigned long vcpu_next_cycle;
int vcpu_timer_init;

unsigned long riscv_vcpu_current_cycles()
{
 return get_cycles() + vcpu_time_delta;
}

void riscv_vcpu_timer_event_start(unsigned long next_cycle)
{
 riscv_vcpu_clear_interrupt(6);
 vcpu_next_cycle = next_cycle;
 vcpu_timer_init = 1;
}

void riscv_vcpu_set_interrupt(int intr)
{
 ({ unsigned long __v = (unsigned long)(1UL << intr); __asm__ __volatile__ ("csrs ""0x645"", %0" : : "rK" (__v) : "memory"); });
}

void riscv_vcpu_clear_interrupt(int intr)
{
 ({ unsigned long __v = (unsigned long)(1UL << intr); __asm__ __volatile__ ("csrc ""0x645"", %0" : : "rK" (__v) : "memory"); });
}

void riscv_vcpu_check_timer_expired(void)
{
 unsigned long val;

 if (!vcpu_timer_init)
  return;
 val = riscv_vcpu_current_cycles();

 if (val < vcpu_next_cycle)
  return;


 riscv_vcpu_set_interrupt(6);
 vcpu_timer_init = 0;
}

void riscv_vcpu_timer_init(void)
{
 vcpu_time_delta = 0;
 ({ unsigned long __v = (unsigned long)(vcpu_time_delta); __asm__ __volatile__ ("csrw ""0x605"", %0" : : "rK" (__v) : "memory"); });
}
# 74 "src/timer.c"
unsigned long get_cycles(void)
{
 return ({ unsigned long __v = (*(volatile unsigned long *)((0x2000000 + 0xbff8))); __asm__ __volatile__ ("" : : : "memory"); __v; });
}


void reset_timer()
{

 ({ unsigned long __v = (unsigned long)(0x20UL); __asm__ __volatile__ ("csrs ""sie"", %0" : : "rK" (__v) : "memory"); });
 sbi_set_timer(get_cycles() + 10000000/100);
}


void timer_init(void)
{
 reset_timer();
}

void handle_timer_irq(void)
{
 ({ unsigned long __v = (unsigned long)(0x20UL); __asm__ __volatile__ ("csrc ""sie"", %0" : : "rK" (__v) : "memory"); });
 riscv_vcpu_check_timer_expired();
 jiffies++;

 tick_handle_periodic();
 reset_timer();
}
