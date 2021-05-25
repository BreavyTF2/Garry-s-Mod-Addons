if SERVER then

	AddCSLuaFile( "shared.lua" )

	SWEP.HoldType        			= "physgun"
end

if CLIENT then

language.Add("weapon_immolator", "Immolator (LeakNet)")

SWEP.Category			= "Half-Life 2"
SWEP.PrintName = "Immolator (LeakNet)"
SWEP.Slot = 5
SWEP.SlotPos = 6
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true
SWEP.ViewModelFOV = 58
SWEP.ViewModelFlip = false
SWEP.DrawWeaponInfoBox	= true
SWEP.Purpose = "A piece of forgotten combine technology, a Cremator's go to."
SWEP.Instructions = "Hold MOUSE1 to immolate."
SWEP.UseHands = true
SWEP.WepSelectIcon = surface.GetTextureID("HUD/swepicons/weapon_immolator_beta") 
SWEP.BounceWeaponIcon = false 

end

// Code by CrazyBubba64
// Modifications by BattlePope
// Extra Modification by Alieneer
------------------------------ Only admin can spawn / everyone can spawn -------------------
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
-----------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------
SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false
-----------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Damage		= 1
SWEP.Primary.Recoil		= 0
SWEP.Primary.Ammo		= "none"
SWEP.Secondary.Ammo		= "none"
-----------------------------------------------------------------------------------------------------------


-----------------------------------------------About model----------------------------------------------------------------
SWEP.ViewModel				= "models/weapons/c_immolator_beta.mdl"
SWEP.WorldModel				= "models/weapons/w_immolator_quality_beta.mdl"
SWEP.HoldType        			= "physgun"
---------------------------------------------------------------------------------------------------------------------------------
sound.Add( {
	name = "Weapon_Immolator.Off",
	channel = CHAN_WEAPON,
	volume = 0.4,
	level = SNDLVL_GUNFIRE,
	sound = "weapons/1immolator/plasma_stop.wav"
} )

sound.Add( {
	name = "Weapon_Immolator.Run",
	channel = CHAN_WEAPON,
	volume = 1.0,
	level = SNDLVL_GUNFIRE,
	sound = "weapons/1immolator/plasma_shoot.wav"
} )

sound.Add( {
	name = "Weapon_Immolator.On",
	channel = CHAN_WEAPON,
	volume = 1.0,
	level = SNDLVL_GUNFIRE,
	sound = "weapons/mtov_flame1.wav"
} )


SWEP.Sound = Sound ("Weapon_Immolator.Run")
local ImmoOff = Sound( "Weapon_Immolator.Off" )
local ImmoOn = Sound( "Weapon_Immolator.On" )
SWEP.LastSoundRelease = 0
SWEP.RestartDelay = 0
SWEP.RandomEffectsDelay = 0.2

function SWEP:Initialize()
		self:SetWeaponHoldType(self.HoldType)
	end
function SWEP:Precache()
end

function SWEP:PrimaryAttack()

self.Weapon:SetNextPrimaryFire( CurTime() + 0.01)
	if self:IsUnderWater() then return end
	if (!SERVER) then return end


    local tr, vm, muzzle, effectdata
    
    
    
    tr = { }
    
    tr.start = self.Owner:GetShootPos( )
    tr.filter = self.Owner
    tr.endpos = tr.start + self.Owner:GetAimVector( ) * 4096
    tr.mins = Vector( ) * -1
    tr.maxs = Vector( ) * 1
    
    tr = util.TraceHull( tr )
	
	local tr, vm, muzzle, effectdata
	vm = self.Owner:GetViewModel()
	local trace = self.Owner:GetEyeTrace()
	local hit = trace.HitPos
	vstr = tostring(self.Weapon)
	local MuzzlePos = self.Owner:GetShootPos() + (self.Owner:GetRight() * 11.5) + (self.Owner:GetUp() * -8.25) + (self.Owner:GetForward() * 36)
	self:lase(vstr, 0, MuzzlePos, hit, 1)
	self:lase(vstr, 0, MuzzlePos, hit, 0)
//	self.Owner:ViewPunch( Angle( math.random(-.02, .02), math.random(-.015, .015), math.random(-.02, .02) ) )
	self:ShootEffects()
 
	end

function SWEP:SecondaryAttack()
end

function SWEP:Reload()
end

function SWEP:Think()
	if SERVER then
		if self.Owner:KeyPressed (IN_ATTACK) then 
		self:EmitSound( ImmoOn )
