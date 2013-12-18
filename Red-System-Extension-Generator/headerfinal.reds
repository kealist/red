#define GLP-MAJOR-VERSION			4
#define GLP-MINOR-VERSION			34
#define GLP-MIN			1
#define GLP-MAX			2
#define GLP-CV			1
#define GLP-IV			2
#define GLP-BV			3
#define GLP-FR			1
#define GLP-LO			2
#define GLP-UP			3
#define GLP-DB			4
#define GLP-FX			5
#define GLP-BS			1
#define GLP-NL			2
#define GLP-NU			3
#define GLP-NF			4
#define GLP-NS			5
#define GLP-SF-GM			1
#define GLP-SF-EQ			16
#define GLP-SF-2N			32
#define GLP-SF-SKIP			64
#define GLP-SF-AUTO			128
#define GLP-SOL			1
#define GLP-IPT			2
#define GLP-MIP			3
#define GLP-UNDEF			1
#define GLP-FEAS			2
#define GLP-INFEAS			3
#define GLP-NOFEAS			4
#define GLP-OPT			5
#define GLP-UNBND			6
#define GLP-BF-FT			1
#define GLP-BF-BG			2
#define GLP-BF-GR			3
#define GLP-MSG-OFF			0
#define GLP-MSG-ERR			1
#define GLP-MSG-ON			2
#define GLP-MSG-ALL			3
#define GLP-MSG-DBG			4
#define GLP-PRIMAL			1
#define GLP-DUALP			2
#define GLP-DUAL			3
#define GLP-PT-STD			17
#define GLP-PT-PSE			34
#define GLP-RT-STD			17
#define GLP-RT-HAR			34
#define GLP-MSG-OFF			0
#define GLP-MSG-ERR			1
#define GLP-MSG-ON			2
#define GLP-MSG-ALL			3
#define GLP-MSG-DBG			4
#define GLP-BR-FFV			1
#define GLP-BR-LFV			2
#define GLP-BR-MFV			3
#define GLP-BR-DTH			4
#define GLP-BR-HPC			5
#define GLP-BT-DFS			1
#define GLP-BT-BFS			2
#define GLP-BT-BLB			3
#define GLP-BT-BPH			4
#define GLP-PP-NONE			0
#define GLP-PP-ROOT			1
#define GLP-PP-ALL			2
#define GLP-RF-REG			0
#define GLP-RF-LAZY			1
#define GLP-RF-CUT			2
#define GLP-RF-GMI			1
#define GLP-RF-MIR			2
#define GLP-RF-COV			3
#define GLP-RF-CLQ			4
#define GLP-ON			1
#define GLP-OFF			0
#define GLP-IROWGEN			1
#define GLP-IBINGO			2
#define GLP-IHEUR			3
#define GLP-ICUTGEN			4
#define GLP-IBRANCH			5
#define GLP-ISELECT			6
#define GLP-IPREPRO			7
#define GLP-NO-BRNCH			0
#define GLP-DN-BRNCH			1
#define GLP-UP-BRNCH			2
#define GLP-EBADB			1
#define GLP-ESING			2
#define GLP-ECOND			3
#define GLP-EBOUND			4
#define GLP-EFAIL			5
#define GLP-EOBJLL			6
#define GLP-EOBJUL			7
#define GLP-EITLIM			8
#define GLP-ETMLIM			9
#define GLP-ENOPFS			10
#define GLP-ENODFS			11
#define GLP-EROOT			12
#define GLP-ESTOP			13
#define GLP-EMIPGAP			14
#define GLP-ENOFEAS			15
#define GLP-ENOCVG			16
#define GLP-EINSTAB			17
#define GLP-MPS-DECK			1
#define GLP-MPS-FILE			2
glp-set-prob-name: "glp_set_prob_name" [
	*lp	[glp_prob!]
	*name	["char"]
	return: 	[void!]
]
glp-set-obj-name: "glp_set_obj_name" [
	*lp	[glp_prob!]
	*name	["char"]
	return: 	[void!]
]
glp-set-obj-dir: "glp_set_obj_dir" [
	*lp	[glp_prob!]
	dir	[integer!]
	return: 	[void!]
]
glp-add-rows: "glp_add_rows" [
	*lp	[glp_prob!]
	nrs	[integer!]
	return: 	[integer!]
]
glp-add-cols: "glp_add_cols" [
	*lp	[glp_prob!]
	ncs	[integer!]
	return: 	[integer!]
]
glp-set-row-name: "glp_set_row_name" [
	*lp	[glp_prob!]
	i	[integer!]
	*name	["char"]
	return: 	[void!]
]
glp-set-col-name: "glp_set_col_name" [
	*lp	[glp_prob!]
	j	[integer!]
	*name	["char"]
	return: 	[void!]
]
glp-set-row-bnds: "glp_set_row_bnds" [
	*lp	[glp_prob!]
	i	[integer!]
	type	[integer!]
	lb	[double!]
	ub	[double!]
	return: 	[void!]
]
glp-set-col-bnds: "glp_set_col_bnds" [
	*lp	[glp_prob!]
	j	[integer!]
	type	[integer!]
	lb	[double!]
	ub	[double!]
	return: 	[void!]
]
glp-set-obj-coef: "glp_set_obj_coef" [
	*lp	[glp_prob!]
	j	[integer!]
	coef	[double!]
	return: 	[void!]
]
glp-set-mat-row: "glp_set_mat_row" [
	*lp	[glp_prob!]
	i	[integer!]
	len	[integer!]
	ind	[integer!]
	val	[double!]
	return: 	[void!]
]
glp-set-mat-col: "glp_set_mat_col" [
	*lp	[glp_prob!]
	j	[integer!]
	len	[integer!]
	ind	[integer!]
	val	[double!]
	return: 	[void!]
]
glp-load-matrix: "glp_load_matrix" [
	*lp	[glp_prob!]
	ne	[integer!]
	ia	[integer!]
	ja	[integer!]
	ar	[double!]
	return: 	[void!]
]
glp-del-rows: "glp_del_rows" [
	*lp	[glp_prob!]
	nrs	[integer!]
	num	[integer!]
	return: 	[void!]
]
glp-del-cols: "glp_del_cols" [
	*lp	[glp_prob!]
	ncs	[integer!]
	num	[integer!]
	return: 	[void!]
]
glp-copy-prob: "glp_copy_prob" [
	*dest	[glp_prob!]
	*prob	[glp_prob!]
	names	[integer!]
	return: 	[void!]
]
glp-erase-prob: "glp_erase_prob" [
	*lp	[glp_prob!]
	return: 	[void!]
]
glp-delete-prob: "glp_delete_prob" [
	*lp	[glp_prob!]
	return: 	[void!]
]
*glp-get-prob-name: "*glp_get_prob_name" [
	*lp	[glp_prob!]
	return: 	[char!]
]
*glp-get-obj-name: "*glp_get_obj_name" [
	*lp	[glp_prob!]
	return: 	[char!]
]
glp-get-obj-dir: "glp_get_obj_dir" [
	*lp	[glp_prob!]
	return: 	[integer!]
]
glp-get-num-rows: "glp_get_num_rows" [
	*lp	[glp_prob!]
	return: 	[integer!]
]
glp-get-num-cols: "glp_get_num_cols" [
	*lp	[glp_prob!]
	return: 	[integer!]
]
*glp-get-row-name: "*glp_get_row_name" [
	*lp	[glp_prob!]
	i	[integer!]
	return: 	[char!]
]
*glp-get-col-name: "*glp_get_col_name" [
	*lp	[glp_prob!]
	j	[integer!]
	return: 	[char!]
]
glp-get-row-type: "glp_get_row_type" [
	*lp	[glp_prob!]
	i	[integer!]
	return: 	[integer!]
]
glp-get-row-lb: "glp_get_row_lb" [
	*lp	[glp_prob!]
	i	[integer!]
	return: 	[double!]
]
glp-get-row-ub: "glp_get_row_ub" [
	*lp	[glp_prob!]
	i	[integer!]
	return: 	[double!]
]
glp-get-col-type: "glp_get_col_type" [
	*lp	[glp_prob!]
	j	[integer!]
	return: 	[integer!]
]
glp-get-col-lb: "glp_get_col_lb" [
	*lp	[glp_prob!]
	j	[integer!]
	return: 	[double!]
]
glp-get-col-ub: "glp_get_col_ub" [
	*lp	[glp_prob!]
	j	[integer!]
	return: 	[double!]
]
glp-get-obj-coef: "glp_get_obj_coef" [
	*lp	[glp_prob!]
	j	[integer!]
	return: 	[double!]
]
glp-get-num-nz: "glp_get_num_nz" [
	*lp	[glp_prob!]
	return: 	[integer!]
]
glp-get-mat-row: "glp_get_mat_row" [
	*lp	[glp_prob!]
	i	[integer!]
	ind	[integer!]
	val	[double!]
	return: 	[integer!]
]
glp-get-mat-col: "glp_get_mat_col" [
	*lp	[glp_prob!]
	j	[integer!]
	ind	[integer!]
	val	[double!]
	return: 	[integer!]
]
glp-create-index: "glp_create_index" [
	*lp	[glp_prob!]
	return: 	[void!]
]
glp-find-row: "glp_find_row" [
	*lp	[glp_prob!]
	*name	["char"]
	return: 	[integer!]
]
glp-find-col: "glp_find_col" [
	*lp	[glp_prob!]
	*name	["char"]
	return: 	[integer!]
]
glp-delete-index: "glp_delete_index" [
	*lp	[glp_prob!]
	return: 	[void!]
]
glp-set-rii: "glp_set_rii" [
	*lp	[glp_prob!]
	i	[integer!]
	rii	[double!]
	return: 	[void!]
]
glp-set-sjj: "glp_set_sjj" [
	*lp	[glp_prob!]
	j	[integer!]
	sjj	[double!]
	return: 	[void!]
]
glp-get-rii: "glp_get_rii" [
	*lp	[glp_prob!]
	i	[integer!]
	return: 	[double!]
]
glp-get-sjj: "glp_get_sjj" [
	*lp	[glp_prob!]
	j	[integer!]
	return: 	[double!]
]
glp-scale-prob: "glp_scale_prob" [
	*lp	[glp_prob!]
	flags	[integer!]
	return: 	[void!]
]
glp-unscale-prob: "glp_unscale_prob" [
	*lp	[glp_prob!]
	return: 	[void!]
]
glp-set-row-stat: "glp_set_row_stat" [
	*lp	[glp_prob!]
	i	[integer!]
	stat	[integer!]
	return: 	[void!]
]
glp-set-col-stat: "glp_set_col_stat" [
	*lp	[glp_prob!]
	j	[integer!]
	stat	[integer!]
	return: 	[void!]
]
glp-std-basis: "glp_std_basis" [
	*lp	[glp_prob!]
	return: 	[void!]
]
glp-adv-basis: "glp_adv_basis" [
	*lp	[glp_prob!]
	flags	[integer!]
	return: 	[void!]
]
glp-cpx-basis: "glp_cpx_basis" [
	*lp	[glp_prob!]
	return: 	[void!]
]
glp-simplex: "glp_simplex" [
	*lp	[glp_prob!]
	*parm	["glp_smcp"]
	return: 	[integer!]
]
glp-exact: "glp_exact" [
	*lp	[glp_prob!]
	*parm	["glp_smcp"]
	return: 	[integer!]
]
glp-init-smcp: "glp_init_smcp" [
	*parm	["glp_smcp"]
	return: 	[void!]
]
glp-get-status: "glp_get_status" [
	*lp	[glp_prob!]
	return: 	[integer!]
]
glp-get-prim-stat: "glp_get_prim_stat" [
	*lp	[glp_prob!]
	return: 	[integer!]
]
glp-get-dual-stat: "glp_get_dual_stat" [
	*lp	[glp_prob!]
	return: 	[integer!]
]
glp-get-obj-val: "glp_get_obj_val" [
	*lp	[glp_prob!]
	return: 	[double!]
]
glp-get-row-stat: "glp_get_row_stat" [
	*lp	[glp_prob!]
	i	[integer!]
	return: 	[integer!]
]
glp-get-row-prim: "glp_get_row_prim" [
	*lp	[glp_prob!]
	i	[integer!]
	return: 	[double!]
]
glp-get-row-dual: "glp_get_row_dual" [
	*lp	[glp_prob!]
	i	[integer!]
	return: 	[double!]
]
glp-get-col-stat: "glp_get_col_stat" [
	*lp	[glp_prob!]
	j	[integer!]
	return: 	[integer!]
]
glp-get-col-prim: "glp_get_col_prim" [
	*lp	[glp_prob!]
	j	[integer!]
	return: 	[double!]
]
glp-get-col-dual: "glp_get_col_dual" [
	*lp	[glp_prob!]
	j	[integer!]
	return: 	[double!]
]
glp-get-unbnd-ray: "glp_get_unbnd_ray" [
	*lp	[glp_prob!]
	return: 	[integer!]
]
glp-interior: "glp_interior" [
	*lp	[glp_prob!]
	*parm	[void!]
	return: 	[integer!]
]
glp-ipt-status: "glp_ipt_status" [
	*lp	[glp_prob!]
	return: 	[integer!]
]
glp-ipt-obj-val: "glp_ipt_obj_val" [
	*lp	[glp_prob!]
	return: 	[double!]
]
glp-ipt-row-prim: "glp_ipt_row_prim" [
	*lp	[glp_prob!]
	i	[integer!]
	return: 	[double!]
]
glp-ipt-row-dual: "glp_ipt_row_dual" [
	*lp	[glp_prob!]
	i	[integer!]
	return: 	[double!]
]
glp-ipt-col-prim: "glp_ipt_col_prim" [
	*lp	[glp_prob!]
	j	[integer!]
	return: 	[double!]
]
glp-ipt-col-dual: "glp_ipt_col_dual" [
	*lp	[glp_prob!]
	j	[integer!]
	return: 	[double!]
]
glp-set-col-kind: "glp_set_col_kind" [
	*mip	[glp_prob!]
	j	[integer!]
	kind	[integer!]
	return: 	[void!]
]
glp-get-col-kind: "glp_get_col_kind" [
	*mip	[glp_prob!]
	j	[integer!]
	return: 	[integer!]
]
glp-get-num-int: "glp_get_num_int" [
	*mip	[glp_prob!]
	return: 	[integer!]
]
glp-get-num-bin: "glp_get_num_bin" [
	*mip	[glp_prob!]
	return: 	[integer!]
]
glp-intopt: "glp_intopt" [
	*mip	[glp_prob!]
	*parm	["glp_iocp"]
	return: 	[integer!]
]
glp-init-iocp: "glp_init_iocp" [
	*parm	["glp_iocp"]
	return: 	[void!]
]
glp-mip-status: "glp_mip_status" [
	*mip	[glp_prob!]
	return: 	[integer!]
]
glp-mip-obj-val: "glp_mip_obj_val" [
	*mip	[glp_prob!]
	return: 	[double!]
]
glp-mip-row-val: "glp_mip_row_val" [
	*mip	[glp_prob!]
	i	[integer!]
	return: 	[double!]
]
glp-mip-col-val: "glp_mip_col_val" [
	*mip	[glp_prob!]
	j	[integer!]
	return: 	[double!]
]
glp-read-sol: "glp_read_sol" [
	*lp	[glp_prob!]
	*fname	["char"]
	return: 	[integer!]
]
glp-write-sol: "glp_write_sol" [
	*lp	[glp_prob!]
	*fname	["char"]
	return: 	[integer!]
]
glp-read-ipt: "glp_read_ipt" [
	*lp	[glp_prob!]
	*fname	["char"]
	return: 	[integer!]
]
glp-write-ipt: "glp_write_ipt" [
	*lp	[glp_prob!]
	*fname	["char"]
	return: 	[integer!]
]
glp-read-mip: "glp_read_mip" [
	*mip	[glp_prob!]
	*fname	["char"]
	return: 	[integer!]
]
glp-write-mip: "glp_write_mip" [
	*mip	[glp_prob!]
	*fname	["char"]
	return: 	[integer!]
]
glp-bf-exists: "glp_bf_exists" [
	*lp	[glp_prob!]
	return: 	[integer!]
]
glp-factorize: "glp_factorize" [
	*lp	[glp_prob!]
	return: 	[integer!]
]
glp-bf-updated: "glp_bf_updated" [
	*lp	[glp_prob!]
	return: 	[integer!]
]
glp-get-bfcp: "glp_get_bfcp" [
	*lp	[glp_prob!]
	*parm	["glp_bfcp"]
	return: 	[void!]
]
glp-set-bfcp: "glp_set_bfcp" [
	*lp	[glp_prob!]
	*parm	["glp_bfcp"]
	return: 	[void!]
]
glp-get-bhead: "glp_get_bhead" [
	*lp	[glp_prob!]
	k	[integer!]
	return: 	[integer!]
]
glp-get-row-bind: "glp_get_row_bind" [
	*lp	[glp_prob!]
	i	[integer!]
	return: 	[integer!]
]
glp-get-col-bind: "glp_get_col_bind" [
	*lp	[glp_prob!]
	j	[integer!]
	return: 	[integer!]
]
glp-ftran: "glp_ftran" [
	*lp	[glp_prob!]
	x	[double!]
	return: 	[void!]
]
glp-btran: "glp_btran" [
	*lp	[glp_prob!]
	x	[double!]
	return: 	[void!]
]
glp-eval-tab-row: "glp_eval_tab_row" [
	*lp	[glp_prob!]
	k	[integer!]
	ind	[integer!]
	val	[double!]
	return: 	[integer!]
]
glp-eval-tab-col: "glp_eval_tab_col" [
	*lp	[glp_prob!]
	k	[integer!]
	ind	[integer!]
	val	[double!]
	return: 	[integer!]
]
glp-ios-reason: "glp_ios_reason" [
	*tree	["glp_tree"]
	return: 	[integer!]
]
*glp-ios-get-prob: "*glp_ios_get_prob" [
	*tree	["glp_tree"]
	return: 	[glp_prob!]
]
glp-ios-tree-size: "glp_ios_tree_size" [
	*tree	["glp_tree"]
	*a_cnt	[integer!]
	*n_cnt	[integer!]
	*t_cnt	[integer!]
	return: 	[void!]
]
glp-ios-curr-node: "glp_ios_curr_node" [
	*tree	["glp_tree"]
	return: 	[integer!]
]
glp-ios-next-node: "glp_ios_next_node" [
	*tree	["glp_tree"]
	p	[integer!]
	return: 	[integer!]
]
glp-ios-prev-node: "glp_ios_prev_node" [
	*tree	["glp_tree"]
	p	[integer!]
	return: 	[integer!]
]
glp-ios-up-node: "glp_ios_up_node" [
	*tree	["glp_tree"]
	p	[integer!]
	return: 	[integer!]
]
glp-ios-node-level: "glp_ios_node_level" [
	*tree	["glp_tree"]
	p	[integer!]
	return: 	[integer!]
]
glp-ios-node-bound: "glp_ios_node_bound" [
	*tree	["glp_tree"]
	p	[integer!]
	return: 	[double!]
]
glp-ios-best-node: "glp_ios_best_node" [
	*tree	["glp_tree"]
	return: 	[integer!]
]
glp-ios-mip-gap: "glp_ios_mip_gap" [
	*tree	["glp_tree"]
	return: 	[double!]
]
*glp-ios-node-data: "*glp_ios_node_data" [
	*tree	["glp_tree"]
	p	[integer!]
	return: 	[void!]
]
glp-ios-row-attr: "glp_ios_row_attr" [
	*tree	["glp_tree"]
	i	[integer!]
	*attr	["glp_attr"]
	return: 	[void!]
]
glp-ios-pool-size: "glp_ios_pool_size" [
	*tree	["glp_tree"]
	return: 	[integer!]
]
glp-ios-add-row: "glp_ios_add_row" [
	*tree	["glp_tree"]
	*name	["char"]
	klass	[integer!]
	flags	[integer!]
	len	[integer!]
	ind	[integer!]
	val	[double!]
	type	[integer!]
	rhs	[double!]
	return: 	[integer!]
]
glp-ios-del-row: "glp_ios_del_row" [
	*tree	["glp_tree"]
	i	[integer!]
	return: 	[void!]
]
glp-ios-clear-pool: "glp_ios_clear_pool" [
	*tree	["glp_tree"]
	return: 	[void!]
]
glp-ios-can-branch: "glp_ios_can_branch" [
	*tree	["glp_tree"]
	j	[integer!]
	return: 	[integer!]
]
glp-ios-branch-upon: "glp_ios_branch_upon" [
	*tree	["glp_tree"]
	j	[integer!]
	sel	[integer!]
	return: 	[void!]
]
glp-ios-select-node: "glp_ios_select_node" [
	*tree	["glp_tree"]
	p	[integer!]
	return: 	[void!]
]
glp-ios-heur-sol: "glp_ios_heur_sol" [
	*tree	["glp_tree"]
	x	[double!]
	return: 	[integer!]
]
glp-ios-terminate: "glp_ios_terminate" [
	*tree	["glp_tree"]
	return: 	[void!]
]
glp-term-out: "glp_term_out" [
	flag	[integer!]
	return: 	[void!]
]
*glp-malloc: "*glp_malloc" [
	size	[integer!]
	return: 	[void!]
]
*glp-calloc: "*glp_calloc" [
	n	[integer!]
	size	[integer!]
	return: 	[void!]
]
glp-free: "glp_free" [
	*ptr	[void!]
	return: 	[void!]
]
glp-mem-usage: "glp_mem_usage" [
	*count	[integer!]
	*cpeak	[integer!]
	*total	["glp_long"]
	*tpeak	["glp_long"]
	return: 	[void!]
]
glp-mem-limit: "glp_mem_limit" [
	limit	[integer!]
	return: 	[void!]
]
glp-read-mps: "glp_read_mps" [
	*lp	[glp_prob!]
	fmt	[integer!]
	*parm	[void!]
	*fname	["char"]
	return: 	[integer!]
]
glp-write-mps: "glp_write_mps" [
	*lp	[glp_prob!]
	fmt	[integer!]
	*parm	[void!]
	*fname	["char"]
	return: 	[integer!]
]
glp-read-lp: "glp_read_lp" [
	*lp	[glp_prob!]
	*parm	[void!]
	*fname	["char"]
	return: 	[integer!]
]
glp-write-lp: "glp_write_lp" [
	*lp	[glp_prob!]
	*parm	[void!]
	*fname	["char"]
	return: 	[integer!]
]
glp-mpl-read-model: "glp_mpl_read_model" [
	*tran	["glp_tran"]
	*fname	["char"]
	skip	[integer!]
	return: 	[integer!]
]
glp-mpl-read-data: "glp_mpl_read_data" [
	*tran	["glp_tran"]
	*fname	["char"]
	return: 	[integer!]
]
glp-mpl-generate: "glp_mpl_generate" [
	*tran	["glp_tran"]
	*fname	["char"]
	return: 	[integer!]
]
glp-mpl-build-prob: "glp_mpl_build_prob" [
	*tran	["glp_tran"]
	*prob	[glp_prob!]
	return: 	[void!]
]
glp-mpl-postsolve: "glp_mpl_postsolve" [
	*tran	["glp_tran"]
	*prob	[glp_prob!]
	sol	[integer!]
	return: 	[integer!]
]
glp-mpl-free-wksp: "glp_mpl_free_wksp" [
	*tran	["glp_tran"]
	return: 	[void!]
]
glp-main: "glp_main" [
	argc	[integer!]
	*argv	["char"]
	return: 	[integer!]
]
#define LPX			glp_prob
#define LPX-LP			100
#define LPX-MIP			101
#define LPX-FR			110
#define LPX-LO			111
#define LPX-UP			112
#define LPX-DB			113
#define LPX-FX			114
#define LPX-MIN			120
#define LPX-MAX			121
#define LPX-P-UNDEF			132
#define LPX-P-FEAS			133
#define LPX-P-INFEAS			134
#define LPX-P-NOFEAS			135
#define LPX-D-UNDEF			136
#define LPX-D-FEAS			137
#define LPX-D-INFEAS			138
#define LPX-D-NOFEAS			139
#define LPX-BS			140
#define LPX-NL			141
#define LPX-NU			142
#define LPX-NF			143
#define LPX-NS			144
#define LPX-T-UNDEF			150
#define LPX-T-OPT			151
#define LPX-CV			160
#define LPX-IV			161
#define LPX-I-UNDEF			170
#define LPX-I-OPT			171
#define LPX-I-FEAS			172
#define LPX-I-NOFEAS			173
#define LPX-OPT			180
#define LPX-FEAS			181
#define LPX-INFEAS			182
#define LPX-NOFEAS			183
#define LPX-UNBND			184
#define LPX-UNDEF			185
#define LPX-E-OK			200
#define LPX-E-EMPTY			201
#define LPX-E-BADB			202
#define LPX-E-INFEAS			203
#define LPX-E-FAULT			204
#define LPX-E-OBJLL			205
#define LPX-E-OBJUL			206
#define LPX-E-ITLIM			207
#define LPX-E-TMLIM			208
#define LPX-E-NOFEAS			209
#define LPX-E-INSTAB			210
#define LPX-E-SING			211
#define LPX-E-NOCONV			212
#define LPX-E-NOPFS			213
#define LPX-E-NODFS			214
#define LPX-E-MIPGAP			215
#define LPX-K-MSGLEV			300
#define LPX-K-SCALE			301
#define LPX-K-DUAL			302
#define LPX-K-PRICE			303
#define LPX-K-RELAX			304
#define LPX-K-TOLBND			305
#define LPX-K-TOLDJ			306
#define LPX-K-TOLPIV			307
#define LPX-K-ROUND			308
#define LPX-K-OBJLL			309
#define LPX-K-OBJUL			310
#define LPX-K-ITLIM			311
#define LPX-K-ITCNT			312
#define LPX-K-TMLIM			313
#define LPX-K-OUTFRQ			314
#define LPX-K-OUTDLY			315
#define LPX-K-BRANCH			316
#define LPX-K-BTRACK			317
#define LPX-K-TOLINT			318
#define LPX-K-TOLOBJ			319
#define LPX-K-MPSINFO			320
#define LPX-K-MPSOBJ			321
#define LPX-K-MPSORIG			322
#define LPX-K-MPSWIDE			323
#define LPX-K-MPSFREE			324
#define LPX-K-MPSSKIP			325
#define LPX-K-LPTORIG			326
#define LPX-K-PRESOL			327
#define LPX-K-BINARIZE			328
#define LPX-K-USECUTS			329
#define LPX-K-BFTYPE			330
#define LPX-K-MIPGAP			331
#define LPX-C-COVER			1
#define LPX-C-CLIQUE			2
#define LPX-C-GOMORY			4
#define LPX-C-MIR			8
#define LPX-C-ALL			255
#define lpx-create-prob			_glp_lpx_create_prob
#define lpx-set-prob-name			_glp_lpx_set_prob_name
lpx-set-prob-name: "lpx_set_prob_name" [
	*lp	["LPX"]
	*name	["char"]
	return: 	[void!]
]
#define lpx-set-obj-name			_glp_lpx_set_obj_name
lpx-set-obj-name: "lpx_set_obj_name" [
	*lp	["LPX"]
	*name	["char"]
	return: 	[void!]
]
#define lpx-set-obj-dir			_glp_lpx_set_obj_dir
lpx-set-obj-dir: "lpx_set_obj_dir" [
	*lp	["LPX"]
	dir	[integer!]
	return: 	[void!]
]
#define lpx-add-rows			_glp_lpx_add_rows
lpx-add-rows: "lpx_add_rows" [
	*lp	["LPX"]
	nrs	[integer!]
	return: 	[integer!]
]
#define lpx-add-cols			_glp_lpx_add_cols
lpx-add-cols: "lpx_add_cols" [
	*lp	["LPX"]
	ncs	[integer!]
	return: 	[integer!]
]
#define lpx-set-row-name			_glp_lpx_set_row_name
lpx-set-row-name: "lpx_set_row_name" [
	*lp	["LPX"]
	i	[integer!]
	*name	["char"]
	return: 	[void!]
]
#define lpx-set-col-name			_glp_lpx_set_col_name
lpx-set-col-name: "lpx_set_col_name" [
	*lp	["LPX"]
	j	[integer!]
	*name	["char"]
	return: 	[void!]
]
#define lpx-set-row-bnds			_glp_lpx_set_row_bnds
lpx-set-row-bnds: "lpx_set_row_bnds" [
	*lp	["LPX"]
	i	[integer!]
	type	[integer!]
	lb	[double!]
	ub	[double!]
	return: 	[void!]
]
#define lpx-set-col-bnds			_glp_lpx_set_col_bnds
lpx-set-col-bnds: "lpx_set_col_bnds" [
	*lp	["LPX"]
	j	[integer!]
	type	[integer!]
	lb	[double!]
	ub	[double!]
	return: 	[void!]
]
#define lpx-set-obj-coef			_glp_lpx_set_obj_coef
lpx-set-obj-coef: "lpx_set_obj_coef" [
	*lp	[glp_prob!]
	j	[integer!]
	coef	[double!]
	return: 	[void!]
]
#define lpx-set-mat-row			_glp_lpx_set_mat_row
lpx-set-mat-row: "lpx_set_mat_row" [
	*lp	["LPX"]
	i	[integer!]
	len	[integer!]
	ind	[integer!]
	val	[double!]
	return: 	[void!]
]
#define lpx-set-mat-col			_glp_lpx_set_mat_col
lpx-set-mat-col: "lpx_set_mat_col" [
	*lp	["LPX"]
	j	[integer!]
	len	[integer!]
	ind	[integer!]
	val	[double!]
	return: 	[void!]
]
#define lpx-load-matrix			_glp_lpx_load_matrix
lpx-load-matrix: "lpx_load_matrix" [
	*lp	["LPX"]
	ne	[integer!]
	ia	[integer!]
	ja	[integer!]
	ar	[double!]
	return: 	[void!]
]
#define lpx-del-rows			_glp_lpx_del_rows
lpx-del-rows: "lpx_del_rows" [
	*lp	["LPX"]
	nrs	[integer!]
	num	[integer!]
	return: 	[void!]
]
#define lpx-del-cols			_glp_lpx_del_cols
lpx-del-cols: "lpx_del_cols" [
	*lp	["LPX"]
	ncs	[integer!]
	num	[integer!]
	return: 	[void!]
]
#define lpx-delete-prob			_glp_lpx_delete_prob
lpx-delete-prob: "lpx_delete_prob" [
	*lp	["LPX"]
	return: 	[void!]
]
#define lpx-get-prob-name			_glp_lpx_get_prob_name
*lpx-get-prob-name: "*lpx_get_prob_name" [
	*lp	["LPX"]
	return: 	[char!]
]
#define lpx-get-obj-name			_glp_lpx_get_obj_name
*lpx-get-obj-name: "*lpx_get_obj_name" [
	*lp	["LPX"]
	return: 	[char!]
]
#define lpx-get-obj-dir			_glp_lpx_get_obj_dir
lpx-get-obj-dir: "lpx_get_obj_dir" [
	*lp	["LPX"]
	return: 	[integer!]
]
#define lpx-get-num-rows			_glp_lpx_get_num_rows
lpx-get-num-rows: "lpx_get_num_rows" [
	*lp	["LPX"]
	return: 	[integer!]
]
#define lpx-get-num-cols			_glp_lpx_get_num_cols
lpx-get-num-cols: "lpx_get_num_cols" [
	*lp	["LPX"]
	return: 	[integer!]
]
#define lpx-get-row-name			_glp_lpx_get_row_name
*lpx-get-row-name: "*lpx_get_row_name" [
	*lp	["LPX"]
	i	[integer!]
	return: 	[char!]
]
#define lpx-get-col-name			_glp_lpx_get_col_name
*lpx-get-col-name: "*lpx_get_col_name" [
	*lp	["LPX"]
	j	[integer!]
	return: 	[char!]
]
#define lpx-get-row-type			_glp_lpx_get_row_type
lpx-get-row-type: "lpx_get_row_type" [
	*lp	["LPX"]
	i	[integer!]
	return: 	[integer!]
]
#define lpx-get-row-lb			_glp_lpx_get_row_lb
lpx-get-row-lb: "lpx_get_row_lb" [
	*lp	["LPX"]
	i	[integer!]
	return: 	[double!]
]
#define lpx-get-row-ub			_glp_lpx_get_row_ub
lpx-get-row-ub: "lpx_get_row_ub" [
	*lp	["LPX"]
	i	[integer!]
	return: 	[double!]
]
#define lpx-get-row-bnds			_glp_lpx_get_row_bnds
lpx-get-row-bnds: "lpx_get_row_bnds" [
	*lp	["LPX"]
	i	[integer!]
	*typx	[integer!]
	*lb	[double!]
	*ub	[double!]
	return: 	[void!]
]
#define lpx-get-col-type			_glp_lpx_get_col_type
lpx-get-col-type: "lpx_get_col_type" [
	*lp	["LPX"]
	j	[integer!]
	return: 	[integer!]
]
#define lpx-get-col-lb			_glp_lpx_get_col_lb
lpx-get-col-lb: "lpx_get_col_lb" [
	*lp	["LPX"]
	j	[integer!]
	return: 	[double!]
]
#define lpx-get-col-ub			_glp_lpx_get_col_ub
lpx-get-col-ub: "lpx_get_col_ub" [
	*lp	["LPX"]
	j	[integer!]
	return: 	[double!]
]
#define lpx-get-col-bnds			_glp_lpx_get_col_bnds
lpx-get-col-bnds: "lpx_get_col_bnds" [
	*lp	["LPX"]
	j	[integer!]
	*typx	[integer!]
	*lb	[double!]
	*ub	[double!]
	return: 	[void!]
]
#define lpx-get-obj-coef			_glp_lpx_get_obj_coef
lpx-get-obj-coef: "lpx_get_obj_coef" [
	*lp	["LPX"]
	j	[integer!]
	return: 	[double!]
]
#define lpx-get-num-nz			_glp_lpx_get_num_nz
lpx-get-num-nz: "lpx_get_num_nz" [
	*lp	["LPX"]
	return: 	[integer!]
]
#define lpx-get-mat-row			_glp_lpx_get_mat_row
lpx-get-mat-row: "lpx_get_mat_row" [
	*lp	["LPX"]
	i	[integer!]
	ind	[integer!]
	val	[double!]
	return: 	[integer!]
]
#define lpx-get-mat-col			_glp_lpx_get_mat_col
lpx-get-mat-col: "lpx_get_mat_col" [
	*lp	["LPX"]
	j	[integer!]
	ind	[integer!]
	val	[double!]
	return: 	[integer!]
]
#define lpx-create-index			_glp_lpx_create_index
lpx-create-index: "lpx_create_index" [
	*lp	["LPX"]
	return: 	[void!]
]
#define lpx-find-row			_glp_lpx_find_row
lpx-find-row: "lpx_find_row" [
	*lp	["LPX"]
	*name	["char"]
	return: 	[integer!]
]
#define lpx-find-col			_glp_lpx_find_col
lpx-find-col: "lpx_find_col" [
	*lp	["LPX"]
	*name	["char"]
	return: 	[integer!]
]
#define lpx-delete-index			_glp_lpx_delete_index
lpx-delete-index: "lpx_delete_index" [
	*lp	["LPX"]
	return: 	[void!]
]
#define lpx-scale-prob			_glp_lpx_scale_prob
lpx-scale-prob: "lpx_scale_prob" [
	*lp	["LPX"]
	return: 	[void!]
]
#define lpx-unscale-prob			_glp_lpx_unscale_prob
lpx-unscale-prob: "lpx_unscale_prob" [
	*lp	["LPX"]
	return: 	[void!]
]
#define lpx-set-row-stat			_glp_lpx_set_row_stat
lpx-set-row-stat: "lpx_set_row_stat" [
	*lp	["LPX"]
	i	[integer!]
	stat	[integer!]
	return: 	[void!]
]
#define lpx-set-col-stat			_glp_lpx_set_col_stat
lpx-set-col-stat: "lpx_set_col_stat" [
	*lp	["LPX"]
	j	[integer!]
	stat	[integer!]
	return: 	[void!]
]
#define lpx-std-basis			_glp_lpx_std_basis
lpx-std-basis: "lpx_std_basis" [
	*lp	["LPX"]
	return: 	[void!]
]
#define lpx-adv-basis			_glp_lpx_adv_basis
lpx-adv-basis: "lpx_adv_basis" [
	*lp	["LPX"]
	return: 	[void!]
]
#define lpx-cpx-basis			_glp_lpx_cpx_basis
lpx-cpx-basis: "lpx_cpx_basis" [
	*lp	["LPX"]
	return: 	[void!]
]
#define lpx-simplex			_glp_lpx_simplex
lpx-simplex: "lpx_simplex" [
	*lp	["LPX"]
	return: 	[integer!]
]
#define lpx-exact			_glp_lpx_exact
lpx-exact: "lpx_exact" [
	*lp	["LPX"]
	return: 	[integer!]
]
#define lpx-get-status			_glp_lpx_get_status
lpx-get-status: "lpx_get_status" [
	*lp	["LPX"]
	return: 	[integer!]
]
#define lpx-get-prim-stat			_glp_lpx_get_prim_stat
lpx-get-prim-stat: "lpx_get_prim_stat" [
	*lp	["LPX"]
	return: 	[integer!]
]
#define lpx-get-dual-stat			_glp_lpx_get_dual_stat
lpx-get-dual-stat: "lpx_get_dual_stat" [
	*lp	["LPX"]
	return: 	[integer!]
]
#define lpx-get-obj-val			_glp_lpx_get_obj_val
lpx-get-obj-val: "lpx_get_obj_val" [
	*lp	["LPX"]
	return: 	[double!]
]
#define lpx-get-row-stat			_glp_lpx_get_row_stat
lpx-get-row-stat: "lpx_get_row_stat" [
	*lp	["LPX"]
	i	[integer!]
	return: 	[integer!]
]
#define lpx-get-row-prim			_glp_lpx_get_row_prim
lpx-get-row-prim: "lpx_get_row_prim" [
	*lp	["LPX"]
	i	[integer!]
	return: 	[double!]
]
#define lpx-get-row-dual			_glp_lpx_get_row_dual
lpx-get-row-dual: "lpx_get_row_dual" [
	*lp	["LPX"]
	i	[integer!]
	return: 	[double!]
]
#define lpx-get-row-info			_glp_lpx_get_row_info
lpx-get-row-info: "lpx_get_row_info" [
	*lp	["LPX"]
	i	[integer!]
	*tagx	[integer!]
	*vx	[double!]
	*dx	[double!]
	return: 	[void!]
]
#define lpx-get-col-stat			_glp_lpx_get_col_stat
lpx-get-col-stat: "lpx_get_col_stat" [
	*lp	["LPX"]
	j	[integer!]
	return: 	[integer!]
]
#define lpx-get-col-prim			_glp_lpx_get_col_prim
lpx-get-col-prim: "lpx_get_col_prim" [
	*lp	["LPX"]
	j	[integer!]
	return: 	[double!]
]
#define lpx-get-col-dual			_glp_lpx_get_col_dual
lpx-get-col-dual: "lpx_get_col_dual" [
	*lp	[glp_prob!]
	j	[integer!]
	return: 	[double!]
]
#define lpx-get-col-info			_glp_lpx_get_col_info
lpx-get-col-info: "lpx_get_col_info" [
	*lp	["LPX"]
	j	[integer!]
	*tagx	[integer!]
	*vx	[double!]
	*dx	[double!]
	return: 	[void!]
]
#define lpx-get-ray-info			_glp_lpx_get_ray_info
lpx-get-ray-info: "lpx_get_ray_info" [
	*lp	["LPX"]
	return: 	[integer!]
]
#define lpx-check-kkt			_glp_lpx_check_kkt
lpx-check-kkt: "lpx_check_kkt" [
	*lp	["LPX"]
	scaled	[integer!]
	*kkt	["LPXKKT"]
	return: 	[void!]
]
#define lpx-warm-up			_glp_lpx_warm_up
lpx-warm-up: "lpx_warm_up" [
	*lp	["LPX"]
	return: 	[integer!]
]
#define lpx-eval-tab-row			_glp_lpx_eval_tab_row
lpx-eval-tab-row: "lpx_eval_tab_row" [
	*lp	["LPX"]
	k	[integer!]
	ind	[integer!]
	val	[double!]
	return: 	[integer!]
]
#define lpx-eval-tab-col			_glp_lpx_eval_tab_col
lpx-eval-tab-col: "lpx_eval_tab_col" [
	*lp	["LPX"]
	k	[integer!]
	ind	[integer!]
	val	[double!]
	return: 	[integer!]
]
#define lpx-transform-row			_glp_lpx_transform_row
lpx-transform-row: "lpx_transform_row" [
	*lp	["LPX"]
	len	[integer!]
	ind	[integer!]
	val	[double!]
	return: 	[integer!]
]
#define lpx-transform-col			_glp_lpx_transform_col
lpx-transform-col: "lpx_transform_col" [
	*lp	["LPX"]
	len	[integer!]
	ind	[integer!]
	val	[double!]
	return: 	[integer!]
]
#define lpx-prim-ratio-test			_glp_lpx_prim_ratio_test
lpx-prim-ratio-test: "lpx_prim_ratio_test" [
	*lp	["LPX"]
	len	[integer!]
	ind	[integer!]
	val	[double!]
	how	[integer!]
	tol	[double!]
	return: 	[integer!]
]
#define lpx-dual-ratio-test			_glp_lpx_dual_ratio_test
lpx-dual-ratio-test: "lpx_dual_ratio_test" [
	*lp	["LPX"]
	len	[integer!]
	ind	[integer!]
	val	[double!]
	how	[integer!]
	tol	[double!]
	return: 	[integer!]
]
#define lpx-interior			_glp_lpx_interior
lpx-interior: "lpx_interior" [
	*lp	["LPX"]
	return: 	[integer!]
]
#define lpx-ipt-status			_glp_lpx_ipt_status
lpx-ipt-status: "lpx_ipt_status" [
	*lp	["LPX"]
	return: 	[integer!]
]
#define lpx-ipt-obj-val			_glp_lpx_ipt_obj_val
lpx-ipt-obj-val: "lpx_ipt_obj_val" [
	*lp	["LPX"]
	return: 	[double!]
]
#define lpx-ipt-row-prim			_glp_lpx_ipt_row_prim
lpx-ipt-row-prim: "lpx_ipt_row_prim" [
	*lp	["LPX"]
	i	[integer!]
	return: 	[double!]
]
#define lpx-ipt-row-dual			_glp_lpx_ipt_row_dual
lpx-ipt-row-dual: "lpx_ipt_row_dual" [
	*lp	["LPX"]
	i	[integer!]
	return: 	[double!]
]
#define lpx-ipt-col-prim			_glp_lpx_ipt_col_prim
lpx-ipt-col-prim: "lpx_ipt_col_prim" [
	*lp	["LPX"]
	j	[integer!]
	return: 	[double!]
]
#define lpx-ipt-col-dual			_glp_lpx_ipt_col_dual
lpx-ipt-col-dual: "lpx_ipt_col_dual" [
	*lp	["LPX"]
	j	[integer!]
	return: 	[double!]
]
#define lpx-set-class			_glp_lpx_set_class
lpx-set-class: "lpx_set_class" [
	*lp	["LPX"]
	klass	[integer!]
	return: 	[void!]
]
#define lpx-get-class			_glp_lpx_get_class
lpx-get-class: "lpx_get_class" [
	*lp	["LPX"]
	return: 	[integer!]
]
#define lpx-set-col-kind			_glp_lpx_set_col_kind
lpx-set-col-kind: "lpx_set_col_kind" [
	*lp	["LPX"]
	j	[integer!]
	kind	[integer!]
	return: 	[void!]
]
#define lpx-get-col-kind			_glp_lpx_get_col_kind
lpx-get-col-kind: "lpx_get_col_kind" [
	*lp	["LPX"]
	j	[integer!]
	return: 	[integer!]
]
#define lpx-get-num-int			_glp_lpx_get_num_int
lpx-get-num-int: "lpx_get_num_int" [
	*lp	["LPX"]
	return: 	[integer!]
]
#define lpx-get-num-bin			_glp_lpx_get_num_bin
lpx-get-num-bin: "lpx_get_num_bin" [
	*lp	["LPX"]
	return: 	[integer!]
]
#define lpx-integer			_glp_lpx_integer
lpx-integer: "lpx_integer" [
	*lp	["LPX"]
	return: 	[integer!]
]
#define lpx-intopt			_glp_lpx_intopt
lpx-intopt: "lpx_intopt" [
	*lp	["LPX"]
	return: 	[integer!]
]
#define lpx-mip-status			_glp_lpx_mip_status
lpx-mip-status: "lpx_mip_status" [
	*lp	["LPX"]
	return: 	[integer!]
]
#define lpx-mip-obj-val			_glp_lpx_mip_obj_val
lpx-mip-obj-val: "lpx_mip_obj_val" [
	*lp	["LPX"]
	return: 	[double!]
]
#define lpx-mip-row-val			_glp_lpx_mip_row_val
lpx-mip-row-val: "lpx_mip_row_val" [
	*lp	["LPX"]
	i	[integer!]
	return: 	[double!]
]
#define lpx-mip-col-val			_glp_lpx_mip_col_val
lpx-mip-col-val: "lpx_mip_col_val" [
	*lp	["LPX"]
	j	[integer!]
	return: 	[double!]
]
#define lpx-check-int			_glp_lpx_check_int
lpx-check-int: "lpx_check_int" [
	*lp	["LPX"]
	*kkt	["LPXKKT"]
	return: 	[void!]
]
#define lpx-reset-parms			_glp_lpx_reset_parms
lpx-reset-parms: "lpx_reset_parms" [
	*lp	["LPX"]
	return: 	[void!]
]
#define lpx-set-int-parm			_glp_lpx_set_int_parm
lpx-set-int-parm: "lpx_set_int_parm" [
	*lp	["LPX"]
	parm	[integer!]
	val	[integer!]
	return: 	[void!]
]
#define lpx-get-int-parm			_glp_lpx_get_int_parm
lpx-get-int-parm: "lpx_get_int_parm" [
	*lp	["LPX"]
	parm	[integer!]
	return: 	[integer!]
]
#define lpx-set-real-parm			_glp_lpx_set_real_parm
lpx-set-real-parm: "lpx_set_real_parm" [
	*lp	["LPX"]
	parm	[integer!]
	val	[double!]
	return: 	[void!]
]
#define lpx-get-real-parm			_glp_lpx_get_real_parm
lpx-get-real-parm: "lpx_get_real_parm" [
	*lp	["LPX"]
	parm	[integer!]
	return: 	[double!]
]
#define lpx-read-mps			_glp_lpx_read_mps
*lpx-read-mps: "*lpx_read_mps" [
	*fname	["char"]
	return: 	["LPX"]
]
#define lpx-write-mps			_glp_lpx_write_mps
lpx-write-mps: "lpx_write_mps" [
	*lp	["LPX"]
	*fname	["char"]
	return: 	[integer!]
]
#define lpx-read-bas			_glp_lpx_read_bas
lpx-read-bas: "lpx_read_bas" [
	*lp	["LPX"]
	*fname	["char"]
	return: 	[integer!]
]
#define lpx-write-bas			_glp_lpx_write_bas
lpx-write-bas: "lpx_write_bas" [
	*lp	["LPX"]
	*fname	["char"]
	return: 	[integer!]
]
#define lpx-read-freemps			_glp_lpx_read_freemps
*lpx-read-freemps: "*lpx_read_freemps" [
	*fname	["char"]
	return: 	["LPX"]
]
#define lpx-write-freemps			_glp_lpx_write_freemps
lpx-write-freemps: "lpx_write_freemps" [
	*lp	["LPX"]
	*fname	["char"]
	return: 	[integer!]
]
#define lpx-read-cpxlp			_glp_lpx_read_cpxlp
*lpx-read-cpxlp: "*lpx_read_cpxlp" [
	*fname	["char"]
	return: 	["LPX"]
]
#define lpx-write-cpxlp			_glp_lpx_write_cpxlp
lpx-write-cpxlp: "lpx_write_cpxlp" [
	*lp	["LPX"]
	*fname	["char"]
	return: 	[integer!]
]
#define lpx-read-model			_glp_lpx_read_model
*lpx-read-model: "*lpx_read_model" [
	*model	["char"]
	*data	["char"]
	*output	["char"]
	return: 	["LPX"]
]
#define lpx-print-prob			_glp_lpx_print_prob
lpx-print-prob: "lpx_print_prob" [
	*lp	["LPX"]
	*fname	["char"]
	return: 	[integer!]
]
#define lpx-print-sol			_glp_lpx_print_sol
lpx-print-sol: "lpx_print_sol" [
	*lp	["LPX"]
	*fname	["char"]
	return: 	[integer!]
]
#define lpx-print-sens-bnds			_glp_lpx_print_sens_bnds
lpx-print-sens-bnds: "lpx_print_sens_bnds" [
	*lp	["LPX"]
	*fname	["char"]
	return: 	[integer!]
]
#define lpx-print-ips			_glp_lpx_print_ips
lpx-print-ips: "lpx_print_ips" [
	*lp	["LPX"]
	*fname	["char"]
	return: 	[integer!]
]
#define lpx-print-mip			_glp_lpx_print_mip
lpx-print-mip: "lpx_print_mip" [
	*lp	["LPX"]
	*fname	["char"]
	return: 	[integer!]
]
#define lpx-is-b-avail			_glp_lpx_is_b_avail
lpx-is-b-avail: "lpx_is_b_avail" [
	*lp	["LPX"]
	return: 	[integer!]
]
#define lpx-write-pb			_glp_lpx_write_pb
lpx-write-pb: "lpx_write_pb" [
	*lp	["LPX"]
	*fname	["char"]
	normalized	[integer!]
	binarize	[integer!]
	return: 	[integer!]
]
#define lpx-main			_glp_lpx_main
lpx-main: "lpx_main" [
	argc	[integer!]
	*argv	["char"]
	return: 	[integer!]
]
