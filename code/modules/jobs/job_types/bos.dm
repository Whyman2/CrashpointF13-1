/*
BoS access:
Main doors: ACCESS_CAPTAIN 20
*/

/datum/job/bos //do NOT use this for anything, it's just to store faction datums.
	department_flag = BOS
	selection_color = "#95a5a6"
	exp_type = EXP_TYPE_BROTHERHOOD
	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	outfit = /datum/outfit/job/bos/

/datum/outfit/job/bos
	name = "bosdatums"
	jobtype = /datum/job/bos
	backpack = /obj/item/storage/backpack/explorer
	ears = /obj/item/radio/headset/headset_bos
	uniform =		/obj/item/clothing/under/syndicate/brotherhood
	shoes = /obj/item/clothing/shoes/combat/swat
	gloves = /obj/item/clothing/gloves/combat
	glasses = /obj/item/clothing/glasses/night
	id = /obj/item/card/id/dogtag

/datum/outfit/job/bos/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

/datum/outfit/job/bos/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_TECHNOPHREAK, TRAIT_GENERIC)

/*
Elder
*/

/datum/job/bos/f13elder
	title = "Elder"
	flag = F13ELDER
	faction = "BOS"
	head_announce = list("Security")
	supervisors = "the high elders"
	selection_color = "#7f8c8d"
	req_admin_notify = 1
	total_positions = 0//from 1
	spawn_positions = 0//from 1
	description = "You, of all individuals, likely have the most power out of anyone within this wretched valley, and, by extension, the bunker. You're here to assure the chapter lives on, and, with that, you must maintain the Security of those in your charge. - Additionally, while normally you'd follow the codex and such to a letter, you may deviate, if you believe it for the better of the chapter. Good luck, Elder."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals."
	enforces = "The Brotherhood of Steel Expects: Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "no one but your morals and the codex."
	outfit = /datum/outfit/job/bos/f13elder
	exp_requirements = 1200
	exp_type = EXP_TYPE_BROTHERHOODCMD
	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_MINERAL_STOREROOM, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_MINERAL_STOREROOM, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	var/elder_age = ELD_AGE_MIN

	loadout_options = list(
	/datum/outfit/loadout/elderpally,
	/datum/outfit/loadout/elderscribe
	)

/datum/outfit/job/bos/f13elder
	name = "Elder"
	jobtype = /datum/job/bos/f13elder
	pa_wear = TRUE
	suit = 			/obj/item/clothing/suit/f13/elder
	accessory = 	/obj/item/clothing/accessory/bos/elder
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc=2, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/gun/ballistic/automatic/pistol/n99=1)

/datum/job/bos/f13elder/after_spawn(mob/living/carbon/human/H, mob/M)
	H.add_quirk("Hard Yards")
	H.add_quirk("Lifegiver")
	H.add_quirk("Iron Fist")
	if(H.age < elder_age)
		H.age = elder_age

/datum/outfit/loadout/elderpally
	name = "Paladin Elder"
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc=3,
		/obj/item/gun/energy/laser/plasma=1)

/datum/outfit/loadout/elderscribe
	name = "Scribe Elder"
	l_hand = /obj/item/gun/energy/laser/scatter
	backpack_contents = list(
		/obj/item/blueprint/weapon/needler=1)

/*
Sentinel - Not west cost abiding. Disabled for now.
*/

/datum/job/bos/f13sentinel
	title = "Sentinel"
	flag = F13SENTINEL
	faction = "BOS"
	head_announce = list("Security")
	total_positions = 0
	spawn_positions = 0
	description = "You are the acting field commander until the Brotherhood regains its strength enough to place an Elder for the bunker. You are a veteran of many battles and sorties in pursuit of Brotherhood goals; your only weakness may just be your hubris. Your main goals are defense of the Chapter and surveillance of the surrounding region for technology."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the elder"
	selection_color = "#7f8c8d"
	exp_requirements = 1800

	outfit = /datum/outfit/job/bos/f13sentinel

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)

	loadout_options = list(
	/datum/outfit/loadout/sentstand, //Tribeam laser and 10mm pistol
	/datum/outfit/loadout/sentvet, //Gauss rifle and AEP7
	/datum/outfit/loadout/sentshot //nerfed combat rifle mk2 and laser pistol
	)


