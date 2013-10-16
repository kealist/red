Red/System [
	Title:		"SDL Tutorial"
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
	
	either begin with-video [
		end
	][log-error]
]