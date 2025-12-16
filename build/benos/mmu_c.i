# 1 "src/mmu.c"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "src/mmu.c"
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
# 18 "include/mm.h"
# 1 "include/asm/pgtable.h" 1
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
# 2 "src/mmu.c" 2
# 1 "include/asm/memory.h" 1
# 3 "src/mmu.c" 2

# 1 "include/memset.h" 1



# 1 "include/type.h" 1
# 5 "include/memset.h" 2

void *memset(void *s, int c, size_t count);
# 5 "src/mmu.c" 2

# 1 "include/asm/plic.h" 1



# 1 "include/asm/ptregs.h" 1
# 5 "include/asm/plic.h" 2
# 34 "include/asm/plic.h"
int plic_init();
void plic_set_prority(int hwirq, int pro);
void plic_enable_irq(int cpu, int hwirq, int enable);
void plic_handle_irq(struct pt_regs *regs);
# 7 "src/mmu.c" 2
# 1 "include/asm/uart.h" 1
# 8 "src/mmu.c" 2
# 1 "include/printk.h" 1



void init_printk_done(void (*fn)(char c));

int printk(const char *fmt, ...);

struct pt_regs;
void print_symbol(unsigned long addr);
void panic(void);
void dump_stack(struct pt_regs *regs);
# 9 "src/mmu.c" 2
# 1 "include/asm/clint.h" 1
# 10 "src/mmu.c" 2

extern char idmap_pg_dir[];

extern char _text_boot[], _etext_boot[];
extern char _text[], _etext[];

static void alloc_init_pte(pmd_t *pmdp, unsigned long addr,
  unsigned long end, unsigned long phys,
  pgprot_t prot,
  unsigned long (*alloc_pgtable)(void),
  unsigned long flags)
{
 pmd_t pmd = *pmdp;
 pte_t *ptep;


 if ((!((pmd).pmd))) {
  unsigned long pte_phys;


  pte_phys = alloc_pgtable();

  set_pmd(pmdp, pfn_pmd(((pte_phys) >> 12), ((pgprot_t) { ((1 << 0)) })));
  pmd = *pmdp;
 }


 ptep = get_ptep_from_pmdp(pmdp, addr);
 do {

  set_pte(ptep, pfn_pte(((phys) >> 12), prot));
  phys += (1 << 12);
 } while (ptep++, addr += (1 << 12), addr != end);
}

static void alloc_init_pmd(pgd_t *pgdp, unsigned long addr,
  unsigned long end, unsigned long phys,
  pgprot_t prot,
  unsigned long (*alloc_pgtable)(void),
  unsigned long flags)
{
 pgd_t pgd = *pgdp;
 pmd_t *pmdp;
 unsigned long next;


 if ((!((pgd).pgd))) {
  unsigned long pmd_phys;


  pmd_phys = alloc_pgtable();

  set_pgd(pgdp, pfn_pgd(((pmd_phys) >> 12), ((pgprot_t) { ((1 << 0)) })));
  pgd = *pgdp;
 }


 pmdp = get_pmdp_from_pgdp(pgdp, addr);
 do {
  next = ({ unsigned long __boundary = ((addr) + (1UL << 21)) & (~((1UL << 21) - 1)); (__boundary - 1 < (end) - 1) ? __boundary : (end); });

  alloc_init_pte(pmdp, addr, next, phys,
     prot, alloc_pgtable, flags);

  phys += next - addr;
 } while (pmdp++, addr = next, addr != end);
}




unsigned long early_pgtable_alloc(void)
{
 unsigned long phys;

 phys = get_free_page();
 memset((void *)phys, 0, (1 << 12));

 return phys;
}
# 102 "src/mmu.c"
void __create_pgd_mapping(pgd_t *pgdir, unsigned long phys,
  unsigned long virt, unsigned long size,
  pgprot_t prot,
  unsigned long (*alloc_pgtable)(void),
  unsigned long flags)
{

 pgd_t *pgdp = ((pgdir) + (((virt) >> 30) & (((1 << 12) / sizeof(pgd_t)) - 1)));
 unsigned long addr, end, next;

 phys &= (~((1 << 12)-1));
 addr = virt & (~((1 << 12)-1));
 end = (((virt + size)+(1 << 12)-1)&(~((1 << 12)-1)));

 do {

  next = ({ unsigned long __boundary = ((addr) + (1UL << 30)) & (~((1UL << 30) - 1)); (__boundary - 1 < (end) - 1) ? __boundary : (end); });
  alloc_init_pmd(pgdp, addr, next, phys,
    prot, alloc_pgtable, flags);
  phys += next - addr;
 } while (pgdp++, addr = next, addr != end);
}

static void create_identical_mapping(void)
{
 unsigned long start;
 unsigned long end;


 start = (unsigned long)_text_boot;
 end = (unsigned long)_etext;
 __create_pgd_mapping((pgd_t *)idmap_pg_dir, start, start,
   end - start, ((pgprot_t) { ((((1 << 1) | (1 << 2) | (1 << 0) | (1 << 6) | (1 << 7) | (1 << 5)) & ~(1 << 2)) | (1 << 3)) }),
   early_pgtable_alloc,
   0);




 start = ((((unsigned long)_etext)+(1 << 12)-1)&(~((1 << 12)-1)));
 end = (0x80000000UL + (16 * 0x100000UL));
 __create_pgd_mapping((pgd_t *)idmap_pg_dir, start, start,
   end - start, ((pgprot_t) { (((1 << 1) | (1 << 2) | (1 << 0) | (1 << 6) | (1 << 7) | (1 << 5))) }),
   early_pgtable_alloc,
   0);

}

static void create_mmio_mapping(void)
{
 unsigned long start;
 unsigned long end;



 start = 0xc000000UL;
 end = 0x10000000UL;
 __create_pgd_mapping((pgd_t *)idmap_pg_dir, start, start,
   end - start, ((pgprot_t) { (((1 << 1) | (1 << 2) | (1 << 0) | (1 << 6) | (1 << 7) | (1 << 5))) }),
   early_pgtable_alloc,
   0);



 start = 0x2000000;
 __create_pgd_mapping((pgd_t *)idmap_pg_dir, start, start,
   0x10000, ((pgprot_t) { (((1 << 1) | (1 << 2) | (1 << 0) | (1 << 6) | (1 << 7) | (1 << 5))) }),
   early_pgtable_alloc,
   0);


 start = 0x10000000;
 __create_pgd_mapping((pgd_t *)idmap_pg_dir, start, start,
   4096, ((pgprot_t) { (((1 << 1) | (1 << 2) | (1 << 0) | (1 << 6) | (1 << 7) | (1 << 5))) }),
   early_pgtable_alloc,
   0);


 start = 0x2000000;
 __create_pgd_mapping((pgd_t *)idmap_pg_dir, start, start,
   0x10000, ((pgprot_t) { (((1 << 1) | (1 << 2) | (1 << 0) | (1 << 6) | (1 << 7) | (1 << 5))) }),
   early_pgtable_alloc,
   0);
}

void paging_init(void)
{


 create_mmio_mapping();


}
