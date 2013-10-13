Red/System [
	Title:		"Play a WAV sound file"
	Author:		"Kaj de Vos"
	Rights:		"Copyright (c) 2011-2013 Kaj de Vos"
	License: {
		PD/CC0
		http://creativecommons.org/publicdomain/zero/1.0/
	}
	Needs: {
		Red/System >= 0.2.6
		%C-library/ANSI.reds
		%SDL/SDL.reds
	}
	Example:	"play-SDL-WAV sample.wav"
	Tabs:		4
]


#include %../../C-library/ANSI.reds
#include %../SDL.reds


with sdl [

	log-error: does [  ; Log current SDL error.
		print-wide ["Error:" form-error newline]
	]


	argument:	get-argument 1
	file:		as-handle 0

	screen:		as surface! 0

	wanted:		declare audio-spec!
	actual:		declare audio-spec!

	sound:		declare audio-spec!
	data:		declare binary-reference!
	size:		declare integer!

	conversion:	declare audio-conversion!
	stream:		declare stream!

	either as-logic argument [
		; Open audio output in the preferred format and get the actual hardware format

		either begin with-audio
			#if OS = 'Syllable [or with-video]
			#if OS = 'Windows [or with-video]
		[
			wanted/format-1:	as-byte audio-s16 and FFh
			wanted/format-2:	as-byte audio-s16 >>> 8
			wanted/channels:	as-byte 2
			wanted/frequency:	22'050
			wanted/samples:		0200h
			wanted/user-data:	as-handle stream
			wanted/callback:	as-integer :fetch-audio

			#if OS = 'Windows [  ; DirectSound needs a window handle
				screen: set-video-mode 1 1  0  no-frame

				unless as-logic screen [log-error]
			]
			either open-audio wanted actual [
				; Load the audio file

				file: open argument "rb"

				either as-logic file [
					either as-logic load-wav file yes sound data :size [
						; Convert audio to the hardware format

						either make-audio-conversion conversion
							(as-integer sound/format-2) << 8 or as-integer sound/format-1
								sound/channels
								sound/frequency
							(as-integer actual/format-2) << 8 or as-integer actual/format-1
								actual/channels
								actual/frequency
						[
							conversion/data: allocate conversion/size-multiple * size

							either as-logic conversion/data [
								copy-part data/value conversion/data size
								conversion/source-size: size

								either convert-audio conversion [
									; Play the converted audio

									stream/index: conversion/data
									stream/rest: conversion/target-size

									pause-audio no

									until [
;										wait 1
										zero? stream/rest
									]
								][
									log-error
								]
								free conversion/data
							][
								print-line "Error: sound conversion memory allocation failed"
							]
						][
							log-error
						]
						free-wav data/value
					][
						log-error
					]
				][
					log-error
				]
				close-audio
			][
				log-error
			]
			end
		][
			log-error
		]
	][
		argument: get-argument 0
		print-wide ["Usage:" argument "<WAV file>" newline]
	]
	end-argument argument

]
