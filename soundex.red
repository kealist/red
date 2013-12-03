Red []

letter: charset [#"a" - #"z" #"A" - #"Z"]
vowel: charset "aeiouyhw"
ones: charset "bfpvBFPV"
twos: charset "cgjkqsxzCGJKQSXZ"
threes: charset "dtDT"
fours: charset "lL"
fives: charset "mnMN"
sixes: charset "rR"

soundex: [
	copy initial letter (append s initial)
	some [vowel | consonant]	
]
consonant: [
	ones (append s 1) | twos (append s 2) | threes (append s 3) | fours (append s 4) | fives (append s 5) | sixes (append s 6)
]

to-soundex: func [
	str [string!]
] [
	s: copy ""
	parse str soundex
	return s
]

print to-soundex "Shireman"