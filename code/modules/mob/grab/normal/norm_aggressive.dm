/datum/grab/normal/aggressive
	state_name = NORM_AGGRESSIVE

	upgrab_name = NORM_NECK
	downgrab_name = NORM_PASSIVE

	shift = 12


	stop_move = 1
	reverse_facing = 0
	can_absorb = 0
	shield_assailant = 0
	point_blank_mult = 1
	same_tile = 0
	can_throw = 1
	force_danger = 1

	icon_state = "reinforce1"

	break_chance_table = list(15, 60, 100)
/datum/grab/normal/aggressive/process_effect(var/obj/item/grab/G)
	var/mob/living/carbon/human/affecting = G.affecting

	//Drop two-handed guns.
	var/obj/item/weapon/gun/g = affecting.l_hand

	if((istype(g) && g.one_hand_penalty == -1))
		affecting.drop_l_hand()
	g = affecting.r_hand
	if((istype(g) && g.one_hand_penalty == -1))
		affecting.drop_r_hand()

	// Keeps those who are on the ground down
	if(affecting.lying)
		affecting.Weaken(4)
