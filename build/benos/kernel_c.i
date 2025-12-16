# 1 "src/kernel.c"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "src/kernel.c"
# 1 "include/uart.h" 1



void uart_init ( void );
char uart_recv ( void );
void uart_send ( char c );
void uart_send_string(char* str);
void putchar(char c);

void enable_uart_plic();
# 2 "src/kernel.c" 2
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
# 3 "src/kernel.c" 2
# 1 "include/memset.h" 1



# 1 "include/type.h" 1
# 5 "include/memset.h" 2

void *memset(void *s, int c, size_t count);
# 4 "src/kernel.c" 2
# 1 "include/printk.h" 1



void init_printk_done(void (*fn)(char c));

int printk(const char *fmt, ...);

struct pt_regs;
void print_symbol(unsigned long addr);
void panic(void);
void dump_stack(struct pt_regs *regs);
# 5 "src/kernel.c" 2
# 1 "include/asm/csr.h" 1
# 6 "src/kernel.c" 2
# 1 "include/io.h" 1
# 49 "include/io.h"
static inline void delay(unsigned int n)
{
 while(n--)
  ;
}
# 7 "src/kernel.c" 2
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
# 8 "src/kernel.c" 2
# 1 "include/asm/timer.h" 1






void handle_timer_irq(void);
void timer_init(void);
unsigned long get_cycles(void);
# 9 "src/kernel.c" 2
# 1 "include/asm/irq.h" 1





extern void handle_uart_irq(void);


static inline void arch_local_irq_enable(void)
{
 ({ unsigned long __v = (unsigned long)(0x2UL); __asm__ __volatile__ ("csrs ""sstatus"", %0" : : "rK" (__v) : "memory"); });
}


static inline void arch_local_irq_disable(void)
{
 ({ unsigned long __v = (unsigned long)(0x2UL); __asm__ __volatile__ ("csrc ""sstatus"", %0" : : "rK" (__v) : "memory"); });
}

static inline void enable_external_irq(void)
{
 ({ unsigned long __v = (unsigned long)(0x200UL); __asm__ __volatile__ ("csrs ""sie"", %0" : : "rK" (__v) : "memory"); });
}
# 10 "src/kernel.c" 2
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
# 11 "src/kernel.c" 2
# 1 "include/asm/memory.h" 1



# 1 "include/mm.h" 1
# 18 "include/mm.h"
# 1 "include/asm/pgtable.h" 1



# 1 "include/asm/pgtable_types.h" 1





typedef u64 pteval_t;
typedef u64 pmdval_t;
typedef u64 pudval_t;
typedef u64 pgdval_t;

typedef struct {
 pteval_t pte;
} pte_t;



typedef struct {
 pmdval_t pmd;
} pmd_t;



typedef struct {
 pudval_t pud;
} pud_t;



typedef struct {
 pgdval_t pgd;
} pgd_t;



typedef struct {
 unsigned long pgprot;
} pgprot_t;
# 5 "include/asm/pgtable.h" 2
# 1 "include/asm/pgtable_hwdef.h" 1
# 6 "include/asm/pgtable.h" 2
# 1 "include/mm.h" 1
# 7 "include/asm/pgtable.h" 2
# 60 "include/asm/pgtable.h"
static inline unsigned long pgd_page_paddr(pgd_t pgd)
{
 return (((pgd).pgd) >> 10) << 12;
}




static inline pmd_t *get_pmdp_from_pgdp(pgd_t *pgdp, unsigned long va)
{
 pmd_t *pmd_base;


 unsigned long index = ((va) >> 21 & ((1 << (30 - 21)) - 1));


 pmd_base = (pmd_t *)pgd_page_paddr(*pgdp);


 return pmd_base + index;
}

static inline unsigned long pmd_page_paddr(pmd_t pmd)
{
 return (((pmd).pmd) >> 10) << 12;
}



static inline pte_t *get_ptep_from_pmdp(pmd_t *pmdp, unsigned long va)
{
 pte_t *pte_base;


 unsigned long index = (((va) >> 12) & (((1 << 12) / sizeof(pte_t)) - 1));


 pte_base = (pte_t *)pmd_page_paddr(*pmdp);


 return pte_base + index;
}

static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
{
 *pgdp = pgd;
}

static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
{
 *pmdp = pmd;
}

static inline void set_pte(pte_t *ptep, pte_t pte)
{
 *ptep = pte;
}

static inline pgd_t pfn_pgd(unsigned long pfn, pgprot_t prot)
{
 return ((pgd_t) { ((pfn << 10) | ((prot).pgprot)) });
}

static inline unsigned long _pgd_pfn(pgd_t pgd)
{
 return ((pgd).pgd) >> 10;
}

static inline pmd_t pfn_pmd(unsigned long pfn, pgprot_t prot)
{
 return ((pmd_t) { ((pfn << 10) | ((prot).pgprot)) });
}

static inline unsigned long _pmd_pfn(pmd_t pmd)
{
 return ((pmd).pmd) >> 10;
}

