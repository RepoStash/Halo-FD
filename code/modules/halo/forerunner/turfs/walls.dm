
/turf/simulated/wall/forerunner
	name = "forerunner alloy wall"
	desc = "An armor-plated wall which acts as both protection and separation"
	icon_state = "forerunner_alloy"

	floor_type = /turf/simulated/floor/plating

/turf/simulated/wall/forerunner/New(var/newloc)
	. = ..(newloc,"forerunner alloy")

/turf/simulated/wall/forerunner/old
	name = "forerunner alloy wall"
	desc = "An armor-plated wall which acts as both protection and separation"
	icon_state = "forerunner_alloy_old"

	floor_type = /turf/simulated/floor/plating

/turf/simulated/wall/forerunner/New(var/newloc)
	. = ..(newloc,"forerunner alloy")