//Swamp

/obj/effect/flora/rocks
	name = "rocks"
	desc = "A collection of moss laden rocks, who knows what you'll find underneath."
	icon = 'code/modules/halo/flora/swamp_ausflora.dmi'
	icon_state = "rock1"

/obj/effect/flora/rocks/New()
	..()
	icon_state = "rock_[rand(1,5)]"

//Bushes

/obj/effect/flora/busha
	name = "ferns"
	icon = 'code/modules/halo/flora/swamp_ausflora.dmi'
	icon_state = "busha1"

/obj/effect/flora/busha/New()
	..()
	icon_state = "busha_[rand(1,3)]"

/obj/effect/flora/bushb
	name = "ferns"
	icon = 'code/modules/halo/flora/swamp_ausflora.dmi'
	icon_state = "bushb1"

/obj/effect/flora/bushb/New()
	..()
	icon_state = "bushb_[rand(1,3)]"

/obj/effect/flora/bushc
	name = "ferns"
	icon = 'code/modules/halo/flora/swamp_ausflora.dmi'
	icon_state = "bushc1"

/obj/effect/flora/bushc/New()
	..()
	icon_state = "bushc_[rand(1,3)]"

//Grass

/obj/effect/flora/swamp_grass
	name = "grass"
	icon = 'code/modules/halo/flora/swamp_ausflora.dmi'
	icon_state = "grassa1"

/obj/effect/flora/swamp_grass/New()
	..()
	icon_state = "grassa_[rand(1,11)]"

//Large Swamp

/obj/effect/flora/swamp_bush
	name = "bush"
	icon = 'code/modules/halo/flora/swamp_ausflora.dmi'
	icon_state = "bush1"

/obj/effect/flora/swamp_bush/New()
	..()
	icon_state = "bush_[rand(1,3)]"

/obj/effect/flora/rocks/large
	name = "rocks"
	icon = 'code/modules/halo/flora/swamp_ausflora.dmi'
	icon_state = "rocks1"

/obj/effect/flora/rocks/large/New()
	..()
	icon_state = "rocks_[rand(1,3)]"