static inline pte_t pfn_pte(unsigned long pfn, pgprot_t prot)
{
 return ((pte_t) { ((pfn << 10) | ((prot).pgprot)) });
}

static inline int pmd_present(pmd_t pmd)
{
       return (((pmd).pmd) & (1 << 0) );
}

static inline int pmd_leaf(pmd_t pmd)
{
       return pmd_present(pmd) && (((pmd).pmd) & ((1 << 1) | (1 << 2) | (1 << 3)));
}

static inline int pte_write(pte_t pte)
{
 return ((pte).pte) & (1 << 2);
}

static inline int pte_exec(pte_t pte)
{
 return ((pte).pte) & (1 << 3);
}

static inline int pte_dirty(pte_t pte)
{
 return ((pte).pte) & (1 << 7);
}

static inline int pte_young(pte_t pte)
{
 return ((pte).pte) & (1 << 6);
}

static inline pte_t pte_wrprotect(pte_t pte)
{
 return ((pte_t) { (((pte).pte) & ~((1 << 2))) });
}

static inline pte_t pte_mkwrite(pte_t pte)
{
 return ((pte_t) { (((pte).pte) | (1 << 2)) });
}

static inline pte_t pte_mkdirty(pte_t pte)
{
 return ((pte_t) { (((pte).pte) | (1 << 7)) });
}

static inline pte_t pte_mkclean(pte_t pte)
{
 return ((pte_t) { (((pte).pte) & ~((1 << 7))) });
}

static inline pte_t pte_mkyoung(pte_t pte)
{
 return ((pte_t) { (((pte).pte) | (1 << 6)) });
}

void dump_pgtable(void);
void walk_pgd(pgd_t *pgd, unsigned long start, unsigned long size);
# 19 "include/mm.h" 2
# 1 "include/asm/ptregs.h" 1
# 20 "include/mm.h" 2

void paging_init(void);
void enable_mmu_relocate(void);

unsigned long get_free_page(void);
void free_page(unsigned long p);
void mem_init(unsigned long start_mem, unsigned long end_mem);

void __create_pgd_mapping(pgd_t *pgdir, unsigned long phys,
  unsigned long virt, unsigned long size,
  pgprot_t prot,
  unsigned long (*alloc_pgtable)(void),
  unsigned long flags);

void set_stage2_page_mapping(unsigned long gpa, unsigned long hpa, unsigned long size, pgprot_t prot);
void write_stage2_pg_reg(void);
void stage2_page_fault(struct pt_regs *regs);
# 5 "include/asm/memory.h" 2
# 12 "src/kernel.c" 2
# 1 "include/asm/pgtable.h" 1
# 13 "src/kernel.c" 2
# 1 "include/sched.h" 1
# 9 "include/sched.h"
# 1 "include/asm/processor.h" 1
# 15 "include/asm/processor.h"
struct cpu_context {
 unsigned long ra;
 unsigned long sp;


 unsigned long s[12];
};
# 10 "include/sched.h" 2



# 1 "include/list.h" 1


struct list_head {
 struct list_head *next, *prev;
};
# 16 "include/list.h"
static inline void INIT_LIST_HEAD(struct list_head *list)
{
 list->next = list;
 list->prev = list;
}

static inline void __list_add(struct list_head *new, struct list_head *prev,
  struct list_head *next)
{
 next->prev = new;
 new->next = next;
 new->prev = prev;
 prev->next = new;
}

static inline void list_add(struct list_head *new, struct list_head *head)
{
 __list_add(new, head, head->next);
}

static inline void list_add_tail(struct list_head *new, struct list_head *head)
{
 __list_add(new, head->prev, head);
}

static inline void __list_del(struct list_head *prev, struct list_head *next)
{
 next->prev = prev;
 prev->next = next;

}

static inline void list_del(struct list_head *entry)
{
 __list_del(entry->prev, entry->next);
 entry->next = ((void *) 0x00100100 + 0xdead000000000000);
 entry->prev = ((void *) 0x00200200 + 0xdead000000000000);
}

static inline int list_empty(struct list_head *head)
{
 return head->next == head;
}
# 14 "include/sched.h" 2


struct task_struct;
struct run_queue;

struct sched_class {
 const struct sched_class *next;

 void (*task_fork)(struct task_struct *p);
 void (*enqueue_task)(struct run_queue *rq, struct task_struct *p);
 void (*dequeue_task)(struct run_queue *rq, struct task_struct *p);
 void (*task_tick)(struct run_queue *rq, struct task_struct *p);
 struct task_struct * (*pick_next_task)(struct run_queue *rq,
   struct task_struct *prev);
};

struct run_queue {
 struct list_head rq_head;
 unsigned int nr_running;
 u64 nr_switches;
 struct task_struct *curr;
};

enum task_state {
 TASK_RUNNING = 0,
 TASK_INTERRUPTIBLE = 1,
 TASK_UNINTERRUPTIBLE = 2,
 TASK_ZOMBIE = 3,
 TASK_STOPPED = 4,
};

