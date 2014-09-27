Red []

file: copy {}
chars: charset "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_0123456789*"
spacer: charset reduce [tab cr lf newline #" "]
spaces: [some spacer]
any-spaces: [any spacer]

test-f4: {
void glp_set_prob_name(glp_prob *lp, const char *name);


int glp_set_obj_name(glp_prob *lp, const char *name);

}

header: [
	some [ functn | skip]
]

functn: [
	(fun: copy "")
	any-spaces
	r-type
	spaces
	copy function-name some chars
	"("
	args
	")"
	any-spaces
	";"
	(
		append fun replace/all copy function-name "_" "-"
		append fun {: "} 
		print function-name
		append fun function-name 
		append fun {" [^/} 
		append fun arg-block
		append fun tab
		append fun "return"
		append fun tab
		ret: mold return-type
		append fun ret
		append fun "^/]^/"
		append file fun
		;print fun
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

print parse-trace test-f4 header
print newline
print "^^ Parse-trace output" 
print ["Parse output: "]
print parse test-f4 header
