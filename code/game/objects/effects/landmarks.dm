/obj/effect/landmark
	name = "landmark"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "x2"
	anchored = TRUE
	layer = MID_LANDMARK_LAYER
	invisibility = INVISIBILITY_ABSTRACT
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/effect/landmark/singularity_act()
	return

// Please stop bombing the Observer-Start landmark.
/obj/effect/landmark/ex_act()
	return

/obj/effect/landmark/singularity_pull()
	return

INITIALIZE_IMMEDIATE(/obj/effect/landmark)

/obj/effect/landmark/Initialize()
	. = ..()
	GLOB.landmarks_list += src

/obj/effect/landmark/Destroy()
	GLOB.landmarks_list -= src
	return ..()

/obj/effect/landmark/start
	name = "start"
	icon = 'icons/mob/landmarks.dmi'
	icon_state = "x"
	anchored = TRUE
	layer = MOB_LAYER
	var/jobspawn_override = FALSE
	var/delete_after_roundstart = TRUE
	var/used = FALSE

/obj/effect/landmark/start/proc/after_round_start()
	if(delete_after_roundstart)
		qdel(src)

/obj/effect/landmark/start/New()
	GLOB.start_landmarks_list += src
	if(jobspawn_override)
		if(!GLOB.jobspawn_overrides[name])
			GLOB.jobspawn_overrides[name] = list()
		GLOB.jobspawn_overrides[name] += src
	..()
	if(name != "start")
		tag = "start*[name]"

/obj/effect/landmark/start/Destroy()
	GLOB.start_landmarks_list -= src
	if(jobspawn_override)
		GLOB.jobspawn_overrides[name] -= src
	return ..()

// START LANDMARKS FOLLOW. Don't change the names unless
// you are refactoring shitty landmark code.

/obj/effect/landmark/start/assistant
	name = "Assistant"
	icon_state = "Assistant"

/obj/effect/landmark/start/assistant/override
	jobspawn_override = TRUE
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/janitor
	name = "Janitor"
	icon_state = "Janitor"

/obj/effect/landmark/start/cargo_technician
	name = "Cargo Technician"
	icon_state = "Cargo Technician"

/obj/effect/landmark/start/bartender
	name = "Bartender"
	icon_state = "Bartender"

/obj/effect/landmark/start/clown
	name = "Clown"
	icon_state = "Clown"

/obj/effect/landmark/start/mime
	name = "Mime"
	icon_state = "Mime"

/obj/effect/landmark/start/quartermaster
	name = "Quartermaster"
	icon_state = "Quartermaster"

/obj/effect/landmark/start/atmospheric_technician
	name = "Atmospheric Technician"
	icon_state = "Atmospheric Technician"

/obj/effect/landmark/start/cook
	name = "Cook"
	icon_state = "Cook"

/obj/effect/landmark/start/shaft_miner
	name = "Shaft Miner"
	icon_state = "Shaft Miner"

/obj/effect/landmark/start/security_officer
	name = "Security Officer"
	icon_state = "Security Officer"

/obj/effect/landmark/start/botanist
	name = "Botanist"
	icon_state = "Botanist"

/obj/effect/landmark/start/head_of_security
	name = "Head of Security"
	icon_state = "Head of Security"

/obj/effect/landmark/start/captain
	name = "Captain"
	icon_state = "Captain"

/obj/effect/landmark/start/detective
	name = "Detective"
	icon_state = "Detective"

/obj/effect/landmark/start/warden
	name = "Warden"
	icon_state = "Warden"

/obj/effect/landmark/start/chief_engineer
	name = "Chief Engineer"
	icon_state = "Chief Engineer"

/obj/effect/landmark/start/head_of_personnel
	name = "Head of Personnel"
	icon_state = "Head of Personnel"

/obj/effect/landmark/start/librarian
	name = "Curator"
	icon_state = "Curator"

/obj/effect/landmark/start/lawyer
	name = "Lawyer"
	icon_state = "Lawyer"

/obj/effect/landmark/start/station_engineer
	name = "Station Engineer"
	icon_state = "Station Engineer"

/obj/effect/landmark/start/medical_doctor
	name = "Medical Doctor"
	icon_state = "Medical Doctor"

/obj/effect/landmark/start/scientist
	name = "Scientist"
	icon_state = "Scientist"

/obj/effect/landmark/start/chemist
	name = "Chemist"
	icon_state = "Chemist"

/obj/effect/landmark/start/roboticist
	name = "Roboticist"
	icon_state = "Roboticist"

/obj/effect/landmark/start/research_director
	name = "Research Director"
	icon_state = "Research Director"

/obj/effect/landmark/start/geneticist
	name = "Geneticist"
	icon_state = "Geneticist"

/obj/effect/landmark/start/chief_medical_officer
	name = "Chief Medical Officer"
	icon_state = "Chief Medical Officer"

