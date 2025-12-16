# 1 "gos/uart.c"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "gos/uart.c"
# 1 "include/asm/uart.h" 1
# 2 "gos/uart.c" 2
# 1 "include/io.h" 1
# 49 "include/io.h"
static inline void delay(unsigned int n)
{
 while(n--)
  ;
}
# 3 "gos/uart.c" 2
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
# 4 "gos/uart.c" 2
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
# 5 "gos/uart.c" 2
# 1 "include/printk.h" 1



void init_printk_done(void (*fn)(char c));

int printk(const char *fmt, ...);

struct pt_regs;
void print_symbol(unsigned long addr);
void panic(void);
void dump_stack(struct pt_regs *regs);
# 6 "gos/uart.c" 2

void uart_send(char c)
{
 while((({ unsigned char __v = (*(volatile unsigned char *)((0x10000000 +0x05))); __asm__ __volatile__ ("" : : : "memory"); __v; }) & 0x40) == 0)
  ;

 ({ unsigned char __v = c; __asm__ __volatile__ ("" : : : "memory"); (*(volatile unsigned char *)((0x10000000 +0x00)) = (__v));});
}

char uart_get(void)
{
 if (({ unsigned char __v = (*(volatile unsigned char *)((0x10000000 +0x05))); __asm__ __volatile__ ("" : : : "memory"); __v; }) & 0x01)
  return ({ unsigned char __v = (*(volatile unsigned char *)((0x10000000 +0x00))); __asm__ __volatile__ ("" : : : "memory"); __v; });
 else
  return -1;
}

void uart_send_string(char *str)
{
 int i;

 for (i = 0; str[i] != '\0'; i++)
  uart_send((char) str[i]);
}

void putchar(char c)
{
       if (c == '\n')
               uart_send('\r');
       uart_send(c);
}

static unsigned int uart16550_clock = 1843200;


void uart_init(void)
{
 unsigned int divisor = uart16550_clock / (16 * 115200);


 ({ unsigned char __v = 0; __asm__ __volatile__ ("" : : : "memory"); (*(volatile unsigned char *)((0x10000000 +0x01)) = (__v));});


 ({ unsigned char __v = 0x80; __asm__ __volatile__ ("" : : : "memory"); (*(volatile unsigned char *)((0x10000000 +0x03)) = (__v));});
 ({ unsigned char __v = (unsigned char)divisor; __asm__ __volatile__ ("" : : : "memory"); (*(volatile unsigned char *)((0x10000000 +0x00)) = (__v));});
 ({ unsigned char __v = (unsigned char)(divisor >> 8); __asm__ __volatile__ ("" : : : "memory"); (*(volatile unsigned char *)((0x10000000 +0x01)) = (__v));});


 ({ unsigned char __v = 0x3; __asm__ __volatile__ ("" : : : "memory"); (*(volatile unsigned char *)((0x10000000 +0x03)) = (__v));});


 ({ unsigned char __v = 0xc7; __asm__ __volatile__ ("" : : : "memory"); (*(volatile unsigned char *)((0x10000000 +0x02)) = (__v));});


 ({ unsigned char __v = 0x1; __asm__ __volatile__ ("" : : : "memory"); (*(volatile unsigned char *)((0x10000000 +0x01)) = (__v));});
}

void handle_uart_irq(void)
{
 char c;

 c = uart_get();
 if (c < 0)
  return;
 else if (c == '\r') {
  printk("gos: %s occurred\n", __func__);
 }
}

void enable_uart_plic()
{

 int cpu = 0;

 uart_init();

 plic_enable_irq(cpu, (10), 1);
}
