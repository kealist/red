Red [
	Title: {Dungeon Construction Set}
	File: %dungeon.red

	Description: {
		When I was a kid, I was obsessed with the idea of creating a 3D
		dungeon game in text graphics on a Commodore 64.  I was
		inspired by the Intellivision game "Advanced Dungeons and
		Dragons: Treasure of Tarmin"; where the map was a grid but
		had thin walls separating the grid squares.

		http://en.wikipedia.org/wiki/Advanced_Dungeons_&_Dragons:_Treasure_of_Tarmin

		I had learned about bytes, and decided that a byte could hold
		enough information for 4 different kind of wall states for
		each of the 4 walls on a grid cell.  Those would be:

			1. Nothing
			2. Wall
			3. Door
			4. Something Else?

		The design allows for the opportunity that adjacent cells would
		"disagree"...e.g. have a wall on one side and a door on the
		other.  I considered this a feature; these situations would
		give rise to one-way doors and walls that didn't appear until
		you passed through them and then turned around.

		I drew diagrams and had ideas of how a position on the map and
		a direction you were facing could "light up" regions on the
		screen...a bit like lighting up segments on an LED:

			https://raw.github.com/hostilefork/teenage-coding/master/DUNGEON/dungeon-spec-flat.jpg

			https://raw.github.com/hostilefork/teenage-coding/master/DUNGEON/dungeon-spec-slant.jpg

		But an implementation of the ideas eluded me.  It was a trickier
		program than I had written at the time, made even trickier because
		I was trying to implement it in a "machine language monitor".  I
		had no assembler, and the book I read didn't discuss them...just
		the instruction set and workings of the 6502 chip.

		(The monitors could encode single instructions into specific memory
		locations.  But unlike an assembler, it had no labels or other
		abstractions...all addresses had to be kept track of on paper.)

		By the time I knew enough about programming that I could do
		something like this in an evening, I no longer cared much
		about the idea.  But upon finding the old diagrams I'd made
		trying to figure it out, I thought it could be fun to take a
		crack at it in the novel new language called "Red".

		Although the Unicode character set is not as ideal for drawing
		what I had in mind as the 8x8 and directly adjacent character
		set on the C-64, it can still get the idea across.
	}
]


;
; GAME MAP
;
; For ease of editing, the cells are not encoded as bytes, but rather
; as a grid of entries that can have their (L)eft, (T)op, (B)ottom,
; and (R)ight walls set.
;
map: [
	[[L T x x] [x T x x] [x T x x] [x T x x] [x T x R]]
	[[L x x x] [x x B x] [x x x x] [x x B x] [x x x R]]
	[[L x x x] [x T x R] [L x x x] [x T x x] [x x x R]]
	[[L x x x] [x x x x] [x x x x] [x x x x] [x x x R]]
	[[L x B x] [x x B x] [x x B x] [x x B x] [x x B R]]
]


;
; SCREEN PARAMETERS
;
; The goal of this exercise is to implement the screen design from my
; diagram as a kid.  While it may be possible to think through some
; generalization of dungeon drawing on character terminals, the odds
; of that generalization passing through the point of this design
; are not high.  So these are hardcoded.
;
display: [
	screen-size: [14 13]

	; maximum depth you can see into the distance
	max-depth: 3
	check-depth: function [depth [integer!]] [
		if any [
			depth < 1
			depth > display/max-depth
		] [
			print ["Unsupported depth:" depth]
			quit
		]
	]

	; dimensions of the walls perpindicular to your facing direction
	flat-dims-for-depth: [
		[12 11]
		[8 7]
		[4 3]
	]

	; bounding dimensions of walls parallel to your facing direction
	slant-dims-for-depth: [
		[1 13]
		[3 11]
		[1 7]
	]
]


