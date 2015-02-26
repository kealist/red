Rebol [
	Title: "Markov Chain Name Generator"
	Author: "Joshua Shireman"
]

languages: [
	latin %names/latin.txt

]

whitespace: charset "^-^M^/ "
alphanum: charset [#"0" - #"9" #"A" - #"Z" #"a" - #"z"]
alpha: charset [#"A" - #"Z" #"a" - #"z"]

level?: func [block [block!]] [(length? block) / 2]

load-name-data: func [
	file [file!]
	/local
	names
	split-names
] [
	names: trim/lines to-string read file
	split-names: split names whitespace
]

generate-markov-word-rules: func [
	name-data [block!]
	level [integer!]
	/word
	/sentence
	/local
	markov-ruleset
	breakdown
	chain
] [
	markov-ruleset: []
	chain: copy array/initial 2 * level #
	breakdown: [
		some [
			copy char alpha 
			(
				remove chain 
				append chain char 
				if not none? (pick chain 1 + level) [append/only markov-ruleset reduce chain] 
			)
			|
			end (
				repeat i -1 + level [
					remove chain 
					append chain #
					append/only markov-ruleset reduce chain 
				]
				chain: copy array/initial 2 * level #
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

rules-sample: generate-markov-word-rules load-name-data %names/latin.txt 2

generate-chain: func [
	rules [block!]
	level [integer!]
	/local
	chain
	options
][
	options: chain-options rules array/initial level #
	chain: reverse pick options  (random length? options)	

	until [
		options: chain-options rules reverse copy/part chain level level
		insert head chain copy/part reverse copy pick options random length? options level
		(none? first chain) or ('none = first chain) 
	]
	append "" reverse trim chain
]

generate-chain rules-sample 2