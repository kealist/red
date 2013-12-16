Red []

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

