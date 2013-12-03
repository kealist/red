Red []

letter: charset [#"a" - #"z" #"A" - #"Z"]
vowel: charset "aeiouyhw"
consonant: charset "bcdfgjklmnpqrstvxz"
consonant-test: [

]

;    b, f, p, v => 1
;    c, g, j, k, q, s, x, z => 2
;    d, t => 3
;    l => 4
;    m, n => 5
;    r => 6

soundex: [
	copy initial letter (append s initial)
	some [vowel | copy following consonant (append s following)]	
]

ones: charset "bfpvBFPV"
twos: charset "cgjkqsxzCGJKQSXZ"
threes: charset "dtDT"
fours: charset "lL"
fives: charset "mnMN"
sixes: charset "rR"


to-soundex: func [
	str [string!]
	/local s
] [
	s: copy ""

	parse str soundex
	return s
]

print to-soundex "Shireman"