/obj/effect/landmark/start/virologist
	name = "Virologist"
	icon_state = "Virologist"

/obj/effect/landmark/start/chaplain
	name = "Chaplain"
	icon_state = "Chaplain"

/obj/effect/landmark/start/cyborg
	name = "Cyborg"
	icon_state = "Cyborg"
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/ai
	name = "AI"
	icon_state = "AI"
	delete_after_roundstart = FALSE
	var/primary_ai = TRUE
	var/latejoin_active = TRUE

/obj/effect/landmark/start/ai/after_round_start()
	if(latejoin_active && !used)
		new /obj/structure/AIcore/latejoin_inactive(loc)
	return ..()

/obj/effect/landmark/start/ai/secondary
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "ai_spawn"
	primary_ai = FALSE
	latejoin_active = FALSE

//Department Security spawns

/obj/effect/landmark/start/depsec
	name = "department_sec"
	icon_state = "Security Officer"

/obj/effect/landmark/start/depsec/New()
	..()
	GLOB.department_security_spawns += src

/obj/effect/landmark/start/depsec/Destroy()
	GLOB.department_security_spawns -= src
	return ..()

/obj/effect/landmark/start/depsec/supply
	name = "supply_sec"

/obj/effect/landmark/start/depsec/medical
	name = "medical_sec"

/obj/effect/landmark/start/depsec/engineering
	name = "engineering_sec"

/obj/effect/landmark/start/depsec/science
	name = "science_sec"

/obj/effect/landmark/start/wizard
	name = "wizard"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "wiznerd_spawn"

/obj/effect/landmark/start/wizard/Initialize()
	..()
	GLOB.wizardstart += loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/start/nukeop
	name = "nukeop"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "snukeop_spawn"

/obj/effect/landmark/start/nukeop/Initialize()
	..()
	GLOB.nukeop_start += loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/start/nukeop_leader
	name = "nukeop leader"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "snukeop_leader_spawn"

/obj/effect/landmark/start/nukeop_leader/Initialize()
	..()
	GLOB.nukeop_leader_start += loc
	return INITIALIZE_HINT_QDEL

// Must be immediate because players will
// join before SSatom initializes everything.
INITIALIZE_IMMEDIATE(/obj/effect/landmark/start/new_player)

/obj/effect/landmark/start/new_player
	name = "New Player"

/obj/effect/landmark/start/new_player/Initialize()
	..()
	GLOB.newplayer_start += loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/latejoin
	name = "JoinLate"

/obj/effect/landmark/latejoin/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += loc
	return INITIALIZE_HINT_QDEL

// carp.
/obj/effect/landmark/carpspawn
	name = "carpspawn"
	icon_state = "carp_spawn"

// observer-start.
/obj/effect/landmark/observer_start
	name = "Observer-Start"
	icon_state = "observer_start"

// xenos.
/obj/effect/landmark/xeno_spawn
	name = "xeno_spawn"
	icon_state = "xeno_spawn"

/obj/effect/landmark/xeno_spawn/Initialize(mapload)
	..()
	GLOB.xeno_spawn += loc
	return INITIALIZE_HINT_QDEL

// blobs.
/obj/effect/landmark/blobstart
	name = "blobstart"
	icon_state = "blob_start"

/obj/effect/landmark/blobstart/Initialize(mapload)
	..()
	GLOB.blobstart += loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/secequipment
	name = "secequipment"
	icon_state = "secequipment"

/obj/effect/landmark/secequipment/Initialize(mapload)
	..()
	GLOB.secequipment += loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/prisonwarp
	name = "prisonwarp"
	icon_state = "prisonwarp"

/obj/effect/landmark/prisonwarp/Initialize(mapload)
	..()
	GLOB.prisonwarp += loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/ert_spawn
	name = "Emergencyresponseteam"
	icon_state = "ert_spawn"

/obj/effect/landmark/ert_spawn/Initialize(mapload)
	..()
	GLOB.emergencyresponseteamspawn += loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/holding_facility
	name = "Holding Facility"
	icon_state = "holding_facility"

/obj/effect/landmark/holding_facility/Initialize(mapload)
	..()
	GLOB.holdingfacility += loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/thunderdome/observe
	name = "tdomeobserve"
	icon_state = "tdome_observer"

/obj/effect/landmark/thunderdome/observe/Initialize(mapload)
	..()
	GLOB.tdomeobserve += loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/thunderdome/one
	name = "tdome1"
	icon_state = "tdome_t1"

/obj/effect/landmark/thunderdome/one/Initialize(mapload)
	..()
	GLOB.tdome1	+= loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/thunderdome/two
	name = "tdome2"
	icon_state = "tdome_t2"

/obj/effect/landmark/thunderdome/two/Initialize(mapload)
	..()
	GLOB.tdome2 += loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/thunderdome/admin
	name = "tdomeadmin"
	icon_state = "tdome_admin"

