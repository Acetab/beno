# 1 "src/stage2_mmu.c"
# 1 "/home/acetab/桌面/benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 1 "<command-line>" 2
# 1 "src/stage2_mmu.c"
# 1 "include/asm/csr.h" 1
# 2 "src/stage2_mmu.c" 2
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
# 3 "src/stage2_mmu.c" 2
# 1 "include/asm/pgtable.h" 1
# 4 "src/stage2_mmu.c" 2
# 1 "include/asm/memory.h" 1
# 5 "src/stage2_mmu.c" 2
# 1 "include/asm/trap.h" 1
# 6 "src/stage2_mmu.c" 2
# 1 "include/asm/barrier.h" 1



static inline void hfence_gvma() {
    asm volatile(
        ".insn r 0x73, 0x0, 0x31, x0, x0, x0\n\t"
        ::: "memory");
}

static inline void hfence_vvma() {
    asm volatile(
        ".insn r 0x73, 0x0, 0x11, x0, x0, x0\n\t"
        ::: "memory");
}

static inline void hfence() {
 hfence_vvma();
 hfence_gvma();
}
# 7 "src/stage2_mmu.c" 2
# 1 "include/printk.h" 1



void init_printk_done(void (*fn)(char c));

int printk(const char *fmt, ...);

struct pt_regs;
void print_symbol(unsigned long addr);
void panic(void);
void dump_stack(struct pt_regs *regs);
# 8 "src/stage2_mmu.c" 2
# 1 "include/asm/ptregs.h" 1
# 9 "src/stage2_mmu.c" 2
# 1 "include/asm/vmm.h" 1



unsigned long hlvwu(unsigned long addr);
unsigned long hlvxwu(unsigned long addr);
void hsvw(unsigned long addr, unsigned long value);
# 10 "src/stage2_mmu.c" 2
# 1 "include/virt.h" 1



struct emu_mmio_access {
 struct pt_regs *regs;
 unsigned long addr;
 int write;
 int sign_ext;
 int width;
 int reg;
};


int check_emul_mmio_range(unsigned long addr);
int emul_device(unsigned long fault_addr, unsigned long ins_val,
  struct pt_regs *regs);
unsigned long emul_readreg(struct pt_regs *regs, int reg);
void emul_writereg(struct pt_regs *regs, int reg, unsigned long val);

void emu_mmio_rw_reg64(struct emu_mmio_access *emu_mmio);
void emu_mmio_ro_reg64(struct emu_mmio_access *emu_mmio);
void emu_mmio_w_reg64(struct emu_mmio_access *emu_mmio);
void emu_mmio_rw_reg32(struct emu_mmio_access *emu_mmio);
void emu_mmio_ro_reg32(struct emu_mmio_access *emu_mmio);
void emu_mmio_w_reg32(struct emu_mmio_access *emu_mmio);
void emu_mmio_rw_reg8(struct emu_mmio_access *emu_mmio);
void emu_mmio_ro_reg8(struct emu_mmio_access *emu_mmio);
void emu_mmio_w_reg8(struct emu_mmio_access *emu_mmio);
# 11 "src/stage2_mmu.c" 2
# 1 "include/memset.h" 1



# 1 "include/type.h" 1
# 5 "include/memset.h" 2

void *memset(void *s, int c, size_t count);
# 12 "src/stage2_mmu.c" 2

extern unsigned long early_pgtable_alloc(void);

char hs_pg_dir[(1 << 12) * 4] __attribute__((aligned((1 << 12) *4)));

void set_stage2_page_mapping(unsigned long gpa, unsigned long hpa, unsigned long size, pgprot_t prot)
{
 __create_pgd_mapping((pgd_t *)hs_pg_dir, hpa, gpa, size, prot, early_pgtable_alloc, 0);
}

void write_stage2_pg_reg(void)
{
 unsigned long hsatp;
 hsatp = (((unsigned long)hs_pg_dir) >> 12) | (8UL << 60);
 ({ unsigned long __v = (unsigned long)(hsatp); __asm__ __volatile__ ("csrw ""0x680"", %0" : : "rK" (__v) : "memory"); });

 hfence();
 printk("write hgatp done\n");
}

static void setup_hg_page_table(unsigned long gpa, unsigned long hpa, unsigned long size, pgprot_t prot)
{
 __create_pgd_mapping((pgd_t *)hs_pg_dir, hpa, gpa, size, prot, early_pgtable_alloc, 0);
}

void stage2_page_fault(struct pt_regs *regs)
{
 unsigned long fault_addr;
 unsigned long htval, stval;
 unsigned long scause;
 unsigned long new_page;

 htval = ({ register unsigned long __v; __asm__ __volatile__ ("csrr %0, " "0x643" : "=r" (__v) : : "memory"); __v; });
 stval = ({ register unsigned long __v; __asm__ __volatile__ ("csrr %0, " "stval" : "=r" (__v) : : "memory"); __v; });
 scause = ({ register unsigned long __v; __asm__ __volatile__ ("csrr %0, " "scause" : "=r" (__v) : : "memory"); __v; });

 fault_addr = (htval << 2) | (stval & 0x3);
# 59 "src/stage2_mmu.c"
 if (scause == 0x15 ||
   scause == 0x17) {
  unsigned long ins_addr = ({ register unsigned long __v; __asm__ __volatile__ ("csrr %0, " "sepc" : "=r" (__v) : : "memory"); __v; });
  unsigned long ins_value = hlvxwu(ins_addr);


  if (check_emul_mmio_range(fault_addr)) {
   emul_device(fault_addr, ins_value, regs);
   regs->sepc += 4;
   return ;
  }
 }




 fault_addr &= (~((1 << 12)-1));
 new_page = get_free_page();
 memset((void *)new_page, 0, (1 << 12));

 setup_hg_page_table(fault_addr, new_page, (1 << 12),
   (scause == 0x17) ? ((pgprot_t) { (((1 << 0) | (1 << 6) | (1 << 4)) | (1 << 1) | (1 << 3) | (1 << 2)) }): ((pgprot_t) { (((1 << 0) | (1 << 6) | (1 << 4)) | (1 << 1) | (1 << 3)) }));
 hfence();
}
