-- Expanded Entities lua script, by Alieneer

local Category = ""
local function AddEntity( t, class )
	list.Set( "SpawnableEntities", class or t.Class, t )
end

local function ADD_SPECIALENTITY( name, class )
	list.Set( "SpawnableEntities", class, { PrintName = name, ClassName = class, Category = Category, NormalOffset = 32, DropToFloor = true, Author = "VALVe" } )
	duplicator.Allow( class )
end

local function ADD_WEAPON( name, class )
	list.Set( "Weapon", class, { ClassName = class, PrintName = name, Category = Category, Author = "VALVe", Spawnable = true } )
	duplicator.Allow( class )
end


Category = "Effects"
	ADD_SPECIALENTITY( "_FireSmoke", "_firesmoke" )
	ADD_SPECIALENTITY( "Cycler Wreckage", "cycler_wreckage" )
	ADD_SPECIALENTITY( "Dust Trail", "env_dusttrail" )
	ADD_SPECIALENTITY( "Fire Trail", "env_fire_trail" )
	ADD_SPECIALENTITY( "Movie Explosion", "env_movieexplosion" )
	ADD_SPECIALENTITY( "Particle Smoke Grenade", "env_particlesmokegrenade" )
	ADD_SPECIALENTITY( "Rocket Trail", "env_rockettrail" )
	ADD_SPECIALENTITY( "Smoke Trail", "env_smoketrail" )
	ADD_SPECIALENTITY( "Spark Shower", "spark_shower" )
	ADD_SPECIALENTITY( "Vort Charge Token", "vort_charge_token" )

Category = "Hammer/Debug"
	ADD_SPECIALENTITY( "Bullseye (Strider Focus)", "bullseye_strider_focus" )
	ADD_SPECIALENTITY( "Commentary Node", "point_commentary_node" )
	ADD_SPECIALENTITY( "Commentary Viewpoint", "point_commentary_viewpoint" )
	ADD_SPECIALENTITY( "Gunship Crash Point", "info_target_gunshipcrash" )
	ADD_SPECIALENTITY( "Helicopter Crash Point", "info_target_helicopter_crash" )
	ADD_SPECIALENTITY( "Projected Texture", "env_projectedtexture" )
	ADD_SPECIALENTITY( "Rotorwash Emitter", "env_rotorwash_emitter" )
	ADD_SPECIALENTITY( "Squad Insignia", "squadinsignia" )
	ADD_SPECIALENTITY( "Test Traceline", "test_traceline" )
	ADD_SPECIALENTITY( "Window Pane", "window_pane" )

Category = "Half-Life 2"
	ADD_SPECIALENTITY( "AR2 Grenade", "item_ar2_grenade" )
	ADD_SPECIALENTITY( "Combine Autogun", "func_tank_combine_cannon" )
	ADD_SPECIALENTITY( "Dynamic Supplies", "item_dynamic_resupply" )
	ADD_SPECIALENTITY( "Flare", "env_flare" )
	ADD_SPECIALENTITY( "Flare Round", "item_flare_round" )
	ADD_SPECIALENTITY( "Flare Rounds", "item_box_flare_rounds" )
	ADD_SPECIALENTITY( "Large Ammo", "item_large_box_lrounds" )
	ADD_SPECIALENTITY( "Large Medium Ammo", "item_large_box_mrounds" )
	ADD_SPECIALENTITY( "Large Small Ammo", "item_large_box_srounds" )
	ADD_SPECIALENTITY( "Dropship Container", "prop_dropship_container" )
	ADD_SPECIALENTITY( "Small Large Ammo", "item_box_lrounds" )
	ADD_SPECIALENTITY( "Small Medium Ammo", "item_box_mrounds" )
	ADD_SPECIALENTITY( "Small Ammo", "item_box_srounds" )
	ADD_SPECIALENTITY( "Sniper Rounds", "item_box_sniper_rounds" )
	ADD_SPECIALENTITY( "Water Leech", "ent_watery_leech" )
	
if (IsMounted( "ep2" ) ) then
	ADD_SPECIALENTITY( "Grub Nugget", "item_grubnugget" )
	ADD_SPECIALENTITY( "Sticky Bomb", "prop_stickybomb" )
end

if (IsMounted( "episodic" ) ) then
	ADD_SPECIALENTITY( "Coreball", "prop_coreball" )
