
/datum/npc_fleet

	var/obj/leader_ship

	var/list/ships_infleet = list()

/datum/npc_fleet/New(var/creator)
	. = ..()
	assign_leader(creator)
	GLOB.processing_objects += src

/datum/npc_fleet/Destroy()
	GLOB.processing_objects -= src
	. = ..()

/datum/npc_fleet/proc/clear_target_locs()
	for(var/obj/effect/overmap/ship/npc_ship/ship in ships_infleet)
		ship.target_loc = ship.loc

/datum/npc_fleet/proc/add_tofleet(var/obj/effect/overmap/ship/add_to)
	ships_infleet |= add_to
	if(add_to.our_fleet.ships_infleet.len == 1 && leader_ship == add_to)
		var/fleet_holder = add_to.our_fleet
		add_to.our_fleet = null
		qdel(fleet_holder)
	add_to.our_fleet = src
	clear_target_locs()

/datum/npc_fleet/proc/assign_leader(var/leader)
	leader_ship = leader
	our_fleet = src
	add_tofleet(leader)
	clear_target_locs()

/datum/npc_fleet/proc/process()
	for(var/entry in ships_infleet)
		if(isnull(entry))
			ships_infleet -= entry
	if(isnull(leader_ship))
		assign_leader(pick(ships_infleet))