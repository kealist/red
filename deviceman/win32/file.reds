

#define _O_TEXT 4000h ;-- file mode is text (translated)
#define _O_BINARY 8000h ;-- file mode is binary (untranslated)
#define _O_WTEXT 00010000h ;-- file mode is UTF16 (translated)
#define _O_U16TEXT 00020000h ;-- file mode is UTF16 no BOM (translated)
#define _O_U8TEXT 00040000h ;-- file mode is UTF8 no BOM (translated)

#define WIN_STD_INPUT_HANDLE -10
#define WIN_STD_OUTPUT_HANDLE -11

#define GENERIC_WRITE 40000000h
#define GENERIC_READ 80000000h
#define FILE_SHARE_READ 00000001h
#define FILE_SHARE_WRITE 00000002h
#define OPEN_EXISTING 00000003h
#define WEOF FFFFh

file: context [

	#enum file-descriptors! [
		fd-stdout: 1 ;@@ hardcoded, safe?
		fd-stderr: 2 ;@@ hardcoded, safe?
	]

	page-size: 4096
	confd: -2

	#import [
		LIBC-file cdecl [
			;putwchar: "putwchar" [
				; wchar [integer!] ;-- wchar is 16-bit on Windows
			;]
			wprintf: "wprintf" [
				[variadic]
				return: [integer!]
			]
			fflush: "fflush" [
				fd [integer!]
				return: [integer!]
			]
			_setmode: "_setmode" [
				handle [integer!]
				mode [integer!]
				return: [integer!]
			]
			_get_osfhandle: "_get_osfhandle" [
				fd [integer!]
				return: [integer!]
			]
			;_open_osfhandle: "_open_osfhandle" [
				; handle [integer!]
				; flags [integer!]
				; return: [integer!]
			;]
		]
		"kernel32.dll" stdcall [
			VirtualAlloc: "VirtualAlloc" [
				address [byte-ptr!]
				size [integer!]
				type [integer!]
				protection [integer!]
				return: [int-ptr!]
			]
			VirtualFree: "VirtualFree" [
				address [int-ptr!]
				size [integer!]
				return: [integer!]
			]
			WriteConsole: "WriteConsoleW" [
				consoleOutput [integer!]
				buffer [byte-ptr!]
				charsToWrite [integer!]
				numberOfChars [int-ptr!]
				_reserved [int-ptr!]
				return: [integer!]
			]
			WriteFile: "WriteFile" [
				handle [integer!]
				buffer [c-string!]
				len [integer!]
				written [int-ptr!]
				overlapped [integer!]
				return: [integer!]
			]
			GetConsoleMode: "GetConsoleMode" [
				handle [integer!]
				mode [int-ptr!]
				return: [integer!]
			]
		]
	]

]