end
		self.LastFrame = self.LastFrame or CurTime()
		self.LastRandomEffects = self.LastRandomEffects or 0		
		if self.Owner:KeyDown (IN_ATTACK) and self.LastSoundRelease + self.RestartDelay < CurTime() then
			if not self.SoundObject then
				self:CreateSound()

			end
			self.SoundObject:PlayEx(5, 100)
			
			self.SoundPlaying = true
			
		else
		
			if self.SoundObject and self.SoundPlaying then

				self.SoundObject:FadeOut (0.8)			
				self.SoundPlaying = false
				self.LastSoundRelease = CurTime()
				self:Idle()	
				self:EmitSound( ImmoOff )
			end
		end
		if not self.Owner:Alive() then
		self:EndSound()
		end
		self.LastFrame = CurTime()
		self.Weapon:SetNWBool ("on", self.SoundPlaying)
			end
		end

function SWEP:Deploy()
	self.Weapon:SendWeaponAnim(ACT_VM_DRAW);
	self:SetNextPrimaryFire( CurTime() + self:SequenceDuration())
	self:SetNextSecondaryFire( CurTime() + self:SequenceDuration())
	self:NextThink( CurTime() + self:SequenceDuration() )
	self:Idle()
   return true
end

function SWEP:ShootEffects()
self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
	self.Owner:MuzzleFlash()								
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
end

function SWEP:IsUnderWater()
	if self:WaterLevel() < 3 then
		return false
	else
		if SERVER then
			--local pos = self:GetPos()+Vector(0,0,50)
			local pos = (self.Owner:GetShootPos() + self.Owner:GetAimVector()*40)-Vector(0,0,25)
			tes = ents.Create( "point_tesla" )
			tes:SetPos( pos )
			tes:SetKeyValue( "m_SoundName", "DoSpark" )
			tes:SetKeyValue( "texture", "sprites/bluelaser1.vmt" )
			tes:SetKeyValue( "m_Color", "0 64 128" )
			tes:SetKeyValue("rendercolor", "0 64 128")
			tes:SetKeyValue( "m_flRadius", "128" )
			tes:SetKeyValue( "beamcount_max", "15" )
			tes:SetKeyValue( "thick_min", "10" )
			tes:SetKeyValue( "thick_max", "20" )
			tes:SetKeyValue( "lifetime_min", "0.15" )
			tes:SetKeyValue( "lifetime_max", "0.15" )
			tes:SetKeyValue( "interval_min", "0.1" )
			tes:SetKeyValue( "interval_max", "0.2" )
			tes:Spawn()
			tes:Fire( "DoSpark", "", 0 )
			tes:Fire( "DoSpark", "", 0.1 )
			tes:Fire( "DoSpark", "", 0.2 )
			tes:Fire( "DoSpark", "", 0.3 )
			tes:Fire( "kill", "", 0.3 )
			local hitdie = ents.Create("point_hurt"); --This is what kills stuff
			hitdie:SetKeyValue("Damage",100)
			hitdie:SetKeyValue("DamageRadius",100)
			hitdie:SetKeyValue("DamageType","PLASMA")
			hitdie:SetParent( self.Owner, muzzle )
			hitdie:SetPos( pos )
			hitdie:Spawn();
			hitdie:Fire("hurt","",0.01); -- ACTIVATE THE POINT_HURT
			hitdie:Fire("kill","",0.06);
		end
		self:EmitSound("ambient/energy/weld"..math.random(1,2)..".wav")
		self:EmitSound("weapons/gauss/electro"..math.random(1,3)..".wav")
		self:SetNextPrimaryFire(CurTime()+0.8)
		self:SetNextSecondaryFire(CurTime()+0.8)
		return true
	end
end

function SWEP:lase(par, stat, from, to, noise)
local attacker = self.Owner
local trace = self.Owner:GetEyeTrace()
local dmginfo = DamageInfo()
if string.find(trace.Entity:GetClass(),"prop_ragdoll") then
trace.Entity:Ignite(120,120)
else
trace.Entity:Ignite(5, 60)
end
	if SERVER then
	local pos2 = (self.Owner:GetShootPos() + self.Owner:GetAimVector()*40)-Vector(0,0,25)
	entItem = ents.Create ("info_target")
	realName = "entItem"..tostring(self.Owner:GetName())
		entItem:SetKeyValue("targetname", realName)
	entItem:Spawn()
	beam = ents.Create("env_laser")
		beam:SetKeyValue("renderamt", "192")
		beam:SetKeyValue("rendercolor", "255 255 255")
		beam:SetKeyValue("texture", "sprites/bluelaser1.vmt")
		beam:SetKeyValue("life", "0")
		beam:SetKeyValue("TextureScroll", "100")
		beam:SetKeyValue("targetname", "beam" )
		beam:SetKeyValue("renderfx", "14")
		beam:SetKeyValue("width", "1")
		beam:SetKeyValue("beamcount_max", "2" )
