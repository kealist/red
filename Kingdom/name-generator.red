Red[
	title: "Fantasy Name Generator"
]

names: context [
	vowels: [
		["a" 7]  ["e" 7]  ["i" 7]  ["o" 7]  ["u" 7]
		["a" 7]  ["e" 7]  ["i" 7]  ["o" 7]  ["u" 7]
		["a" 7]  ["e" 7]  ["i" 7]  ["o" 7]  ["u" 7]
		["a" 7]  ["e" 7]  ["i" 7]  ["o" 7]  ["u" 7]
		["a" 7]  ["e" 7]  ["i" 7]  ["o" 7]  ["u" 7]
		["a" 7]  ["e" 7]  ["i" 7]  ["o" 7]  ["u" 7]
		["a" 7]  ["e" 7]  ["i" 7]  ["o" 7]  ["u" 7]
		["a" 7]  ["e" 7]  ["i" 7]  ["o" 7]  ["u" 7]
		["a" 7]  ["e" 7]  ["i" 7]  ["o" 7]  ["u" 7]
		["a" 7]  ["e" 7]  ["i" 7]  ["o" 7]  ["u" 7]
		["a" 7]  ["e" 7]  ["i" 7]  ["o" 7]  ["u" 7]
		["a" 7]  ["e" 7]  ["i" 7]  ["o" 7]  ["u" 7]
		["ae" 7] ["ai" 7] ["ao" 7] ["au" 7] ["aa" 7] 
		["ea" 7] ["eo" 7] ["eu" 7] ["ee" 7] ["eau" 7]
		["ia" 7] ["io" 7] ["iu" 7] ["ii" 7] 
		["oa" 7] ["oe" 7] ["oi" 7] ["ou" 7] ["oo" 7]
		["'" 4] ["y" 7]
		["ay" 7] ["ay" 7] ["ei" 7] ["ei" 7] ["ei" 7]
		["ua" 7] ["ua" 7]
	]


	consonants: [
		["b" 7]  ["c" 7]  ["d" 7]  ["f" 7]  ["g" 7]  ["h" 7] 
		["j" 7]  ["k" 7]  ["l" 7]  ["m" 7]  ["n" 7]  ["p" 7] 
		["qu" 6]  ["r" 7] ["s" 7]  ["t" 7]  ["v" 7]  ["w" 7]
		["x" 7]  ["y" 7]  ["z" 7] 
		;; Blends sorted by second character:
		["sc" 7]
		["ch" 7]  ["gh" 7]  ["ph" 7] ["sh" 7]  ["th" 7] ["wh" 6]
		["ck" 5]  ["nk" 5]  ["rk" 5] ["sk" 7]  ["wk" 0]
		["cl" 6]  ["fl" 6]  ["gl" 6] ["kl" 6]  ["ll" 6] ["pl" 6] ["sl" 6]
		["br" 6]  ["cr" 6]  ["dr" 6]  ["fr" 6]  ["gr" 6]  ["kr" 6] 
		["pr" 6]  ["sr" 6]  ["tr" 6]
		["ss" 5]
		["st" 7]  ["str" 6]
		;; Repeat some entries to make them more common.
		["b" 7]  ["c" 7]  ["d" 7]  ["f" 7]  ["g" 7]  ["h" 7] 
		["j" 7]  ["k" 7]  ["l" 7]  ["m" 7]  ["n" 7]  ["p" 7] 
		["r" 7] ["s" 7]  ["t" 7]  ["v" 7]  ["w" 7]
		["b" 7]  ["c" 7]  ["d" 7]  ["f" 7]  ["g" 7]  ["h" 7] 
		["j" 7]  ["k" 7]  ["l" 7]  ["m" 7]  ["n" 7]  ["p" 7] 
		["r" 7] ["s" 7]  ["t" 7]  ["v" 7]  ["w" 7]
		["br" 6]  ["dr" 6]  ["fr" 6]  ["gr" 6]  ["kr" 6]
		["x" 7] ["x" 7] ["x" 7] ["x" 7] ["x" 7] ["xx" 7] ["xx"5]
	]
	random-num-syllables: func [] [
		1 + random 5
	]
	generate: function [] [

		name: copy ""
		num: random-num-syllables
		start: random 2
		repeat i num [
			syllable: none
			while [none? syllable] [
				switch start [
					1 [
						;; vowels
						syllable: vowels/(random length? vowels)
					]
					2 [
						;; consonants
						syllable: consonants/(random length? consonants)
					]
				]
				case [
					(i = 1)		[if not (2 and syllable/2) [syllable: none]]
					(i = num)	[if not (1 and syllable/2) [syllable: none]]
					true 		[if not (4 and syllable/2) [syllable: none]]
				]
			]
			append name syllable/1
			either (start = 1) [start: 2] [start: 1]

		]
		name
	]
]