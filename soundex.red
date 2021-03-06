Red [
	author: "Joshua Shireman"
	purpose: {This function outputs a string that is the American Soundex value of a particular word.}
	title: "to-soundex function"
	web: {http://www.github.com/kealist}
	documentation: {Given a string as a parameter, the function will return a string of length four, which is the soundex code for the particular name, ie to-soundex "Smith" will return "S530"}
	license-type: "Apache License v2.0"
	license: {Copyright 2013 Joshua Shireman

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at
	
		http://www.apache.org/licenses/LICENSE-2.0
	
	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.}
]

letter: charset [#"a" - #"z" #"A" - #"Z"]
vowel: charset "aeiouyhw"
one: charset "bfpvBFPV"
two: charset "cgjkqsxzCGJKQSXZ"
three: charset "dtDT"
four: charset "lL"
five: charset "mnMN"
six: charset "rR"

to-soundex: func [
	str [string!]
	/local preceding-vowel? preceding-consonant s c soundex consonant
] [
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
	s: copy ""
	append-if: func [
		int [integer!]
	] [
		if not all [
			not preceding-vowel?
			preceding-consonant = int
		][
			preceding-consonant: int
			append s int
		]
	]
	either parse str soundex [
		either ((length? s) > 4) [
			return copy/part at s 0 4
		][
			while [(length? s) < 4] [append s 0]
			return s
		]
	][
		return none
	]
]

ev: func [block] [print mold compose/deep block]

ev [Shireman: (to-soundex "Shireman")]
ev [Aaron: (to-soundex "Aaron")]
ev [Smith: (to-soundex "Smith")]
ev [Johnson: (to-soundex "Johnson")]
ev [Robert: (to-soundex "Robert")]
ev [Rupert: (to-soundex "Rupert")]
ev [Rubin: (to-soundex "Rubin")]
ev [Ashcraft: (to-soundex "Ashcraft")]
ev [Ashcroft: (to-soundex "Ashcroft")] 
ev [Tymczak: (to-soundex "Tymczak") should be "T522"]
ev [Pfister: (to-soundex "Pfister") should be "P236"]
ev [(to-soundex "")]