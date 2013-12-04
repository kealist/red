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
c: none

soundex: [
	copy initial letter (
		parse initial consonant
		preceding-consonant: c
		append s initial
	)
	some [
		vowel (preceding-vowel?: true) | 
		consonant (
			append-if c
			preceding-vowel?: false
		)
	]	
]
consonant: [
	one (c: 1) |
	two (c: 2) | 
	three (c: 3) | 
	four (c: 4) | 
	five (c: 5) | 
	six (c: 6)
]

append-if: func [
	int [integer!]
] [
	either not all [
		not preceding-vowel?
		preceding-consonant = int
	] [
		preceding-consonant: int
		append s int
	] [
		preceding-consonant: int
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
ev [Aaron: (to-soundex "Aaron")]
ev [Smith: (to-soundex "Smith")]
ev [Johnson: (to-soundex "Johnson")]