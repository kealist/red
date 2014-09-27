Red []
chars: charset "abcdefghijklmnopqrstuvwxyz0123456789"
str-16: "0123456789abcdef"

print parse str-16 [
	(
		s: copy ""
		ast: false
	) 
	some chars 
	opt copy ast "*"
	some chars
	(if (ast) [print "hello"])
]