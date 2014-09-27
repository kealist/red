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
		screen...a bit like lighting up segments on an LED.  I wrote
		it up as a programming puzzle on the Code Golf StackExchange:

			http://codegolf.stackexchange.com/questions/15932/

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
; as a grid of entries that can have their (W)est, (N)orth, (S)outh,
; and (E)ast walls set.
;
map: [
	[[W N . .] [. N . .] [. N . .] [. N . .] [. N . E]]
	[[W . . .] [. . S .] [. . . .] [. . S .] [. . . E]]
	[[W . . .] [. N . E] [W . . .] [. N . .] [. . . E]]
	[[W . . .] [. . . .] [. . . .] [. . . .] [. . . E]]
	[[W . S .] [. . S .] [. . S .] [. . S .] [. . S E]]
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
	screen-size: [16 15]

	; maximum depth you can see into the distance
	max-depth: 3

	; dimensions of the walls perpindicular to your facing direction
	flat-dims-for-depth: [
		[14 13]
		[8 7]
		[6 5]
	]

	; bounding dimensions of walls parallel to your facing direction
	slant-dims-for-depth: [
		[1 15]
		[3 13]
		[1 7]
	]
]
display-make-buffer: function [] [
	empty-line: copy ""
	loop display/screen-size/1 [append empty-line space]

	buffer: copy []
	loop display/screen-size/2 [append buffer copy empty-line]

	buffer
]


;
; Characters for diagonals.  Unicode versions are suboptimal, as
; they span the width of the character but not the full height
; 
; see: http://home.comcast.net/~tamivox/dave/boxchar/index.html
;
diagonal-char: [
	dark: [
		left: [
			top: #"\" ;-- #"^(25E4)"		
			bottom: #"/" ;-- #"^(25E3)"
		]

		right: [
			top: #"/" ;-- #"^(25E5)"
			bottom: #"\" ;-- #"^(25E2)"
		]
	]

	light: [
		left: [
			top: #"\" ;-- #"^(25E4)"		
			bottom: #"/" ;-- #"^(25E3)"
		]

		right: [
			top: #"/" ;-- #"^(25E5)"
			bottom: #"\" ;-- #"^(25E2)"
		]
	]
]


;
; Characters for solid blocks
;
solid-char: [
	dark: #"X" ;-- #"^(2593)"
	light: #"+" ;-- #^(2591)"
]


add-offset: function [
	{Adds the members of the offset block to the location}

	location [block!]
	offset [block!]

	return: [unset!]
] [
	location/1: location/1 + offset/1
	location/2: location/2 + offset/2
	exit
]


direction-after-turn: function [
	{Get the direction you'd facing after turning left or right.}

	direction [word!] "Direction turned right relative to"
	side [word!] "left or right"

	return: [word!]
] [
	either side = 'right [
		select [north east south west north] direction
	] [
		select [north west south east north] direction
	]
]


offset-for-direction: function [
	{Offset pair to take one step in this direction on the map.}

	direction [word!] "Direction step would be taken in"

	return: [block!]
] [
	unless result: select [
		north [0 -1]
		east [1 0]
		south [0 1]
		west [-1 0]
	] direction [
		print ["Bad direction (offset-for-direction):" mold direction] 
		quit
	]
	result
]


wall-for-direction: function [
	{Translate a direction into corresponding letter in "cell dialect"}

	direction [word!] "Direction to translate."

	return: [word!]
] [
	unless result: select [
		north N
		east E
		south S
		west W
	] direction [
		print ["Bad direction (wall-for-direction):" mold direction]
		quit
	]
	result
]


shading-for-wall: function [
	{
		Shading rule is that the wall you see facing north at [1 1] is
		dark, and that walls alternate being dark and light so that
		a light and dark wall do not directly abut eachother.  For
		this rule to be possible, if you look on one side at a wall
		and then walk around to the other side and look at that same
		edge, it will be the opposite shading.
	}

	location [block!]
	direction [word!]

	return: [word!]
] [
	is-dark: switch/default direction [
		north [
			either odd? location/2 [odd? location/1] [even? location/1]
		]
		south [
			either odd? location/2 [odd? location/1] [even? location/1]
		]
		east [
			either even? location/1 [odd? location/2] [even? location/2]
		]
		west [
			either even? location/1 [odd? location/2] [even? location/2]
		]
	] [
		print ["Bad direction (shading-for-wall):" mold direction]
		quit
	]
	either is-dark ['dark] ['light]
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
		print ["Bad direction (opposite direction):" mold direction]
		quit
	]
	first result
]


in-bounds: function [
	{
		Given a coordinate pair, limit it inside a certain boundary.
		Return true if it didn't need to be limited, false if it did.
	}

	pos [block!]
	low [block!]
	high [block!]

	return: [logic!]
] [
	all-inside: true
	case/all [
		pos/1 < low/1 [
			pos/1: low/1
			all-inside: false
		]
		pos/1 > high/1 [
			pos/1: high/1
			all-inside: false
		]
		pos/2 < low/2 [
			pos/2: low/2
			all-inside: false
		]
		pos/2 > high/2 [
			pos/2: high/2
			all-inside: false
		]
	]
	all-inside
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
	shading [word!] "How should the wall be shaded?"

	return: [logic!] "Whether the flat wall fit completely in the display"
] [
	dims: display/flat-dims-for-depth/(depth)

	start-pos: reduce [
		1 + (display/screen-size/1 / 2) - (dims/1 / 2) + (dims/1 * x-offset)
		1 + (display/screen-size/2 / 2) - (dims/2 / 2)
	]
	end-pos: reduce [
		start-pos/1 + dims/1 - 1
		start-pos/2 + dims/2 - 1
	]

	all-inside: either all reduce [
		in-bounds start-pos [1 1] display/screen-size
		in-bounds end-pos [1 1] display/screen-size
	] [true] [false]

	pos: copy start-pos
	while [pos/1 <= end-pos/1] [
		while [pos/2 <= end-pos/2] [
			buffer/(pos/2)/(pos/1): solid-char/(shading)
			pos/2: pos/2 + 1
		]
		pos/2: start-pos/2
		pos/1: pos/1 + 1
	]

	all-inside
]


