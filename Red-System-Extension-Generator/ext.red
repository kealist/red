Red []

inc: func [n [integer!]][n + 1]

#system [
   #call [inc 123]
   int: as red-integer! stack/arguments
   print int/value                     ;-- will print 124
]