Red/System [
	Title:		"ZeroMQ request/reply server example"
	Author:		"Kaj de Vos"
	Rights:		"Copyright (c) 2011-2013 Kaj de Vos"
	License: {
		PD/CC0
		http://creativecommons.org/publicdomain/zero/1.0/
	}
	Needs: {
		Red/System >= 0.3.1
		%C-library/ANSI.reds
		%ZeroMQ-binding.reds
	}
	Tabs:		4
]


#include %../../C-library/ANSI.reds
#include %../ZeroMQ-binding.reds


with zmq [

	major: 0  minor: 0  patch: 0

	version :major :minor :patch
	print [
		"0MQ version: " major #"." minor #"." patch newline
		newline
	]


	; Hello World client/server

	log-error: does [  ; FIXME: should go to stderr
		print [form-error system-error  newline]
	]

	server: function [
		/local pool socket message reply data size
	][
		pool: make-pool 1
		; For 0MQ <= 2.0.6:
;		pool: make-pool 1 1 0

		either none? pool [
			log-error
		][
			socket: open-socket pool reply!

			either none? socket [
				log-error
			][
				either serve socket "tcp://*:5555" [
					print-line "Awaiting requests..."

					message: declare message!
					reply: "World"
					size: (length? reply) + 1

					forever [
						either receive socket message zmq-none [
							data: message-data-of message

							either none? data [
								log-error

;								unless end-message message [log-error]
							][
								print ["Received request: "  as-c-string data  newline]

								either end-message message [
									;wait 1

									data: allocate size

									unless all [
										as-logic data
										send socket message
											copy-part as-binary reply  data size
											size
											zmq-none
									][
										log-error
									]
								][
									log-error
								]
							]
						][
							log-error
						]
					]
				][
					log-error
				]
				unless close-socket socket [log-error]
			]
			unless end-pool pool [log-error]
		]
	]

]

server
