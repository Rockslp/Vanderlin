
/obj/item/clothing/wrists/wrappings
	name = "solar wrappings"
	desc = "Common Astratan vestments for the forearms."
	icon_state = "wrappings"
	item_state = "wrappings"

/obj/item/clothing/wrists/nocwrappings
	name = "moon wrappings"
	icon_state = "nocwrappings"
	item_state = "nocwrappings"

/obj/item/clothing/wrists/silverbracelet
	name = "silver bracelets"
	icon_state = "bracelets"
	sellprice = 30

/obj/item/clothing/wrists/silverbracelet/Initialize()
	. = ..()
	enchant(/datum/enchantment/silver)

/obj/item/clothing/wrists/gem
	name = "gem bracelet base"
	desc = "timbers trunk, this isnt supposed to show up! report this immediately, TOODLES!"
	nodismemsleeves = TRUE
	icon = 'icons/roguetown/clothing/wrists.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/gembracelet.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_gembracelet.dmi'
	abstract_type = /obj/item/clothing/wrists/gem

/obj/item/clothing/wrists/gem/jadebracelet
	name = "joapstone bracelets"
	desc = "A set of bracelets carved out of joapstone."
	icon_state = "br_jade"
	sellprice = 65

/obj/item/clothing/wrists/gem/turqbracelet
	name = "ceruleabaster bracelets"
	desc = "A set of bracelets carved out of ceruleabaster."
	icon_state = "br_turq"
	sellprice = 90

/obj/item/clothing/wrists/gem/onyxabracelet
	name = "onyxa bracelets"
	desc = "A set of bracelets carved out of onyxa."
	icon_state = "br_onyxa"
	sellprice = 45

/obj/item/clothing/wrists/gem/coralbracelet
	name = "aoetal bracelets"
	desc = "A set of bracelets carved out of aoetal."
	icon_state = "br_coral"
	sellprice = 75

/obj/item/clothing/wrists/gem/amberbracelet
	name = "petriamber bracelets"
	desc = "A set of bracelets carved out of petriamber."
	icon_state = "br_amber"
	sellprice = 65

/obj/item/clothing/wrists/gem/shellbracelet
	name = "shell bracelets"
	desc = "A set of bracelets carved out of shell."
	icon_state = "br_shell"
	sellprice = 25

/obj/item/clothing/wrists/gem/rosebracelet
	name = "rosellusk bracelets"
	desc = "A set of bracelets carved out of rosellusk."
	icon_state = "br_rose"
	sellprice = 30

/obj/item/clothing/wrists/gem/opalbracelet
	name = "opaloise bracelets"
	desc = "A set of bracelets carved out of opaloise."
	icon_state = "br_opal"
	sellprice = 95

/obj/item/clothing/wrists/goldbracelet
	name = "gold bracelets"
	icon_state = "braceletg"
	sellprice = 65

/obj/item/clothing/wrists/bracers/rare
	abstract_type = /obj/item/clothing/wrists/bracers/rare

/obj/item/clothing/wrists/bracers/rare/hoplite
	name = "ancient bracers"
	desc = "Stalwart bronze bracers, from an age long past."
	icon_state = "aasimarwrist"
	item_state = "aasimarwrist"
	armor = ARMOR_PLATE_BAD
	smeltresult = /obj/item/ingot/bronze
	melting_material = /datum/material/bronze

//copper bracers

/obj/item/clothing/wrists/bracers/copper
	name = "copper bracers"
	desc = "Copper forearm guards that offer some protection while looking rather stylish."
	icon_state = "copperarm"
	item_state = "copperarm"
	armor = list("blunt" = 50, "slash" = 50, "stab" = 50,  "piercing" = 60, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_LASHING, BCLASS_BITE, BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	smeltresult = /obj/item/ingot/copper
	melting_material = /datum/material/copper

//Queensleeves
/obj/item/clothing/wrists/royalsleeves
	name = "royal sleeves"
	desc = "Sleeves befitting an elaborate gown."
	icon_state = "royalsleeves"
	item_state = "royalsleeves"
	detail_tag = "_detail"
	detail_color = CLOTHING_SOOT_BLACK
	uses_lord_coloring = LORD_PRIMARY
