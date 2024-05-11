/datum/job/unsc/spartan_two
	title = "Spartan II"
	outfit_type = /decl/hierarchy/outfit/job/unsc/spartan_two
	total_positions = 4
	spawn_positions = 4
	account_allowed = 0
	access = list(\
		access_unsc,\
		access_unsc_bridge,\
		access_unsc_tech,\
		access_unsc_crew,\
		access_unsc_navsec,\
		access_unsc_ops,\
		access_unsc_fighters,\
		access_unsc_shuttles,\
		access_unsc_medical,\
		access_unsc_armoury,\
		access_unsc_supplies,\
		access_unsc_cargo, \
		access_unsc_officers,\
		access_unsc_marine,\
		access_unsc_gunnery,\
		access_unsc_ids,\
		access_unsc_odst,\
		access_unsc_oni,\
		access_unsc_specialist)
	whitelisted_species = list(/datum/species/spartan)
	pop_balance_mult = 3

	radio_speech_size = RADIO_SPEECH_LEADER
