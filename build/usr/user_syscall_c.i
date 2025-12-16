# 1 "usr/user_syscall.c"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "usr/user_syscall.c"
# 1 "include/uapi/syscall.h" 1
# 2 "usr/user_syscall.c" 2
# 1 "usr/syscall.h" 1



extern unsigned long syscall(int nr, ...);

unsigned long malloc(void);

extern int __clone(int (*fn)(void *arg), void *child_stack,
  int flags, void *arg);
extern unsigned long syscall(int nr, ...);

int clone(int (*fn)(void *arg), void *child_stack,
  int flags, void *arg);
# 3 "usr/user_syscall.c" 2

int clone(int (*fn)(void *arg), void *child_stack,
  int flags, void *arg)
{

 return __clone(fn, child_stack, flags, arg);
}

unsigned long malloc(void)
{
 return syscall(5);
}