/obj/effect/landmark/thunderdome/admin/Initialize(mapload)
	..()
	GLOB.tdomeadmin += loc
	return INITIALIZE_HINT_QDEL

//Servant spawn locations
/obj/effect/landmark/servant_of_ratvar
	name = "servant of ratvar spawn"
	icon_state = "clockwork_orange"
	layer = MOB_LAYER

/obj/effect/landmark/servant_of_ratvar/Initialize(mapload)
	..()
	GLOB.servant_spawns += loc
	return INITIALIZE_HINT_QDEL

//City of Cogs entrances
/obj/effect/landmark/city_of_cogs
	name = "city of cogs entrance"
	icon_state = "city_of_cogs"

/obj/effect/landmark/city_of_cogs/Initialize(mapload)
	..()
	GLOB.city_of_cogs_spawns += loc
	return INITIALIZE_HINT_QDEL

//generic event spawns
/obj/effect/landmark/event_spawn
	name = "generic event spawn"
	icon_state = "generic_event"
	layer = HIGH_LANDMARK_LAYER


/obj/effect/landmark/event_spawn/New()
	..()
	GLOB.generic_event_spawns += src

/obj/effect/landmark/event_spawn/Destroy()
	GLOB.generic_event_spawns -= src
	return ..()

/obj/effect/landmark/ruin
	var/datum/map_template/ruin/ruin_template

/obj/effect/landmark/ruin/New(loc, my_ruin_template)
	name = "ruin_[GLOB.ruin_landmarks.len + 1]"
	..(loc)
	ruin_template = my_ruin_template
	GLOB.ruin_landmarks |= src

/obj/effect/landmark/ruin/Destroy()
	GLOB.ruin_landmarks -= src
	ruin_template = null
	. = ..()

// FO13 Faction Start. Set to override for the time being to allow latejoining in their original spots.

// NCR
/obj/effect/landmark/start/f13
	icon = 'icons/mob/landmarks.dmi'
	jobspawn_override = TRUE
	delete_after_roundstart = FALSE
	icon_state = "Assistant"

/obj/effect/landmark/start/f13/ncrcolonel
	name = "NCR Colonel"
	icon_state = "NCR Colonel"

/obj/effect/landmark/start/f13/ncrambassador
	name = "NCR Ambassador"

/obj/effect/landmark/start/f13/ncrcaptain
	name = "NCR Captain"
	icon_state = "NCR Captain"

/obj/effect/landmark/start/f13/ncrlieutenant
	name = "NCR Lieutenant"
	icon_state = "NCR Lieutenant"

/obj/effect/landmark/start/f13/ncrsergeant
	name = "NCR Sergeant"
	icon_state = "NCR Sergeant"

/obj/effect/landmark/start/f13/ncrspecialist
	name = "NCR Specialist"
	icon_state = "NCR Trooper"

/obj/effect/landmark/start/f13/ncrmp
	name = "NCR Military Police"
	icon_state = "NCR Trooper"

/obj/effect/landmark/start/f13/ncrht
	name = "NCR Heavy Trooper"
	icon_state = "NCR Trooper"

/obj/effect/landmark/start/f13/ncrtrooper
	name = "NCR Trooper"
	icon_state = "NCR Trooper"

/obj/effect/landmark/start/f13/ncrrecruit
	name = "NCR Non-Combatant"
	icon_state = "NCR Recruit"

/obj/effect/landmark/start/f13/ncrveteranranger
	name = "NCR Veteran Ranger"
	icon_state = "NCR Veteran Ranger"

/obj/effect/landmark/start/f13/ncrranger
	name = "NCR Ranger"
	icon_state = "NCR Patrol Ranger"


// Legion

/obj/effect/landmark/start/f13/legate
	name = "Legate"
	icon_state = "Legate"

/obj/effect/landmark/start/f13/centurion
	name = "Legion Centurion"
	icon_state = "Centurion"

/obj/effect/landmark/start/f13/librator
	name = "Legion Libritor"

/obj/effect/landmark/start/f13/slavemaster
	name = "Legion Slavemaster"

/obj/effect/landmark/start/f13/priestess
	name = "Priestess of Mars"

/obj/effect/landmark/start/f13/decanus
	name = "Veteran Decanus"
	icon_state = "Decanus"

/obj/effect/landmark/start/f13/primedecanus
	name = "Prime Decanus"
	icon_state = "Decanus"

/obj/effect/landmark/start/f13/vexillarius
	name = "Legion Vexillarius"
	icon_state = "Vexillarius"

/obj/effect/landmark/start/f13/vetlegionary
	name = "Veteran Legionary"
	icon_state = "Veteran Legionnaire"

/obj/effect/landmark/start/f13/legionary
	name = "Legionnaire"
	icon_state = "Veteran Legionnaire"

