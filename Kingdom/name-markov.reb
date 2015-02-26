Rebol []

whitespace: charset "^-^M^/ "
alphanum: charset [#"0" - #"9" #"A" - #"Z" #"a" - #"z"]
alpha: charset [#"A" - #"Z" #"a" - #"z"]

level?: func [block] [(length? block) / 2]

load-name-data: func [
	file [file!]
	/local
	names
	split-names
] [
	names: trim/lines to-string read file
	split-names: split names whitespace
]

generate-markov-rules: func [
	name-data [block!]
	level [integer!]
	/local
	markov-ruleset
	breakdown
	chain
] [
	markov-ruleset: []
	chain: copy array/initial 2 * level ""
	breakdown: [
		some [
			copy char alpha 
			(
				remove chain 
				append chain char 
				if not equal? "" (pick chain 1 + level) [append/only markov-ruleset reduce chain] 
			)
			|
			end (
				repeat i -1 + level [
					remove chain 
					append chain ""
					append/only markov-ruleset reduce chain 
				]
				chain: copy array/initial 2 * level ""
			)
		] 
	]
	foreach word name-data [
		parse word breakdown
	]
	return markov-ruleset
]

chain-options: func [
	ruleset [block!]
	cond [block!]
	/local
	subset
	initial?
	subrule
][
	subset: copy []
	foreach rule ruleset [
		match?: true
		repeat i length? cond [
			if not ((pick cond i) = (pick rule i)) [match?: false]
		]
		subrule: copy/part rule (length? cond)
		if match? [append/only subset reduce rule]
		
	]
	subset
]

rules-sample: generate-markov-rules load-name-data %names/latin.txt 2
print mold chain-options rules-sample ["" ""]

