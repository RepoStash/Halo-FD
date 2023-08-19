
#define DEFAULT_OBJECTIVE_REMINDER_TIMEFRAME 4 MINUTES
#define POINT_CAPTURE_OBSEC_FOR 10 MINUTES

//Objective Ideas:
//Assault (All factions are given the objective at the same time)
//Defense (One faction is told to defend a location

/datum/SC_objective
	var/objective_name = "Objective"
	var/list/allowed_om_objs = list()//Typepaths, please
	var/list/allowed_om_objs_cache = list()//Refs for the above.
	var/list/factions = list() //Our gamemode will populate this when it creates us.
	var/obj/effect/overmap/active_om
	var/next_reminder = 0
	var/reminder_timeframe = DEFAULT_OBJECTIVE_REMINDER_TIMEFRAME
	var/objective_worth = 1 //Only very hard objectives should make this go up.
	var/objective_winner
	//Should contain a name, list of planets it can initialise on, and a variable to hold the name of the winner.
	//Should also link to a standard objective, for the point-costs and whatnot.

/datum/SC_objective/New()
	. = ..()
	get_rand_valid_om_obj()
	next_reminder = world.time + reminder_timeframe

//If an objective needs to cut itself out of the validity list due to various gamestate things, do it here.
/datum/SC_objective/proc/check_objective_valid()
	return 1

//This can also output -1, in addition to 1 and 0. -1 fails the objective forcibly and sets a new one.
/datum/SC_objective/proc/check_completion()
	var/winner = objective_check_completion()
	if(winner)
		objective_winner = winner
		return 1
	return 0

//This should return a faction name.
/datum/SC_objective/proc/objective_check_completion()

/datum/SC_objective/proc/om_obj_valid(var/obj/effect/om_obj)
	return 1

/datum/SC_objective/proc/get_rand_valid_om_obj()
	//If our two arrays have different lengths, then let's redo them
	if(allowed_om_objs.len != allowed_om_objs_cache.len)
		//Clear out any nullrefs, just in case.
		for(var/om in allowed_om_objs_cache)
			if(isnull(om))
				allowed_om_objs_cache -= om

		for(var/path in allowed_om_objs)
			var/om_obj_found = locate(path)
			if(om_obj_found)
				allowed_om_objs_cache |= om_obj_found

	var/list/om_objs_tocheck = allowed_om_objs_cache.Copy()
	while(isnull(active_om))
		active_om = pick(om_objs_tocheck)
		if(!om_obj_valid(active_om))
			om_objs_tocheck -= active_om
			active_om = null
		if(om_objs_tocheck.len == 0)
			log_admin("ERROR: Gamemode attempted to acquire a valid OM object for objective [objective_name], but failed!")
			return 0
	return active_om

/datum/SC_objective/proc/broadcast_faction(var/fac_name,var/fac_message)
	var/sender_name = "Emergency Broadcast"
	var/channel = RADIO_HUMAN
	var/lang = LANGUAGE_ENGLISH
	if(fac_name == "UNSC")
		sender_name = "HIGHCOMM SIGNINT"
		channel = RADIO_SQUAD
	else if(fac_name == "Insurrection")
		sender_name = "People's Voice"
		channel = GLOB.INSURRECTION.get_innie_channel_name()
	else if(fac_name == "Covenant")
		sender_name = "Covenant Overwatch"
		channel = RADIO_COV
		lang = LANGUAGE_SANGHEILI
	GLOB.global_announcer.autosay("[fac_message]", sender_name, channel, lang)

/datum/SC_objective/proc/broadcast_all_factions(var/message,var/list/ignore_list = list())
	for(var/datum/faction/f in factions)
		if(f.name in ignore_list)
			continue
		broadcast_faction(f.name,message)

/datum/SC_objective/proc/should_announce_removal()
	if(isnull(objective_winner))
		return 1
	return 0

/datum/SC_objective/proc/send_reminder()
	if(world.time > next_reminder)
		spawn()
			announce_reminder()
		next_reminder = world.time + reminder_timeframe

/datum/SC_objective/proc/send_removal()
	if(should_announce_removal())
		spawn()
			announce_removal()

/datum/SC_objective/proc/send_active()
	spawn()
		announce_active()

/datum/SC_objective/proc/send_complete()
	spawn()
		announce_completion()

/datum/SC_objective/proc/announce_reminder()
	to_world("<span class = 'danger'>The Objective [objective_name] is still ongoing!.</span>")

//Some objectives might expire early.
/datum/SC_objective/proc/announce_removal()
	to_world("<span class = 'danger'>The Objective [objective_name] has expired before being completed.</span>")

/datum/SC_objective/proc/announce_active()
	to_world("<span class = 'danger'>The Objective [objective_name] has become the active objective.</span>")

/datum/SC_objective/proc/announce_completion()
	to_world("<span class = 'danger'>The Objective [objective_name] has been completed!.</span>")


//Some baseline objective types//

/datum/SC_objective/point_control
	objective_name = "point control do not use"

	var/control_leeway = 1 //How many points can we *not* control and still win?
	var/obsec_length = 15 MINUTES
	var/list/points_to_scan = list()

/datum/SC_objective/point_control/get_rand_valid_om_obj()
	. = ..()
	if(active_om)
		objective_name = "[initial(objective_name)]: [active_om.name]"

/datum/SC_objective/point_control/proc/apply_point_tweaks(var/obj/machinery/computer/capture_node/n)
	//Unsecure the node, so people can start capturing it.
	n.objective_secured = 0
	n.obsec_for = POINT_CAPTURE_OBSEC_FOR

/datum/SC_objective/point_control/proc/revert_point_tweaks(var/obj/machinery/computer/capture_node/n)
	n.control_faction = null
	n.obsec_until = 0
	n.obsec_for = 0
	n.objective_secured = 1

/datum/SC_objective/point_control/proc/get_capture_points()
	if(points_to_scan.len != 0)
		return
	for(var/obj/machinery/computer/capture_node/node in world)
		var/obj/effect/overmap/om = map_sectors["[node.z]"]
		if(!om || om != active_om)
			continue
		apply_point_tweaks(node)
		points_to_scan += node

/datum/SC_objective/point_control/proc/get_point_areas_and_status()
	. = "\nThe enemy can hold no more than [control_leeway] objectives.\nActive Nodes:"
	for(var/n in points_to_scan)
		var/obj/machinery/computer/capture_node/node = n
		var/area/node_area = get_area(node)
		var/node_status = ""
		if(node.objective_secured)
			node_status = "Secured. "
		if(node.control_faction)
			node_status += "[node.control_faction] controlled."
		else
			node_status = "Neutral. "
		. += "\n[node_area.name] - [node_status]"

/datum/SC_objective/point_control/objective_check_completion()
	//If we haven't grabbed refs to all our points, do it now.
	get_capture_points()

	for(var/datum/faction/f in factions)
		var/our_points = 0
		for(var/obj/machinery/computer/capture_node/node in points_to_scan)
			if(node.control_faction == f.name)
				our_points += 1
		//If our control falls within the leeway, let's mark ourselves as a winner.
		if(points_to_scan.len - control_leeway <= our_points)
			//If somone has won, let's reset all our capture nodes.
			for(var/obj/machinery/computer/capture_node/node in points_to_scan)
				revert_point_tweaks(node)
			return f.name

/datum/SC_objective/point_control/send_active()
	get_capture_points()
	. = ..()

#include "objective_attack.dm"
#include "objective_hold.dm"

#undef DEFAULT_OBJECTIVE_REMINDER_TIMEFRAME