# 1 "lib/string.c"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "lib/string.c"

typedef unsigned int size_t;

size_t strlen(const char *s)
{
 const char *sc;

 for (sc = s; *sc != '\0'; ++sc)
  ;

 return sc - s;
}

void *memcpy(void *dest, const void *src, size_t count)
{
 char *tmp = dest;
 const char *s = src;

 while (count--)
  *tmp++ = *s++;
 return dest;
}
