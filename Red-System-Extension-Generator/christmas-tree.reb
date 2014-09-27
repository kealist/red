Rebol[]

make-tree: func [int /local tr length sp ast] [
      tr: copy []
      length: (int * 2) + 3
      repeat i int [
          repeat j 3 [
                ast: to-integer ((i * 2) - 1 + (j * 2) - 2)
                sp: to-integer (length - ast) / 2
                either ((i = 1) and (j = 1)) [
                  append tr reduce [sp 'space 1 'star 'lf]
                ] [
                  append tr reduce [sp 'space ast 'asterisk 'lf]
                ]
          ]
      ]
      append tr reduce [(to-integer ((length - 3) / 2)) 'space 1 'bar 'lf ]
      tr
]



tree: [ 3 space 1 asterisk 3 space lf 
       2 space 3 asterisk 2 space lf
       1 space 2 asterisk 1 star 1 asterisk lf
       1 star 1 asterisk 1 star 3 asterisk lf
       2 space 3 asterisk 2 space lf
       1 space 2 asterisk 1 star 1 asterisk 1 space lf
       7 asterisk lf
       3 space 1 bar 3 space lf ]
result: copy []
rule: [ some [ set i integer! 'space ( append/dup result space i ) |
           set i integer! 'asterisk ( append/dup result "*" i ) |
           set i integer! 'star ( append/dup result "☆" i ) |
           set i integer! 'bar ( append/dup result "|   |" i) |
           'lf ( append result lf ) | skip
   ]
]

parse (make-tree 5) rule
print result
parse (make-tree 4) rule
print result