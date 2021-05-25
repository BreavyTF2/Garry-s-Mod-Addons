--Expanded NPCs Plus LUA file, by Alieneer
local Category = "Combine"
//local NPC = { Name = "City Scanner Grenade", Class = "grenade_homer", Offset = 40, Model = "models/weapons/w_grenade.mdl", Category = Category} list.Set( "NPC", "grenade_homer", NPC ) 
local NPC = { Name = "Crab Synth", Class = "monster_generic", Model = "models/synth.mdl", Category = Category} list.Set( "NPC", "Synth", NPC ) 
local NPC = { Name = "D0G's Ball", Class = "npc_rollermine", SpawnFlags = 65536, KeyValues = { SquadName = "overwatch" }, Category = Category } list.Set( "NPC", "npc_rollermine_friendly", NPC)
local NPC = { Name = "Dropship w/ Container", Class = "npc_combinedropship", Offset = 350, KeyValues = { CrateType = 1 , GunRange = 1000, SquadName = "overwatch" }, Category = Category } list.Set( "NPC", "npc_dropship_container", NPC )
local NPC = { Name = "Dropship w/ Jeep", Class = "npc_combinedropship", Offset = 350, KeyValues = { CrateType = -3 , GunRange = 1000, SquadName = "overwatch" }, Category = Category } list.Set( "NPC", "npc_dropship_jeep", NPC )
local NPC = { Name = "Dropship w/ Strider", Class = "npc_combinedropship", Offset = 350, KeyValues = { CrateType = -1 , GunRange = 1000, SquadName = "overwatch" }, Category = Category } list.Set( "NPC", "npc_dropship_strider", NPC )
local NPC = { Name = "Electrical Drone", Class = "npc_helicopter", Offset = 300, SpawnFlags = 131072, KeyValues = { SquadName = "overwatch" }, Category = Category} list.Set( "NPC", "npc_helicopter_electricaldrone", NPC)
local NPC = { Name = "Gunship Chopper", Class = "npc_combinegunship", Offset = 300, SpawnFlags = 8192, KeyValues = { SquadName = "overwatch" }, Category = Category} list.Set( "NPC", "npc_gunship_helicopter", NPC)
local NPC = { Name = "Helicopter Boss", Class = "npc_helicopter", Offset = 300, KeyValues = { SquadName = "overwatch" }, Category = Category } list.Set( "NPC", "npc_helicopter_boss", NPC ) --Helicopter with default health points (5600)
local NPC = { Name = "Metro Police (Arrest)", Class = "npc_metropolice", SpawnFlags = 2097152, KeyValues = { SquadName = "overwatch" }, Weapons = { "weapon_pistol" }, Category = Category } list.Set( "NPC", "npc_metropolice_arrest", NPC)
local NPC = { Name = "Metro Police (Manhack)", Class = "npc_metropolice", KeyValues = { manhacks = 1 , SquadName = "overwatch" }, Weapons = { "weapon_stunstick", "weapon_pistol", "weapon_smg1" }, Category = Category } list.Set( "NPC", "npc_metropolice_manhack", NPC)
local NPC = { Name = "Metro Police (Simple)", Class = "npc_metropolice", SpawnFlags = 131072, KeyValues = { SquadName = "overwatch" }, Weapons = { "weapon_smg1", "weapon_stunstick", "weapon_pistol" }, Category = Category } list.Set( "NPC", "npc_metropolice_simple", NPC)
local NPC = { Name = "Mini Strider", Class = "npc_furniture", Model = "models/ministrider.mdl", Category  = Category} list.Set( "NPC", "MiniStrider", NPC )
local NPC = { Name = "Mortar Synth", Class = "cycler", Model = "models/mortarsynth.mdl", Category = Category} list.Set( "NPC", "MortarSynth", NPC ) 
//local NPC = { Name = "Motar Synth Grenade", Class = "grenade_beam", Offset = 20, Model = "models/weapons/w_grenade.mdl", Category = Category} list.Set( "NPC", "grenade_beam", NPC )
local NPC = { Name = "Stalker (Medium Beam)", Class = "npc_stalker", KeyValues = { BeamPower = 1, SquadName = "overwatch" }, Category = Category} list.Set( "NPC", "npc_stalker_meddmg", NPC)
local NPC = { Name = "Stalker (High Beam)", Class = "npc_stalker", KeyValues = { BeamPower = 2, SquadName = "overwatch" }, Category = Category} list.Set( "NPC", "npc_stalker_highdmg", NPC)
local NPC = { Name = "Strider (Stomper)", Class = "npc_strider", SpawnFlags = 65536, KeyValues = { SquadName = "overwatch" }, Category = Category} list.Set( "NPC", "npc_strider_stompplayer", NPC)
if (IsMounted( "ep2" ) ) then
local NPC = { Name = "Advisor Pod", Class = "cycler_actor", Model = "models/advisorpod.mdl", Category = Category} list.Set( "NPC", "AdvisorPod", NPC ) 
end
local Category = "Humans + Resistance" 
local NPC = { Name = "Alyx EP2", Class = "npc_alyx", Model = "models/alyx_ep2.mdl",  Weapons = { "weapon_alyxgun", "weapon_smg1", "weapon_shotgun" }, KeyValues = { SquadName = "resistance" }, Category = Category} list.Set( "NPC", "npc_alyxep2", NPC )
local NPC = { Name = "Alyx Intro", Class = "npc_alyx", Model = "models/alyx_intro.mdl", Weapons = { "weapon_alyxgun", "weapon_smg1", "weapon_shotgun" }, KeyValues = { SquadName = "resistance" }, Category = Category} list.Set( "NPC", "npc_alyxintro", NPC )
local NPC = { Name = "Breen Monitor", Class = "npc_breen", Model = "models/breen_monitor.mdl", Category = Category} list.Set( "NPC", "npc_breen_monitor", NPC ) 
local NPC = { Name = "Eli Monitor", Class = "npc_eli", Model = "models/eli_monitor.mdl", Category = Category} list.Set( "NPC", "npc_eli_monitor", NPC ) 
local NPC = { Name = "Kleiner Monitor", Class = "npc_kleiner", Model = "models/kleiner_monitor.mdl", Category = Category} list.Set( "NPC", "npc_kleiner_monitor", NPC ) 
local NPC = { Name = "Lamarr", Class = "generic_actor", Model = "models/lamarr.mdl", Category = Category} list.Set( "NPC", "Lamarr", NPC ) 
local NPC = { Name = "Male Cheaple", Class = "npc_citizen", Model = "models/humans/group01/male_cheaple.mdl", KeyValues = { SquadName = "resistance", citizentype = CT_UNIQUE }, Category = Category} list.Set( "NPC", "npc_cheaple", NPC ) 
local NPC = { Name = "Vortigaunt Medic", Class = "npc_vortigaunt", KeyValues = { ArmorRechargeEnabled=1, HealthRegenerateEnabled=1 }, Category = Category} list.Set( "NPC", "npc_vortigaunt_medic", NPC )
local Category = "Counter-Strike: Source"
if ( IsMounted( "cstrike" ) ) then
local NPC = { Name = "Hostage 01", Class = "npc_citizen", Model = "models/Characters/Hostage_01.mdl", KeyValues = { SquadName = "resistance", citizentype = CT_UNIQUE }, Weapons = { "weapon_pistol" }, Category = Category} list.Set( "NPC", "npc_css_hostage1", NPC ) 
local NPC = { Name = "Hostage 02", Class = "npc_citizen", Model = "models/Characters/Hostage_02.mdl", KeyValues = { SquadName = "resistance", citizentype = CT_UNIQUE }, Weapons = { "weapon_shotgun" }, Category = Category} list.Set( "NPC", "npc_css_hostage2", NPC ) 
local NPC = { Name = "Hostage 03", Class = "npc_citizen", Model = "models/Characters/Hostage_03.mdl", KeyValues = { SquadName = "resistance", citizentype = CT_UNIQUE }, Weapons = { "weapon_ar2" }, Category = Category} list.Set( "NPC", "npc_css_hostage3", NPC ) 
local NPC = { Name = "Hostage 04", Class = "npc_citizen", Model = "models/Characters/Hostage_04.mdl", KeyValues = { SquadName = "resistance", citizentype = CT_UNIQUE }, Weapons = { "weapon_smg1" }, Category = Category} list.Set( "NPC", "npc_css_hostage4", NPC ) 
end
local Category = "Half-Life: Source"
if ( IsMounted( "hl1" ) ) then
local NPC = { Name = "Cigar Grunt", Class = "monster_human_grunt", KeyValues = {  weapons = 7 }, Category = Category} list.Set( "NPC", "monster_human_grunt_cigar", NPC)
local NPC = { Name = "Einstein", Class = "monster_scientist", KeyValues = { body = 1 }, Category = Category} list.Set( "NPC", "monster_scientist_einstein", NPC)
local NPC = { Name = "Heavy Turret (Floor)", Class = "monster_turret", SpawnFlags = 32, OnFloor = true, Offset = 1, Category = Category} list.Set( "NPC", "monster_turret_floor", NPC)
local NPC = { Name = "Luther", Class = "monster_scientist", KeyValues = { body = 2 }, Category = Category} list.Set( "NPC", "monster_scientist_luther", NPC)
local NPC = { Name = "Mini Turret (Floor)", Class = "monster_miniturret", SpawnFlags = 32, OnFloor = true, Offset = 1, Category = Category} list.Set( "NPC", "monster_miniturret_floor", NPC)
local NPC = { Name = "Pre-Disaster Barney", Class = "monster_barney", SpawnFlags = 65536, Category = Category} list.Set( "NPC", "monster_barney_predisaster", NPC)
local NPC = { Name = "Pre-Disaster Scientist", Class = "monster_scientist", KeyValues = { body = -1 }, SpawnFlags = 65536, Category = Category} list.Set( "NPC", "monster_scientist_predisaster", NPC)
local NPC = { Name = "Sentry (Ceiling)", Class = "monster_sentry", KeyValues = { orientation = 1 }, OnCeiling = true, Offset = 2, SpawnFlags = 32, Category = Category} list.Set( "NPC", "monster_sentry_ceiling", NPC)
local NPC = { Name = "Shotgun Grunt", Class = "monster_human_grunt", KeyValues = { weapons = 10 }, Category = Category} list.Set( "NPC", "monster_human_grunt_shotgun", NPC)
local NPC = { Name = "Slick", Class = "monster_scientist", KeyValues = { body = 3 }, Category = Category} list.Set( "NPC", "monster_scientist_slick", NPC)
local NPC = { Name = "Walter", Class = "monster_scientist", KeyValues =  { body = 0 }, Category = Category} list.Set( "NPC", "monster_scientist_walter", NPC)
end
local Category = "Half-Life: Source (Actors)"
if (IsMounted( "hl1" ) ) then
local NPC = { Name = "Archer", Class = "monster_generic", Model = "models/archer.mdl", Category = Category} list.Set( "NPC", "monster_archer", NPC )
local NPC = { Name = "Big Rat", Class = "monster_generic", Model = "models/bigrat.mdl", Category = Category} list.Set( "NPC", "monster_rat", NPC )
local NPC = { Name = "Chumtoad", Class = "monster_generic", Model = "models/chumtoad.mdl", Category = Category} list.Set( "NPC", "monster_chumtoad", NPC )
local NPC = { Name = "Control Sphere", Class = "monster_generic", Model = "models/sphere.mdl", Category = Category} list.Set( "NPC", "monster_sphere", NPC )
local NPC = { Name = "Doctor", Class = "monster_generic", Model = "models/doctor.mdl", Category = Category} list.Set( "NPC", "monster_doctor", NPC )
local NPC = { Name = "File Cabinet", Class = "monster_furniture", Model = "models/filecabinet.mdl", Category = Category} list.Set( "NPC", "monster_cabinet", NPC )
local NPC = { Name = "Forklift", Class = "monster_generic", Model = "models/forklift.mdl", Category = Category} list.Set( "NPC", "monster_forklift", NPC )
local NPC = { Name = "Human Assault", Class = "monster_generic", Model = "models/hassault.mdl", Category = Category} list.Set( "NPC", "monster_hassault", NPC )
local NPC = { Name = "Holo", Class = "monster_generic", Model = "models/holo.mdl", Category = Category} list.Set( "NPC", "monster_holo", NPC )
local NPC = { Name = "Kingpin", Class = "monster_generic", Model = "models/kingpin.mdl", Category = Category} list.Set( "NPC", "monster_kingpin", NPC )
local NPC = { Name = "Loader", Class = "monster_generic", Model = "models/perftest/loader.mdl", Category = Category} list.Set( "NPC", "monster_loader", NPC ) 
local NPC = { Name = "Protozoa", Class = "cycler", Model = "models/protozoa.mdl", Category = Category} list.Set( "NPC", "monster_protozoa", NPC )
local NPC = { Name = "Mr. Friendly", Class = "monster_generic", Model = "models/friendly.mdl", Category = Category} list.Set( "NPC", "monster_friendly", NPC )
local NPC = { Name = "Skeleton", Class = "monster_furniture", Model = "models/skeleton.mdl", Category = Category} list.Set( "NPC", "monster_skeleton", NPC )
local NPC = { Name = "Snapbug", Class = "monster_generic", Model = "models/snapbug.mdl", Category = Category} list.Set( "NPC", "monster_snapbug", NPC )
local NPC = { Name = "Stukabat", Class = "monster_generic", Model = "models/stukabat.mdl", Category = Category} list.Set( "NPC", "monster_stukabat", NPC )
end
local Category = "Other"
local NPC = { Name = "Scrapyard Dumpster", Class = "npc_furniture",  Model = "models/props_lab/scrapyarddumpster.mdl", Category = Category } list.Set( "NPC", "EliDumpster", NPC )
local NPC = { Name = "HL2 Player", Class = "generic_actor", Model = "models/player.mdl", Category = Category} list.Set( "NPC", "HL2Player", NPC ) 
if (IsMounted( "hl1" ) ) then
local NPC = { Name = "HL1 Player", Class = "generic_actor", Model = "models/hl1plr.mdl", Category = Category } list.Set( "NPC", "HL1Player", NPC )
end
local Category = "Zombies + Enemy Aliens"
local NPC = { Name = "Summoner Guard", Class = "npc_antlionguard", KeyValues = { allowbark = 1, SquadName = "antlions" }, Category = Category} list.Set( "NPC", "npc_antlionguard_bark", NPC )
local NPC = { Name = "Poison Zombie (Two)", Class = "npc_poisonzombie", KeyValues = { crabcount = 2, SquadName = "poison" }, Category = Category} list.Set( "NPC", "npc_poisonzombie_twocrabs", NPC )
local NPC = { Name = "Poison Zombie (One)", Class = "npc_poisonzombie", KeyValues = { crabcount = 1, SquadName = "poison" }, Category = Category} list.Set( "NPC", "npc_poisonzombie_onecrab", NPC )