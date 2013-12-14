Red [
	Title:		"Tagged NetStrings"
	Author:		"Kaj de Vos"
	Rights:		"Copyright (c) 2013 Kaj de Vos. All rights reserved."
	License: {
		Redistribution and use in source and binary forms, with or without modification,
		are permitted provided that the following conditions are met:

		    * Redistributions of source code must retain the above copyright notice,
		      this list of conditions and the following disclaimer.
		    * Redistributions in binary form must reproduce the above copyright notice,
		      this list of conditions and the following disclaimer in the documentation
		      and/or other materials provided with the distribution.

		THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
		ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
		WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
		DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
		FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
		DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
		SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
		CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
		OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
		OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
	}
	Needs: {
		Red > 0.4.1
		%common/common.red
		READ
	}
	Purpose: {
		To convert Red values to and from (Tagged) NetStrings format.
	}
	Notes: {
		Needs to be compiled. Current Red interpreter can't LOAD the script.
		TNetStrings specification: http://tnetstrings.org
		String!s and file!s other than Latin-1 yield size value incompatible with
		specification.
		Floats are loaded as file! for now because Red doesn't have them yet.
	}
	Tabs:		4
]


#include %../common/common.red


load-TNetString: function [			"Convert value(s) from (Tagged) NetStrings format."
	value			[string! file!]	"TNetStrings value(s)"
	/keys							"Convert dictionary keys to Red value."
	/values							"Convert binary values to Red value."
	/all							"Always return a block."
	/into							"Insert result into existing block."
		out			[block!]		"Result buffer"
][
	header: [
		start: 1 9 digit stop: #":"
		(size: load/into append/part
			clear _string  start  offset? start stop  ; FIXME: #580
			clear _item
		)
	]
	binary: [
		ahead [size skip #","]
		[if (value)
			start: size skip stop:
			(value: load/into append/part
				clear _string  start  offset? start stop
				clear _item
			)
			keep (value)
		| if (zero? size)
			keep (make string! 0)  ; FIXME: #603
		| keep size skip
		]
		skip
	]
	element: [
		"0:~"			keep (none)												; null
		| "4:true!"		keep (yes)
		| "5:false!"	keep (no)
		| [header [
			(value: values) binary
			; WARN: LOAD rules allow spaces
			| ahead [size skip #"#"]
				start: size skip stop: skip

				if (integer? value: load/into append/part
					clear _string  start  offset? start stop
					clear _item
				)
					keep (value)
			; FIXME: check end positions
			| ahead [size skip #"^^"]											; TODO: float conversion
				start: opt #"-"  any digit  opt [#"." any digit] stop: #"^^"
				(value: append/part make file! 0
					start  offset? start stop
				)
				keep (value)
			| ahead [size skip #"]"] collect [any element] #"]"					; list
			| ahead [size skip #"}"] collect [any [								; dictionary
					header  (value: keys) binary								; key
					element
				]]
				#"}"
			]
		]
	]

	if any [string? value  value: read value] [
		either into [
			here: out

			if parse/case value [collect into out [any element]] [
				either any [all  1 <> offset? here out] [out] [here/1]
			]
		][
			if parse/case value [collect set out [any element]] [
				either any [all  not single? out] [out] [out/1]
			]
		]
	]
]

to-TNetString: function [			"Convert value to (Tagged) NetString."
	value							"Type is lost for some datatypes."
	/map							"Convert even sized any-block! to a TNetStrings dictionary."
	/deep							"Convert nested any-block! to TNetStrings dictionaries."
	/only							"Omit outer envelope from a TNetStrings list."
	/into							"Insert result into existing string."
		result		[string!]		"Result buffer"
	return:			[string! none!]	"NONE: error"
][
	clear _string

	out: either into [
		either tail? result [result] [_string]
	][
		make string! 0
	]
	switch/default type: type?/word value [
		integer! [
			append insert out
				length? append insert out  #":" value
				#"#"
		]
		logic! [
			append insert out
				length? append insert out  #":" value
				#"!"
		]
		char! [append append append out  "1:" value #","]
	][
		case [
			any-string? value [
				; FIXME: only Latin-1 yields proper size
				if 999'999'999 < size: length? value [return none]

				append append append append out  size #":" value #","
			]
			any-word? value
				append insert out
					length? append insert out  #":" value
					#","
			find [none! unset!] type
				append out "0:~"
			any-block? value
				either all [map  even? length? value] [
					append out #":"

					foreach [name value] value [
						either any-string? name [
							; FIXME: only Latin-1 yields proper size
							if 999'999'999 < size: length? name [return none]

							append append append append out  size #":" name #","
						][
							append insert  tail out
								length? append insert  tail out  #":" name
								#","
						]
						unless either deep [
							to-TNetString/map/deep/into value  tail out
						][
							to-TNetString/into value  tail out
						][
							return none
						]
					]
					; FIXME: only Latin-1 yields proper size
					if 999'999'999 < size: (length? out) - 1 [return none]

					append insert out  size #"}"
				][
					foreach value value [
						unless either deep [
							to-TNetString/map/deep/into value  tail out
						][
							to-TNetString/into value  tail out
						][
							return none
						]
					]
					unless only [
						; FIXME: only Latin-1 yields proper size
						if 999'999'999 < size: length? out [return none]

						; TODO: insert in one go
						insert out #":"
						append insert out  size #"]"
					]
				]
			yes [
				; FIXME: only Latin-1 yields proper size
				if 999'999'999 < size: length? append insert out  #":" value [
					return none
				]
				append insert out  size #","
			]
		]
	]
	either into [
		either empty? _string [
			tail result
		][
			out: insert result _string
			clear _string
			out
		]
	][
		head out
	]
]