/datum/outfit/job/bos/f13sentinel
	name = "Sentinel"
	jobtype = /datum/job/bos/f13sentinel
	pa_wear = TRUE
	uniform = 		/obj/item/clothing/under/f13/recon
	accessory = 	/obj/item/clothing/accessory/bos/sentinel
	suit = 			/obj/item/clothing/suit/armor/f13/power_armor/t60
	belt =			/obj/item/storage/belt/military/assault
	head = 			/obj/item/clothing/head/helmet/power_armor/t60
	mask =			/obj/item/clothing/mask/gas/sechailer/swat
	id = 			/obj/item/card/id/dogtag
	backpack_contents = list(
		/obj/item/kitchen/knife/combat=1)

/datum/job/bos/f13sentinel/after_spawn(mob/living/carbon/human/H, mob/M)
	H.add_quirk("Hard Yards")
	H.add_quirk("Lifegiver")
	H.add_quirk("Iron Fist")

/datum/outfit/loadout/sentstand
	name = "Shock Sentinel"
	l_hand = /obj/item/gun/energy/laser/scatter
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc=3,
		/obj/item/gun/ballistic/automatic/pistol/n99=1,
		/obj/item/ammo_box/magazine/m10mm_adv=2)

/datum/outfit/loadout/sentvet
	name = "Veteran Sentinel"
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/gun/ballistic/automatic/m72=1,
		/obj/item/ammo_box/magazine/m2mm=1,
		/obj/item/gun/energy/laser/pistol=1)

/datum/outfit/loadout/sentshot
	name = "Fire Support Sentinel"
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/ar=1,
		/obj/item/ammo_box/magazine/m556=2,
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/ec=2
		)


/*
Head Scribe
*/

/datum/job/bos/f13headscribe
	title = "Head Scribe"
	flag = F13HEADSCRIBE
	faction = "BOS"
	total_positions = 0//from 1
	spawn_positions = 0//from 1
	description = "You are the foremost experienced scribe remaining in this bunker. Your role is to ensure the safekeeping and proper usage of technology within the Brotherhood. You are also the lead medical expert in this Chapter. Delegate your tasks to your Scribes."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Elder"
	selection_color = "#7f8c8d"
	exp_requirements = 600
	exp_type = EXP_TYPE_SCRIBE
	var/leader1_age = LED_AGE_MIN

	loadout_options = list(
	/datum/outfit/loadout/hsstand, //Needler, pen, and medbeam
	/datum/outfit/loadout/hspract //AEP7 and hypospray
	)

	outfit = /datum/outfit/job/bos/f13headscribe

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)

/datum/outfit/job/bos/f13headscribe
	name = "Head Scribe"
	jobtype = /datum/job/bos/f13headscribe
	chemwhiz = TRUE
	uniform = 		/obj/item/clothing/under/f13/recon
	accessory = 	/obj/item/clothing/accessory/bos/headscribe
	suit = 			/obj/item/clothing/suit/armor/f13/headscribe
	belt = 			/obj/item/storage/belt/utility/full/engi
	id = 			/obj/item/card/id/dogtag
	backpack_contents = list(
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak/super=2 \
		)


/datum/outfit/loadout/hsstand
	name = "Administrative Leader"
	l_hand = /obj/item/gun/ballistic/revolver/needler
	backpack_contents = list(
		/obj/item/ammo_box/needleap=2
		)

/datum/outfit/loadout/hspract
	name = "Medicinal Expert"
	backpack_contents = list(
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/reagent_containers/hypospray/CMO=1
		)


/datum/outfit/job/bos/f13headscribe/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.add_trait(TRAIT_MEDICALEXPERT, TRAIT_GENERIC)

