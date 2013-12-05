Red []

letter: charset [#"a" - #"z" #"A" - #"Z"]

rule: [
	some [
		"end" end (print "end")|
		letter
	]
]

print parse "blahendslkjsfdend" rule