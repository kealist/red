Red/System []

devices: context [
	#define DEVICE_MAX 16

	;; Red Device Commands:
	#enum device-commands! [
		RDC_INIT	;; init device driver resources
		RDC_QUIT	;; cleanup device driver resources
		RDC_OPEN	;; open device unit (port)
		RDC_CLOSE	;; close device unit
		RDC_READ	;; read from unit
		RDC_WRITE	;; write to unit
		RDC_POLL	;; check for activity
		RDC_CONNECT	;; connect (in or out)
		RDC_QUERY	;; query unit info
		RDC_MODIFY	;; set modes (also get modes)
		RDC_CREATE	;; create unit target
		RDC_DELETE	;; delete unit target
		RDC_RENAME
		RDC_LOOKUP
		RDC_MAX
		RDC_CUSTOM: 32	;; start of custom commands
	]

	;; Red Device Flags and Options (bitnums):
	#enum device-flag! [
		;; Status flags:
		RDF_INIT	;; Device is initialized
		RDF_OPEN	;; Global open (for devs that cannot multi-open)
		;; Options:
		RDO_MUST_INIT: 16	;; Do not allow auto init (manual init required)
		RDO_AUTO_POLL	;; Poll device, even if no requests (e.g. interrupts)
	]

	;; Red Request Flags (bitnums):
	#enum request-flag! [
		RRF_OPEN	;; Port is open
		RRF_DONE	;; Request is done (used when extern proc changes it)
		RRF_FLUSH	;; Flush WRITE
		;; RRF_PREWAKE ;; C-callback before awake happens (to update port object)
		RRF_PENDING	;; Request is attached to pending list
		RRF_ALLOC	;; Request is allocated, not a temp on stack
		RRF_WIDE	;; Wide char IO
		RRF_ACTIVE	;; Port is active, even no new events yet
	]

	;; Red Device Errors:
	#enum device-error! [
		RDE_NONE
		RDE_NO_DEVICE	;; command did not provide device
		RDE_NO_COMMAND	;; command past end
		RDE_NO_INIT	;; device has not been inited
	]


	red-request!: alias struct! [
		test [integer!]
	]

	;; Device structure:
	red-device!: alias struct! [
		title 			[byte-ptr!]		;; title of device
		version			[integer!]		;; version, revision, release
		date			[integer!]		;; year, month, day, hour
		commands		[byte-ptr!]		;; command dispatch table
		max-command		[integer!]		;; keep commands in bounds
		pending			[red-request!]	;; pending requests
		flags 			[integer!]		;; state: open, signal
		req-size		[integer!]		;; size of request struct
	]

	;; Request structure: ;; Allowed to be extended by some devices

	red-device-request!: alias struct! [
		length [integer!]		;; size of extended structure

		;; Linkages:
		device 			[integer!]	;; device id (dev table)
		next 			[red-request!]	;; linked list (pending or done lists)
		port 			[byte-ptr!]	;; link back to REBOL port object
		
		handle 	[byte-ptr!]
		socket 	[integer!]
		id 		[integer!]

		;; Command info:
		command [integer!]	;; command code
		error 	[integer!]	;; error code
		modes 	[integer!]	;; special modes, types or attributes
		flags 	[integer!]	;; request flags
		state 	[integer!]	;; device process flags
		timeout [integer!]	;; request timeout


		data [byte-ptr!]	;; data to transfer
		sock [byte-ptr!]	;; temp link to related socket

		length [integer!]	;; length to transfer
		actual [integer!]	;; length actually transferred
	]

	;; Red Device Table

	device-table: array [DEVICE_MAX red-device!]

		comment {
		;; Special fields for common IO uses:
				union [
					struct [
						REBCHR *path;	;; file string (in OS local format)
						i64 size;	;; file size
						i64 index;	;; file index position
						I64 time;	;; file modification time (struct)
					] file;
					struct [
						u32 local_ip;	;; local address used
						u32 local_port;	;; local port used
						u32 remote_ip;	;; remote address
						u32 remote_port;	;; remote port
						void *host_info;	;; for DNS usage
					] net;
					struct [
						REBCHR *path;	;;device path string (in OS local format)
						void *prior_attr;	;; termios: retain previous settings to revert on close
						i32 baud;	;; baud rate of serial port
						u8	data_bits;	;; 5, 6, 7 or 8
						u8	parity;	;; odd, even, mark or space
						u8	stop_bits;	;; 1 or 2
						u8	flow_control;	;; hardware or software
					] serial;
				]
		}
]