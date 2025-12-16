#include "uart.h"
#include "type.h"
#include "memset.h"
#include "printk.h"
#include "asm/csr.h"
#include "io.h"
#include "asm/sbi.h"
#include "asm/timer.h"
#include "asm/irq.h"
#include "asm/plic.h"
#include "asm/memory.h"
#include "asm/pgtable.h"
#include "sched.h"
#include "../usr/syscall.h"

extern void load_store_test(void);
extern void shift_test(void);
extern void add_sub_test(void);
extern void branch_test(void);
extern void my_memcpy_test(void);
extern unsigned long compare_and_return(unsigned long a, unsigned long b);
extern unsigned long sel_test(unsigned long a, unsigned long b); 
extern void bl_test();
extern unsigned long macro_test_1(long a, long b);
extern unsigned long macro_test_2(long a, long b);

extern unsigned long func_addr[];
extern unsigned long func_num_syms;
extern char func_string;
extern void trap_init(void);
extern void trigger_load_access_fault();

/* 声明用户程序入口 (实验6关键) */
extern void my_user_app(void);

static int print_func_name(unsigned long addr)
{
    int i;
    char *p, *string;

    for (i = 0; i < func_num_syms; i++) {
        if (addr == func_addr[i])
            goto found;
    }

    return 0;

found:
    p = &func_string;
    
    if (i == 0) {
        string = p;
        goto done;
    }

    while (1) {
        p++;

        if (*p == '\0')
            i--;

        if (i == 0) {
            p++;
            string = p;
            break;
        }
    }

done:
    printk("<0x%lx> %s\n", addr, string);

    return 0;
}

#define MY_OPS(ops, asm_ops) \
static inline void my_asm_##ops(unsigned long mask, void *p) \
{                                                         \
    unsigned long tmp = 0;                                \
    asm volatile (                                        \
            "ld %[tmp], (%[p])\n"              \
            " "#asm_ops" %[tmp], %[tmp], %[mask]\n"    \
            "sd %[tmp], (%[p])\n"               \
            : [p] "+r"(p), [tmp]"+r" (tmp)          \
            : [mask]"r" (mask)                   \
            : "memory"                       \
             );                                           \
}

MY_OPS(orr, or)
MY_OPS(and, and)
MY_OPS(add, add)

extern char _text_boot[], _etext_boot[];
extern char _text[], _etext[];
extern char _rodata[], _erodata[];
extern char _data[], _edata[];
extern char _bss[], _ebss[];

static void print_mem(void)
{
    printk("BenOS image layout:\n");
    printk("  .text.boot: 0x%08lx - 0x%08lx (%6ld B)\n",
            (unsigned long)_text_boot, (unsigned long)_etext_boot,
            (unsigned long)(_etext_boot - _text_boot));
    printk("       .text: 0x%08lx - 0x%08lx (%6ld B)\n",
            (unsigned long)_text, (unsigned long)_etext,
            (unsigned long)(_etext - _text));
    printk("     .rodata: 0x%08lx - 0x%08lx (%6ld B)\n",
            (unsigned long)_rodata, (unsigned long)_erodata,
            (unsigned long)(_erodata - _rodata));
    printk("       .data: 0x%08lx - 0x%08lx (%6ld B)\n",
            (unsigned long)_data, (unsigned long)_edata,
            (unsigned long)(_edata - _data));
    printk("        .bss: 0x%08lx - 0x%08lx (%6ld B)\n",
            (unsigned long)_bss, (unsigned long)_ebss,
            (unsigned long)(_ebss - _bss));
}

static void clean_bss(void)
{
    unsigned long start = (unsigned long)_bss;
    unsigned long end = (unsigned long)_ebss;
    unsigned size = end - start;

    memset((void *)start, 0, size);
}

extern union task_union init_task_union;

/* * 唯一的 kernel_main 函数
 */
void kernel_main(void)
{
    /* 1. 基础初始化 */
    clean_bss();
    sbi_put_string("Welcome RISC-V!\r\n");

    /* 注意：根据实验6要求，如果我们在boot.S禁用了MMU，
       这里的 mem_init 和 paging_init 可能需要注释掉，或者保留但不开启satp。
       为了防止出错，我们暂时只保留基础IO和中断初始化。
    */
    // mem_init((unsigned long)_ebss, DDR_END);
    // paging_init();

    uart_init();
    init_printk_done(putchar);
    printk("printk init done\n");

    /* 2. 初始化异常向量表 (非常重要，否则系统调用会崩) */
    trap_init();
    printk("trap init done\n");

    print_mem();
    
    // timer_init(); // 如果不需要时钟中断测试，可以先注释掉

    printk("System init done. Preparing to jump to User App...\n");

    /* 3. 实验6的核心逻辑：跳转到用户态 */
    
    unsigned long mstatus = read_csr(sstatus);
    /* 清除 SPP 位 (设置为 0)，这样 sret 后会进入 User 模式 */
    mstatus &= ~SR_SPP; 
    /* 开启 User 模式中断使能 (可选) */
    mstatus |= SR_SPIE; 
    /* 关闭 SUM (禁止内核访问用户页，虽然没有MMU时这个位意义不大，但保持规范) */
    mstatus &= ~SR_SUM;

    write_csr(sstatus, mstatus);

    /* 设置 sepc 为用户程序入口地址 */
    write_csr(sepc, (unsigned long)my_user_app);

    printk("Executing sret to jump to 0x%lx...\n", (unsigned long)my_user_app);

    /* 执行 sret，硬件会跳转到 sepc 并切换到 U 模式 */
    asm volatile("sret");

    /* 如果跳转成功，永远不会运行到这里 */
    while (1) {
        ;
    }
}
