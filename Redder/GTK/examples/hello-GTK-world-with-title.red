Red [
	Title:		"Hello GTK+ example, with window title"
	Author:		"Kaj de Vos"
	Rights:		"Copyright (c) 2011-2013 Kaj de Vos"
	License: {
		PD/CC0
		http://creativecommons.org/publicdomain/zero/1.0/
	}
	Needs: {
		Red >= 0.3.2
		%GTK.red
	}
	Purpose: {
		This is the traditional Hello World example, showing
		the smallest possible program to output a message,
		in the GTK+ binding for Red.
		This is the version for if you insist on a window title.
	}
	Tabs:		4
]

#include %../GTK.red

view/title "Hello, Red GTK+ world!" "Hello World"
