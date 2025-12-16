# 1 "src/kallsyms.c"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "src/kallsyms.c"
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
# 2 "src/kallsyms.c" 2
# 1 "include/printk.h" 1



void init_printk_done(void (*fn)(char c));

int printk(const char *fmt, ...);

struct pt_regs;
void print_symbol(unsigned long addr);
void panic(void);
void dump_stack(struct pt_regs *regs);
# 3 "src/kallsyms.c" 2
# 48 "src/kallsyms.c"
extern unsigned long kallsyms_addresses[] __attribute__((weak));


extern unsigned int kallsyms_num_syms __attribute__((weak));


extern u8 kallsyms_names[] __attribute__((weak));


extern u8 kallsyms_token_table[] __attribute__((weak));
extern u16 kallsyms_token_index[] __attribute__((weak));

extern unsigned int kallsyms_markers[] __attribute__((weak));

extern char _stext[], _etext[];

static int is_kernel(unsigned long addr)
{
 if (addr >= (unsigned long)_stext &&
   addr <= (unsigned long)_etext)
  return 1;
 else
  return 0;
}

static unsigned int get_symbol_offset(unsigned long pos)
{
 const u8 *name;
 int i;

 name = &kallsyms_names[kallsyms_markers[pos>>8]];

 for (i = 0; i < (pos & 0xFF); i++)
  name = name + (*name) + 1;

 return name - kallsyms_names;
}

static unsigned int kallsyms_expand_symbol(unsigned int off, char *result)
{
 int len, skipped_first = 0;
 u8 *tptr, *data;

 data = &kallsyms_names[off];
 len = *data;
 data++;

 off += len + 1;

 while (len) {
  tptr = &kallsyms_token_table[kallsyms_token_index[*data]];
  data++;
  len--;

  while (*tptr) {
   if (skipped_first) {
    *result = *tptr;
    result++;
   } else
    skipped_first = 1;
   tptr++;
  }
 }

 *result = '\0';

 return off;
}

const char *kallsyms_lookup(unsigned long addr, unsigned long *symbolsize,
  unsigned long *offset, char *namebuf)
{
 unsigned long i, low, high, mid;

 namebuf[128 -1] = 0;
 namebuf[0] = 0;

 if (is_kernel(addr)) {
  unsigned long symbol_end = 0;


  low = 0;
  high = kallsyms_num_syms;

  while (high - low > 1) {
   mid = (low + high)/2;
   if (kallsyms_addresses[mid] <= addr)
    low = mid;
   else
    high = mid;
  }


  kallsyms_expand_symbol(get_symbol_offset(low), namebuf);


  for (i = low + 1; i < kallsyms_num_syms; i++) {
   if (kallsyms_addresses[i] > kallsyms_addresses[low]) {
    symbol_end = kallsyms_addresses[i];
    break;
   }
  }

  *symbolsize = symbol_end - kallsyms_addresses[low];
  *offset = addr - kallsyms_addresses[low];
  return namebuf;
 }

 return ((void *)0);
}

void print_symbol(unsigned long addr)
{
 const char *name;
 unsigned long offset, size;
 char namebuf[128];

 name = kallsyms_lookup(addr, &size, &offset, namebuf);
 if (!name)
  printk("[<0x%016lx>] ", addr);
 else {
  printk("[<0x%016lx>] ", addr);
  printk("%s+0x%lx/0x%lx\n", name, offset, size);
 }
}
