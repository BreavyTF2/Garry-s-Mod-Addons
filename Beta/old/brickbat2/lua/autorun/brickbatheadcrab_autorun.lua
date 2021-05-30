CreateConVar("brickbat_killcrabs",0,0,"Should the player be able to kill the headcrabs they throw?")
CreateConVar("brickbat_playerfriendly",0,0,"Should thrown headcrabs be friendly to all players?")

local Category = "Zombies + Enemy Aliens"

local NPC = { Name = "2001 Headcrab", Class = "npc_headcrab_fast", KeyValues = { SquadName = "zombies" }, Model = "models/2001headcrab.mdl", Category = Category } list.Set( "NPC", "npc_brickbatheadcrab", NPC )