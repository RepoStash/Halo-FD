/obj/item/weapon/tank/jetpack/integrated

/obj/item/weapon/tank/jetpack/integrated/allow_thrust(num, mob/living/user as mob)
	return 1

/datum/armourspecials/integrated_jetpack
	var/obj/item/weapon/tank/jetpack/integrated/integrated_thrust
	var/datum/effect/effect/system/trail/ion/ion_trail

/datum/armourspecials/integrated_jetpack/New(var/obj/item/controller)
	. = ..()
	integrated_thrust = new
	src.ion_trail = new /datum/effect/effect/system/trail/ion()
	src.ion_trail.set_up(controller)

/datum/armourspecials/integrated_jetpack/on_equip(var/obj/source_armour)
	ion_trail.start()

/datum/armourspecials/integrated_jetpack/on_drop(var/obj/source_armour)
	ion_trail.stop()




/* Based on jetpack airtank code. Hoping this will work, probably won't! - Aro

/datum/armourspecials/integrated_jetpack
	var/datum/effect/effect/system/trail/ion/ion_trail
	var/on = 0
	var/mob/living/carbon/human/owner
	var/obj/item/clothing/suit/armor/special/source_item

/datum/armourspecials/integrated_jetpack/New(var/obj/item/controller)
	. = ..()
	source_item = controller
	source_item.action_button_name = "Activate Jetpack"
	src.ion_trail = new /datum/effect/effect/system/trail/ion()
	src.ion_trail.set_up(src)

/datum/armourspecials/integrated_jetpack/Destroy()
	qdel(ion_trail)
	. = ..()

/datum/armourspecials/integrated_jetpack/on_equip(var/obj/source_armour)
	owner = source_armour.loc
	source_item = source_armour

/datum/armourspecials/integrated_jetpack/on_drop(var/obj/source_armour)
	owner = null

/datum/armourspecials/integrated_jetpack/try_item_action()
	on = !on
	if(on)
		ion_trail.start()
	else
		ion_trail.stop()

	if (ismob(usr))
		var/mob/M = usr
		M.update_action_buttons()

	to_chat(usr, "You toggle the thrusters [on? "on":"off"].")

/datum/armourspecials/integrated_jetpack/proc/allow_thrust(owner as mob)
	if(!(src.on))
		src.ion_trail.stop()
		return 0
	else
		return 1

	return */