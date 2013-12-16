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
#define GLP-SF-GM			0x01
#define GLP-SF-EQ			0x10
#define GLP-SF-2N			0x20
#define GLP-SF-SKIP			0x40
#define GLP-SF-AUTO			0x80
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
#define GLP-PT-STD			0x11
#define GLP-PT-PSE			0x22
#define GLP-RT-STD			0x11
#define GLP-RT-HAR			0x22
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
#define GLP-IROWGEN			0x01
#define GLP-IBINGO			0x02
#define GLP-IHEUR			0x03
#define GLP-ICUTGEN			0x04
#define GLP-IBRANCH			0x05
#define GLP-ISELECT			0x06
#define GLP-IPREPRO			0x07
#define GLP-NO-BRNCH			0
#define GLP-DN-BRNCH			1
#define GLP-UP-BRNCH			2
#define GLP-EBADB			0x01
#define GLP-ESING			0x02
#define GLP-ECOND			0x03
#define GLP-EBOUND			0x04
#define GLP-EFAIL			0x05
#define GLP-EOBJLL			0x06
#define GLP-EOBJUL			0x07
#define GLP-EITLIM			0x08
#define GLP-ETMLIM			0x09
#define GLP-ENOPFS			0x0A
#define GLP-ENODFS			0x0B
#define GLP-EROOT			0x0C
#define GLP-ESTOP			0x0D
#define GLP-EMIPGAP			0x0E
#define GLP-ENOFEAS			0x0F
#define GLP-ENOCVG			0x10
#define GLP-EINSTAB			0x11
#define GLP-MPS-DECK			1
#define GLP-MPS-FILE			2
glp-set-pr: "glp_set_pr" [
	*lp	[glp_	return: 	[void!]
]
glp-set-ob: "glp_set_ob" [
	*lp	[glp_	return: 	[void!]
]
glp-set-ob: "glp_set_ob" [
	*lp	[glp_	return: 	[void!]
]
glp-add-ro: "glp_add_ro" [
	*lp	[glp_	return: 	"[integer!
]
glp-add-co: "glp_add_co" [
	*lp	[glp_	return: 	"[integer!
]
glp-set-ro: "glp_set_ro" [
	*lp	[glp_	return: 	[void!]
]
glp-set-co: "glp_set_co" [
	*lp	[glp_	return: 	[void!]
]
glp-set-ro: "glp_set_ro" [
	*lp	[glp_	return: 	[void!]
]
glp-set-co: "glp_set_co" [
	*lp	[glp_	return: 	[void!]
]
glp-set-ob: "glp_set_ob" [
	*lp	[glp_	return: 	[void!]
]
glp-set-ma: "glp_set_ma" [
	*lp	[glp_	return: 	[void!]
]
glp-set-ma: "glp_set_ma" [
	*lp	[glp_	return: 	[void!]
]
glp-load-m: "glp_load_m" [
	*lp	[glp_	return: 	[void!]
]
glp-del-ro: "glp_del_ro" [
	*lp	[glp_	return: 	[void!]
]
glp-del-co: "glp_del_co" [
	*lp	[glp_	return: 	[void!]
]
glp-copy-p: "glp_copy_p" [
	*dest	[gl	return: 	[void!]
]
glp-erase-: "glp_erase_" [
	*lp	[glp_	return: 	[void!]
]
glp-delete: "glp_delete" [
	*lp	[glp_	return: 	[void!]
]
*glp-get-p: "*glp_get_p" [
	*lp	[glp_	return: 	["char"]
]
*glp-get-o: "*glp_get_o" [
	*lp	[glp_	return: 	["char"]
]
glp-get-ob: "glp_get_ob" [
	*lp	[glp_	return: 	"[integer!
]
glp-get-nu: "glp_get_nu" [
	*lp	[glp_	return: 	"[integer!
]
glp-get-nu: "glp_get_nu" [
	*lp	[glp_	return: 	"[integer!
]
*glp-get-r: "*glp_get_r" [
	*lp	[glp_	return: 	["char"]
]
*glp-get-c: "*glp_get_c" [
	*lp	[glp_	return: 	["char"]
]
glp-get-ro: "glp_get_ro" [
	*lp	[glp_	return: 	"[integer!
]
glp-get-ro: "glp_get_ro" [
	*lp	[glp_	return: 	[double!]
]
glp-get-ro: "glp_get_ro" [
	*lp	[glp_	return: 	[double!]
]
glp-get-co: "glp_get_co" [
	*lp	[glp_	return: 	"[integer!
]
glp-get-co: "glp_get_co" [
	*lp	[glp_	return: 	[double!]
]
glp-get-co: "glp_get_co" [
	*lp	[glp_	return: 	[double!]
]
glp-get-ob: "glp_get_ob" [
	*lp	[glp_	return: 	[double!]
]
glp-get-nu: "glp_get_nu" [
	*lp	[glp_	return: 	"[integer!
]
glp-get-ma: "glp_get_ma" [
	*lp	[glp_	return: 	"[integer!
]
glp-get-ma: "glp_get_ma" [
	*lp	[glp_	return: 	"[integer!
]
glp-create: "glp_create" [
	*lp	[glp_	return: 	[void!]
]
glp-find-r: "glp_find_r" [
	*lp	[glp_	return: 	"[integer!
]
glp-find-c: "glp_find_c" [
	*lp	[glp_	return: 	"[integer!
]
glp-delete: "glp_delete" [
	*lp	[glp_	return: 	[void!]
]
glp-set-ri: "glp_set_ri" [
	*lp	[glp_	return: 	[void!]
]
glp-set-sj: "glp_set_sj" [
	*lp	[glp_	return: 	[void!]
]
glp-get-ri: "glp_get_ri" [
	*lp	[glp_	return: 	[double!]
]
glp-get-sj: "glp_get_sj" [
	*lp	[glp_	return: 	[double!]
]
glp-scale-: "glp_scale_" [
	*lp	[glp_	return: 	[void!]
]
glp-unscal: "glp_unscal" [
	*lp	[glp_	return: 	[void!]
]
glp-set-ro: "glp_set_ro" [
	*lp	[glp_	return: 	[void!]
]
glp-set-co: "glp_set_co" [
	*lp	[glp_	return: 	[void!]
]
glp-std-ba: "glp_std_ba" [
	*lp	[glp_	return: 	[void!]
]
glp-adv-ba: "glp_adv_ba" [
	*lp	[glp_	return: 	[void!]
]
glp-cpx-ba: "glp_cpx_ba" [
	*lp	[glp_	return: 	[void!]
]
glp-simple: "glp_simple" [
	*lp	[glp_	return: 	"[integer!
]
glp-exact: "glp_exact" [
	*lp	[glp_	return: 	"[integer!
]
glp-init-s: "glp_init_s" [
	*parm	["g	return: 	[void!]
]
glp-get-st: "glp_get_st" [
	*lp	[glp_	return: 	"[integer!
]
glp-get-pr: "glp_get_pr" [
	*lp	[glp_	return: 	"[integer!
]
glp-get-du: "glp_get_du" [
	*lp	[glp_	return: 	"[integer!
]
glp-get-ob: "glp_get_ob" [
	*lp	[glp_	return: 	[double!]
]
glp-get-ro: "glp_get_ro" [
	*lp	[glp_	return: 	"[integer!
]
glp-get-ro: "glp_get_ro" [
	*lp	[glp_	return: 	[double!]
]
glp-get-ro: "glp_get_ro" [
	*lp	[glp_	return: 	[double!]
]
glp-get-co: "glp_get_co" [
	*lp	[glp_	return: 	"[integer!
]
glp-get-co: "glp_get_co" [
	*lp	[glp_	return: 	[double!]
]
glp-get-co: "glp_get_co" [
	*lp	[glp_	return: 	[double!]
]
glp-get-un: "glp_get_un" [
	*lp	[glp_	return: 	"[integer!
]
glp-interi: "glp_interi" [
	*lp	[glp_	return: 	"[integer!
]
glp-ipt-st: "glp_ipt_st" [
	*lp	[glp_	return: 	"[integer!
]
glp-ipt-ob: "glp_ipt_ob" [
	*lp	[glp_	return: 	[double!]
]
glp-ipt-ro: "glp_ipt_ro" [
	*lp	[glp_	return: 	[double!]
]
glp-ipt-ro: "glp_ipt_ro" [
	*lp	[glp_	return: 	[double!]
]
glp-ipt-co: "glp_ipt_co" [
	*lp	[glp_	return: 	[double!]
]
glp-ipt-co: "glp_ipt_co" [
	*lp	[glp_	return: 	[double!]
]
glp-set-co: "glp_set_co" [
	*mip	[glp	return: 	[void!]
]
glp-get-co: "glp_get_co" [
	*mip	[glp	return: 	"[integer!
]
glp-get-nu: "glp_get_nu" [
	*mip	[glp	return: 	"[integer!
]
glp-get-nu: "glp_get_nu" [
	*mip	[glp	return: 	"[integer!
]
glp-intopt: "glp_intopt" [
	*mip	[glp	return: 	"[integer!
]
glp-init-i: "glp_init_i" [
	*parm	["g	return: 	[void!]
]
glp-mip-st: "glp_mip_st" [
	*mip	[glp	return: 	"[integer!
]
glp-mip-ob: "glp_mip_ob" [
	*mip	[glp	return: 	[double!]
]
glp-mip-ro: "glp_mip_ro" [
	*mip	[glp	return: 	[double!]
]
glp-mip-co: "glp_mip_co" [
	*mip	[glp	return: 	[double!]
]
glp-read-s: "glp_read_s" [
	*lp	[glp_	return: 	"[integer!
]
glp-write-: "glp_write_" [
	*lp	[glp_	return: 	"[integer!
]
glp-read-i: "glp_read_i" [
	*lp	[glp_	return: 	"[integer!
]
glp-write-: "glp_write_" [
	*lp	[glp_	return: 	"[integer!
]
glp-read-m: "glp_read_m" [
	*mip	[glp	return: 	"[integer!
]
glp-write-: "glp_write_" [
	*mip	[glp	return: 	"[integer!
]
glp-bf-exi: "glp_bf_exi" [
	*lp	[glp_	return: 	"[integer!
]
glp-factor: "glp_factor" [
	*lp	[glp_	return: 	"[integer!
]
glp-bf-upd: "glp_bf_upd" [
	*lp	[glp_	return: 	"[integer!
]
glp-get-bf: "glp_get_bf" [
	*lp	[glp_	return: 	[void!]
]
glp-set-bf: "glp_set_bf" [
	*lp	[glp_	return: 	[void!]
]
glp-get-bh: "glp_get_bh" [
	*lp	[glp_	return: 	"[integer!
]
glp-get-ro: "glp_get_ro" [
	*lp	[glp_	return: 	"[integer!
]
glp-get-co: "glp_get_co" [
	*lp	[glp_	return: 	"[integer!
]
glp-ftran: "glp_ftran" [
	*lp	[glp_	return: 	[void!]
]
glp-btran: "glp_btran" [
	*lp	[glp_	return: 	[void!]
]
glp-eval-t: "glp_eval_t" [
	*lp	[glp_	return: 	"[integer!
]
glp-eval-t: "glp_eval_t" [
	*lp	[glp_	return: 	"[integer!
]
glp-ios-re: "glp_ios_re" [
	*tree	["g	return: 	"[integer!
]
*glp-ios-g: "*glp_ios_g" [
	*tree	["g	return: 	[glp_prob!
]
glp-ios-tr: "glp_ios_tr" [
	*tree	["g	return: 	[void!]
]
glp-ios-cu: "glp_ios_cu" [
	*tree	["g	return: 	"[integer!
]
glp-ios-ne: "glp_ios_ne" [
	*tree	["g	return: 	"[integer!
]
glp-ios-pr: "glp_ios_pr" [
	*tree	["g	return: 	"[integer!
]
glp-ios-up: "glp_ios_up" [
	*tree	["g	return: 	"[integer!
]
glp-ios-no: "glp_ios_no" [
	*tree	["g	return: 	"[integer!
]
glp-ios-no: "glp_ios_no" [
	*tree	["g	return: 	[double!]
]
glp-ios-be: "glp_ios_be" [
	*tree	["g	return: 	"[integer!
]
glp-ios-mi: "glp_ios_mi" [
	*tree	["g	return: 	[double!]
]
*glp-ios-n: "*glp_ios_n" [
	*tree	["g	return: 	[void!]
]
glp-ios-ro: "glp_ios_ro" [
	*tree	["g	return: 	[void!]
]
glp-ios-po: "glp_ios_po" [
	*tree	["g	return: 	"[integer!
]
glp-ios-ad: "glp_ios_ad" [
	*tree	["g	return: 	"[integer!
]
glp-ios-de: "glp_ios_de" [
	*tree	["g	return: 	[void!]
]
glp-ios-cl: "glp_ios_cl" [
	*tree	["g	return: 	[void!]
]
glp-ios-ca: "glp_ios_ca" [
	*tree	["g	return: 	"[integer!
]
glp-ios-br: "glp_ios_br" [
	*tree	["g	return: 	[void!]
]
glp-ios-se: "glp_ios_se" [
	*tree	["g	return: 	[void!]
]
glp-ios-he: "glp_ios_he" [
	*tree	["g	return: 	"[integer!
]
glp-ios-te: "glp_ios_te" [
	*tree	["g	return: 	[void!]
]
glp-term-o: "glp_term_o" [
	flag	[int	return: 	[void!]
]
*glp-mallo: "*glp_mallo" [
	size	[int	return: 	[void!]
]
*glp-callo: "*glp_callo" [
	n	[intege	return: 	[void!]
]
glp-free: "glp_free" [
	*ptr	[voi	return: 	[void!]
]
glp-mem-us: "glp_mem_us" [
	*count	[i	return: 	[void!]
]
glp-mem-li: "glp_mem_li" [
	limit	[in	return: 	[void!]
]
glp-read-m: "glp_read_m" [
	*lp	[glp_	return: 	"[integer!
]
glp-write-: "glp_write_" [
	*lp	[glp_	return: 	"[integer!
]
glp-read-l: "glp_read_l" [
	*lp	[glp_	return: 	"[integer!
]
glp-write-: "glp_write_" [
	*lp	[glp_	return: 	"[integer!
]
glp-mpl-re: "glp_mpl_re" [
	*tran	["g	return: 	"[integer!
]
glp-mpl-re: "glp_mpl_re" [
	*tran	["g	return: 	"[integer!
]
glp-mpl-ge: "glp_mpl_ge" [
	*tran	["g	return: 	"[integer!
]
glp-mpl-bu: "glp_mpl_bu" [
	*tran	["g	return: 	[void!]
]
glp-mpl-po: "glp_mpl_po" [
	*tran	["g	return: 	"[integer!
]
glp-mpl-fr: "glp_mpl_fr" [
	*tran	["g	return: 	[void!]
]
glp-main: "glp_main" [
	argc	[int	return: 	"[integer!
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
#define LPX-C-COVER			0x01
#define LPX-C-CLIQUE			0x02
#define LPX-C-GOMORY			0x04
#define LPX-C-MIR			0x08
#define LPX-C-ALL			0xFF
#define lpx-create-prob			_glp_lpx_create_prob
#define lpx-set-prob-name			_glp_lpx_set_prob_name
lpx-set-pr: "lpx_set_pr" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-set-obj-name			_glp_lpx_set_obj_name
lpx-set-ob: "lpx_set_ob" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-set-obj-dir			_glp_lpx_set_obj_dir
lpx-set-ob: "lpx_set_ob" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-add-rows			_glp_lpx_add_rows
lpx-add-ro: "lpx_add_ro" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-add-cols			_glp_lpx_add_cols
lpx-add-co: "lpx_add_co" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-set-row-name			_glp_lpx_set_row_name
lpx-set-ro: "lpx_set_ro" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-set-col-name			_glp_lpx_set_col_name
lpx-set-co: "lpx_set_co" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-set-row-bnds			_glp_lpx_set_row_bnds
lpx-set-ro: "lpx_set_ro" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-set-col-bnds			_glp_lpx_set_col_bnds
lpx-set-co: "lpx_set_co" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-set-obj-coef			_glp_lpx_set_obj_coef
lpx-set-ob: "lpx_set_ob" [
	*lp	[glp_	return: 	[void!]
]
#define lpx-set-mat-row			_glp_lpx_set_mat_row
lpx-set-ma: "lpx_set_ma" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-set-mat-col			_glp_lpx_set_mat_col
lpx-set-ma: "lpx_set_ma" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-load-matrix			_glp_lpx_load_matrix
lpx-load-m: "lpx_load_m" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-del-rows			_glp_lpx_del_rows
lpx-del-ro: "lpx_del_ro" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-del-cols			_glp_lpx_del_cols
lpx-del-co: "lpx_del_co" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-delete-prob			_glp_lpx_delete_prob
lpx-delete: "lpx_delete" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-get-prob-name			_glp_lpx_get_prob_name
*lpx-get-p: "*lpx_get_p" [
	*lp	["LPX	return: 	["char"]
]
#define lpx-get-obj-name			_glp_lpx_get_obj_name
*lpx-get-o: "*lpx_get_o" [
	*lp	["LPX	return: 	["char"]
]
#define lpx-get-obj-dir			_glp_lpx_get_obj_dir
lpx-get-ob: "lpx_get_ob" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-get-num-rows			_glp_lpx_get_num_rows
lpx-get-nu: "lpx_get_nu" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-get-num-cols			_glp_lpx_get_num_cols
lpx-get-nu: "lpx_get_nu" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-get-row-name			_glp_lpx_get_row_name
*lpx-get-r: "*lpx_get_r" [
	*lp	["LPX	return: 	["char"]
]
#define lpx-get-col-name			_glp_lpx_get_col_name
*lpx-get-c: "*lpx_get_c" [
	*lp	["LPX	return: 	["char"]
]
#define lpx-get-row-type			_glp_lpx_get_row_type
lpx-get-ro: "lpx_get_ro" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-get-row-lb			_glp_lpx_get_row_lb
lpx-get-ro: "lpx_get_ro" [
	*lp	["LPX	return: 	[double!]
]
#define lpx-get-row-ub			_glp_lpx_get_row_ub
lpx-get-ro: "lpx_get_ro" [
	*lp	["LPX	return: 	[double!]
]
#define lpx-get-row-bnds			_glp_lpx_get_row_bnds
lpx-get-ro: "lpx_get_ro" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-get-col-type			_glp_lpx_get_col_type
lpx-get-co: "lpx_get_co" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-get-col-lb			_glp_lpx_get_col_lb
lpx-get-co: "lpx_get_co" [
	*lp	["LPX	return: 	[double!]
]
#define lpx-get-col-ub			_glp_lpx_get_col_ub
lpx-get-co: "lpx_get_co" [
	*lp	["LPX	return: 	[double!]
]
#define lpx-get-col-bnds			_glp_lpx_get_col_bnds
lpx-get-co: "lpx_get_co" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-get-obj-coef			_glp_lpx_get_obj_coef
lpx-get-ob: "lpx_get_ob" [
	*lp	["LPX	return: 	[double!]
]
#define lpx-get-num-nz			_glp_lpx_get_num_nz
lpx-get-nu: "lpx_get_nu" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-get-mat-row			_glp_lpx_get_mat_row
lpx-get-ma: "lpx_get_ma" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-get-mat-col			_glp_lpx_get_mat_col
lpx-get-ma: "lpx_get_ma" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-create-index			_glp_lpx_create_index
lpx-create: "lpx_create" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-find-row			_glp_lpx_find_row
lpx-find-r: "lpx_find_r" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-find-col			_glp_lpx_find_col
lpx-find-c: "lpx_find_c" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-delete-index			_glp_lpx_delete_index
lpx-delete: "lpx_delete" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-scale-prob			_glp_lpx_scale_prob
lpx-scale-: "lpx_scale_" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-unscale-prob			_glp_lpx_unscale_prob
lpx-unscal: "lpx_unscal" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-set-row-stat			_glp_lpx_set_row_stat
lpx-set-ro: "lpx_set_ro" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-set-col-stat			_glp_lpx_set_col_stat
lpx-set-co: "lpx_set_co" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-std-basis			_glp_lpx_std_basis
lpx-std-ba: "lpx_std_ba" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-adv-basis			_glp_lpx_adv_basis
lpx-adv-ba: "lpx_adv_ba" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-cpx-basis			_glp_lpx_cpx_basis
lpx-cpx-ba: "lpx_cpx_ba" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-simplex			_glp_lpx_simplex
lpx-simple: "lpx_simple" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-exact			_glp_lpx_exact
lpx-exact: "lpx_exact" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-get-status			_glp_lpx_get_status
lpx-get-st: "lpx_get_st" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-get-prim-stat			_glp_lpx_get_prim_stat
lpx-get-pr: "lpx_get_pr" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-get-dual-stat			_glp_lpx_get_dual_stat
lpx-get-du: "lpx_get_du" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-get-obj-val			_glp_lpx_get_obj_val
lpx-get-ob: "lpx_get_ob" [
	*lp	["LPX	return: 	[double!]
]
#define lpx-get-row-stat			_glp_lpx_get_row_stat
lpx-get-ro: "lpx_get_ro" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-get-row-prim			_glp_lpx_get_row_prim
lpx-get-ro: "lpx_get_ro" [
	*lp	["LPX	return: 	[double!]
]
#define lpx-get-row-dual			_glp_lpx_get_row_dual
lpx-get-ro: "lpx_get_ro" [
	*lp	["LPX	return: 	[double!]
]
#define lpx-get-row-info			_glp_lpx_get_row_info
lpx-get-ro: "lpx_get_ro" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-get-col-stat			_glp_lpx_get_col_stat
lpx-get-co: "lpx_get_co" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-get-col-prim			_glp_lpx_get_col_prim
lpx-get-co: "lpx_get_co" [
	*lp	["LPX	return: 	[double!]
]
#define lpx-get-col-dual			_glp_lpx_get_col_dual
lpx-get-co: "lpx_get_co" [
	*lp	[glp_	return: 	[double!]
]
#define lpx-get-col-info			_glp_lpx_get_col_info
lpx-get-co: "lpx_get_co" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-get-ray-info			_glp_lpx_get_ray_info
lpx-get-ra: "lpx_get_ra" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-check-kkt			_glp_lpx_check_kkt
lpx-check-: "lpx_check_" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-warm-up			_glp_lpx_warm_up
lpx-warm-u: "lpx_warm_u" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-eval-tab-row			_glp_lpx_eval_tab_row
lpx-eval-t: "lpx_eval_t" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-eval-tab-col			_glp_lpx_eval_tab_col
lpx-eval-t: "lpx_eval_t" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-transform-row			_glp_lpx_transform_row
lpx-transf: "lpx_transf" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-transform-col			_glp_lpx_transform_col
lpx-transf: "lpx_transf" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-prim-ratio-test			_glp_lpx_prim_ratio_test
lpx-prim-r: "lpx_prim_r" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-dual-ratio-test			_glp_lpx_dual_ratio_test
lpx-dual-r: "lpx_dual_r" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-interior			_glp_lpx_interior
lpx-interi: "lpx_interi" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-ipt-status			_glp_lpx_ipt_status
lpx-ipt-st: "lpx_ipt_st" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-ipt-obj-val			_glp_lpx_ipt_obj_val
lpx-ipt-ob: "lpx_ipt_ob" [
	*lp	["LPX	return: 	[double!]
]
#define lpx-ipt-row-prim			_glp_lpx_ipt_row_prim
lpx-ipt-ro: "lpx_ipt_ro" [
	*lp	["LPX	return: 	[double!]
]
#define lpx-ipt-row-dual			_glp_lpx_ipt_row_dual
lpx-ipt-ro: "lpx_ipt_ro" [
	*lp	["LPX	return: 	[double!]
]
#define lpx-ipt-col-prim			_glp_lpx_ipt_col_prim
lpx-ipt-co: "lpx_ipt_co" [
	*lp	["LPX	return: 	[double!]
]
#define lpx-ipt-col-dual			_glp_lpx_ipt_col_dual
lpx-ipt-co: "lpx_ipt_co" [
	*lp	["LPX	return: 	[double!]
]
#define lpx-set-class			_glp_lpx_set_class
lpx-set-cl: "lpx_set_cl" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-get-class			_glp_lpx_get_class
lpx-get-cl: "lpx_get_cl" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-set-col-kind			_glp_lpx_set_col_kind
lpx-set-co: "lpx_set_co" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-get-col-kind			_glp_lpx_get_col_kind
lpx-get-co: "lpx_get_co" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-get-num-int			_glp_lpx_get_num_int
lpx-get-nu: "lpx_get_nu" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-get-num-bin			_glp_lpx_get_num_bin
lpx-get-nu: "lpx_get_nu" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-integer			_glp_lpx_integer
lpx-intege: "lpx_intege" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-intopt			_glp_lpx_intopt
lpx-intopt: "lpx_intopt" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-mip-status			_glp_lpx_mip_status
lpx-mip-st: "lpx_mip_st" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-mip-obj-val			_glp_lpx_mip_obj_val
lpx-mip-ob: "lpx_mip_ob" [
	*lp	["LPX	return: 	[double!]
]
#define lpx-mip-row-val			_glp_lpx_mip_row_val
lpx-mip-ro: "lpx_mip_ro" [
	*lp	["LPX	return: 	[double!]
]
#define lpx-mip-col-val			_glp_lpx_mip_col_val
lpx-mip-co: "lpx_mip_co" [
	*lp	["LPX	return: 	[double!]
]
#define lpx-check-int			_glp_lpx_check_int
lpx-check-: "lpx_check_" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-reset-parms			_glp_lpx_reset_parms
lpx-reset-: "lpx_reset_" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-set-int-parm			_glp_lpx_set_int_parm
lpx-set-in: "lpx_set_in" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-get-int-parm			_glp_lpx_get_int_parm
lpx-get-in: "lpx_get_in" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-set-real-parm			_glp_lpx_set_real_parm
lpx-set-re: "lpx_set_re" [
	*lp	["LPX	return: 	[void!]
]
#define lpx-get-real-parm			_glp_lpx_get_real_parm
lpx-get-re: "lpx_get_re" [
	*lp	["LPX	return: 	[double!]
]
#define lpx-read-mps			_glp_lpx_read_mps
*lpx-read-: "*lpx_read_" [
	*fname	["	return: 	["LPX"]
]
#define lpx-write-mps			_glp_lpx_write_mps
lpx-write-: "lpx_write_" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-read-bas			_glp_lpx_read_bas
lpx-read-b: "lpx_read_b" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-write-bas			_glp_lpx_write_bas
lpx-write-: "lpx_write_" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-read-freemps			_glp_lpx_read_freemps
*lpx-read-: "*lpx_read_" [
	*fname	["	return: 	["LPX"]
]
#define lpx-write-freemps			_glp_lpx_write_freemps
lpx-write-: "lpx_write_" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-read-cpxlp			_glp_lpx_read_cpxlp
*lpx-read-: "*lpx_read_" [
	*fname	["	return: 	["LPX"]
]
#define lpx-write-cpxlp			_glp_lpx_write_cpxlp
lpx-write-: "lpx_write_" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-read-model			_glp_lpx_read_model
*lpx-read-: "*lpx_read_" [
	*model	["	return: 	["LPX"]
]
#define lpx-print-prob			_glp_lpx_print_prob
lpx-print-: "lpx_print_" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-print-sol			_glp_lpx_print_sol
lpx-print-: "lpx_print_" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-print-sens-bnds			_glp_lpx_print_sens_bnds
lpx-print-: "lpx_print_" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-print-ips			_glp_lpx_print_ips
lpx-print-: "lpx_print_" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-print-mip			_glp_lpx_print_mip
lpx-print-: "lpx_print_" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-is-b-avail			_glp_lpx_is_b_avail
lpx-is-b-a: "lpx_is_b_a" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-write-pb			_glp_lpx_write_pb
lpx-write-: "lpx_write_" [
	*lp	["LPX	return: 	"[integer!
]
#define lpx-main			_glp_lpx_main
lpx-main: "lpx_main" [
	argc	[int	return: 	"[integer!
]
