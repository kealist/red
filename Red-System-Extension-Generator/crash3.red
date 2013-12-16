Red []

chars: charset "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_0123456789*"
spacer: charset reduce [tab cr lf newline #" "]
spaces: [some spacer]
any-spaces: [any spacer]

r1: [
	(substr: copy "")
	copy x some chars
	any-spaces
	copy y some chars
	(
		append substr x
		append substr y
	)
]

r2: [
	(superstr: copy "")
	"[" 
	some r1
	"]"
	(
		b: "glp_set_prob_name glp_get_prob_name"
        c: load replace/all copy b "_" "-"
		append superstr b
		append superstr c
		print superstr
	)
	
]
test: "[aspect hello]"
print parse test r2