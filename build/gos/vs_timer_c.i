# 1 "gos/vs_timer.c"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "gos/vs_timer.c"
# 1 "include/asm/csr.h" 1
# 2 "gos/vs_timer.c" 2
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
# 3 "gos/vs_timer.c" 2
# 1 "include/printk.h" 1



void init_printk_done(void (*fn)(char c));

int printk(const char *fmt, ...);

struct pt_regs;
void print_symbol(unsigned long addr);
void panic(void);
void dump_stack(struct pt_regs *regs);
# 4 "gos/vs_timer.c" 2
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
# 5 "gos/vs_timer.c" 2
# 1 "include/asm/timer.h" 1






void handle_timer_irq(void);
void timer_init(void);
unsigned long get_cycles(void);
# 6 "gos/vs_timer.c" 2
# 1 "include/io.h" 1
# 49 "include/io.h"
static inline void delay(unsigned int n)
{
 while(n--)
  ;
}
# 7 "gos/vs_timer.c" 2
# 1 "include/asm/clint.h" 1
# 8 "gos/vs_timer.c" 2

unsigned long volatile __attribute__((__aligned__(64))) vs_jiffies;





unsigned long vs_get_cycles(void)
{
 unsigned long n;

 asm volatile (
  "rdtime %0"
  : "=r" (n));
 return n;
}
# 33 "gos/vs_timer.c"
static void reset_timer()
{
 ({ unsigned long __v = (unsigned long)(0x20UL); __asm__ __volatile__ ("csrs ""sie"", %0" : : "rK" (__v) : "memory"); });
 sbi_set_timer(vs_get_cycles() + 10000000/50);
}

void vs_timer_init(void)
{
 reset_timer();
}

void vs_handle_timer_irq(void)
{
 ({ unsigned long __v = (unsigned long)(0x20UL); __asm__ __volatile__ ("csrc ""sie"", %0" : : "rK" (__v) : "memory"); });
 reset_timer();
 vs_jiffies++;
 printk("Virtual Core0 Timer interrupt received %lu\n", vs_jiffies);
}
