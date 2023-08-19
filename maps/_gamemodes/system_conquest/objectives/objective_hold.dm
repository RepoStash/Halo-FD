
/datum/SC_objective/point_control/hold
	objective_name = "Take/Hold"
	//Glassed planet removed because, frankly, what is there to defend???
	allowed_om_objs = list(/obj/effect/overmap/sector/exo_research,/obj/effect/overmap/sector/exo_depot,/obj/effect/overmap/sector/geminus_city)
	control_leeway = 2
	obsec_length = 5 MINUTES
	var/holder_faction
	var/hold_for_time = 40 MINUTES
	var/hold_until = 0
	var/announce_delay = 12 MINUTES

/datum/SC_objective/point_control/hold/get_rand_valid_om_obj()
	. = ..()
	hold_until = world.time + hold_for_time + announce_delay

/datum/SC_objective/point_control/hold/apply_point_tweaks(var/obj/machinery/computer/capture_node/n)
	. = ..()
	n.obscure_first_capture = 1

/datum/SC_objective/point_control/hold/revert_point_tweaks(var/obj/machinery/computer/capture_node/n)
	. = ..()
	n.obscure_first_capture = 0

/datum/SC_objective/point_control/hold/announce_reminder()
	to_target(world,sound('sound/misc/notice2.ogg', repeat = 0, wait = 0, volume = 50, channel = 3))
	var/pre_text = "[objective_name] is still ongoing!"
	var/point_text = get_point_areas_and_status()
	broadcast_all_factions(pre_text + point_text)

/datum/SC_objective/point_control/hold/announce_removal()
	to_target(world,sound('sound/misc/notice2.ogg', repeat = 0, wait = 0, volume = 50, channel = 3))
	var/pre_text = "[objective_name] was not achieved in time, and has expired!"
	broadcast_all_factions(pre_text)

/datum/SC_objective/point_control/hold/send_active()
	var/datum/faction/f = pick(factions)
	if(f)//Select one of the factions to be the one who is alerted first.
		holder_faction = f.name
	//Do this before we send the message so we actually have the data to work with.
	. = ..()

/datum/SC_objective/point_control/hold/announce_active()
	to_target(world,sound('sound/misc/notice2.ogg', repeat = 0, wait = 0, volume = 50, channel = 3))
	var/pre_text = "A new objective has been assigned: [objective_name]."
	var/point_text = get_point_areas_and_status()
	var/holder_text = "\nStop any other faction from capturing enough points for 40 minutes to win.\nEnemy communications have been partially disrupted, but our tampering will not have gone unnoticed. We do not have long."
	broadcast_faction(holder_faction,pre_text + holder_text + point_text)
	next_reminder = world.time + announce_delay
	spawn(announce_delay)
		broadcast_all_factions(pre_text + point_text, list(holder_faction))

/datum/SC_objective/point_control/hold/announce_completion()
	to_target(world,sound('sound/misc/notice2.ogg', repeat = 0, wait = 0, volume = 50, channel = 3))
	var/pre_text = "We succesfully achieved our objective ([objective_name])!\n A new objective will be assigned soon."
	broadcast_faction(objective_winner,pre_text)
	pre_text = "We failed to complete our objective ([objective_name].\n A new objective will be assigned soon."
	broadcast_all_factions(pre_text, list(objective_winner))

//A copy of the standard point control completion, but changed to consider the holders to have autowon if nobody else does after a certain time.
/datum/SC_objective/point_control/hold/objective_check_completion()
	. = ..()

	if(!. && world.time > hold_until)
		return holder_faction
	if(. && . != holder_faction)
		return .

