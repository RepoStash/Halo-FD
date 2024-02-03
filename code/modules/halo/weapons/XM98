/obj/item/weapon/gun/projectile/xm98_carbine
	name = "\improper XM98 Carbine"
	desc = "An experimental carbine dreamt up by the Office of Naval Intelligence as a standard rifle for special operations teams, trading the modularity of the MA5B with a faster rate of fire and better accuracy. It is a bullpup carbine with an integrated suppressor, and is capable of using magazines from the MA5B, MA3, and MA37. It has a low-magnification sight attached on the top."
	icon = 'code/modules/halo/weapons/icons/Weapon Sprites.dmi'
	icon_state = "XM98"
	item_state = "ma37"
	caliber = "7.62mm"
	fire_sound = 'code/modules/halo/sounds/MA3_Assault_Rifle_Fire_New.ogg'
	//fire_sound_burst = 'code/modules/halo/sounds/MA37_Fire_New.wav'
	reload_sound = 'code/modules/halo/sounds/MA37_Reload_New.wav'
	magazine_type = /obj/item/ammo_magazine/ma5b/m118
	allowed_magazines = list(/obj/item/ammo_magazine/ma37/m118, /obj/item/ammo_magazine/ma5b, /obj/item/ammo_magazine/ma3/m118)
	load_method = MAGAZINE
	slot_flags = SLOT_BACK
	wielded_item_state = "ma37-wielded"

	burst = 5
	burst_delay = 1.5
	one_hand_penalty = -1
	dispersion = list(0.0,0.1,0.2,0.2)
	hud_bullet_row_num = 20
	scope_zoom_amount = 1.2
	is_scope_variable = 0

	firemodes = list(\
	list(mode_name="short bursts",  burst=5, dispersion=list(0.0,0.1,0.2,0.2)),
	list(mode_name="extended bursts",  burst=10, dispersion=list(0.0,0.1,0.2,0.2, 0.3, 0.3, 0.4, 0.4))
	)

	ammo_icon_state = null
	attachment_slots = null
	attachments_on_spawn = null

/obj/item/weapon/gun/projectile/ma37_ar/can_use_when_prone()
	return 1

/obj/item/weapon/gun/projectile/ma37_ar/update_icon()
	. = ..()
	if(ammo_magazine)
		icon_state = "XM98"
	else
		icon_state = "XM98_unloaded"

	item_icons = list(
		slot_l_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_left.dmi',
		slot_r_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_right.dmi',
		slot_back_str = 'code/modules/halo/weapons/icons/Back_Weapons.dmi',
		slot_s_store_str = 'code/modules/halo/weapons/icons/Armor_Weapons.dmi',
		)


/obj/item/weapon/gun/projectile/xm98_carbine/orion
	name = "\improper XM98 Carbine"
	desc = "An experimental carbine dreamt up by the Office of Naval Intelligence as a standard rifle for special operations teams, trading the modularity of the MA5B with a faster rate of fire and better accuracy. It is a bullpup carbine with an integrated suppressor, and is capable of using magazines from the MA5B, MA3, and MA37. It has a low-magnification sight attached on the top. Recently, a number have went missing from an ONI shipment, and have begun showing up in the hands of the URF's elite."
	magazine_type = /obj/item/ammo_magazine/ma37/m118
