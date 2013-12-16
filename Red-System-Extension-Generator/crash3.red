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
		print substr
	)
]

r2: [
	(superstr: copy "")
	"[" 
	some r1
	"]"
	(
		append superstr substr
		print superstr
	)
	
]
test: "[aspect hello]"
print parse test r2