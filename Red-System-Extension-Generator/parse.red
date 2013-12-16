Red []

#include %../C-library/input-output.red

header-file: read %glpk.h
file: copy {}
chars: charset "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_0123456789*"
spacer: charset reduce [tab cr lf newline #" "]
spaces: [some spacer]
any-spaces: [any spacer]
non-space: complement spacer
to-space: [some non-space | end]
array: [{[} any-spaces any chars any-spaces {]}]

;removes c-comments
decomment: func [str [string!] /local f c com remove-comments] [
	com: [
		"/*" 
		skip thru "*/"
	]
	f: copy ""
	remove-comments: [ 
		some [
			com |
			copy c skip (append f c)
		]
	]
	parse str remove-comments
	return f
]


; removes ifdefs
deifdef: func [str [string!] /local f c remove-ifdef ifdef] [
	ifdef: [
		"#ifdef" skip thru "#endif" |
		"#ifndef" skip thru "#endif"
	]
	f: copy ""
	remove-ifdef: [
		some [
			ifdef |
			copy c skip (append f c)
		]
	]
	parse str remove-ifdef
	return f
]

p-type: [ ;parameter type
	"void" (param-type: [void!]) | 
	"int" (param-type: [integer!]) | 
	"double" (param-type: [double!]) |
	"float" (param-type: [float!]) |
	"glp_prob" (param-type: [glp_prob!]) |
	copy unknown-type some chars (param-type: compose [(unknown-type)])
]

r-type: [ ;return type (return-type: copy [])
	"void" (return-type: [void!]) |
	"int" (return-type: "[integer!]") | 
	"double" (return-type: [double!]) |
	"float" (return-type: [float!]) |
	"glp_prob" (return-type: [glp_prob!]) |
	copy unknown-r-type some chars (return-type: (compose [(unknown-r-type)]))
]

comment: [
	(c: copy "; ")
	"/*" 
	copy com to "*/"
	"*/"
	(	
		replace/all com "^/" "^/ ; "
		append c com
		append c newline
		append file c
	)
]

;#define GLP_MAJOR_VERSION  4
define: [
	(	;print "define"
		def: copy "#define "
	)
	"#define" spaces copy def-var some chars spaces copy def-val some chars
	(
		append def replace/all def-var "_" "-"
		append def "^-^-^-"
		append def def-val
		append file def
		print def
	)
]

args: [
	(arg-block: copy "")
	some [
		any-spaces
		opt "const"
		opt spaces
		p-type
		spaces
		copy param-name some chars 
		any-spaces
		opt array
		opt ","
		any-spaces
		(
			append arg-block tab
			append arg-block (load param-name) 
			append arg-block tab
			append arg-block mold compose [(param-type)]
			append arg-block newline
		)
	]
]

field: [
	
	some chars spaces some chars any-spaces {;} (print "field")
]

;typedef struct { int lo, hi; } glp_long;
typedef: [
	
	"#typedef" (print "typedef") spaces "struct" any-spaces "{" any-spaces any [field any-spaces | define any-spaces] any-spaces "^}" any-spaces some chars any-spaces {;} 
	
]

functn: [
	(fun: copy "")
	any-spaces
	r-type
	(print "return type")
	spaces
	copy function-name some chars
	(print "function name")
	"("
	args
	(print "arguments")
	")"
	any-spaces
	";"
	(
		print "END"
		append fun load replace/all copy function-name "_" "-"
		append fun {: "}  
		append fun function-name 
		print "app function name"
		append fun {" [^/} 
		append fun arg-block
		print "app arg block"
		append fun tab
		print "app tab"
		append fun "return"
		print "app return"
		append fun tab
		print "app tab"
		print return-type
		asdf: mold return-type
		print asdf
		append fun asdf
		print "app return-type"
		append fun "^/]^/"
		append file fun
		print fun
	)
]

header: [
	some [ functn |  define | skip (print "skip")]
] ;typedef (print "typedef") |

test-arg1: {double i, int len}
test-arg2: {glp_prob *lp, int i, int len, const int ind[], const double val[]}
test-f1: {void glp_set_mat_row(glp_prob *lp, int i, int len, const int ind[],const double val[]);}
test-f2: {void glp_set_mat_col(glp_prob *lp, int j, int len, const int ind[],      
const double val[]);}
test-f3: {void glp_load_matrix(glp_prob *lp, int ne, const int ia[], const int ja[], const double ar[]);}
test-f4: {void glp_set_prob_name(glp_prob *lp, const char *name);


int glp_set_obj_name(glp_prob *lp, const char *name);


void glp_set_obj_dir(glp_prob *lp, int dir);


int glp_add_rows(glp_prob *lp, int nrs);}


test-c1: {1 /* help help help help  sdfds sdfsdf */ 1}
test-h1: {}

test-def1: {#define GLP_MAJOR_VERSION  4

#define GLP_MAsd_VERSION  2323

#define GLP_MAJsadsa_VERSION  23}

;print parse {GLP_MAJOR_VERSION} [some chars]
;print parse test-def1 define
;print parse test-h1 header
;print parse test-f1 functn
;print parse test-f2 functn
;print parse test-f3 functn
;print parse test-f3 header
print parse-trace test-f4 header
;print file

header-file2: decomment header-file
write %headerfile2.h header-file2
header-file3: deifdef header-file2
write %headerfile3.h header-file3

;parse header-file3 header
;write %headerfinal.h file