/datum/job/bos/f13headscribe/after_spawn(mob/living/carbon/human/H, mob/M)
	if(H.age < leader1_age)
		H.age = leader1_age

/*
Knight Captain - Not west cost abiding. Disabled for now.
*/

/datum/job/bos/f13knightcap
	title = "Knight-Captain"
	flag = F13KNIGHTCAPTAIN
	head_announce = list("Security")
	faction = "BOS"
	total_positions = 0
	spawn_positions = 0
	description = "You are the Knight-Captain, head of the Knight division in the Chapter. Your knowledge of pre-war materials and engineering is almost unparalleled, and you have basic combat training and experience. You are in charge of the Chapter's engineering Corps, and your Knights. Delegate to them as necessary. As Chief Armorer, you are also in charge of the armory."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Elder"
	selection_color = "#7f8c8d"
	exp_requirements = 600
	exp_type = EXP_TYPE_KNIGHT

	loadout_options = list(
	/datum/outfit/loadout/capstand, //AER9 and 10mm pistol
	/datum/outfit/loadout/capsap, //glock86a and 2 blocks of c4
	/datum/outfit/loadout/capalt //Riot shotgun
	)

	outfit = /datum/outfit/job/bos/f13knightcap

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)

/datum/outfit/job/bos/f13knightcap
	name = "Knight-Captain"
	jobtype = /datum/job/bos/f13knightcap
	gunsmith_one = TRUE
	gunsmith_two = TRUE
	gunsmith_three = TRUE
	gunsmith_four = TRUE
	pa_wear = TRUE
	suit = 			/obj/item/clothing/suit/armor/f13/combat/knightcap
	uniform =		/obj/item/clothing/under/syndicate/brotherhood
	accessory = 	/obj/item/clothing/accessory/bos/knightcaptain
	belt = 			/obj/item/storage/belt/security/full
	mask =			/obj/item/clothing/mask/gas/sechailer/swat
	head =			/obj/item/clothing/head/helmet/f13/combat/knightcap
	id = 			/obj/item/card/id/dogtag
	backpack_contents = list(
		/obj/item/kitchen/knife/combat=1, \
		)


/datum/job/bos/f13knightcap/after_spawn(mob/living/carbon/human/H, mob/M)
	H.add_quirk("Hard Yards")



/datum/outfit/loadout/capstand
	name = "Knight-Captain"
	backpack_contents = list(
		/obj/item/gun/energy/laser/aer9=1,
		/obj/item/gun/ballistic/automatic/pistol/n99=1,
		/obj/item/stock_parts/cell/ammo/mfc=2,
		/obj/item/ammo_box/magazine/m10mm_adv=2
		)

/datum/outfit/loadout/capsap
	name = "Close Support"
	backpack_contents = list(
		/obj/item/gun/energy/laser/plasma/glock=1,
		/obj/item/grenade/plastic/c4=2,
		/obj/item/stock_parts/cell/ammo/ec=2
		)

/datum/outfit/loadout/capalt
	name = "Warden-Defender"
	backpack_contents = list(
		/obj/item/gun/ballistic/shotgun/riot=1,
		/obj/item/storage/box/lethalshot=2,
		/obj/item/stock_parts/cell/ammo/ec=2,
		/obj/item/gun/energy/laser/pistol=1
		)

/*
Senior Paladin
*/

/datum/job/bos/f13seniorpaladin
	title = "Senior Paladin"
	flag = F13SENIORPALADIN
	faction = "BOS"
	total_positions = 0//from 1
	spawn_positions = 0//from 1
	description = "As the Chapter's Senior offensive warrior, you have proven your service and dedication to the Brotherhood over your time as a Paladin. As your skills gained, however, you were deigned to be more useful as a commander and trainer. Now you have your trusty super-sledge, and were recently given a suit of T-51b power armor. Your job is to coordinate the Paladins and ensure they work as a team, instilling discipline as you go."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Elder"
	selection_color = "#95a5a6"
	exp_requirements = 360
	exp_type = EXP_TYPE_BROTHERHOODCMD
	var/leader2_age = LED_AGE_MIN

	loadout_options = list(
		/datum/outfit/loadout/spaladina,
		/datum/outfit/loadout/spaladinb,
		/datum/outfit/loadout/spaladinc,
		)

	outfit = /datum/outfit/job/bos/f13seniorpaladin

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)

