
datum/preferences
	var/halo_hud_scaling = 1.3

/datum/category_item/player_setup_item/general/basic/load_character(var/savefile/S)
	. = ..()
	to_target(S["halo_hud_scaling"],pref.halo_hud_scaling)

/datum/category_item/player_setup_item/general/basic/save_character(var/savefile/S)
	. = ..()
	from_target(S["halo_hud_scaling"],pref.halo_hud_scaling)

/datum/category_item/player_setup_item/general/basic/sanitize_character()
	. = ..()
	pref.halo_hud_scaling = sanitize_integer(pref.halo_hud_scaling, 1, 3, 1.3,0)

/datum/category_item/player_setup_item/general/basic/content()
	. = ..()
	. += "<b>Ammo Display and Shield-Bar Scaling:</b> <a href='?src=\ref[src];halohud=1'>[pref.halo_hud_scaling]</a><br>"

/datum/category_item/player_setup_item/general/basic/OnTopic(var/href,var/list/href_list, var/mob/user)
	. = ..()
	if(href_list["halohud"])
		var/new_hud_scale = input(user, "Choose your Halo HUD Scaling:\n(1-3)\nStaying below 2 is recommended.", "Character Preference", pref.halo_hud_scaling) as num|null
		if(new_hud_scale)
			pref.halo_hud_scaling = sanitize_integer(new_hud_scale, 1, 3, 1.3,0)
			return TOPIC_REFRESH
