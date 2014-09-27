Rebol[]

str: "...<id>90,123</id>...<id>190</id>...<id>123,90</id>...<id>123,90,123</id>...<id>901</id>"
delimiter: charset ">,<"
s: copy "" 
old-new: [ "90" "100" "190" "200" "901" "300" ] 
rule: copy []

foreach [old new] old-new [
	append rule compose [copy del1 delimiter (old) copy del2 delimiter]
	append/only rule to-paren compose/deep [append s rejoin [del1 (new) del2] ]
	append rule [|]
]

append rule [copy c skip (append s c)]
print mold rule
parse str [some rule]
print s