/obj/effect/landmark/start/f13/recleg
	name = "Recruit Legionary"
	icon_state = "Legionary"

/obj/effect/landmark/start/f13/explorer
	name = "Legion Explorer"

/obj/effect/landmark/start/f13/auxilia
	name = "Auxilia"

/obj/effect/landmark/start/f13/campfollower
	name = "Camp Follower"

// Brotherhood of Steel

/obj/effect/landmark/start/f13/elder
	name = "Elder"
	icon_state = "Elder"

/obj/effect/landmark/start/f13/headscribe
	name = "Head Scribe"
	icon_state = "Knight"

/obj/effect/landmark/start/f13/sentinel
	name = "Sentinel"
	icon_state = "Paladin"

/obj/effect/landmark/start/f13/knightcap
	name = "Knight-Captain"
	icon_state = "Knight"

/obj/effect/landmark/start/f13/seniorpaladin
	name = "Senior Paladin"
	icon_state = "Knight"

/obj/effect/landmark/start/f13/paladin
	name = "Paladin"
	icon_state = "Knight"

/obj/effect/landmark/start/f13/scribe
	name = "Scribe"
	icon_state = "Scribe"

/obj/effect/landmark/start/f13/Knight
	name = "Knight"
	icon_state = "Knight"

/obj/effect/landmark/start/f13/initiate
	name = "Initiate"
	icon_state = "Knight"

/obj/effect/landmark/start/f13/vertipilot
	name = "Vertibird Pilot"
	icon_state = "Knight"

/obj/effect/landmark/start/f13/handy
	name = "Mr. Handy"
	icon_state = "Scribe"

// Vault

/obj/effect/landmark/start/f13/overseer
	name = "Overseer"
	icon_state = "Overseer"

/obj/effect/landmark/start/f13/vaultheadofsecurity
	name = "Chief of Security"
	icon_state = "Chief of Security"

/obj/effect/landmark/start/f13/vaultdoctor
	name = "Vault-tec Doctor"
	icon_state = "Vault-tec Doctor"

/obj/effect/landmark/start/f13/vaultscientist
	name = "Vault-tec Scientist"
	icon_state = "Vault-tec Scientist"

/obj/effect/landmark/start/f13/vaultsecurityofficer
	name = "Vault-tec Security"
	icon_state = "Vault-tec Security"

/obj/effect/landmark/start/f13/vaultengineer
	name = "Vault-tec Engineer"
	icon_state = "Vault-tec Engineer"

/obj/effect/landmark/start/f13/vaultdweller
	name = "Vault Dweller"
	icon_state = "Vault Dweller"

// Kebab // Is not Kebab is Oasis REEEE // It's Kebab, you absolute freaks.

/obj/effect/landmark/start/f13/mayor
	name = "Mayor"

/obj/effect/landmark/start/f13/sheriff
	name = "Sheriff"
	icon_state = "Sheriff"

/obj/effect/landmark/start/f13/deputy
	name = "Deputy"

/obj/effect/landmark/start/f13/farmer
	name = "Farmer"

/obj/effect/landmark/start/f13/prospector
	name = "Prospector"

/obj/effect/landmark/start/f13/settler
	name = "Settler"
	icon_state = "Settler"

/obj/effect/landmark/start/f13/dendoc
	name = "Doctor"

/obj/effect/landmark/start/f13/shopkeeper
	name = "Shopkeeper"
	icon_state = "Vault-tec Doctor"

// Wasteland

/obj/effect/landmark/start/f13/cultleader
	name = "Cult Leader"

/obj/effect/landmark/start/f13/wastelander
	name = "Wastelander"
	icon_state = "Wastelander"

/obj/effect/landmark/start/f13/raider
	name = "Raider"
	icon_state = "Raider"

/obj/effect/landmark/start/f13/pusher
	name = "Pusher"
	icon_state = "Pusher"

/obj/effect/landmark/start/f13/preacher
	name = "Preacher"
	icon_state = "Preacher"

// Enclave

/obj/effect/landmark/start/f13/uscommander
	name = "US Commander"

/obj/effect/landmark/start/f13/usmedic
	name = "US Medic"

/obj/effect/landmark/start/f13/usprivate
	name = "US Private"

/obj/effect/landmark/start/f13/usscientist
	name = "US Scientist"

/obj/effect/landmark/start/f13/usengineer
	name = "US Engineer"

/obj/effect/landmark/start/f13/uscolonist
	name = "US Colonist"

//Tribal

/obj/effect/landmark/start/f13/chief
	name = "Chief"
	icon_state = "Chief"

/obj/effect/landmark/start/f13/shaman
	name = "Shaman"
	icon_state = "Shaman"

/obj/effect/landmark/start/f13/villager
	name = "Villager"
	icon_state = "Villager"
