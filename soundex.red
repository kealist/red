Red [
	Author: "Joshua Shireman"
	Purpose: {This function outputs a string that is the Soundex value of a particular word.}
	Title: "to-soundex function"
]

letter: charset [#"a" - #"z" #"A" - #"Z"]
vowel: charset "aeiouyhw"
one: charset "bfpvBFPV"
two: charset "cgjkqsxzCGJKQSXZ"
three: charset "dtDT"
four: charset "lL"
five: charset "mnMN"
six: charset "rR"
preceding-vowel?: true
preceding-consonant: none
s: copy ""

soundex: [
	copy initial letter (append s initial)
	some [vowel (preceding-vowel?: true) | consonant (preceding-vowel?: false)]	
]
consonant: [
	one (append-if 1) |
	two (append-if 2) | 
	three (append-if 3) | 
	four (append-if 4) | 
	five (append-if 5) | 
	six (append-if 6)
]

append-if: func [
	int [integer!]
] [
	if not all [
		not preceding-vowel?
		preceding-consonant = int
	] [
		preceding-consonant: int
		append s int
	]
]

to-soundex: func [
	str [string!]
] [
	s: copy ""
	parse str soundex
	either ((length? s) > 4) [
		return copy/part at s 0 4
	][
		while [(length? s) < 4] [append s 0]
		return s
	]
]

ev: func [block] [print mold compose/deep block]

ev [Shireman: (to-soundex "Shireman")]
ev [Smith: (to-soundex "Smith")]
ev [Johnson: (to-soundex "Johnson")]