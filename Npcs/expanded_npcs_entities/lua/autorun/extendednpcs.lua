--More NPCs LUA file, by Alieneer
local function AddNPC( t, class )
list.Set( "NPC", class or t.Class, t )
end
local Category = "Combine" 
AddNPC( { Name = "Advisor", Class = "npc_advisor", Model = "models/advisor.mdl", KeyValues = { SquadName = "overwatch" }, Offset = 100, Category = Category} )
AddNPC( { Name = "Combine", Class = "npc_combine", Model = "models/combine_soldier.mdl", Weapons = { "weapon_ar2", "weapon_smg1", "weapon_shotgun" }, KeyValues = { NumGrenades = 5, SquadName = "overwatch" }, Category = Category} )
AddNPC( { Name = "HK-707 Missile Defense", Class = "npc_missiledefense",  KeyValues = { SquadName = "overwatch" }, Category = Category} )
AddNPC( { Name = "Proto Sniper", Class = "proto_sniper", KeyValues = { SquadName = "overwatch" }, Category = Category} )
AddNPC( { Name = "Sniper", Class = "npc_sniper", KeyValues = { SquadName = "overwatch" }, Category = Category} )
local Category = "Half-Life: Source" 
if ( IsMounted( "hl1" ) ) then
AddNPC( { Name = "AH-64 Apache", Class = "monster_apache", Offset = 200, Category = Category} )
AddNPC( { Name = "Barnacle", Class = "monster_barnacle", OnCeiling = true, Offset = 2, Category = Category} )
AddNPC( { Name = "Boid", Class = "monster_flyer", Category = Category} )
AddNPC( { Name = "Dead Security Officer", Class = "monster_barney_dead", Category = Category} )
AddNPC( { Name = "Dead Researcher", Class = "monster_hevsuit_dead", Category = Category} )
AddNPC( { Name = "Dead Grunt", Class = "monster_hgrunt_dead", Category = Category} )
AddNPC( { Name = "Dead Scientist", Class = "monster_scientist_dead", KeyValues = { body = -1 },  Category = Category} )
AddNPC( { Name = "Flocking Floater", Class = "monster_bloater", Category = Category} )
AddNPC( { Name = "G-Man", Class = "monster_gman", Category = Category} )
AddNPC( { Name = "Hornet", Class = "hornet", Category = Category} )
AddNPC( { Name = "Ichthyosaur", Class = "monster_ichthyosaur", Offset = 100, Category = Category} )
AddNPC( { Name = "Osprey", Class = "monster_osprey", Offset = 200, Category = Category} )
AddNPC( { Name = "Satchel Charge", Class = "monster_satchel", Category = Category} )
AddNPC( { Name = "Sitting Scientist", Class = "monster_sitting_scientist", KeyValues = { body = -1 }, Category = Category} )
AddNPC( { Name = "Tripmine", Class = "monster_tripmine", Category = Category} )
AddNPC( { Name = "V-22 Osprey", Class = "monster_osprey", Offset = 200, Category = Category} )
end
AddNPC( { Name = "Leech", Class = "monster_leech", Offset = 100, Category = Category} )
local Category = "Nextbot" 
AddNPC( { Name = "Nextbot Base", Class = "base_nextbot", Category = Category} )
AddNPC( { Name = "Simple Bot", Class = "simple_bot", Category = Category} )
local Category = "Other" 
AddNPC( { Name = "Bugbait", Class = "npc_grenade_bugbait", Category = Category} )
AddNPC( { Name = "Concussion Grenade", Class = "npc_concussiongrenade", Category = Category} )
AddNPC( { Name = "Contact Grenade", Class = "npc_contactgrenade", Category = Category} )
AddNPC( { Name = "Cycler", Class = "cycler", Model = "models/kleiner.mdl", Category = Category} )
AddNPC( { Name = "Hand Grenade", Class = "npc_handgrenade", Category = Category} )
AddNPC( { Name = "Model Studio", Class = "model_studio", Model  = "models/kleiner.mdl", Category = Category} )
AddNPC( { Name = "New NPC", Class = "npc_newnpc", Category = Category} )
AddNPC( { Name = "Puppet", Class = "npc_puppet", Model = "models/kleiner.mdl", Category = Category} )
AddNPC( { Name = "Satchel Charge", Class = "npc_satchel", Category = Category} )
AddNPC( { Name = "Target", Class = "npc_bullseye", Category = Category} )
AddNPC( { Name = "Tripmine", Class = "npc_tripmine", Category = Category} )
local Category = "Zombies + Enemy Aliens" 
AddNPC( { Name = "Actual Headcrab Poison", Class = "npc_headcrab_poison", KeyValues = { SquadName = "poison" }, Category = Category} )
AddNPC( { Name = "Ichthyosaur", Class = "npc_ichthyosaur", Offset = 100, Category = Category} )