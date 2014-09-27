    Rebol[]

    f: does [if (a = -1) or (a = 256) [a: 0]]
    d: [
    	any[
    		["i"|"x"] (a: a + 1 f) |
    		["d"] (a: a - 1 f) |
    		["s"|"k"] (a: a * a f) |
    		["o"|"c"] (print a) |
    		skip
    	]
    ]
    a: 0 
    forever [parse (ask ">>") d]