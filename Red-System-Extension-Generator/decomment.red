Red []

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