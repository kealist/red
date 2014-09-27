Red []

funct-name: "glp_set_prob_name"
arg-block: {	str	[byte!]
	n	[integer!]
}
return-type: [integer!]

print reduce [(replace/all copy funct-name "_" "-") {: "} funct-name {" [^/} arg-block tab {return: } tab (mold return-type) "^/]^/"]
