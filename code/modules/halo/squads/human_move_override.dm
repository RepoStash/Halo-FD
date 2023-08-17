
/mob/living/carbon/human/Move(var/newloc,newdir)
	. = ..()
	if(istype(head,/obj/item/clothing/glasses/hud/tactical))
		spawn()
			head:process_hud_pointers()
