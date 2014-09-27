Rebol[]

input: {[++++.]-.}
a: 0

rule: [
	any [
		"-" (-- a) |
		"+" (++ a) |
		"." (print a) |
		"[" mark: if (a > 10) thru "]" |
		"[" |
		"]" if (a < 10) :mark |
		"]"
	]
]

parse input rule