/datum/job/deathknight
	title = "Death Knight"
	tutorial = null
	flag = DEATHKNIGHT
	department_flag = UNDEAD
	faction = FACTION_STATION //?
	job_flags = (JOB_EQUIP_RANK)
	total_positions = -1
	spawn_positions = 0

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Half-Orc"
	)

	outfit = /datum/outfit/job/deathknight
	give_bank_account = FALSE

/datum/job/deathknight/after_spawn(mob/living/spawned, client/player_client)
	SSmapping.find_and_remove_world_trait(/datum/world_trait/death_knight)
	SSmapping.retainer.death_knights |= spawned.mind
	..()
	// copy-paste of skeleton job, to be refactored
	var/mob/living/carbon/human/H = spawned
	if(spawned.mind)
		spawned.mind.current.job = null
	if(H.dna && H.dna.species)
		H.dna.species.species_traits |= NOBLOOD
		H.dna.species.soundpack_m = new /datum/voicepack/skeleton()
		H.dna.species.soundpack_f = new /datum/voicepack/skeleton()
	var/obj/item/bodypart/O = H.get_bodypart(BODY_ZONE_R_ARM)
	if(O)
		O.drop_limb()
		qdel(O)
	O = H.get_bodypart(BODY_ZONE_L_ARM)
	if(O)
		O.drop_limb()
		qdel(O)
	H.regenerate_limb(BODY_ZONE_R_ARM)
	H.regenerate_limb(BODY_ZONE_L_ARM)
	for(var/obj/item/bodypart/B in H.bodyparts)
		B.skeletonize()
	H.base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB, /datum/intent/simple/claw)
	H.update_a_intents()
	H.cmode_music = 'sound/music/cmode/combat_weird.ogg'
	var/obj/item/organ/eyes/eyes = H.getorganslot(ORGAN_SLOT_EYES)
	if(eyes)
		eyes.Remove(H,1)
		QDEL_NULL(eyes)
	eyes = new /obj/item/organ/eyes/night_vision/zombie
	eyes.Insert(H)
	H.ambushable = FALSE
	H.underwear = "Nude"
	if(H.charflaw)
		QDEL_NULL(H.charflaw)
	H.update_body()
	H.mob_biotypes = MOB_UNDEAD
	H.faction = list(FACTION_UNDEAD)
	H.name = "Death Knight"
	H.real_name = "Death Knight"
	ADD_TRAIT(H, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOSTAMINA, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOLIMBDISABLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBREATH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOPAIN, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_TOXIMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOSLEEP, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SHOCKIMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_CRITICAL_WEAKNESS, TRAIT_GENERIC)

/datum/outfit/job/deathknight/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind?.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/magic/arcane, 3, TRUE)


	belt = /obj/item/storage/belt/leather
	pants = /obj/item/clothing/pants/platelegs/blk/death
	shoes = /obj/item/clothing/shoes/boots/armor/blkknight
	shirt = /obj/item/clothing/shirt/undershirt/black
	armor = /obj/item/clothing/armor/plate/blkknight/death
	gloves = /obj/item/clothing/gloves/plate/blk/death
	backl = /obj/item/weapon/sword/long/death
	head = /obj/item/clothing/head/helmet/visored/knight/black

	H.change_stat(STATKEY_INT, 3)
	H.change_stat(STATKEY_STR, 2)
	H.change_stat(STATKEY_END, 2)
	H.change_stat(STATKEY_CON, 2)
	H.change_stat(STATKEY_SPD, -3)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/lightningbolt)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fetch)

	H.ambushable = FALSE

	var/datum/antagonist/new_antag = new /datum/antagonist/skeleton/knight()
	H.mind.add_antag_datum(new_antag)

/obj/item/clothing/armor/plate/blkknight/death
	color = CLOTHING_SOOT_BLACK

/obj/item/clothing/shoes/boots/armor/blkknight/death
	color = CLOTHING_SOOT_BLACK

/obj/item/clothing/gloves/plate/blk/death
	color = CLOTHING_SOOT_BLACK

/obj/item/clothing/pants/platelegs/blk/death
	color = CLOTHING_SOOT_BLACK
