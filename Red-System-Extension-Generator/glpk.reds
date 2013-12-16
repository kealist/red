Red/System [

]

#include %common.reds

#define GLPK-library "glpk.dll"

; library version numbers: 
#define GLP_MAJOR_VERSION  4
#define GLP_MINOR_VERSION  34

; optimization direction flag: 
#define GLP_MIN            1  ; minimization 
#define GLP_MAX            2  ; maximization 

; kind of structural variable: 
#define GLP_CV             1  ; continuous variable 
#define GLP_IV             2  ; integer variable 
#define GLP_BV             3  ; binary variable 

; type of auxiliary/structural variable: 
#define GLP_FR             1  ; free variable 
#define GLP_LO             2  ; variable with lower bound 
#define GLP_UP             3  ; variable with upper bound 
#define GLP_DB             4  ; double-bounded variable 
#define GLP_FX             5  ; fixed variable 

; status of auxiliary/structural variable: 
#define GLP_BS             1  ; basic variable 
#define GLP_NL             2  ; non-basic variable on lower bound 
#define GLP_NU             3  ; non-basic variable on upper bound 
#define GLP_NF             4  ; non-basic free variable 
#define GLP_NS             5  ; non-basic fixed variable 

; scaling options:
#define GLP_SF_GM       0x01  ; perform geometric mean scaling 
#define GLP_SF_EQ       0x10  ; perform equilibration scaling 
#define GLP_SF_2N       0x20  ; round scale factors to power of two 
#define GLP_SF_SKIP     0x40  ; skip if problem is well scaled 
#define GLP_SF_AUTO     0x80  ; choose scaling options automatically 

; solution indicator: 
#define GLP_SOL            1  ; basic solution 
#define GLP_IPT            2  ; interior-posolution 
#define GLP_MIP            3  ; mixed integer solution 

; solution status: 
#define GLP_UNDEF          1  ; solution is undefined 
#define GLP_FEAS           2  ; solution is feasible 
#define GLP_INFEAS         3  ; solution is infeasible 
#define GLP_NOFEAS         4  ; no feasible solution exists 
#define GLP_OPT            5  ; solution is optimal 
#define GLP_UNBND          6  ; solution is unbounded 

;typedef struct { _opaque_prob; } glp_prob;

glp_prob!: alias struct! [
    _opaque_prob [double!]
] 

glp_long!: alias struct! [
	lo [integer!]
	hi [integer!]
]
;typedef struct { lo, hi; } glp_long;

glp_bfcp!: alias struct! [
	;     basis factorization control parameters 
      msg_lev	[integer!]		;msg_lev;             (reserved) 
      type 		[integer!]		;type;                factorization type: 
#define GLP_BF_FT          1  ; LUF + Forrest-Tomlin 
#define GLP_BF_BG          2  ; LUF + Schur compl. + Bartels-Golub 
#define GLP_BF_GR          3  ; LUF + Schur compl. + Givens rotation 
      lu_size 	[integer!]		;lu_size;             luf.sv_size 
      piv_tol 	[double!]		;piv_tol;          luf.piv_tol 
      piv_lim 	[integer!]		;piv_lim;             luf.piv_lim 
      suhl 		[integer!]		;suhl;                luf.suhl 
      eps_tol	[double!]		;          luf.eps_tol 
      max_gro	[double!]		;          luf.max_gro 
      nfs_max	[integer!]		;          fhv.hh_max 
      upd_tol	[double!]		;          fhv.upd_tol 
      nrs_max	[integer!]		;             lpf.n_max 
      rs_size	[integer!]		;             lpf.v_size 
      ;foo_bar[38] [double!];      (reserved) 
]

