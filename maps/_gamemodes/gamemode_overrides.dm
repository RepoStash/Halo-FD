
/datum/game_mode

	var/list/factions = list()

/datum/game_mode/pre_setup()
	. = ..()
	//setup faction handling
	for(var/faction_type in factions)
		factions.Remove(faction_type)
		var/datum/faction/F = GLOB.factions_by_type[faction_type]

		//this is normally bad practice, but it seems to work fine in byond
		factions.Add(F)