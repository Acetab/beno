# 1 "src/page_alloc.c"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "src/page_alloc.c"
# 1 "include/mm.h" 1
# 18 "include/mm.h"
# 1 "include/asm/pgtable.h" 1



# 1 "include/asm/pgtable_types.h" 1



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
# 5 "include/asm/pgtable_types.h" 2

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
# 2 "src/page_alloc.c" 2
# 1 "include/printk.h" 1



void init_printk_done(void (*fn)(char c));

int printk(const char *fmt, ...);

struct pt_regs;
void print_symbol(unsigned long addr);
void panic(void);
void dump_stack(struct pt_regs *regs);
# 3 "src/page_alloc.c" 2
# 1 "include/asm/memory.h" 1
# 4 "src/page_alloc.c" 2



static unsigned short mem_map[((16 * 0x100000UL) / (1 << 12))] = {0,};

static unsigned long phy_start_address;

void mem_init(unsigned long start_mem, unsigned long end_mem)
{
 unsigned long nr_free_pages = 0;
 unsigned long free;

 start_mem = (((start_mem)+(1 << 12)-1)&(~((1 << 12)-1)));
 phy_start_address = start_mem;
 end_mem &= (~((1 << 12)-1));
 free = end_mem - start_mem;

 while (start_mem < end_mem) {
  nr_free_pages++;
  start_mem += (1 << 12);
 }

 printk("Memory: %uKB available, %u free pages, phy_start_address=0x%x\n", free/1024, nr_free_pages, phy_start_address);
}

unsigned long get_free_page(void)
{
 int i;

 for (i = 0; i < ((16 * 0x100000UL) / (1 << 12)); i++) {
  if (mem_map[i] == 0) {
   mem_map[i] = 1;
   return phy_start_address + i * (1 << 12);
  }
 }
 return 0;
}

void free_page(unsigned long p)
{
 mem_map[(p - phy_start_address)/(1 << 12)] = 0;
}
