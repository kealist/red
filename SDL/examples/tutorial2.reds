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
	
	screen-width: 640
	screen-height: 480
	screen-bpp: 32
	
	screen:				as surface! 0
	background:			as surface! 0
	message:			as surface! 0
	image:				as surface! 0
	
	
	load-image: function [ "Convert an image"
		filename [c-string!]
		return: [surface!]
		/local loaded-image optimized image
	] [
		loaded-image:		as surface! 0
		optimized-image: 	as surface! 0
		loaded-image: load-bmp open filename "rb" yes
		optimized-image: display-format loaded-image
		free-surface loaded-image
		return optimized-image
	]
	
	blit-image: function ["apply an image at x y coordinates"
		x	[integer!]
		y	[integer!]
		source				[surface!]
		target				[surface!]
		return:				[logic!]
		/local rectangle
	] [
		rectangle: as rectangle! allocate size? rectangle!
		rectangle/x-y: x and FFFFh or (y << 16)
		rectangle/width-height: source/height << 16 or source/width
		blit source null target rectangle
		
	]
	
	either begin with-video [
		screen: set-video-mode screen-width screen-height  screen-bpp  software-surface
		set-window-caption "Hello World" null
		image: load-image "sample.bmp"
		if as logic! image [
			blit-image 0 0 image screen
			blit-image 150 200 image screen
			blit-image 0 200 image screen
			blit-image 150 0 image screen
			flip screen
			delay 2000
			free-surface image
		]
		end
	][log-error]
]