
/obj/item/weapon/gun
	var/scope_zoom_amount = 0
	var/max_zoom_amount = 0
	var/min_zoom_amount = BASE_MIN_MAGNIF
	var/is_scope_variable = 0 //If this is set to 1, the set_scope_zoom verb will be added to the list of usable verbs.

/obj/item/weapon/gun/New()
	. = ..()
	if(is_scope_variable)
		verbs += /obj/item/weapon/gun/proc/verb_set_scope_zoom
		verbs += /obj/item/weapon/gun/proc/verb_increase_zoom_amt
		verbs += /obj/item/weapon/gun/proc/verb_decrease_zoom_amt
	if(max_zoom_amount == 0 && !scope_zoom_amount == 0)
		max_zoom_amount = scope_zoom_amount

/obj/item/weapon/gun/proc/verb_set_scope_zoom()
	set name = "Set Scope Zoom"
	set category = "Weapon"
	set popup_menu = 1

	if(istype(usr,/mob/living))
		var/setzoom = input(usr,"Set Scope Zoom?","Max Zoom: [max_zoom_amount]x, Min Zoom: [min_zoom_amount]x") as num
		set_scope_zoom(setzoom,usr)

/obj/item/weapon/gun/proc/set_scope_zoom(var/setzoom,var/mob/user) //The set zoom amount on the weapon is
	if(setzoom < min_zoom_amount)
		if(user)
			to_chat(user,"<span class = 'notice'>Zoom must be greater than or equal to [min_zoom_amount]. Defaulting to [min_zoom_amount].</span>")
		scope_zoom_amount = min_zoom_amount
	else if(setzoom > max_zoom_amount)
		if(user)
			to_chat(user,"<span class = 'notice'>Zoom must be less than or equal to [max_zoom_amount]. Defaulting to [mzx_zoom_amount].</span>")
		scope_zoom_amount = max_zoom_amount
	else
		scope_zoom_amount = setzoom

/obj/item/weapon/gun/proc/verb_increase_zoom_amt()
	set name = "Increase Scope Zoom"
	set category = "Weapon"
	set popup_menu = 1

	var/mob/living/user = usr
	if(user == loc)
		set_scope_zoom(scope_zoom_amount+0.5,user)

/obj/item/weapon/gun/proc/verb_decrease_zoom_amt()
	set name = "Decrease Scope Zoom"
	set category = "Weapon"
	set popup_menu = 1

	var/mob/living/user = usr
	if(user == loc)
		set_scope_zoom(scope_zoom_amount-0.5,user)
