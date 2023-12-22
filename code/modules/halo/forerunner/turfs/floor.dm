
/turf/simulated/floor/forerunner_alloy
	name = "Alloy Flooring"
	desc = "Floor made of an advanced alien alloy."
	icon = 'code/modules/halo/forerunner/turfs/floors.dmi'
	icon_state = "floortile"

	heat_capacity = 17000

	initial_flooring = /turf/simulated/floor/forerunner_alloy

/turf/simulated/floor/forerunner_alloy/old
	name = "Alloy Flooring"
	desc = "Floor made of an advanced alien alloy."
	icon = 'code/modules/halo/forerunner/turfs/floors.dmi'
	icon_state = "floortile_old"

/decl/flooring/forerunner_alloy
	name = "Alloy Flooring"
	desc = "Floor made of an advanced alien alloy."
	icon = 'code/modules/halo/forerunner/turfs/floors.dmi'
	icon_base = "floortile"
	flags = TURF_ACID_IMMUNE
	build_type = null
	build_cost = 2
	build_time = 30
	apply_thermal_conductivity = 0.025
	apply_heat_capacity = 325000