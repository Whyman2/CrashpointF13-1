//KEEP IN MIND: These are different from gun/grenadelauncher. These are designed to shoot premade rocket and grenade projectiles, not flashbangs or chemistry casings etc.
//Put handheld rocket launchers here if someone ever decides to make something so hilarious ~Paprika

/obj/item/gun/ballistic/revolver/grenadelauncher//Once underbarrel only, now actually used.
	name = "M79 grenade launcher"
	desc = "A break-operated grenade launcher."
	icon_state = "dshotgun-sawn"
	item_state = "gun"
	mag_type = /obj/item/ammo_box/magazine/internal/grenadelauncher
	fire_sound = 'sound/weapons/grenadelaunch.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	pin = /obj/item/firing_pin/implant/pindicate

/obj/item/gun/ballistic/revolver/grenadelauncher/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/revolver/grenadelauncher/nonlethal
	name = "M79-TG grenade launcher"
	desc = "A break-operated grenade launcher. This one appears modified for riot control."
	mag_type = /obj/item/ammo_box/magazine/internal/grenadelauncher_nl
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/revolver/grenadelauncher/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/ammo_box) || istype(A, /obj/item/ammo_casing))
		chamber_round()

/obj/item/gun/ballistic/revolver/grenadelauncher/cyborg
	desc = "A 6-shot grenade launcher."
	name = "Milkor MGL"
	icon = 'icons/mecha/mecha_equipment.dmi'
	icon_state = "mecha_grenadelnchr"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/grenademulti
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/revolver/grenadelauncher/cyborg/attack_self()
	return

/obj/item/gun/ballistic/automatic/gyropistol
	name = "gyrojet pistol"
	desc = "A prototype pistol designed to fire self propelled rockets."
	icon_state = "gyropistol"
	fire_sound = 'sound/weapons/grenadelaunch.ogg'
	mag_type = /obj/item/ammo_box/magazine/m75
	burst_size = 1
	fire_delay = 0
	actions_types = list()
	casing_ejector = FALSE

/obj/item/gun/ballistic/automatic/gyropistol/update_icon()
	..()
	icon_state = "[initial(icon_state)][magazine ? "loaded" : ""]"

/obj/item/gun/ballistic/automatic/speargun
	name = "kinetic speargun"
	desc = "A weapon favored by carp hunters. Fires specialized spears using kinetic energy."
	icon_state = "speargun"
	item_state = "speargun"
	w_class = WEIGHT_CLASS_BULKY
	force = 10
	can_suppress = FALSE
	mag_type = /obj/item/ammo_box/magazine/internal/speargun
	fire_sound = 'sound/weapons/grenadelaunch.ogg'
	burst_size = 1
	fire_delay = 0
	select = 0
	actions_types = list()
	casing_ejector = FALSE

/obj/item/gun/ballistic/automatic/speargun/update_icon()
	return

/obj/item/gun/ballistic/automatic/speargun/attack_self()
	return

/obj/item/gun/ballistic/automatic/speargun/attackby(obj/item/A, mob/user, params)
	var/num_loaded = magazine.attackby(A, user, params, 1)
	if(num_loaded)
		to_chat(user, "<span class='notice'>You load [num_loaded] spear\s into \the [src].</span>")
		update_icon()
		chamber_round()

/obj/item/gun/ballistic/automatic/atlauncher
	desc = "A pre-loaded, single shot anti-armour launcher."
	name = "M72 LAW"
	icon_state = "rocketlauncher"
	item_state = "rocketlauncher"
	mag_type = /obj/item/ammo_box/magazine/internal/rocketlauncher
	fire_sound = 'sound/weapons/rocketlaunch.ogg'
	w_class = WEIGHT_CLASS_BULKY
	can_suppress = FALSE
	burst_size = 1
	fire_delay = 0
	select = 0
	actions_types = list()
	casing_ejector = FALSE
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/automatic/atlauncher/attack_self()
	return

/obj/item/gun/ballistic/automatic/atlauncher/update_icon()
	..()
	icon_state = "rocketlauncher[magazine ? "-[get_ammo(1)]" : ""]"

/obj/item/gun/ballistic/automatic/tribalbow
	name = "tribal bow"
	desc = "A simple wooden bow with small pieces of turquiose."
	icon_state = "tribalbow"
	item_state = "tribalbow"
	w_class = WEIGHT_CLASS_NORMAL
	force = 10
	can_suppress = FALSE
	mag_type = /obj/item/ammo_box/magazine/internal/tribalbow
	fire_sound = 'sound/weapons/grenadelaunch.ogg'
	burst_size = 1
	fire_delay = 6
	select = 0
	actions_types = list()
	casing_ejector = FALSE
	extra_damage = 30


/obj/item/gun/ballistic/automatic/tribalbow/update_icon()
	return

/obj/item/gun/ballistic/automatic/tribalbow/attack_self()
	return

/obj/item/gun/ballistic/automatic/tribalbow/attackby(obj/item/A, mob/user, params)
	var/num_loaded = magazine.attackby(A, user, params, 1)
	if(num_loaded)
		to_chat(user, "<span class='notice'>You load [num_loaded] spear\s into \the [src].</span>")
		update_icon()
		chamber_round()