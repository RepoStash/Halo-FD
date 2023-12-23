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
	icon = 'code/modules/halo/flora/swamp_ausflora_large.dmi'
	icon_state = "bush1"

/obj/effect/flora/swamp_bush/New()
	..()
	icon_state = "bush_[rand(1,3)]"

/obj/effect/flora/rocks/large
	name = "rocks"
	icon = 'code/modules/halo/flora/swamp_ausflora_large.dmi'
	icon_state = "rocks1"

/obj/effect/flora/rocks/large/New()
	..()
	icon_state = "rocks_[rand(1,3)]"

//Vines

/obj/effect/flora/vines
	name = "vines"
	icon = 'code/modules/halo/flora/vines.dmi'
	icon_state = "light1"

/obj/effect/flora/vines/New()
	..()
	icon_state = "light_[rand(1,3)]"

/obj/effect/flora/vines/medium
	icon_state = "medium1"

/obj/effect/flora/vines/medium/New()
	..()
	icon_state = "medium_[rand(1,3)]"

/obj/effect/flora/vines/heavy
	icon_state = "heavy1"

/obj/effect/flora/vines/heavy/New()
	..()
	icon_state = "heavy_[rand(1,3)]"

//Ausflora

/obj/effect/flora/fern
	name = "fern"
	icon = 'code/modules/halo/flora/ausflora.dmi'
	icon_state = "fern1"

/obj/effect/flora/fern/New()
	..()
	icon_state = "fern_[rand(1,4)]"

/obj/effect/flora/bush
	name = "bush"
	icon = 'code/modules/halo/flora/ausflora.dmi'
	icon_state = "bush1"

/obj/effect/flora/bush/New()
	..()
	icon_state = "bush_[rand(1,3)]"