enum task_flags {
 PF_KTHREAD = 1 << 0,
};


struct task_struct {
 struct cpu_context cpu_context;
 int preempt_count;
 int need_resched;
 unsigned long kernel_sp;
 unsigned long user_sp;
 enum task_state state;
 enum task_flags flags;
 int pid;
 struct list_head run_list;
 int counter;
 int priority;
 struct task_struct *next_task;
 struct task_struct *prev_task;

};




union task_union {
 struct task_struct task;
 unsigned long stack[(1 * (1 << 12))/sizeof(long)];
};
# 91 "include/sched.h"
extern struct task_struct *g_task[];

extern union task_union init_task_union;
# 108 "include/sched.h"
extern const struct sched_class simple_sched_class;

extern void ret_from_kernel_thread(void);
extern void ret_from_fork(void);
int do_fork(unsigned long clone_flags, unsigned long fn, unsigned long arg);
struct task_struct * switch_to(struct task_struct *prev,
  struct task_struct *next);
extern struct task_struct *cpu_switch_to(struct task_struct *prev,
      struct task_struct *next);
void sched_init(void);
void schedule(void);
void task_tick(struct run_queue *rq, struct task_struct *p);
void enqueue_task(struct run_queue *rq, struct task_struct *p);
struct task_struct *pick_next_task(struct run_queue *rq,
  struct task_struct *prev);
void tick_handle_periodic(void);
void wake_up_process(struct task_struct *p);
int move_to_user_space(unsigned long pc);

static inline void clear_task_resched(struct task_struct *p)
{
 p->need_resched = 0;
}

# 1 "include/asm/current.h" 1



static struct task_struct *get_current(void)
{
 register struct task_struct *tp __asm__("tp");
 return tp;
}
# 133 "include/sched.h" 2
# 156 "include/sched.h"
static inline void preempt_disable(void)
{
 get_current()->preempt_count++;
}

static inline void preempt_enable(void)
{
 get_current()->preempt_count--;
}

static inline void preempt_add(int val)
{
 get_current()->preempt_count += val;
}

static inline void preempt_sub(int val)
{
 get_current()->preempt_count -= val;
}
# 14 "src/kernel.c" 2
# 1 "src/../usr/syscall.h" 1



extern unsigned long syscall(int nr, ...);

unsigned long malloc(void);

extern int __clone(int (*fn)(void *arg), void *child_stack,
  int flags, void *arg);
extern unsigned long syscall(int nr, ...);

int clone(int (*fn)(void *arg), void *child_stack,
  int flags, void *arg);
# 15 "src/kernel.c" 2

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
# 89 "src/kernel.c"
static inline void my_asm_orr(unsigned long mask, void *p) { unsigned long tmp = 0; asm volatile ( "ld %[tmp], (%[p])\n" " ""or"" %[tmp], %[tmp], %[mask]\n" "sd %[tmp], (%[p])\n" : [p] "+r"(p), [tmp]"+r" (tmp) : [mask]"r" (mask) : "memory" ); }
static inline void my_asm_and(unsigned long mask, void *p) { unsigned long tmp = 0; asm volatile ( "ld %[tmp], (%[p])\n" " ""and"" %[tmp], %[tmp], %[mask]\n" "sd %[tmp], (%[p])\n" : [p] "+r"(p), [tmp]"+r" (tmp) : [mask]"r" (mask) : "memory" ); }
static inline void my_asm_add(unsigned long mask, void *p) { unsigned long tmp = 0; asm volatile ( "ld %[tmp], (%[p])\n" " ""add"" %[tmp], %[tmp], %[mask]\n" "sd %[tmp], (%[p])\n" : [p] "+r"(p), [tmp]"+r" (tmp) : [mask]"r" (mask) : "memory" ); }

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



void kernel_main(void)
{

    clean_bss();
    sbi_put_string("Welcome RISC-V!\r\n");
# 145 "src/kernel.c"
    uart_init();
    init_printk_done(putchar);
    printk("printk init done\n");


    trap_init();
    printk("trap init done\n");

    print_mem();



    printk("System init done. Preparing to jump to User App...\n");



    unsigned long mstatus = ({ register unsigned long __v; __asm__ __volatile__ ("csrr %0, " "sstatus" : "=r" (__v) : : "memory"); __v; });

    mstatus &= ~0x100UL;

    mstatus |= 0x20UL;

    mstatus &= ~0x40000UL;

    ({ unsigned long __v = (unsigned long)(mstatus); __asm__ __volatile__ ("csrw ""sstatus"", %0" : : "rK" (__v) : "memory"); });


    ({ unsigned long __v = (unsigned long)((unsigned long)my_user_app); __asm__ __volatile__ ("csrw ""sepc"", %0" : : "rK" (__v) : "memory"); });

    printk("Executing sret to jump to 0x%lx...\n", (unsigned long)my_user_app);


    asm volatile("sret");


    while (1) {
        ;
    }
}
