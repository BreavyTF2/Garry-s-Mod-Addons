CreateConVar("brickbat_killcrabs",0,0,"Should the player be able to kill the headcrabs they throw?")
CreateConVar("brickbat_playerfriendly",0,0,"Should thrown headcrabs be friendly to all players?")
CreateConVar("sk_plr_dmg_iceaxe",10,0,"How much damage should the ice axe do")
CreateConVar("sk_plr_dmg_iceaxe_alt",20,0,"How much damage should the secondary attack ice axe attack do.")
CreateConVar("sk_plr_dmg_flare_round",12,0,"")
CreateConVar("sk_npc_dmg_flare_round",2,0,"")
CreateConVar("sk_max_flare_round",20,0,"")

local Category = "Zombies + Enemy Aliens"

local NPC = { Name = "2001 Headcrab", Class = "npc_headcrab_fast", KeyValues = { SquadName = "zombies" }, Model = "models/2001headcrab.mdl", Category = Category } list.Set( "NPC", "npc_brickbat", NPC )