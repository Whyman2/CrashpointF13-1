// Shotgun

/obj/item/ammo_casing/shotgun
	name = "12 gauge slug"
	desc = "A 12 gauge lead slug, meant to blow holes through armor and people at a limited range."
	icon_state = "blshell"
	caliber = "shotgun"
	projectile_type = /obj/item/projectile/bullet/shotgun_slug
	materials = list(MAT_METAL=1000)

/obj/item/ammo_casing/shotgun/beanbag
	name = "12 gauge beanbag slug"
	desc = "A beanbag slug for riot control used to incapacitate single, large targets."
	icon_state = "bshell"
	projectile_type = /obj/item/projectile/bullet/shotgun_beanbag

/obj/item/ammo_casing/shotgun/incendiary
	name = "12 gauge incendiary slug"
	desc = "An incendiary-coated shotgun slug."
	icon_state = "ishell"
	projectile_type = /obj/item/projectile/bullet/incendiary/shotgun

/obj/item/ammo_casing/shotgun/dragonsbreath
	name = "12 gauge dragonsbreath shell"
	desc = "A shotgun shell which fires a spread of incendiary pellets."
	icon_state = "ishell2"
	projectile_type = /obj/item/projectile/bullet/incendiary/shotgun/dragonsbreath
	pellets = 5
	variance = 15

/obj/item/ammo_casing/shotgun/stunslug
	name = "12 gauge taser slug"
	desc = "A stunning taser slug."
	icon_state = "stunshell"
	projectile_type = /obj/item/projectile/bullet/shotgun_stunslug
	materials = list(MAT_METAL=250)

/obj/item/ammo_casing/shotgun/meteorslug
	name = "12 gauge meteor slug"
	desc = "A shotgun shell rigged with CMC technology, which launches a massive slug when fired."
	icon_state = "mshell"
	projectile_type = /obj/item/projectile/bullet/shotgun_meteorslug

/obj/item/ammo_casing/shotgun/pulseslug
	name = "12 gauge pulse slug"
	desc = "A delicate device which can be loaded into a shotgun. The primer acts as a button which triggers the gain medium and fires a powerful \
	energy blast. While the heat and power drain limit it to one use, it can still allow an operator to engage targets that ballistic ammunition \
	would have difficulty with."
	icon_state = "pshell"
	projectile_type = /obj/item/projectile/beam/pulse/shotgun

/obj/item/ammo_casing/shotgun/frag12
	name = "12 gauge FRAG-12 slug"
	desc = "A high explosive breaching round for a 12 gauge shotgun."
	icon_state = "heshell"
	projectile_type = /obj/item/projectile/bullet/shotgun_frag12

/obj/item/ammo_casing/shotgun/buckshot
	name = "12 gauge buckshot shell"
	desc = "A 12 gauge buckshot shell, best to point-blank for full effect."
	icon_state = "gshell"
	projectile_type = /obj/item/projectile/bullet/pellet/shotgun_buckshot
	pellets = 7
	variance = 15

/obj/item/ammo_casing/shotgun/magnumshot
	name = "12 gauge magnum buckshot shell"
	desc = "A 12 gauge magnum buckshot shell, holding a more powerful load than typical buckshot."
	icon_state = "magshell"
	projectile_type = /obj/item/projectile/bullet/pellet/magnum_buckshot
	pellets = 7
	variance = 15

/obj/item/ammo_casing/shotgun/rubbershot
	name = "12 gauge riot control shell"
	desc = "A shotgun casing filled with densely-packed rubber balls, used to incapacitate crowds from a distance."
	icon_state = "bshell"
	projectile_type = /obj/item/projectile/bullet/pellet/shotgun_rubbershot
	pellets = 7
	variance = 15

/obj/item/ammo_casing/shotgun/improvised
	name = "12 gauge improvised shell"
	desc = "An extremely weak shotgun shell with multiple small pellets made out of metal shards."
	icon_state = "improvshell"
	projectile_type = /obj/item/projectile/bullet/pellet/shotgun_improvised
	materials = list(MAT_METAL=250)
	pellets = 6
	variance = 15

/obj/item/ammo_casing/shotgun/ion
	name = "12 gauge ion shell"
	desc = "An advanced shotgun shell which uses a subspace ansible crystal to produce an effect similar to a standard ion rifle. \
	The unique properties of the crystal split the pulse into a spread of individually weaker bolts."
	icon_state = "ionshell"
	projectile_type = /obj/item/projectile/ion/weak
	pellets = 4
	variance = 15

/obj/item/ammo_casing/shotgun/laserslug
	name = "12 gauge laser slug"
	desc = "An advanced shotgun shell that uses a micro laser to replicate the effects of a laser weapon in a ballistic package."
	icon_state = "lshell"
	projectile_type = /obj/item/projectile/beam/laser

/obj/item/ammo_casing/shotgun/techshell
	name = "12 gauge unloaded technological shell"
	desc = "A high-tech shotgun shell which can be loaded with materials to produce unique effects."
	icon_state = "cshell"
	projectile_type = null

/obj/item/ammo_casing/shotgun/dart
	name = "12 gauge shotgun dart"
	desc = "A dart for use in shotguns. Can be injected with up to 15 units of any chemical."
	icon_state = "cshell"
	projectile_type = /obj/item/projectile/bullet/dart
	var/reagent_amount = 15
	var/reagent_react = TRUE

/obj/item/ammo_casing/shotgun/dart/noreact
	name = "12 gauge cryostasis shotgun dart"
	desc = "A dart for use in shotguns, using similar technolgoy as cryostatis beakers to keep internal reagents from reacting. Can be injected with up to 10 units of any chemical."
	icon_state = "cnrshell"
	reagent_amount = 10
	reagent_react = FALSE

/obj/item/ammo_casing/shotgun/dart/Initialize()
	. = ..()
	container_type |= OPENCONTAINER
	create_reagents(reagent_amount)
	reagents.set_reacting(reagent_react)

/obj/item/ammo_casing/shotgun/dart/attackby()
	return

/obj/item/ammo_casing/shotgun/dart/bioterror
	desc = "A shotgun dart filled with deadly toxins."

/obj/item/ammo_casing/shotgun/dart/bioterror/Initialize()
	. = ..()
	reagents.add_reagent("neurotoxin", 6)
	reagents.add_reagent("spore", 6)
	reagents.add_reagent("mutetoxin", 6) //;HELP OPS IN MAINT
	reagents.add_reagent("coniine", 6)
	reagents.add_reagent("sodium_thiopental", 6)
