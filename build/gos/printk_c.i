# 1 "gos/printk.c"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "gos/printk.c"
# 1 "/usr/lib/gcc-cross/riscv64-linux-gnu/9/include/stdarg.h" 1 3 4
# 40 "/usr/lib/gcc-cross/riscv64-linux-gnu/9/include/stdarg.h" 3 4

# 40 "/usr/lib/gcc-cross/riscv64-linux-gnu/9/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 99 "/usr/lib/gcc-cross/riscv64-linux-gnu/9/include/stdarg.h" 3 4
typedef __gnuc_va_list va_list;
# 2 "gos/printk.c" 2
# 1 "include/string.h" 1



# 1 "include/type.h" 1






# 6 "include/type.h"
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
# 5 "include/string.h" 2

void *memcpy(void *dest, const void *src, size_t count);
size_t strlen(const char *s);
# 3 "gos/printk.c" 2
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
# 4 "gos/printk.c" 2
# 1 "include/printk.h" 1



void init_printk_done(void (*fn)(char c));

int printk(const char *fmt, ...);

struct pt_regs;
void print_symbol(unsigned long addr);
void panic(void);
void dump_stack(struct pt_regs *regs);
# 5 "gos/printk.c" 2


static char print_buf[1024];




static char log_buf[(1 << 17)] = {0,};

enum printk_status {
 PRINTK_STATUS_DOWN,
 PRINTK_STATUS_READY,
};

static enum printk_status g_printk_status = PRINTK_STATUS_DOWN;
static char *g_record = log_buf;
static unsigned long g_record_len;
# 41 "gos/printk.c"
static const char *scan_number(const char *string, int *number)
{
 int tmp = 0;

 while (((*string) >= '0' && (*string) <= '9')) {
  tmp *= 10;
  tmp += *(string++) - '0';
 }

 *number = tmp;
 return string;
}