//		beam:SetKeyValue("dissolvetype", "0")
		beam:SetKeyValue("EndSprite", "")
		beam:SetKeyValue("LaserTarget", realName)
		beam:SetKeyValue("NoiseAmplitude", 1)
	beam:Spawn()
	beam:SetOwner(self.Owner)
	tent = ents.Create("point_tesla")
	tent:SetKeyValue("texture","sprites/bluelaser1.vmt")
	tent:SetKeyValue( "m_Color", "0 64 128" )
	tent:SetKeyValue("rendercolor", "0 64 128")
	tent:SetKeyValue("m_flRadius","128")
	tent:SetKeyValue("beamcount_min","1")
	tent:SetKeyValue("beamcount_max","1")
	tent:SetKeyValue("lifetime_min","0.15")
	tent:SetKeyValue("lifetime_max","0.15")
	tent:SetKeyValue("interval_min","0.11")
	tent:SetKeyValue("interval_max","0.12")
	tent:SetPos(to)
//	tent:Spawn()
	tent:SetOwner(self.Owner)
	tent:Activate()
	tent:Fire("TurnOn","",0)
	aoe = ents.Create("env_beam")
		aoe:SetKeyValue("renderamt", "128")
		aoe:SetKeyValue("rendercolor", "0 64 128")
		aoe:SetKeyValue("life", "0.15f")
		aoe:SetKeyValue("radius", "20")
		aoe:SetKeyValue("framerate", "2")
		aoe:SetKeyValue("Boltwidth", "1.75")
		aoe:SetKeyValue("LightningStart", "")
		aoe:SetKeyValue("StrikeTime", "0.1")
//		aoe:SetKeyValue("DamageTarget","npc")
		aoe:SetKeyValue("damage", "0")
		aoe:SetKeyValue("NoiseAmplitude", "15")
		aoe:SetKeyValue("texture", "sprites/bluelaser1.vmt")
		aoe:SetKeyValue("dissolvetype", "0")
dmginfo:SetDamageForce (self.Owner:GetAimVector())
dmginfo:SetDamageType ( 16777224 )
	dmginfo:SetAttacker( attacker )
	dmginfo:SetInflictor( self )
	dmginfo:SetDamage( 0.4 )
trace.Entity:TakeDamageInfo( dmginfo )
	aoe:Fire("TurnOn", "", 0)
	aoe:SetPos(to)
	aoe:Fire("kill", "", 0.2)
	beam:Fire("TurnOn", "", 0)
	beam:Fire("kill", "", 0.01)
	entItem:Fire("kill", "", 0.001)
	tent:Fire("Kill","",0.13)
	entItem:SetPos(to)
	entItem:SetOwner(self.Owner)
	beam:SetPos(from)
	end
end

function SWEP:CreateSound ()
	self.SoundObject = CreateSound (self.Weapon, self.Sound)
	self.SoundObject:Play()
end

function SWEP:Holster() self:EndSound() return true end
function SWEP:OwnerChanged() self:EndSound() end

function SWEP:EndSound ()
	if self.SoundObject then
		self.SoundObject:Stop()
	end
end

function SWEP:OnRemove()
	self:EndSound()
	return true
end

function SWEP:Holster( weapon )
	if ( CLIENT ) then return end
	
	self:StopIdle()
	
	return true
end

function SWEP:DoIdleAnimation()
	self:SendWeaponAnim( ACT_VM_IDLE )
end

function SWEP:DoIdle()
	self:DoIdleAnimation()

	timer.Adjust( "weapon_idle" .. self:EntIndex(), self:SequenceDuration(), 0, function()
		if ( !IsValid( self ) ) then timer.Destroy( "weapon_idle" .. self:EntIndex() ) return end

		self:DoIdleAnimation()
	end )
end

function SWEP:StopIdle()
	timer.Destroy( "weapon_idle" .. self:EntIndex() )
end

function SWEP:Idle()
	if ( CLIENT || !IsValid( self.Owner ) ) then return end
	timer.Create( "weapon_idle" .. self:EntIndex(), self:SequenceDuration() - 0.2, 1, function()
		if ( !IsValid( self ) ) then return end
		self:DoIdle()
	end )
end