Red []

inc: func [n [integer!]][n + 1]   

#system-global [
	foobar: function [
		x [integer!]
		return: [integer!]
	] [
		#call [inc x]
		int: as integer! stack/arguments
		;int/value
	]    
	#export [foobar]
]

;;>> test-dll: load/library %extension.dll
;;>> hw: make routine! [x [integer!] return: [integer!]] test-dll "inc"