;
; Unicode characters for triangles (suboptimal, as they span
; the width of the character space but not the full height
; 
; see: http://home.comcast.net/~tamivox/dave/boxchar/index.html
;
triangle-char: [
	bottom: [
		left: #"\" ;-- #"^(25E3)"
		right: #"/" ;-- #"^(25E2)"
	]
	top: [
		left: #"\" ;-- #"^(25E4)"
		right: #"/" ;-- #"^(25E5)"
	]
]


;
; Unicode character for a solid block
;
solid-char: #"X" ;-- #"^(2588)"


direction-after-right: function [
	{Get the direction you'd facing after turning right.}

	direction [word!] "Direction turned right relative to"
] [
	select [north east south west north] direction
]


direction-after-left: function [
	{Get the direction you'd facing after turning left.}

	direction [word!] "Direction turned right relative to"
] [
	;-- Two wrongs don't make a right.
	;-- (but three lefts do... :-P)

	loop 3 [direction: direction-after-right direction]
	direction
]


offset-for-direction: function [
	{Offset pair to take one step in this direction on the map.}

	direction [word!] "Direction step would be taken in"
] [
	unless result: select [
		north [0 -1]
		east [1 0]
		south [0 1]
		west [-1 0]
	] direction [
		print ["Bad direction:" mold direction] 
		quit
	]
	result
]


wall-for-direction: function [
	{Translate a direction into corresponding letter in "cell dialect"}

	direction [word!] "Direction to translate."
] [
	unless result: select [
		north T
		east R
		south B
		west L
	] direction [
		print ["Bad direction:" mold direction]
		quit
	]
	result
]


opposite-wall: function [
	{Given letter from the cell wall, give opposite (Top=>Bottom, etc.)}

	wall [word!] "Wall to reverse."
] [
	unless result: select [
		T [B]
		R [L]
		B [T]
		L [R]
	] wall [
		print ["Bad edge:" mold edge]
		quit
	]
	first result
]


opposite-direction: function [
	{Reverse the given direction (north=>south, etc.)}

	direction [word!] "Direction to reverse."
] [
	unless result: select [
		north [south]
		east [west]
		south [north]
		west [east]
	] direction [
		print ["Bad direction:" mold direction]
		quit
	]
	first result
]


draw-flat-wall: function [
	{
		Will draw a flat wall at the given depth.  The offset is an integer
		indicating how many steps off center the wall should be drawn.
		Negative numbers indicate steps to the left, positive to the right.

		In defiance of the laws of perspective, walls at the same distance
		are shown at the same width for as far as they can be seen to the
		left and right within the screen boundaries.
	}

	buffer [block!] "Display buffer to draw into"
	depth [integer!] "How many steps in the distance the wall is"
	x-offset [integer!] "Steps off center the wall should be drawn"

	return: [logic!] "Whether the flat wall fit completely in the display"
] [
	display/check-depth depth

	dims: display/flat-dims-for-depth/(depth)

	start-pos: reduce [
		(display/screen-size/1 / 2 + 1) - (dims/1 / 2) + (dims/1 * x-offset)
		(display/screen-size/2 / 2 + 1) - (dims/2 / 2)
	]
	end-pos: reduce [
		start-pos/1 + dims/1 - 1
		start-pos/2 + dims/2 - 1
	]

	all-inside: true
	case/all [
		start-pos/1 < 1 [
			start-pos/1: 1
			all-inside: false
		]
		end-pos/1 > display/screen-size/1 [
			end-pos/1: display/screen-size/1
			all-inside: false
		]
		start-pos/2 < 1 [
			start-pos/2: 1
			all-inside: false
		]
		end-pos/2 > display/screen-size/2 [
			end-pos/2: display/screen-size/2
			all-inside: false
		] 
	]

	col-count: end-pos/1 - start-pos/1 + 1
	row-count: end-pos/2 - start-pos/2 + 1
	repeat col col-count [
		repeat row row-count [
			buffer/(start-pos/2 + row - 1)/(start-pos/1 + col - 1): (
				either even? x-offset [#"X"] [#"+"]
			)
		]
	]

	all-inside
]


draw-slant-wall: function [
	{Draw a slanted wall, which is parallel to the viewer's direction facing.}

	buffer [block!] "Display buffer to draw into"
	depth [integer!] "How many steps in the distance the wall is"
	z-offset [integer!] "-1 for a left wall, and +1 for a right wall"
] [
	display/check-depth depth

	inset: 0
	repeat d (depth - 1) [
		inset: inset + display/slant-dims-for-depth/(d)/1
	]

	dims: display/slant-dims-for-depth/(depth)

	start-pos: reduce [
		1 + either z-offset = -1 [inset] [display/screen-size/2 - inset - dims/1]
		(display/screen-size/2 / 2 + 1) - (dims/2 / 2)
	]

	end-pos: reduce [
		start-pos/1 + dims/1 - 1
		start-pos/2 + dims/2 - 1
	]

	case/all [
		start-pos/1 < 1 [
			print "Slant wall col-start error"
			quit
		]
		end-pos/1 > display/screen-size/1 [
			print "Slant wall col-end error"
			quit
		]
		start-pos/2 < 1 [
			print "Slant wall row-start error"
			quit
		]
		end-pos/2 > display/screen-size/2 [
			print "Slant wall row-end error"
			quit
		] 
	]

	col-count: end-pos/1 - start-pos/1 + 1
	row-count: end-pos/2 - start-pos/2 + 1
	repeat col col-count [
		repeat row row-count [
			buffer/(start-pos/2 + row - 1)/(start-pos/1 + col - 1): (
				either even? depth [#"X"] [#"+"]
			)
		]
	]
]


render-3d: function [
	{
		This routine will print out a 14x13 matrix of Unicode characters,
		chosen to approximate the C-64 equivalent character set of solid
		blocks and diagonal triangles.
	}

	pos [block!] "one-based position into the map grid"
	facing [word!] "north, south, east, or west"
] [
	empty-line: copy ""
	loop display/screen-size/1 [append empty-line space]

	buffer: copy []
	loop display/screen-size/2 [append buffer copy empty-line]

	depth: display/max-depth
	while [depth > 0] [
		x-offset: -1
		foreach step [-1 1 0] [
			step-offset: switch step [
				-1 [offset-for-direction direction-after-left facing]
				1 [offset-for-direction direction-after-right facing]
				0 [[0 0]]
			]

			all-inside: true
			while [all-inside] [
				scan-pos: copy pos

				depth-offset: offset-for-direction facing

				scan-pos/1: scan-pos/1 + (
					(depth - 1) * depth-offset/1
				) + (
					step * x-offset * step-offset/1
				)
				scan-pos/2: scan-pos/2 + (
					(depth - 1) * depth-offset/2
				) + (
					step * x-offset * step-offset/2
				)

				scan-walls: none
				if map/(scan-pos/2) [
					scan-walls: map/(scan-pos/2)/(scan-pos/1)
				]

				either scan-walls [
					if find scan-walls wall-for-direction facing [
						all-inside: draw-flat-wall buffer depth x-offset
					]
				] [
					all-inside: false
				]

				either all-inside [
					x-offset: x-offset + step
				] [
					x-offset: switch step [
						-1 [1]
						1 [0]
						0 [none]
					]
				]

				if all [
					step = 0
					scan-walls
				] [
					;-- last thing to do at this depth:
					;-- draw the diagonal walls to the left and right (if applicable)

					foreach z-offset [-1 1] [
						side: either z-offset = -1 [
							direction-after-left facing
						] [
							direction-after-right facing
						]
						if find scan-walls wall-for-direction side [
							draw-slant-wall buffer depth z-offset
						]
					]
				
					all-inside: false
				]
			]
		]

		depth: depth - 1
	]

	repeat line display/screen-size/2 [
		print buffer/(line)
	]
]


;--
; MAIN PROGRAM LOOP
;--

do [
    facing: 'north

	pos: [1 1]

	command: none

	while [command <> "q"] [
		prin newline

		print ["You are at coordinate" mold pos "facing" mold facing]

		walls: map/(pos/2)/(pos/1)

		render-3d pos facing

		command: input "[F]orward, [B]ackward, turn [L]eft, turn [R]ight or [Q]uit? "

		offset: none
		switch/default command [
			"f" [
				either find walls wall-for-direction facing [
					print "That direction is blocked!"
				] [
					offset: offset-for-direction facing
				]
			]
			"b" [
				either find walls opposite-wall wall-for-direction facing [
					print "That direction is blocked!"
				] [
					offset: offset-for-direction opposite-direction facing
				]
			]
			"l" [
				facing: direction-after-left facing
			]
			"r" [
				facing: direction-after-right facing
			]
			"q" [quit]
		] [
			print "Invalid command."
		]

		if offset [
			pos/1: pos/1 + offset/1
			pos/2: pos/2 + offset/2
		]

		prin newline
	]
]