/datum/outfit/job/bos/f13seniorpaladin
	name = "Senior Paladin"
	jobtype = /datum/job/bos/f13seniorpaladin
	pa_wear = TRUE
	suit = 			/obj/item/clothing/suit/armor/f13/power_armor/t51b
	head = 			/obj/item/clothing/head/helmet/power_armor/t51b
	accessory = 	/obj/item/clothing/accessory/bos/seniorpaladin
	uniform = 		/obj/item/clothing/under/f13/recon
	mask =			/obj/item/clothing/mask/gas/sechailer/swat
	belt = 			/obj/item/storage/belt/military/assault
	suit_store = 	/obj/item/gun/energy/laser/plasma/glock
	backpack_contents = list(
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/stock_parts/cell/ammo/ec=2, \
		)

/datum/outfit/loadout/spaladina
	name = "Frontline Senior-Paladin"
	backpack_contents = list(
		/obj/item/twohanded/sledgehammer/supersledge=1,
		)

/datum/outfit/loadout/spaladinb
	name = "Rearline Senior-Paladin"
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/bozar=1,
		/obj/item/ammo_box/magazine/m556/rifle=2,
		)

/datum/outfit/loadout/spaladinc
	name = "Heavy-Duty Senior-Paladin"
	backpack_contents = list(
		/obj/item/minigunpack=1,
		)

/datum/job/bos/f13seniorpaladin/after_spawn(mob/living/carbon/human/H, mob/M)
	H.add_quirk("Hard Yards")
	if(H.age < leader2_age)
		H.age = leader2_age



/*
Paladin
*/

/datum/job/bos/f13paladin
	title = "Paladin"
	flag = F13PALADIN
	faction = "BOS"
	total_positions = 0//from 1
	spawn_positions = 0//from 1
	description = "You answer directly to the Senior Paladin and Elder. You are this Chapter's main line of defense and offense; highly trained in combat and weaponry though with little practical field experience, you are eager to prove your worth to the Brotherhood. Your primary duties are defense and surface operations. You may also be assigned a trainee Initiate."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Elder"
	selection_color = "#95a5a6"
	exp_requirements = 360
	exp_type = EXP_TYPE_KNIGHT

	loadout_options = list(
	/datum/outfit/loadout/paladinb, //Carbine and aep7
	/datum/outfit/loadout/paladine, //aer9 and n99
	)

	outfit = /datum/outfit/job/bos/f13paladin

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)

/datum/outfit/job/bos/f13paladin
	name = "Paladin"
	jobtype = /datum/job/bos/f13paladin
	pa_wear = TRUE
	suit = 			/obj/item/clothing/suit/armor/f13/power_armor/t45d
	head = 			/obj/item/clothing/head/helmet/power_armor/t45d
	uniform = 		/obj/item/clothing/under/f13/recon
	mask =			/obj/item/clothing/mask/gas/sechailer/swat
	belt = 			/obj/item/storage/belt/military
	backpack_contents = list(
		/obj/item/kitchen/knife/combat=1, \
		)

/datum/job/bos/f13paladin/after_spawn(mob/living/carbon/human/H, mob/M)
	H.add_quirk("Hard Yards")



/datum/outfit/loadout/paladinb
	name = "Paladin-Junior"
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/assault_carbine=1,
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/ec=2,
		/obj/item/ammo_box/magazine/m556/rifle=2,
		/obj/item/clothing/accessory/bos/juniorpaladin=1
		)

