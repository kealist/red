Red []

	st1: "<i"
	delimiter: charset "<"
	rule: [ some [delimiter | copy c skip ] ]
	print parse-trace st1 rule