Red/System [
	Title:		"Lazyfoo SDL Tutorial Lesson 1"
	Author:		"Joshua Shireman"
	Rights:		""
	License: {
		PD/CC0
		http://creativecommons.org/publicdomain/zero/1.0/
	}
	Needs: {
		Red/System >= 0.2.5
		%C-library/ANSI.reds
		%SDL/SDL.reds
	}
	Purpose: {
	blah
	}
	Example: {
	blah
	}
	Tabs:		4
]

#include %../../C-library/ANSI.reds
#include %../SDL.reds

with sdl [
	current: version
	print ["SDL version: "
		as-integer current/major  #"."
		as-integer current/minor  #"."
		as-integer current/patch  newline
	]


	log-error: does [  ; Log current SDL error.
		print-wide ["Error:" form-error newline]
	]
	
	screen:			as surface! 0
	image:			as surface! 0
	
	either begin with-video [
	
		screen: set-video-mode 640 480  32  software-surface
		image: load-bmp open "sample.bmp" "rb" yes
		blit image null screen null
		flip screen
		delay 2000
		free-surface image
		end
	][log-error]
]