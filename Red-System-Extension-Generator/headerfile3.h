



#define _GLPK_H

extern "C" {

#define GLP_MAJOR_VERSION  4
#define GLP_MINOR_VERSION  34

#define _GLP_PROB
typedef struct { double _opaque_prob; } glp_prob;


#define GLP_MIN            1  
#define GLP_MAX            2  


#define GLP_CV             1  
#define GLP_IV             2  
#define GLP_BV             3  


#define GLP_FR             1  
#define GLP_LO             2  
#define GLP_UP             3  
#define GLP_DB             4  
#define GLP_FX             5  


#define GLP_BS             1  
#define GLP_NL             2  
#define GLP_NU             3  
#define GLP_NF             4  
#define GLP_NS             5  


#define GLP_SF_GM       0x01  
#define GLP_SF_EQ       0x10  
#define GLP_SF_2N       0x20  
#define GLP_SF_SKIP     0x40  
#define GLP_SF_AUTO     0x80  


#define GLP_SOL            1  
#define GLP_IPT            2  
#define GLP_MIP            3  


#define GLP_UNDEF          1  
#define GLP_FEAS           2  
#define GLP_INFEAS         3  
#define GLP_NOFEAS         4  
#define GLP_OPT            5  
#define GLP_UNBND          6  

typedef struct { int lo, hi; } glp_long;


#define _GLP_BFCP
typedef struct glp_bfcp glp_bfcp;
struct glp_bfcp
{     
      int msg_lev;            
      int type;               
#define GLP_BF_FT          1  
#define GLP_BF_BG          2  
#define GLP_BF_GR          3  
      int lu_size;            
      double piv_tol;         
      int piv_lim;            
      int suhl;               
      double eps_tol;         
      double max_gro;         
      int nfs_max;            
      double upd_tol;         
      int nrs_max;            
      int rs_size;            
      double foo_bar[38];     
};

typedef struct
{     
      int msg_lev;            
#define GLP_MSG_OFF        0  
#define GLP_MSG_ERR        1  
#define GLP_MSG_ON         2  
#define GLP_MSG_ALL        3  
#define GLP_MSG_DBG        4  
      int meth;               
#define GLP_PRIMAL         1  
#define GLP_DUALP          2  
#define GLP_DUAL           3  
      int pricing;            
#define GLP_PT_STD      0x11  
#define GLP_PT_PSE      0x22  
      int r_test;             
#define GLP_RT_STD      0x11  
#define GLP_RT_HAR      0x22  
      double tol_bnd;         
      double tol_dj;          
      double tol_piv;         
      double obj_ll;          
      double obj_ul;          
      int it_lim;             
      int tm_lim;             
      int out_frq;            
      int out_dly;            
      int presolve;           
      double foo_bar[36];     
} glp_smcp;

#define _GLP_TREE
typedef struct { double _opaque_tree; } glp_tree;

typedef struct
{     
      int msg_lev;            
#define GLP_MSG_OFF        0  
#define GLP_MSG_ERR        1  
#define GLP_MSG_ON         2  
#define GLP_MSG_ALL        3  
#define GLP_MSG_DBG        4  
      int br_tech;            
#define GLP_BR_FFV         1  
#define GLP_BR_LFV         2  
#define GLP_BR_MFV         3  
#define GLP_BR_DTH         4  
#define GLP_BR_HPC         5  
      int bt_tech;            
#define GLP_BT_DFS         1  
#define GLP_BT_BFS         2  
#define GLP_BT_BLB         3  
#define GLP_BT_BPH         4  
      double tol_int;         
      double tol_obj;         
      int tm_lim;             
      int out_frq;            
      int out_dly;            
      void (*cb_func)(glp_tree *tree, void *info);
                              
      void *cb_info;          
      int cb_size;            
      int pp_tech;            
#define GLP_PP_NONE        0  
#define GLP_PP_ROOT        1  
#define GLP_PP_ALL         2  
      double mip_gap;         
      int mir_cuts;           
      int gmi_cuts;           
      int cov_cuts;           
      int clq_cuts;           
      int presolve;           
      int binarize;           
      double foo_bar[30];     
#if 1 
      char *fn_sol;           

typedef struct
{     
      int level;
      
      int origin;
      
#define GLP_RF_REG         0  
#define GLP_RF_LAZY        1  
#define GLP_RF_CUT         2  
      int klass;
      
#define GLP_RF_GMI         1  
#define GLP_RF_MIR         2  
#define GLP_RF_COV         3  
#define GLP_RF_CLQ         4  
      double foo_bar[7];
      
} glp_attr;


#define GLP_ON             1  
#define GLP_OFF            0  


#define GLP_IROWGEN     0x01  
#define GLP_IBINGO      0x02  
#define GLP_IHEUR       0x03  
#define GLP_ICUTGEN     0x04  
#define GLP_IBRANCH     0x05  
#define GLP_ISELECT     0x06  
#define GLP_IPREPRO     0x07  


#define GLP_NO_BRNCH       0  
#define GLP_DN_BRNCH       1  
#define GLP_UP_BRNCH       2  


#define GLP_EBADB       0x01  
#define GLP_ESING       0x02  
#define GLP_ECOND       0x03  
#define GLP_EBOUND      0x04  
#define GLP_EFAIL       0x05  
#define GLP_EOBJLL      0x06  
#define GLP_EOBJUL      0x07  
#define GLP_EITLIM      0x08  
#define GLP_ETMLIM      0x09  
#define GLP_ENOPFS      0x0A  
#define GLP_ENODFS      0x0B  
#define GLP_EROOT       0x0C  
#define GLP_ESTOP       0x0D  
#define GLP_EMIPGAP     0x0E  
#define GLP_ENOFEAS     0x0F  
#define GLP_ENOCVG      0x10  
#define GLP_EINSTAB     0x11  


#define GLP_MPS_DECK       1  
#define GLP_MPS_FILE       2  

#define _GLP_TRAN
typedef struct { double _opaque_tran; } glp_tran;

glp_prob *glp_create_prob(void);


void glp_set_prob_name(glp_prob *lp, const char *name);


void glp_set_obj_name(glp_prob *lp, const char *name);


void glp_set_obj_dir(glp_prob *lp, int dir);


int glp_add_rows(glp_prob *lp, int nrs);


int glp_add_cols(glp_prob *lp, int ncs);


void glp_set_row_name(glp_prob *lp, int i, const char *name);


void glp_set_col_name(glp_prob *lp, int j, const char *name);


void glp_set_row_bnds(glp_prob *lp, int i, int type, double lb,
      double ub);


void glp_set_col_bnds(glp_prob *lp, int j, int type, double lb,
      double ub);


void glp_set_obj_coef(glp_prob *lp, int j, double coef);


void glp_set_mat_row(glp_prob *lp, int i, int len, const int ind[],
      const double val[]);


void glp_set_mat_col(glp_prob *lp, int j, int len, const int ind[],
      const double val[]);


void glp_load_matrix(glp_prob *lp, int ne, const int ia[],
      const int ja[], const double ar[]);


void glp_del_rows(glp_prob *lp, int nrs, const int num[]);


void glp_del_cols(glp_prob *lp, int ncs, const int num[]);


void glp_copy_prob(glp_prob *dest, glp_prob *prob, int names);


void glp_erase_prob(glp_prob *lp);


void glp_delete_prob(glp_prob *lp);


const char *glp_get_prob_name(glp_prob *lp);


const char *glp_get_obj_name(glp_prob *lp);


int glp_get_obj_dir(glp_prob *lp);


int glp_get_num_rows(glp_prob *lp);


int glp_get_num_cols(glp_prob *lp);


const char *glp_get_row_name(glp_prob *lp, int i);


const char *glp_get_col_name(glp_prob *lp, int j);


int glp_get_row_type(glp_prob *lp, int i);


double glp_get_row_lb(glp_prob *lp, int i);


double glp_get_row_ub(glp_prob *lp, int i);


int glp_get_col_type(glp_prob *lp, int j);


double glp_get_col_lb(glp_prob *lp, int j);


double glp_get_col_ub(glp_prob *lp, int j);


double glp_get_obj_coef(glp_prob *lp, int j);


int glp_get_num_nz(glp_prob *lp);


int glp_get_mat_row(glp_prob *lp, int i, int ind[], double val[]);


int glp_get_mat_col(glp_prob *lp, int j, int ind[], double val[]);


void glp_create_index(glp_prob *lp);


int glp_find_row(glp_prob *lp, const char *name);


int glp_find_col(glp_prob *lp, const char *name);


void glp_delete_index(glp_prob *lp);


void glp_set_rii(glp_prob *lp, int i, double rii);


void glp_set_sjj(glp_prob *lp, int j, double sjj);


double glp_get_rii(glp_prob *lp, int i);


double glp_get_sjj(glp_prob *lp, int j);


void glp_scale_prob(glp_prob *lp, int flags);


void glp_unscale_prob(glp_prob *lp);


void glp_set_row_stat(glp_prob *lp, int i, int stat);


void glp_set_col_stat(glp_prob *lp, int j, int stat);


void glp_std_basis(glp_prob *lp);


void glp_adv_basis(glp_prob *lp, int flags);


void glp_cpx_basis(glp_prob *lp);


int glp_simplex(glp_prob *lp, const glp_smcp *parm);


int glp_exact(glp_prob *lp, const glp_smcp *parm);


void glp_init_smcp(glp_smcp *parm);


int glp_get_status(glp_prob *lp);


int glp_get_prim_stat(glp_prob *lp);


int glp_get_dual_stat(glp_prob *lp);


double glp_get_obj_val(glp_prob *lp);


int glp_get_row_stat(glp_prob *lp, int i);


double glp_get_row_prim(glp_prob *lp, int i);


double glp_get_row_dual(glp_prob *lp, int i);


int glp_get_col_stat(glp_prob *lp, int j);


double glp_get_col_prim(glp_prob *lp, int j);


double glp_get_col_dual(glp_prob *lp, int j);


int glp_get_unbnd_ray(glp_prob *lp);


int glp_interior(glp_prob *lp, const void *parm);


int glp_ipt_status(glp_prob *lp);


double glp_ipt_obj_val(glp_prob *lp);


double glp_ipt_row_prim(glp_prob *lp, int i);


double glp_ipt_row_dual(glp_prob *lp, int i);


double glp_ipt_col_prim(glp_prob *lp, int j);


double glp_ipt_col_dual(glp_prob *lp, int j);


void glp_set_col_kind(glp_prob *mip, int j, int kind);


int glp_get_col_kind(glp_prob *mip, int j);


int glp_get_num_int(glp_prob *mip);


int glp_get_num_bin(glp_prob *mip);


int glp_intopt(glp_prob *mip, const glp_iocp *parm);


void glp_init_iocp(glp_iocp *parm);


int glp_mip_status(glp_prob *mip);


double glp_mip_obj_val(glp_prob *mip);


double glp_mip_row_val(glp_prob *mip, int i);


double glp_mip_col_val(glp_prob *mip, int j);


int glp_read_sol(glp_prob *lp, const char *fname);


int glp_write_sol(glp_prob *lp, const char *fname);


int glp_read_ipt(glp_prob *lp, const char *fname);


int glp_write_ipt(glp_prob *lp, const char *fname);


int glp_read_mip(glp_prob *mip, const char *fname);


int glp_write_mip(glp_prob *mip, const char *fname);


int glp_bf_exists(glp_prob *lp);


int glp_factorize(glp_prob *lp);


int glp_bf_updated(glp_prob *lp);


void glp_get_bfcp(glp_prob *lp, glp_bfcp *parm);


void glp_set_bfcp(glp_prob *lp, const glp_bfcp *parm);


int glp_get_bhead(glp_prob *lp, int k);


int glp_get_row_bind(glp_prob *lp, int i);


int glp_get_col_bind(glp_prob *lp, int j);


void glp_ftran(glp_prob *lp, double x[]);


void glp_btran(glp_prob *lp, double x[]);


int glp_eval_tab_row(glp_prob *lp, int k, int ind[], double val[]);


int glp_eval_tab_col(glp_prob *lp, int k, int ind[], double val[]);


int glp_ios_reason(glp_tree *tree);


glp_prob *glp_ios_get_prob(glp_tree *tree);


void glp_ios_tree_size(glp_tree *tree, int *a_cnt, int *n_cnt,
      int *t_cnt);


int glp_ios_curr_node(glp_tree *tree);


int glp_ios_next_node(glp_tree *tree, int p);


int glp_ios_prev_node(glp_tree *tree, int p);


int glp_ios_up_node(glp_tree *tree, int p);


int glp_ios_node_level(glp_tree *tree, int p);


double glp_ios_node_bound(glp_tree *tree, int p);


int glp_ios_best_node(glp_tree *tree);


double glp_ios_mip_gap(glp_tree *tree);


void *glp_ios_node_data(glp_tree *tree, int p);


void glp_ios_row_attr(glp_tree *tree, int i, glp_attr *attr);


int glp_ios_pool_size(glp_tree *tree);


int glp_ios_add_row(glp_tree *tree,
      const char *name, int klass, int flags, int len, const int ind[],
      const double val[], int type, double rhs);


void glp_ios_del_row(glp_tree *tree, int i);


void glp_ios_clear_pool(glp_tree *tree);


int glp_ios_can_branch(glp_tree *tree, int j);


void glp_ios_branch_upon(glp_tree *tree, int j, int sel);


void glp_ios_select_node(glp_tree *tree, int p);


int glp_ios_heur_sol(glp_tree *tree, const double x[]);


void glp_ios_terminate(glp_tree *tree);


const char *glp_version(void);


void glp_term_out(int flag);


void glp_term_hook(int (*func)(void *info, const char *s), void *info);


void *glp_malloc(int size);


void *glp_calloc(int n, int size);


void glp_free(void *ptr);


void glp_mem_usage(int *count, int *cpeak, glp_long *total,
      glp_long *tpeak);


void glp_mem_limit(int limit);


void glp_free_env(void);


int glp_read_mps(glp_prob *lp, int fmt, const void *parm,
      const char *fname);


int glp_write_mps(glp_prob *lp, int fmt, const void *parm,
      const char *fname);


int glp_read_lp(glp_prob *lp, const void *parm, const char *fname);


int glp_write_lp(glp_prob *lp, const void *parm, const char *fname);


glp_tran *glp_mpl_alloc_wksp(void);


int glp_mpl_read_model(glp_tran *tran, const char *fname, int skip);


int glp_mpl_read_data(glp_tran *tran, const char *fname);


int glp_mpl_generate(glp_tran *tran, const char *fname);


void glp_mpl_build_prob(glp_tran *tran, glp_prob *prob);


int glp_mpl_postsolve(glp_tran *tran, glp_prob *prob, int sol);


void glp_mpl_free_wksp(glp_tran *tran);


int glp_main(int argc, const char *argv[]);




#define LPX glp_prob


#define LPX_LP          100   
#define LPX_MIP         101   


#define LPX_FR          110   
#define LPX_LO          111   
#define LPX_UP          112   
#define LPX_DB          113   
#define LPX_FX          114   


#define LPX_MIN         120   
#define LPX_MAX         121   


#define LPX_P_UNDEF     132   
#define LPX_P_FEAS      133   
#define LPX_P_INFEAS    134   
#define LPX_P_NOFEAS    135   


#define LPX_D_UNDEF     136   
#define LPX_D_FEAS      137   
#define LPX_D_INFEAS    138   
#define LPX_D_NOFEAS    139   


#define LPX_BS          140   
#define LPX_NL          141   
#define LPX_NU          142   
#define LPX_NF          143   
#define LPX_NS          144   


#define LPX_T_UNDEF     150   
#define LPX_T_OPT       151   


#define LPX_CV          160   
#define LPX_IV          161   


#define LPX_I_UNDEF     170   
#define LPX_I_OPT       171   
#define LPX_I_FEAS      172   
#define LPX_I_NOFEAS    173   


#define LPX_OPT         180   
#define LPX_FEAS        181   
#define LPX_INFEAS      182   
#define LPX_NOFEAS      183   
#define LPX_UNBND       184   
#define LPX_UNDEF       185   


#define LPX_E_OK        200   
#define LPX_E_EMPTY     201   
#define LPX_E_BADB      202   
#define LPX_E_INFEAS    203   
#define LPX_E_FAULT     204   
#define LPX_E_OBJLL     205   
#define LPX_E_OBJUL     206   
#define LPX_E_ITLIM     207   
#define LPX_E_TMLIM     208   
#define LPX_E_NOFEAS    209   
#define LPX_E_INSTAB    210   
#define LPX_E_SING      211   
#define LPX_E_NOCONV    212   
#define LPX_E_NOPFS     213   
#define LPX_E_NODFS     214   
#define LPX_E_MIPGAP    215   


#define LPX_K_MSGLEV    300   
#define LPX_K_SCALE     301   
#define LPX_K_DUAL      302   
#define LPX_K_PRICE     303   
#define LPX_K_RELAX     304   
#define LPX_K_TOLBND    305   
#define LPX_K_TOLDJ     306   
#define LPX_K_TOLPIV    307   
#define LPX_K_ROUND     308   
#define LPX_K_OBJLL     309   
#define LPX_K_OBJUL     310   
#define LPX_K_ITLIM     311   
#define LPX_K_ITCNT     312   
#define LPX_K_TMLIM     313   
#define LPX_K_OUTFRQ    314   
#define LPX_K_OUTDLY    315   
#define LPX_K_BRANCH    316   
#define LPX_K_BTRACK    317   
#define LPX_K_TOLINT    318   
#define LPX_K_TOLOBJ    319   
#define LPX_K_MPSINFO   320   
#define LPX_K_MPSOBJ    321   
#define LPX_K_MPSORIG   322   
#define LPX_K_MPSWIDE   323   
#define LPX_K_MPSFREE   324   
#define LPX_K_MPSSKIP   325   
#define LPX_K_LPTORIG   326   
#define LPX_K_PRESOL    327   
#define LPX_K_BINARIZE  328   
#define LPX_K_USECUTS   329   
#define LPX_K_BFTYPE    330   
#define LPX_K_MIPGAP    331   

#define LPX_C_COVER     0x01  
#define LPX_C_CLIQUE    0x02  
#define LPX_C_GOMORY    0x04  
#define LPX_C_MIR       0x08  
#define LPX_C_ALL       0xFF  

typedef struct
{     
      
      
      double pe_ae_max;
      
      int    pe_ae_row;
      
      double pe_re_max;
      
      int    pe_re_row;
      
      int    pe_quality;
      
      
      
      double pb_ae_max;
      
      int    pb_ae_ind;
      
      double pb_re_max;
      
      int    pb_re_ind;
      
      int    pb_quality;
      
      
      
      double de_ae_max;
      
      int    de_ae_col;
      
      double de_re_max;
      
      int    de_re_col;
      
      int    de_quality;
      
      
      
      double db_ae_max;
      
      int    db_ae_ind;
      
      double db_re_max;
      
      int    db_re_ind;
      
      int    db_quality;
      
      
      
      double cs_ae_max;
      
      int    cs_ae_ind;
      
      double cs_re_max;
      
      int    cs_re_ind;
      
      int    cs_quality;
      
} LPXKKT;

#define lpx_create_prob _glp_lpx_create_prob
LPX *lpx_create_prob(void);


#define lpx_set_prob_name _glp_lpx_set_prob_name
void lpx_set_prob_name(LPX *lp, const char *name);


#define lpx_set_obj_name _glp_lpx_set_obj_name
void lpx_set_obj_name(LPX *lp, const char *name);


#define lpx_set_obj_dir _glp_lpx_set_obj_dir
void lpx_set_obj_dir(LPX *lp, int dir);


#define lpx_add_rows _glp_lpx_add_rows
int lpx_add_rows(LPX *lp, int nrs);


#define lpx_add_cols _glp_lpx_add_cols
int lpx_add_cols(LPX *lp, int ncs);


#define lpx_set_row_name _glp_lpx_set_row_name
void lpx_set_row_name(LPX *lp, int i, const char *name);


#define lpx_set_col_name _glp_lpx_set_col_name
void lpx_set_col_name(LPX *lp, int j, const char *name);


#define lpx_set_row_bnds _glp_lpx_set_row_bnds
void lpx_set_row_bnds(LPX *lp, int i, int type, double lb, double ub);


#define lpx_set_col_bnds _glp_lpx_set_col_bnds
void lpx_set_col_bnds(LPX *lp, int j, int type, double lb, double ub);


#define lpx_set_obj_coef _glp_lpx_set_obj_coef
void lpx_set_obj_coef(glp_prob *lp, int j, double coef);


#define lpx_set_mat_row _glp_lpx_set_mat_row
void lpx_set_mat_row(LPX *lp, int i, int len, const int ind[],
      const double val[]);


#define lpx_set_mat_col _glp_lpx_set_mat_col
void lpx_set_mat_col(LPX *lp, int j, int len, const int ind[],
      const double val[]);


#define lpx_load_matrix _glp_lpx_load_matrix
void lpx_load_matrix(LPX *lp, int ne, const int ia[], const int ja[],
      const double ar[]);


#define lpx_del_rows _glp_lpx_del_rows
void lpx_del_rows(LPX *lp, int nrs, const int num[]);


#define lpx_del_cols _glp_lpx_del_cols
void lpx_del_cols(LPX *lp, int ncs, const int num[]);


#define lpx_delete_prob _glp_lpx_delete_prob
void lpx_delete_prob(LPX *lp);


#define lpx_get_prob_name _glp_lpx_get_prob_name
const char *lpx_get_prob_name(LPX *lp);


#define lpx_get_obj_name _glp_lpx_get_obj_name
const char *lpx_get_obj_name(LPX *lp);


#define lpx_get_obj_dir _glp_lpx_get_obj_dir
int lpx_get_obj_dir(LPX *lp);


#define lpx_get_num_rows _glp_lpx_get_num_rows
int lpx_get_num_rows(LPX *lp);


#define lpx_get_num_cols _glp_lpx_get_num_cols
int lpx_get_num_cols(LPX *lp);


#define lpx_get_row_name _glp_lpx_get_row_name
const char *lpx_get_row_name(LPX *lp, int i);


#define lpx_get_col_name _glp_lpx_get_col_name
const char *lpx_get_col_name(LPX *lp, int j);


#define lpx_get_row_type _glp_lpx_get_row_type
int lpx_get_row_type(LPX *lp, int i);


#define lpx_get_row_lb _glp_lpx_get_row_lb
double lpx_get_row_lb(LPX *lp, int i);


#define lpx_get_row_ub _glp_lpx_get_row_ub
double lpx_get_row_ub(LPX *lp, int i);


#define lpx_get_row_bnds _glp_lpx_get_row_bnds
void lpx_get_row_bnds(LPX *lp, int i, int *typx, double *lb,
      double *ub);


#define lpx_get_col_type _glp_lpx_get_col_type
int lpx_get_col_type(LPX *lp, int j);


#define lpx_get_col_lb _glp_lpx_get_col_lb
double lpx_get_col_lb(LPX *lp, int j);


#define lpx_get_col_ub _glp_lpx_get_col_ub
double lpx_get_col_ub(LPX *lp, int j);


#define lpx_get_col_bnds _glp_lpx_get_col_bnds
void lpx_get_col_bnds(LPX *lp, int j, int *typx, double *lb,
      double *ub);


#define lpx_get_obj_coef _glp_lpx_get_obj_coef
double lpx_get_obj_coef(LPX *lp, int j);


#define lpx_get_num_nz _glp_lpx_get_num_nz
int lpx_get_num_nz(LPX *lp);


#define lpx_get_mat_row _glp_lpx_get_mat_row
int lpx_get_mat_row(LPX *lp, int i, int ind[], double val[]);


#define lpx_get_mat_col _glp_lpx_get_mat_col
int lpx_get_mat_col(LPX *lp, int j, int ind[], double val[]);


#define lpx_create_index _glp_lpx_create_index
void lpx_create_index(LPX *lp);


#define lpx_find_row _glp_lpx_find_row
int lpx_find_row(LPX *lp, const char *name);


#define lpx_find_col _glp_lpx_find_col
int lpx_find_col(LPX *lp, const char *name);


#define lpx_delete_index _glp_lpx_delete_index
void lpx_delete_index(LPX *lp);


#define lpx_scale_prob _glp_lpx_scale_prob
void lpx_scale_prob(LPX *lp);


#define lpx_unscale_prob _glp_lpx_unscale_prob
void lpx_unscale_prob(LPX *lp);


#define lpx_set_row_stat _glp_lpx_set_row_stat
void lpx_set_row_stat(LPX *lp, int i, int stat);


#define lpx_set_col_stat _glp_lpx_set_col_stat
void lpx_set_col_stat(LPX *lp, int j, int stat);


#define lpx_std_basis _glp_lpx_std_basis
void lpx_std_basis(LPX *lp);


#define lpx_adv_basis _glp_lpx_adv_basis
void lpx_adv_basis(LPX *lp);


#define lpx_cpx_basis _glp_lpx_cpx_basis
void lpx_cpx_basis(LPX *lp);


#define lpx_simplex _glp_lpx_simplex
int lpx_simplex(LPX *lp);


#define lpx_exact _glp_lpx_exact
int lpx_exact(LPX *lp);


#define lpx_get_status _glp_lpx_get_status
int lpx_get_status(LPX *lp);


#define lpx_get_prim_stat _glp_lpx_get_prim_stat
int lpx_get_prim_stat(LPX *lp);


#define lpx_get_dual_stat _glp_lpx_get_dual_stat
int lpx_get_dual_stat(LPX *lp);


#define lpx_get_obj_val _glp_lpx_get_obj_val
double lpx_get_obj_val(LPX *lp);


#define lpx_get_row_stat _glp_lpx_get_row_stat
int lpx_get_row_stat(LPX *lp, int i);


#define lpx_get_row_prim _glp_lpx_get_row_prim
double lpx_get_row_prim(LPX *lp, int i);


#define lpx_get_row_dual _glp_lpx_get_row_dual
double lpx_get_row_dual(LPX *lp, int i);


#define lpx_get_row_info _glp_lpx_get_row_info
void lpx_get_row_info(LPX *lp, int i, int *tagx, double *vx,
      double *dx);


#define lpx_get_col_stat _glp_lpx_get_col_stat
int lpx_get_col_stat(LPX *lp, int j);


#define lpx_get_col_prim _glp_lpx_get_col_prim
double lpx_get_col_prim(LPX *lp, int j);


#define lpx_get_col_dual _glp_lpx_get_col_dual
double lpx_get_col_dual(glp_prob *lp, int j);


#define lpx_get_col_info _glp_lpx_get_col_info
void lpx_get_col_info(LPX *lp, int j, int *tagx, double *vx,
      double *dx);


#define lpx_get_ray_info _glp_lpx_get_ray_info
int lpx_get_ray_info(LPX *lp);


#define lpx_check_kkt _glp_lpx_check_kkt
void lpx_check_kkt(LPX *lp, int scaled, LPXKKT *kkt);


#define lpx_warm_up _glp_lpx_warm_up
int lpx_warm_up(LPX *lp);


#define lpx_eval_tab_row _glp_lpx_eval_tab_row
int lpx_eval_tab_row(LPX *lp, int k, int ind[], double val[]);


#define lpx_eval_tab_col _glp_lpx_eval_tab_col
int lpx_eval_tab_col(LPX *lp, int k, int ind[], double val[]);


#define lpx_transform_row _glp_lpx_transform_row
int lpx_transform_row(LPX *lp, int len, int ind[], double val[]);


#define lpx_transform_col _glp_lpx_transform_col
int lpx_transform_col(LPX *lp, int len, int ind[], double val[]);


#define lpx_prim_ratio_test _glp_lpx_prim_ratio_test
int lpx_prim_ratio_test(LPX *lp, int len, const int ind[],
      const double val[], int how, double tol);


#define lpx_dual_ratio_test _glp_lpx_dual_ratio_test
int lpx_dual_ratio_test(LPX *lp, int len, const int ind[],
      const double val[], int how, double tol);


#define lpx_interior _glp_lpx_interior
int lpx_interior(LPX *lp);


#define lpx_ipt_status _glp_lpx_ipt_status
int lpx_ipt_status(LPX *lp);


#define lpx_ipt_obj_val _glp_lpx_ipt_obj_val
double lpx_ipt_obj_val(LPX *lp);


#define lpx_ipt_row_prim _glp_lpx_ipt_row_prim
double lpx_ipt_row_prim(LPX *lp, int i);


#define lpx_ipt_row_dual _glp_lpx_ipt_row_dual
double lpx_ipt_row_dual(LPX *lp, int i);


#define lpx_ipt_col_prim _glp_lpx_ipt_col_prim
double lpx_ipt_col_prim(LPX *lp, int j);


#define lpx_ipt_col_dual _glp_lpx_ipt_col_dual
double lpx_ipt_col_dual(LPX *lp, int j);


#define lpx_set_class _glp_lpx_set_class
void lpx_set_class(LPX *lp, int klass);


#define lpx_get_class _glp_lpx_get_class
int lpx_get_class(LPX *lp);


#define lpx_set_col_kind _glp_lpx_set_col_kind
void lpx_set_col_kind(LPX *lp, int j, int kind);


#define lpx_get_col_kind _glp_lpx_get_col_kind
int lpx_get_col_kind(LPX *lp, int j);


#define lpx_get_num_int _glp_lpx_get_num_int
int lpx_get_num_int(LPX *lp);


#define lpx_get_num_bin _glp_lpx_get_num_bin
int lpx_get_num_bin(LPX *lp);


#define lpx_integer _glp_lpx_integer
int lpx_integer(LPX *lp);


#define lpx_intopt _glp_lpx_intopt
int lpx_intopt(LPX *lp);


#define lpx_mip_status _glp_lpx_mip_status
int lpx_mip_status(LPX *lp);


#define lpx_mip_obj_val _glp_lpx_mip_obj_val
double lpx_mip_obj_val(LPX *lp);


#define lpx_mip_row_val _glp_lpx_mip_row_val
double lpx_mip_row_val(LPX *lp, int i);


#define lpx_mip_col_val _glp_lpx_mip_col_val
double lpx_mip_col_val(LPX *lp, int j);


#define lpx_check_int _glp_lpx_check_int
void lpx_check_int(LPX *lp, LPXKKT *kkt);


#define lpx_reset_parms _glp_lpx_reset_parms
void lpx_reset_parms(LPX *lp);


#define lpx_set_int_parm _glp_lpx_set_int_parm
void lpx_set_int_parm(LPX *lp, int parm, int val);


#define lpx_get_int_parm _glp_lpx_get_int_parm
int lpx_get_int_parm(LPX *lp, int parm);


#define lpx_set_real_parm _glp_lpx_set_real_parm
void lpx_set_real_parm(LPX *lp, int parm, double val);


#define lpx_get_real_parm _glp_lpx_get_real_parm
double lpx_get_real_parm(LPX *lp, int parm);


#define lpx_read_mps _glp_lpx_read_mps
LPX *lpx_read_mps(const char *fname);


#define lpx_write_mps _glp_lpx_write_mps
int lpx_write_mps(LPX *lp, const char *fname);


#define lpx_read_bas _glp_lpx_read_bas
int lpx_read_bas(LPX *lp, const char *fname);


#define lpx_write_bas _glp_lpx_write_bas
int lpx_write_bas(LPX *lp, const char *fname);


#define lpx_read_freemps _glp_lpx_read_freemps
LPX *lpx_read_freemps(const char *fname);


#define lpx_write_freemps _glp_lpx_write_freemps
int lpx_write_freemps(LPX *lp, const char *fname);


#define lpx_read_cpxlp _glp_lpx_read_cpxlp
LPX *lpx_read_cpxlp(const char *fname);


#define lpx_write_cpxlp _glp_lpx_write_cpxlp
int lpx_write_cpxlp(LPX *lp, const char *fname);


#define lpx_read_model _glp_lpx_read_model
LPX *lpx_read_model(const char *model, const char *data,
      const char *output);


#define lpx_print_prob _glp_lpx_print_prob
int lpx_print_prob(LPX *lp, const char *fname);


#define lpx_print_sol _glp_lpx_print_sol
int lpx_print_sol(LPX *lp, const char *fname);


#define lpx_print_sens_bnds _glp_lpx_print_sens_bnds
int lpx_print_sens_bnds(LPX *lp, const char *fname);


#define lpx_print_ips _glp_lpx_print_ips
int lpx_print_ips(LPX *lp, const char *fname);


#define lpx_print_mip _glp_lpx_print_mip
int lpx_print_mip(LPX *lp, const char *fname);


#define lpx_is_b_avail _glp_lpx_is_b_avail
int lpx_is_b_avail(LPX *lp);


#define lpx_write_pb _glp_lpx_write_pb
int lpx_write_pb(LPX *lp, const char *fname, int normalized,
      int binarize);


#define lpx_main _glp_lpx_main
int lpx_main(int argc, const char *argv[]);


}

