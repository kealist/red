Red []

file: copy {}
chars: charset "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_0123456789*^\"
spacer: charset reduce [tab cr lf newline #" "]
spaces: [some spacer]
any-spaces: [any spacer]
non-space: complement spacer
to-space: [some non-space | end]
array: [{[} any-spaces any chars any-spaces {]}]

;#define GLP_MAJOR_VERSION  4
def: [	
	"#define" spaces copy def-var some chars spaces copy def-val some chars
]

defs: [some [any-spaces def any-spaces]]


test-def1: {
#define GLP_MAsd_VERSION  2323

#define GLP_MAJsadsa_VERSION  23}


print parse-trace test-def1 defs