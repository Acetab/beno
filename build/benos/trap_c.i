# 1 "src/trap.c"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "src/trap.c"
# 1 "include/asm/csr.h" 1
# 2 "src/trap.c" 2
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
# 3 "src/trap.c" 2
# 1 "include/printk.h" 1



void init_printk_done(void (*fn)(char c));

int printk(const char *fmt, ...);

struct pt_regs;
void print_symbol(unsigned long addr);
void panic(void);
void dump_stack(struct pt_regs *regs);
# 4 "src/trap.c" 2
# 1 "include/io.h" 1
# 49 "include/io.h"
static inline void delay(unsigned int n)
{
 while(n--)
  ;
}
# 5 "src/trap.c" 2
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
# 6 "src/trap.c" 2
# 1 "include/asm/timer.h" 1






void handle_timer_irq(void);
void timer_init(void);
unsigned long get_cycles(void);
# 7 "src/trap.c" 2
# 1 "include/asm/plic.h" 1
# 34 "include/asm/plic.h"
int plic_init();
void plic_set_prority(int hwirq, int pro);
void plic_enable_irq(int cpu, int hwirq, int enable);
void plic_handle_irq(struct pt_regs *regs);
# 8 "src/trap.c" 2
# 1 "include/irq.h" 1
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
# 2 "include/irq.h" 2
# 9 "src/trap.c" 2
# 1 "include/asm/syscall.h" 1



# 1 "include/sched.h" 1







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
# 9 "include/sched.h" 2
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
# 5 "include/asm/syscall.h" 2

typedef long (*syscall_fn_t)(struct pt_regs *);

extern const syscall_fn_t syscall_table[];

void riscv_svc_handler(struct pt_regs *regs);
# 10 "src/trap.c" 2
# 1 "include/asm/trap.h" 1
# 11 "src/trap.c" 2
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
# 12 "src/trap.c" 2


# 1 "src/../virt/vs_mm.h" 1
# 15 "src/trap.c" 2
# 1 "include/asm/vmm.h" 1



unsigned long hlvwu(unsigned long addr);
unsigned long hlvxwu(unsigned long addr);
void hsvw(unsigned long addr, unsigned long value);
# 16 "src/trap.c" 2

extern void do_exception_vector(void);
extern long sys_show_student_info(void);

struct fault_info {
 int (*fn)(struct pt_regs *regs, const char *name);
 const char *name;
};

void panic()
{
 printk("Kernel panic\n");
 while(1)
  ;
}

void show_regs(struct pt_regs *regs)
{
 printk("sepc: %016lx ra : %016lx sp : %016lx\n",
  regs->sepc, regs->ra, regs->sp);
 printk(" gp : %016lx tp : %016lx t0 : %016lx\n",
  regs->gp, regs->tp, regs->t0);
 printk(" t1 : %016lx t2 : %016lx t3 : %016lx\n",
  regs->t1, regs->t2, regs->s0);
 printk(" s1 : %016lx a0 : %016lx a1 : %016lx\n",
  regs->s1, regs->a0, regs->a1);
 printk(" a2 : %016lx a3 : %016lx a4 : %016lx\n",
  regs->a2, regs->a3, regs->a4);
 printk(" a5 : %016lx a6 : %016lx a7 : %016lx\n",
  regs->a5, regs->a6, regs->a7);
 printk(" s2 : %016lx s3 : %016lx s4 : %016lx\n",
  regs->s2, regs->s3, regs->s4);
 printk(" s5 : %016lx s6 : %016lx s7 : %016lx\n",
  regs->s5, regs->s6, regs->s7);
 printk(" s8 : %016lx s9 : %016lx s10: %016lx\n",
  regs->s8, regs->s9, regs->s10);
 printk(" s11: %016lx t3 : %016lx t4: %016lx\n",
  regs->s11, regs->t3, regs->t4);
 printk(" t5 : %016lx t6 : %016lx\n",
  regs->t5, regs->t6);
}

static void do_trap_error(struct pt_regs *regs, const char *str)
{
 printk("Oops - %s\n", str);
 dump_stack(regs);
 show_regs(regs);
 printk("sstatus:0x%016lx  sbadaddr:0x%016lx  scause:0x%016lx\n",
   regs->sstatus, regs->sbadaddr, regs->scause);
 panic();
}
# 75 "src/trap.c"
int do_trap_unknown(struct pt_regs *regs, const char *str) { do_trap_error(regs, str); return 0; };
int do_trap_insn_misaligned(struct pt_regs *regs, const char *str) { do_trap_error(regs, str); return 0; };
int do_trap_insn_fault(struct pt_regs *regs, const char *str) { do_trap_error(regs, str); return 0; };
int do_trap_insn_illegal(struct pt_regs *regs, const char *str) { do_trap_error(regs, str); return 0; };
int do_trap_load_misaligned(struct pt_regs *regs, const char *str) { do_trap_error(regs, str); return 0; };
int do_trap_load_fault(struct pt_regs *regs, const char *str) { do_trap_error(regs, str); return 0; };
int do_trap_store_misaligned(struct pt_regs *regs, const char *str) { do_trap_error(regs, str); return 0; };
int do_trap_store_fault(struct pt_regs *regs, const char *str) { do_trap_error(regs, str); return 0; };
int do_trap_ecall_u(struct pt_regs *regs, const char *str) { do_trap_error(regs, str); return 0; };
int do_trap_ecall_s(struct pt_regs *regs, const char *str) { do_trap_error(regs, str); return 0; };
int do_trap_break(struct pt_regs *regs, const char *str) { do_trap_error(regs, str); return 0; };
int do_page_fault(struct pt_regs *regs, const char *str) { do_trap_error(regs, str); return 0; };