static char *number(char *str, unsigned long num, int base, int size, int precision
 , int type)
{
 char c, sign = 0, tmp[128];
 long snum;

 const char *digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
 int i;

 if (type & 64)
  digits = "0123456789abcdefghijklmnopqrstuvwxyz";
 if (type & 16)
  type &= ~1;
 if (base < 2 || base > 36)
  return 0;

 c = (type & 1) ? '0' : ' ';

 if (type & 2) {
  snum = (long)num;
  if (snum < 0) {
   sign = '-';
   num = -snum;
  } else if (type & 4) {
   sign = '+';
   size--;
  } else if (type & 8) {
   sign = ' ';
   size--;
  }
 }

 if (type & 32) {
  if (base == 16)
   size -= 2;
  else if (base == 8)
   size--;
 }

 i = 0;
 if (num == 0)
  tmp[i++] = '0';
 else
  while (num != 0)
   tmp[i++] = digits[({ unsigned int __base = (base); unsigned int __rem; __rem = ((unsigned long)(num)) % __base; (num) = ((unsigned long)(num)) / __base; __rem; })];
 if (i > precision)
  precision = i;
 size -= precision;
 if (!(type&(1 +16)))
  while (size-- > 0)
   *str++ = ' ';
 if (sign)
  *str++ = sign;

 if (type & 32) {
  if (base == 8)
   *str++ = '0';
  else if (base == 16) {
   *str++ = '0';
   *str++ = digits[33];
  }
 }

 if (!(type & 16))
  while (size-- > 0)
   *str++ = c;
 while (i < precision--)
  *str++ = '0';
 while (i-- > 0)
  *str++ = tmp[i];
 while (size-- > 0)
  *str++ = ' ';

 return str;
}
# 145 "gos/printk.c"
int myprintf(char *string, unsigned int size,
  const char *fmt, va_list arg)
{
 char *pos;
 int flags;
 int field_width;
 int precision;
 int qualifier;
 char *ip;
 char *s;
 int i;
 int len;
 unsigned long num;
 int base;

 pos = string;

 for (; *fmt; fmt++) {
  if (*fmt != '%') {
   *pos++ = *fmt;
   continue;
  }


  flags = 0;
repeat:
  ++fmt;
  switch (*fmt) {
  case '-':
   flags |= 16;
   goto repeat;
  case '+':
   flags |= 4;
   goto repeat;
  case ' ':
   flags |= 8;
   goto repeat;
  case '#':
   flags |= 32;
   goto repeat;
  case '0':
   flags |= 1;
   goto repeat;
  }


  field_width = -1;
  if (((*fmt) >= '0' && (*fmt) <= '9')) {
   fmt = scan_number(fmt, &field_width);
  } else if (*fmt == '*') {
   field_width = 
# 195 "gos/printk.c" 3 4
                __builtin_va_arg(
# 195 "gos/printk.c"
                arg
# 195 "gos/printk.c" 3 4
                ,
# 195 "gos/printk.c"
                int
# 195 "gos/printk.c" 3 4
                )
# 195 "gos/printk.c"
                                ;
   if (field_width < 0) {
    field_width = -field_width;
    flags |= 16;
   }
  }


  precision = -1;
  if (*fmt == '.') {
   ++fmt;
   if (((*fmt) >= '0' && (*fmt) <= '9'))
    fmt = scan_number(fmt, &precision);
   else if (*fmt == '*')
    precision = 
# 209 "gos/printk.c" 3 4
               __builtin_va_arg(
# 209 "gos/printk.c"
               arg
# 209 "gos/printk.c" 3 4
               ,
# 209 "gos/printk.c"
               int
# 209 "gos/printk.c" 3 4
               )
# 209 "gos/printk.c"
                               ;
   if (precision < 0)
    precision = 0;
  }





  qualifier = -1;
  if (*fmt == 'h' || *fmt == 'l' || *fmt == 'L') {
   qualifier = *fmt;
   ++fmt;

   if (qualifier == 'l' && *fmt == 'l') {
    qualifier = 'L';
    ++fmt;
   }
  }

  switch (*fmt) {

  case 'c':
   if (!(flags & 16))
    while (--field_width > 0)
     *pos++ = ' ';
   *pos++ = (unsigned char)
# 235 "gos/printk.c" 3 4
                          __builtin_va_arg(
# 235 "gos/printk.c"
                          arg
# 235 "gos/printk.c" 3 4
                          ,
# 235 "gos/printk.c"
                          int
# 235 "gos/printk.c" 3 4
                          )
# 235 "gos/printk.c"
                                          ;
   while (--field_width > 0)
    *pos++ = ' ';

   continue;


  case 's':
   s = 
# 243 "gos/printk.c" 3 4
      __builtin_va_arg(
# 243 "gos/printk.c"
      arg
# 243 "gos/printk.c" 3 4
      ,
# 243 "gos/printk.c"
      char *
# 243 "gos/printk.c" 3 4
      )
# 243 "gos/printk.c"
                         ;
   if (!s)
    s = "<NULL>";
   len = strlen(s);
   if (precision < 0)
    precision = len;
   else if (len > precision)
    len = precision;

   if (!(flags & 16))
    while (len < field_width--)
     *pos++ = ' ';
   for (i = 0; i < len; i++)
    *pos++ = *s++;
   while (len < field_width--)
    *pos++ = ' ';
   continue;





  case 'n':
   ip = (char *)
# 266 "gos/printk.c" 3 4
               __builtin_va_arg(
# 266 "gos/printk.c"
               arg
# 266 "gos/printk.c" 3 4
               ,
# 266 "gos/printk.c"
               int *
# 266 "gos/printk.c" 3 4
               )
# 266 "gos/printk.c"
                                 ;
   *ip = (pos - string);
   continue;




  case 'p':
   if (field_width == -1) {
    field_width = 2 * sizeof(void *);
    flags |= 1;
   }
   pos = number(pos,
    (unsigned long)
# 279 "gos/printk.c" 3 4
                  __builtin_va_arg(
# 279 "gos/printk.c"
                  arg
# 279 "gos/printk.c" 3 4
                  ,
# 279 "gos/printk.c"
                  void *
# 279 "gos/printk.c" 3 4
                  )
# 279 "gos/printk.c"
                                     ,
    16, field_width, precision, flags);
   continue;


  case 'o':
   base = 8;
   break;

  case 'x':
   flags |= 64;
  case 'X':
   base = 16;
   break;

  case 'd':
  case 'i':
   flags |= 2;

  case 'u':
   base = 10;
   break;

  default:
   if (*fmt != '%')
    *pos++ = '%';
   if (*fmt)
    *pos++ = *fmt;
   else
    --fmt;
   break;
  }

  if (qualifier == 'L') {
   if (flags & 2)
    num = 
# 314 "gos/printk.c" 3 4
         __builtin_va_arg(
# 314 "gos/printk.c"
         arg
# 314 "gos/printk.c" 3 4
         ,
# 314 "gos/printk.c"
         long
# 314 "gos/printk.c" 3 4
         )
# 314 "gos/printk.c"
                          ;
   else
    num = 
# 316 "gos/printk.c" 3 4
         __builtin_va_arg(
# 316 "gos/printk.c"
         arg
# 316 "gos/printk.c" 3 4
         ,
# 316 "gos/printk.c"
         long
# 316 "gos/printk.c" 3 4
         )
# 316 "gos/printk.c"
                          ;
  } else if (qualifier == 'h') {
   if (flags & 2)
    num = (short)
# 319 "gos/printk.c" 3 4
                __builtin_va_arg(
# 319 "gos/printk.c"
                arg
# 319 "gos/printk.c" 3 4
                ,
# 319 "gos/printk.c"
                int
# 319 "gos/printk.c" 3 4
                )
# 319 "gos/printk.c"
                                ;
   else
    num = (unsigned short)
# 321 "gos/printk.c" 3 4
                         __builtin_va_arg(
# 321 "gos/printk.c"
                         arg
# 321 "gos/printk.c" 3 4
                         ,
# 321 "gos/printk.c"
                         unsigned int
# 321 "gos/printk.c" 3 4
                         )
# 321 "gos/printk.c"
                                                  ;
  } else if (qualifier == 'l') {
   if (flags & 2)
    num = 
# 324 "gos/printk.c" 3 4
         __builtin_va_arg(
# 324 "gos/printk.c"
         arg
# 324 "gos/printk.c" 3 4
         ,
# 324 "gos/printk.c"
         long
# 324 "gos/printk.c" 3 4
         )
# 324 "gos/printk.c"
                          ;
   else
    num = 
# 326 "gos/printk.c" 3 4
         __builtin_va_arg(
# 326 "gos/printk.c"
         arg
# 326 "gos/printk.c" 3 4
         ,
# 326 "gos/printk.c"
         unsigned long
# 326 "gos/printk.c" 3 4
         )
# 326 "gos/printk.c"
                                   ;
  } else {
   if (flags & 2)
    num = (int)
# 329 "gos/printk.c" 3 4
              __builtin_va_arg(
# 329 "gos/printk.c"
              arg
# 329 "gos/printk.c" 3 4
              ,
# 329 "gos/printk.c"
              int
# 329 "gos/printk.c" 3 4
              )
# 329 "gos/printk.c"
                              ;
   else
    num = 
# 331 "gos/printk.c" 3 4
         __builtin_va_arg(
# 331 "gos/printk.c"
         arg
# 331 "gos/printk.c" 3 4
         ,
# 331 "gos/printk.c"
         unsigned int
# 331 "gos/printk.c" 3 4
         )
# 331 "gos/printk.c"
                                  ;
  }
  pos = number(pos, num, base, field_width, precision, flags);
 }

 *pos = '\0';
 return pos - string;
}

