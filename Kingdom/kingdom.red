Red []

kingdom: context [
	description: {Cactus Flats is a frontier town in the Wild West. There are ranchers, rustlers and gunslingers. The Sheriff wears a badge, but law mostly comes from the barrel of a gun.}
	threats: [
		{Outlaws and lowlifes have been drifting into town.} 
		{Railroad is not coming thru our town after all.}
		{Drought. A long dry spell has made the rivers run low, making it harder to water cattle or crops.}
	]
	locations: [
		{Taproom of the Old Saloon}
		{Boot Hill, the graveyard}
		{Sheriff’s office & jail cell}
		{Hanging Tree, lonely oak south of town}
		{On the dry banks of the Cahoga River}
		{Treacher’s Canyon, surrounding the road north to Fort Brook} 
		{Honest Cartwright’s dry goods}
		{Abandoned mission on the edge of town, its adobe walls crumbling}
	]
	character!: make object! [
		role: 				; power / perspective / touchstone
		concept: 			; string! (description)
		wish-fear: 			; string! (description)
		issue: 				; string! (personal)
		locations: 			; integer! (location #)
		bond: none			; string! (connection with the character on the left)
	]
]