static const struct fault_info fault_info[] = {
 {do_trap_insn_misaligned, "Instruction address misaligned"},
 {do_trap_insn_fault, "Instruction access fault"},
 {do_trap_insn_illegal, "Illegal instruction"},
 {do_trap_break, "Breakpoint"},
 {do_trap_load_misaligned, "Load address misaligned"},
 {do_trap_load_fault, "Load access fault"},
 {do_trap_store_misaligned, "Store/AMO address misaligned"},
 {do_trap_store_fault, "Store/AMO access fault"},
 {do_trap_ecall_u, "Environment call from U-mode"},
 {do_trap_ecall_s, "Environment call from S-mode"},
 {do_trap_unknown, "unknown 10"},
 {do_trap_unknown, "unknown 11"},
 {do_page_fault, "Instruction page fault"},
 {do_page_fault, "Load page fault"},
 {do_trap_unknown, "unknown 14"},
 {do_page_fault, "Store/AMO page fault"},
};

static inline const struct fault_info *ec_to_fault_info(unsigned int scause)
{
 return fault_info + (scause & (0xf));
}
# 126 "src/trap.c"
static int vs_sbi_ecall_handle(unsigned int id, struct pt_regs *regs)
{
 int ret = 0;

 switch (id) {
 case 0x100:
  printk("%s: running in HS mode\n", __func__);
  printk("hstatus 0x%lx\n", ({ register unsigned long __v; __asm__ __volatile__ ("csrr %0, " "0x600" : "=r" (__v) : : "memory"); __v; }));

  unsigned long val = hlvwu(0x30000000);
  printk("read VS virtual address 0x%lx val 0x%lx\n", 0x30000000, val);

  printk("write VS address 0x%lx\n", 0x30000000);
  hsvw(0x30000000, 0x87654321);
  break;
 case 0:
  riscv_vcpu_timer_event_start(regs->a0);
  break;
 }


 if (!ret)
  regs->sepc += 4;

 return ret;
}

int do_exception(struct pt_regs *regs, unsigned long scause)
{
 const struct fault_info *inf;
 unsigned long ecall_id = regs->a7;
 const char *msg = "trap handler failed";
 int ret = 0;




 if ((scause & (1UL << 63))) {
  switch (scause &~ (1UL << 63)) {
  case 5:
   handle_timer_irq();
   break;
  case 9:
   plic_handle_irq(regs);
   break;
  case 1:

   break;
  default:
   printk("unexpected interrupt cause");
   panic();
  }
 } else {
  switch (scause) {
  case 8:





   regs->sepc += 4;
   if(regs->s7 ==100){
    regs->a0 = sys_show_student_info();
   }else{
    riscv_svc_handler(regs);
   }
   break;
   case 0xa:
   ret = vs_sbi_ecall_handle(ecall_id, regs);
   msg = "virtual ecall handler failed";
   break;
  case 0x15:
  case 0x14:
  case 0x17:
         stage2_page_fault(regs);
         break;
  default:
   inf = ec_to_fault_info(scause);
   if (!inf->fn(regs, inf->name))
   return 0;
  }
 }

 if (ret) {
  printk("%s\n", msg);
  panic();
 }

 return ret;
}

static void hs_delegate_traps(void)
{
 unsigned long exceptions;
 unsigned long interrupt;

 interrupt = (1UL << 2) | (1UL << 6) | (1UL << 10);

 exceptions = (1UL << 0x0) | (1UL << 0xc) |
                         (1UL << 0x3) | (1UL << 0xd) |
                         (1UL << 0xf) | (1UL << 0x8) |
    (1UL << 0x5) | (1UL << 0x7) |
    (1UL << 0x2);

 ({ unsigned long __v = (unsigned long)(exceptions); __asm__ __volatile__ ("csrw ""0x602"", %0" : : "rK" (__v) : "memory"); });
 ({ unsigned long __v = (unsigned long)(interrupt); __asm__ __volatile__ ("csrw ""0x603"", %0" : : "rK" (__v) : "memory"); });

 ({ unsigned long __v = (unsigned long)(0); __asm__ __volatile__ ("csrw ""0x645"", %0" : : "rK" (__v) : "memory"); });
}

void trap_init(void)
{
 hs_delegate_traps();

 ({ unsigned long __v = (unsigned long)(0); __asm__ __volatile__ ("csrw ""sscratch"", %0" : : "rK" (__v) : "memory"); });

 ({ unsigned long __v = (unsigned long)(do_exception_vector); __asm__ __volatile__ ("csrw ""stvec"", %0" : : "rK" (__v) : "memory"); });
 printk("stvec=0x%x, 0x%x\n", ({ register unsigned long __v; __asm__ __volatile__ ("csrr %0, " "stvec" : "=r" (__v) : : "memory"); __v; }), do_exception_vector);

 ({ unsigned long __v = (unsigned long)(-1); __asm__ __volatile__ ("csrw ""sie"", %0" : : "rK" (__v) : "memory"); });
}
