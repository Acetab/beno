# 1 "src/memset.c"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "src/memset.c"
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
# 2 "src/memset.c" 2

extern void *__memset_16bytes_asm(void *s, unsigned long val, unsigned long count);

static void __memset_16bytes_inline_asm(void *p, unsigned long val,
  int count)
{
 int i = 0;

 asm volatile (
   "1: sd %[val], (%[p])\n"
   "sd %[val], 8(%[p])\n"
   "addi %[i], %[i], 16\n"
   "blt %[i], %[count], 1b"
   : [p] "+r" (p), [count]"+r" (count), [i]"+r" (i)
   : [val]"r" (val)
   : "memory"
       );
}

static void *__memset_1bytes(void *s, int c, size_t count)
{
 char *xs = s;

 while (count--)
  *xs++ = c;
 return s;
}

static void *__memset(char *s, int c, size_t count)
{
 char *p = s;
 unsigned long align = 16;
 size_t size, left = count;
 int n, i;
 unsigned long address = (unsigned long)p;
 unsigned long data = 0ULL;




 for (i = 0; i < 8; i++)
  data |= (((unsigned long)c) & 0xff) << (i * 8);


 if (address & (align - 1)) {
  size = address & (align - 1);
  size = align - size;
  __memset_1bytes(p, c, size);
  p = p + size;
  left = count - size;
 }


 if (left > align) {
  n = left / align;
  left = left % align;




  __memset_16bytes_inline_asm(p, data, 16*n);


  if (left)
   __memset_1bytes(p + 16*n, c, left);
 }

 return s;
}

void *memset(void *s, int c, size_t count)
{
 return __memset(s, c, count);
}