end

Category = "Half-Life 2: Projectiles"
	ADD_SPECIALENTITY( "APC Missile", "apc_missile" )
	ADD_SPECIALENTITY( "Combine Ball", "prop_combine_ball" )
	ADD_SPECIALENTITY( "Combine Bouncy Mine", "combine_bouncemine" )
	ADD_SPECIALENTITY( "Bouncy Grenade", "bounce_bomb" )
	ADD_SPECIALENTITY( "Crossbow Bolt", "crossbow_bolt" )
	ADD_SPECIALENTITY( "RPG Missile", "rpg_missile" )
	ADD_SPECIALENTITY( "SMG Grenade", "grenade_ar2" )

if (IsMounted( "ep2" ) ) then
	ADD_SPECIALENTITY( "Antlion Spit", "grenade_spit" )
	ADD_SPECIALENTITY( "Flechette", "hunter_flechette" )
end

Category = "Half-Life: Source"
if (IsMounted( "hl1" ) ) then
	ADD_SPECIALENTITY( "AR Ammo", "ammo_9mmar" )
	ADD_SPECIALENTITY( "AR Grenades", "ammo_argrenades" )
	ADD_SPECIALENTITY( "Big Momma Mortar Shot", "bmortar" )
	ADD_SPECIALENTITY( "Clip Ammo", "ammo_9mmclip" )
	ADD_SPECIALENTITY( "Crossbow Bolt", "crossbow_bolt_hl1" )
	ADD_SPECIALENTITY( "Energy Ball", "controller_energy_ball" )
	ADD_SPECIALENTITY( "Head Ball", "controller_head_ball" )
	ADD_SPECIALENTITY( "Hand Grenade", "grenade_hand" )
	ADD_SPECIALENTITY( "Large Xen Spore", "xen_spore_large" )
	ADD_SPECIALENTITY( "Long Jump Module", "item_longjump" )
	ADD_SPECIALENTITY( "Medium Xen Spore", "xen_spore_medium" )
	ADD_SPECIALENTITY( "MP5 Grenade", "grenade_mp5" )
	ADD_SPECIALENTITY( "RPG Rocket", "rpg_rocket" )
	ADD_SPECIALENTITY( "Small Xen Spore", "xen_spore_small" )
	ADD_SPECIALENTITY( "Soda Can", "item_sodacan" )
	ADD_SPECIALENTITY( "Uranium (Egon)", "ammo_egonclip" )
	ADD_SPECIALENTITY( "Weapon Box", "weaponbox" )
	ADD_SPECIALENTITY( "Xen Hair", "xen_hair" )
	ADD_SPECIALENTITY( "Xen Plant", "xen_plantlight" )
	ADD_SPECIALENTITY( "Xen Tree", "xen_tree" )
end

Category = "Half-Life 2"
	ADD_WEAPON( "Alyx Gun", "weapon_alyxgun" )
	ADD_WEAPON( "Annabelle", "weapon_annabelle" )
	ADD_WEAPON( "Base HL2MP Combat Weapon", "basehl2mpcombatweapon" )
	ADD_WEAPON( "Base HL Combat Weapon", "basehlcombatweapon" )
	ADD_WEAPON( "Harpoon", "weapon_oldmanharpoon" )
	ADD_WEAPON( "HL2MP Base", "weapon_hl2mp_base" )
	ADD_WEAPON( "Package", "weapon_citizenpackage" )
	ADD_WEAPON( "Suitcase", "weapon_citizensuitcase" )

Category = "Half-Life: Source"
	ADD_WEAPON( "Base HL1 Combat Weapon", "basehl1combatweapon" )
	ADD_WEAPON( "Base HL1MP Combat Weapon", "basehl1mpcombatweapon" )

Category = "Other"
	ADD_WEAPON( "Cubemaps", "weapon_cubemap" )

	list.Add( "NPCUsableWeapons", { class = "weapon_oldmanharpoon", title = "Fisherman's harpoon" } )
	list.Add( "NPCUsableWeapons", { class = "weapon_citizenpackage", title = "Food Ration" } )
	list.Add( "NPCUsableWeapons", { class = "weapon_citizensuitcase", title = "Suitcase" } )
	list.Add( "NPCUsableWeapons", { class = "weapon_cubemap", title = "Cubemaps" } )