Red []
a: "1 "
b: "glp_set_prob_name glp_get_prob_name"
c: load replace/all copy b "_" "-"
repeat i 2000 [
	append a c
    append a b
]
print a
print b