# 1 "src/fs.c"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "src/fs.c"
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
# 2 "src/fs.c" 2
# 1 "include/printk.h" 1



void init_printk_done(void (*fn)(char c));

int printk(const char *fmt, ...);

struct pt_regs;
void print_symbol(unsigned long addr);
void panic(void);
void dump_stack(struct pt_regs *regs);
# 3 "src/fs.c" 2

long sys_open(const char *filename, int flags, int mode)
{
 printk("%s\n", __func__);

 return 0;
}

long sys_close(unsigned int fd)
{
 printk("%s\n", __func__);

 return 0;
}

int sys_read(unsigned int fd, char *buf, size_t count)
{
 printk("%s\n", __func__);

 return 0;
}

int sys_write(unsigned int fd, char *buf, size_t count)
{
 printk("%s\n", __func__);

 return 0;
}