glp_smcp!: alias struct! [
;      simplex method control parameters 
      msg_lev	[integer!];            ; message level: 
#define GLP_MSG_OFF        0  ; no output 
#define GLP_MSG_ERR        1  ; warning and error messages only 
#define GLP_MSG_ON         2  ; normal output 
#define GLP_MSG_ALL        3  ; full output 
#define GLP_MSG_DBG        4  ; debug output 
      meth	[integer!];        ;        simplex method option: 
#define GLP_PRIMAL         1  ; use primal simplex 
#define GLP_DUALP          2  ; use dual; if it fails, use primal 
#define GLP_DUAL           3  ; use dual simplex 
      pricing	[integer!];   ;          pricing technique: 
#define GLP_PT_STD      0x11  ; standard (Dantzig rule) 
#define GLP_PT_PSE      0x22  ; projected steepest edge 
      r_test	[integer!];   ;           ratio test technique: 
#define GLP_RT_STD      0x11  ; standard (textbook) 
#define GLP_RT_HAR      0x22  ; two-pass Harris' ratio test 
      tol_bnd	[double!];    ;      spx.tol_bnd 
      tol_dj		[double!];           spx.tol_dj 
      tol_piv	[double!];    ;      spx.tol_piv 
      obj_ll		[double!];           spx.obj_ll 
      obj_ul		[double!];           spx.obj_ul 
      it_lim	[integer!];              spx.it_lim 
      tm_lim	[integer!];              spx.tm_lim (milliseconds) 
      out_frq	[integer!];             spx.out_frq 
      out_dly	[integer!];             spx.out_dly (milliseconds) 
      presolve	[integer!];            enable/disable using LP presolver 
      ;foo_bar[36];      (reserved) 
]

glp_tree!: alias struct! [
	_opaque_tree [double!]; 
]

glp_iocp!: alias struct! [
     ; integer optimizer control parameters */
      msg_lev	[integer!];            ; message level: */
#define GLP_MSG_OFF        0  ; no output */
#define GLP_MSG_ERR        1  ; warning and error messages only */
#define GLP_MSG_ON         2  ; normal output */
#define GLP_MSG_ALL        3  ; full output */
#define GLP_MSG_DBG        4  ; debug output */
      br_tech	[integer!];            ; branching technique: */
#define GLP_BR_FFV         1  ; first fractional variable */
#define GLP_BR_LFV         2  ; last fractional variable */
#define GLP_BR_MFV         3  ; most fractional variable */
#define GLP_BR_DTH         4  ; heuristic by Driebeck and Tomlin */
#define GLP_BR_HPC         5  ; hybrid pseudocost */
      bt_tech	[integer!];            ; backtracking technique: */
#define GLP_BT_DFS         1  ; depth first search */
#define GLP_BT_BFS         2  ; breadth first search */
#define GLP_BT_BLB         3  ; best local bound */
#define GLP_BT_BPH         4  ; best projection heuristic */
      tol_int		[double!];         ; mip.tol_*/
      tol_obj		[double!];         ; mip.tol_obj */
      tm_lim	[integer!];             ; mip.tm_lim (milliseconds) */
      out_frq	[integer!];            ; mip.out_frq (milliseconds) */
      out_dly	[integer!];            ; mip.out_dly (milliseconds) */
      void (*cb_func)(glp_tree *tree, void *info);
                              ; mip.cb_func */
      void *cb_info;          ; mip.cb_info */
      cb_size	[integer!];            ; mip.cb_size */
      pp_tech	[integer!];            ; preprocessing technique: */
#define GLP_PP_NONE        0  ; disable preprocessing */
#define GLP_PP_ROOT        1  ; preprocessing only on root level */
#define GLP_PP_ALL         2  ; preprocessing on all levels */
      mip_gap;         ; relative MIP gap tolerance */
      mir_cuts	[integer!];           ; MIR cuts       (GLP_ON/GLP_OFF) */
      gmi_cuts	[integer!];           ; Gomory's cuts  (GLP_ON/GLP_OFF) */
      cov_cuts	[integer!];           ; cover cuts     (GLP_ON/GLP_OFF) */
      clq_cuts	[integer!];           ; clique cuts    (GLP_ON/GLP_OFF) */
      presolve	[integer!];           ; enable/disable using MIP presolver */
      binarize	[integer!];           ; try to binarize integer variables */
      ;double foo_bar[30];     ; (reserved) */
#if 1 ; not yet available */
      char *fn_sol;           ; file name to write solution found */
#endif
];


#import [
	GLPK-library cdecl [
		
	]
]