/datum/outfit/loadout/paladine
	name = "Paladin"
	backpack_contents = list(
		/obj/item/gun/energy/laser/aer9=1,
		/obj/item/gun/ballistic/automatic/pistol/n99=1,
		/obj/item/stock_parts/cell/ammo/mfc=2,
		/obj/item/ammo_box/magazine/m10mm_adv=2,
		/obj/item/clothing/accessory/bos/paladin=1

		)

/*
Scribe
*/

/datum/job/bos/f13scribe
	title = "Scribe"
	flag = F13SCRIBE
	faction = "BOS"
	total_positions = 0//from 2
	spawn_positions = 0//from 2
	description = "You answer directly to the Head Scribe, tasked with researching and reverse-engineering recovered technologies from the old world, while maintaining the brotherhoods scientific archives. You may also be given a trainee to assign duties to."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Head Scribe"
	selection_color = "#95a5a6"
	exp_requirements = 240
	exp_type = EXP_TYPE_BROTHERHOOD

	loadout_options = list(
	/datum/outfit/loadout/scribea, //Scribe
	/datum/outfit/loadout/scribeb //Senior Scribe
	)

	outfit = /datum/outfit/job/bos/f13scribe

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)

/datum/outfit/job/bos/f13scribe
	name = "Scribe"
	jobtype = /datum/job/bos/f13scribe
	chemwhiz = TRUE
	pa_wear = TRUE
	uniform =		/obj/item/clothing/under/syndicate/brotherhood
	shoes = 		/obj/item/clothing/shoes/combat
	belt = 			/obj/item/storage/belt/utility/full/engi
	id = 			/obj/item/card/id/dogtag
	glasses =		/obj/item/clothing/glasses/sunglasses/big
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/ec=2, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/gun/energy/laser/pistol=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=2)

/datum/outfit/loadout/scribea
	name = "Scribe"
	backpack_contents = list(
		/obj/item/clothing/suit/f13/scribe=1,
		/obj/item/clothing/accessory/bos/scribe=1
		)

/datum/outfit/loadout/scribeb
	name = "Senior Scribe"
	backpack_contents = list(
		/obj/item/clothing/suit/f13/seniorscribe=1,
		/obj/item/clothing/accessory/bos/seniorscribe=1
		)
/*
/datum/job/bos/f13scribe/after_spawn(mob/living/carbon/human/H, mob/M)
	H.add_quirk("Poor Aim")
*/


/*
Knight
*/

/datum/job/bos/f13knight
	title = "Knight"
	flag = F13KNIGHT
	faction = "BOS"
	total_positions = 0//from 2
	spawn_positions = 0//from 2
	description = "You report directly to the Knight-Captain. You are the Brotherhood Knight, the veritable lifeblood of your organization. You are a versatile and adaptably trained person: from your primary duties of weapon & armor repair to basic combat, survival and stealth skills, the only thing you lack is proper experience. You are also in charge of Initiates."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Knight-Captain"
	selection_color = "#95a5a6"
	exp_requirements = 240
	exp_type = EXP_TYPE_BROTHERHOOD

	loadout_options = list(
	/datum/outfit/loadout/knighta, //AER9
	/datum/outfit/loadout/knightb, //lever shotgun and teleshield
	)

	outfit = /datum/outfit/job/bos/f13knight

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)

/datum/outfit/job/bos/f13knight
	name = "Knight"
	jobtype = /datum/job/bos/f13knight
	suit = 			/obj/item/clothing/suit/armor/f13/combat/brotherhood
	accessory = 	/obj/item/clothing/accessory/bos/knight
	uniform =		/obj/item/clothing/under/syndicate/brotherhood
	mask =			/obj/item/clothing/mask/gas/sechailer/swat
	belt = 			/obj/item/storage/belt/military
	head = 			/obj/item/clothing/head/helmet/f13/combat/brotherhood
	id = 			/obj/item/card/id/dogtag
	gunsmith_one = TRUE
	gunsmith_two = TRUE
	gunsmith_three = TRUE
	gunsmith_four = TRUE
	pa_wear = TRUE
	backpack_contents = list(
		/obj/item/gun/energy/laser/pistol=1, \
		/obj/item/stock_parts/cell/ammo/ec=2)

