
/datum/SC_objective/point_control/attack
	objective_name = "Attack"
	allowed_om_objs = list(/obj/effect/overmap/sector/exo_research,/obj/effect/overmap/sector/exo_depot,/obj/effect/overmap/sector/geminus_city,/obj/effect/overmap/sector/glassed_planet)

/datum/SC_objective/point_control/attack/announce_reminder()
	to_target(world,sound('sound/misc/notice2.ogg', repeat = 0, wait = 0, volume = 50, channel = 3))
	var/pre_text = "[objective_name] is still ongoing!"
	var/point_text = get_point_areas_and_status()
	point_text += "\nWe must capture all but [control_leeway] objectives."
	broadcast_all_factions(pre_text + point_text)

/datum/SC_objective/point_control/attack/announce_removal()
	to_target(world,sound('sound/misc/notice2.ogg', repeat = 0, wait = 0, volume = 50, channel = 3))
	var/pre_text = "[objective_name] was not achieved in time, and has expired!"
	broadcast_all_factions(pre_text)

/datum/SC_objective/point_control/attack/announce_active()
	to_target(world,sound('sound/misc/notice2.ogg', repeat = 0, wait = 0, volume = 50, channel = 3))
	var/pre_text = "A new objective has been assigned: [objective_name]."
	var/point_text = get_point_areas_and_status()
	point_text += "\nWe must capture all but [control_leeway] objectives."
	broadcast_all_factions(pre_text + point_text)

/datum/SC_objective/point_control/attack/announce_completion()
	to_target(world,sound('sound/misc/notice2.ogg', repeat = 0, wait = 0, volume = 50, channel = 3))
	var/pre_text = "We succesfully achieved our objective ([objective_name])!\n A new objective will be assigned soon."
	broadcast_faction(objective_winner,pre_text)
	pre_text = "We failed to complete our objective ([objective_name].\n A new objective will be assigned soon."
	broadcast_all_factions(pre_text, list(objective_winner))