draw-slant-wall: function [
	{Draw a slanted wall, which is parallel to the viewer's direction facing.}

	buffer [block!] "Display buffer to draw into"
	depth [integer!] "How many steps in the distance the wall is"
	side [word!] "Left or right wall?"
	shading [word!] "How should the wall be shaded?"

	return: [unset!]
] [
	inset: 0
	repeat d (depth - 1) [
		inset: inset + display/slant-dims-for-depth/(d)/1
	]

	dims: display/slant-dims-for-depth/(depth)

	start-pos: reduce [
		either side = 'left [inset + 1] [display/screen-size/1 - inset]
		1 + (display/screen-size/2 / 2) - (dims/2 / 2)
	]

	end-pos: reduce [
		either side = 'left [start-pos/1 + dims/1 - 1] [start-pos/1 - dims/1 + 1]
		start-pos/2 + dims/2 - 1
	]

	unless all [
		in-bounds start-pos [1 1] display/screen-size
		in-bounds end-pos [1 1] display/screen-size
	] [
		print "Slant wall boundary error."
		quit
	]

	pos: copy start-pos
	while [either side = 'left [pos/1 <= end-pos/1] [pos/1 >= end-pos/1]] [
		while [pos/2 <= end-pos/2] [
			buffer/(pos/2)/(pos/1): case [
				pos/2 = start-pos/2 [diagonal-char/(shading)/(side)/top]
				pos/2 = end-pos/2 [diagonal-char/(shading)/(side)/bottom]
				true [solid-char/(shading)]
			]
			pos/2: pos/2 + 1
		]

		; at each step, we shorten
		start-pos/2: start-pos/2 + 1
		end-pos/2: end-pos/2 - 1

		pos/2: start-pos/2
		pos/1: pos/1 + either side = 'left [1] [-1]
	]

	exit
]


render-3d: function [
	{
		This routine will print out a 14x13 matrix of Unicode characters,
		chosen to approximate the C-64 equivalent character set of solid
		blocks and diagonal triangles.
	}

	location [block!] "one-based player coordinate in the map grid"
	facing [word!] "north, south, east, or west"

	return: [unset!]
] [
	buffer: display-make-buffer

	depth: display/max-depth
	while [depth > 0] [
		x-offset: -1

		;-- We draw a line of flat walls at each depth, with a step
		;-- index of -1 first to go left of center, then 1 to go
		;-- right of center.  Finally we draw the center wall and slant
		;-- walls at that depth.  The depths draw from back to front.

		foreach step [-1 1 0] [
			step-offset: switch step [
				-1 [offset-for-direction direction-after-turn facing 'left]
				1 [offset-for-direction direction-after-turn facing 'right]
				0 [[0 0]]
			]

			all-inside: true
			while [all-inside] [
				scan-location: copy location

				;-- adjust scan location for depth parallel to facing
				add-offset scan-location reduce [
					(depth - 1) * first offset-for-direction facing
					(depth - 1) * second offset-for-direction facing
				]

				;-- adjust scan location for offset perpindicular to facing
				add-offset scan-location reduce [
					step * x-offset * step-offset/1
					step * x-offset * step-offset/2
				]

				scan-walls: none
				if map/(scan-location/2) [
					scan-walls: map/(scan-location/2)/(scan-location/1)
				]

				either scan-walls [
					if find scan-walls wall-for-direction facing [
						all-inside: draw-flat-wall buffer depth x-offset (
							shading-for-wall scan-location facing
						)
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

					foreach side [left right] [
						side-direction: direction-after-turn facing side
						if find scan-walls wall-for-direction side-direction [
							draw-slant-wall buffer depth side (
								shading-for-wall scan-location side-direction
							)
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

	exit
]


;--
; MAIN PROGRAM LOOP
;--

do [
	facing: 'north

	location: [1 1]

	command: none

	while [command <> "q"] [
		prin newline

		print ["You are at location" mold location "facing" mold facing]

		walls: map/(location/2)/(location/1)

		render-3d location facing

		command: input "[F]orward, [B]ackward, turn [L]eft, turn [R]ight or [Q]uit? "

		offset: none
		switch/default first command [
			#"f" #"F" [
				either find walls wall-for-direction facing [
					print "That direction is blocked!"
				] [
					offset: offset-for-direction facing
				]
			]
			#"b" #"B" [
				either find walls wall-for-direction opposite-direction facing [
					print "That direction is blocked!"
				] [
					offset: offset-for-direction opposite-direction facing
				]
			]
			#"l" #"L" [
				facing: direction-after-turn facing 'left
			]
			#"r" #"R" [
				facing: direction-after-turn facing 'right
			]
			#"q" #"Q" [quit]
		] [
			print "Invalid command."
		]

		if offset [
			add-offset location offset
		]

		prin newline
	]
]