static void (*putchar_fn)(char c);

void init_printk_done(void (*fn)(char c))
{
 unsigned long i;

 putchar_fn = fn;

 g_printk_status = PRINTK_STATUS_READY;

 for (i = 0; i < g_record_len; i++)
  putchar_fn(log_buf[i]);

 g_record = log_buf;
 g_record_len = 0;
}

int printk(const char *fmt, ...)
{
 va_list arg;
 int len;
 int i;

 
# 363 "gos/printk.c" 3 4
__builtin_va_start(
# 363 "gos/printk.c"
arg
# 363 "gos/printk.c" 3 4
,
# 363 "gos/printk.c"
fmt
# 363 "gos/printk.c" 3 4
)
# 363 "gos/printk.c"
                  ;
 len = myprintf(print_buf, sizeof(print_buf), fmt, arg);
 
# 365 "gos/printk.c" 3 4
__builtin_va_end(
# 365 "gos/printk.c"
arg
# 365 "gos/printk.c" 3 4
)
# 365 "gos/printk.c"
           ;


 if (g_printk_status == PRINTK_STATUS_DOWN) {
  memcpy(g_record, print_buf, len);
  g_record = log_buf + len;
  g_record_len += len;

  return 0;
 }

 for (i = 0; i < len; i++) {
  putchar_fn(print_buf[i]);
  if (i > sizeof(print_buf))
   break;
 }
 return len;
}