/datum/outfit/loadout/knighta
	name = "Footknight"
	backpack_contents = list(
		/obj/item/gun/energy/laser/aer9=1,
		/obj/item/stock_parts/cell/ammo/mfc=2,
		)

/datum/outfit/loadout/knightb
	name = "Knight-Defender"
	backpack_contents = list(
		/obj/item/gun/ballistic/shotgun/trench=1,
		/obj/item/storage/box/lethalshot=2,
		/obj/item/shield/riot/tele=1
		)
/*
Initiate
*/

/datum/job/bos/f13initiate
	title = "Initiate"
	flag = F13INITIATE
	faction = "BOS"
	total_positions = 0
	spawn_positions = 0
	description = "Either recently inducted or born into the Brotherhood, you have since proven yourself worthy of assignment to the Chapter. You are to assist your superiors and receive training how they deem fit. You are NEVER allowed to leave the bunker without the direct supervision of a superior; doing so may result in exile or transferrence back the Valley."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the scribes, knights, or Paladins"
	selection_color = "#95a5a6"
	exp_requirements = 720
	exp_type = EXP_TYPE_CREW

	loadout_options = list(
	/datum/outfit/loadout/initiatek, //AEP7 and Engibelt with combat armor, no helmet
	/datum/outfit/loadout/initiates, //Medical belt and chem knowledge
	)

	outfit = /datum/outfit/job/bos/f13initiate

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)

/datum/outfit/job/bos/f13initiate
	name = "Initiate"
	jobtype = /datum/job/bos/f13initiate
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_bos
	uniform =		/obj/item/clothing/under/syndicate/brotherhood
	shoes = 		/obj/item/clothing/shoes/combat/swat
	gloves = 		/obj/item/clothing/gloves/combat

/datum/outfit/loadout/initiatek
	name = "Knight-Aspirant"
	belt = 			/obj/item/storage/belt/utility/full/engi
	suit = 			/obj/item/clothing/suit/armor/f13/combat/brotherhood
	backpack_contents = list(
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/ec=2,
		/obj/item/book/granter/trait/gunsmith_one=1,
		/obj/item/book/granter/trait/gunsmith_two=1,
		/obj/item/clothing/accessory/bos/initiateK=1
		)

/datum/outfit/loadout/initiates
	name = "Scribe-Aspirant"
	belt =			/obj/item/storage/belt/medical
	suit =			/obj/item/clothing/suit/toggle/labcoat
	glasses =		/obj/item/clothing/glasses/science
	gloves =		/obj/item/clothing/gloves/color/latex
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak=2,
		/obj/item/book/granter/trait/chemistry=1,
		/obj/item/clothing/accessory/bos/initiateS=1
		)

//pilot
/datum/job/bos/vertipilot
	title = "Vertibird Pilot"
	flag = VERTIPILOT
	faction = "BOS"
	total_positions = 0//from 1
	spawn_positions = 0//from 1
	description = "Likely starting out as a Knight, you've decided to train to pilot one of the most dangerous creations still around. Good job."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Elder and Paladins"
	selection_color = "#95a5a6"
	exp_requirements = 1200
	exp_type = EXP_TYPE_BROTHERHOOD

	outfit = /datum/outfit/job/bos/vertipilot

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)

/datum/outfit/job/bos/vertipilot
	name = "Pilot"
	jobtype = /datum/job/bos/vertipilot
	vb_pilot = TRUE
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_bos
	uniform =		/obj/item/clothing/under/syndicate/brotherhood
	accessory = 	/obj/item/clothing/accessory/bos/knight
	shoes = 		/obj/item/clothing/shoes/combat/swat
	gloves = 		/obj/item/clothing/gloves/combat
	id = 			/obj/item/card/id/dogtag
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m10mm_adv=2, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/gun/ballistic/automatic/pistol/n99=1)