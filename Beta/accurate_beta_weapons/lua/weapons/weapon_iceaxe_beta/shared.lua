if SERVER then

	AddCSLuaFile( "shared.lua" )
	
end
local IceAxeSound3 = Sound( "Weapon_IceAxe.Single" )
local IceAxeSound2 = Sound( "Weapon_IceAxe.Melee_Hit" )
local IceAxeSound = Sound( "Weapon_IceAxe.Melee_HitWorld" )
if CLIENT then

SWEP.Category = "Half-Life 2"
SWEP.HoldType			= "melee"
language.Add("weapon_iceaxe", "Ice Axe")

SWEP.PrintName = "Ice Axe"
SWEP.Slot = 0
SWEP.SlotPos = 4
SWEP.DrawAmmo = true
SWEP.DrawCrosshair = true
SWEP.ViewModelFOV = GetConVar( "viewmodel_fov" )
SWEP.ViewModelFlip = false
SWEP.UseHands = true
SWEP.WepSelectIcon = surface.GetTextureID("HUD/swepicons/weapon_iceaxe_beta") 
SWEP.Purpose = "Found in a mysterious artic shipwreck."
SWEP.Instructions = "Press MOUSE1 to do a light attack. Press MOUSE2 to do a heavy attack."
SWEP.DrawWeaponInfoBox	= true
SWEP.BounceWeaponIcon = false 

end
 
function SWEP:Think() 
	if ( self.Owner:KeyReleased( IN_ATTACK ) || ( !self.Owner:KeyDown( IN_ATTACK ) && self.Sound ) ) then		
		self:Idle()
		end
	if ( self.Owner:KeyReleased( IN_ATTACK2 ) || ( !self.Owner:KeyDown( IN_ATTACK2 ) && self.Sound ) ) then		
		self:Idle()
		end
end

function SWEP:Initialize()
		self:SetWeaponHoldType(self.HoldType)

util.PrecacheSound("")
end


sound.Add( {
	name = "Weapon_IceAxe.Single",
	channel = CHAN_WEAPON,
	volume = 1.0,
	level = SNDLVL_105dB,
	pitch =	{95, 100},
	sound =  {"weapons/iceaxe/iceaxe_swing1.wav", "weapons/iceaxe/iceaxe_swing2.wav"}
} )

sound.Add( {
	name = "Weapon_IceAxe.Melee_Hit",
	channel = CHAN_WEAPON,
	volume = 1.0,
	level = SNDLVL_105dB,
	pitch =	{98, 102},
	sound =  {"physics/flesh/flesh_impact_bullet1.wav", "physics/flesh/flesh_impact_bullet2.wav", "physics/flesh/flesh_impact_bullet3.wav", "physics/flesh/flesh_impact_bullet4.wav", "physics/flesh/flesh_impact_bullet5.wav"}
} )

sound.Add( {
	name = "Weapon_IceAxe.Melee_HitWorld",
	channel = CHAN_WEAPON,
	volume = 1.0,
	level = SNDLVL_105dB,
	pitch =	{98, 102},
	sound = {"weapons/iceaxe/iceaxe_impact1.wav", "weapons/iceaxe/iceaxe_impact2.wav"}
} )

function SWEP:PrimaryAttack()
self.Weapon:SetNextPrimaryFire(CurTime() + 0.25)
self:SetNextSecondaryFire( CurTime() + 0.25)
self.Owner:ViewPunch( Angle( math.random(2.0, 4.0), math.random(-2.0, -1.0), 0 ) )
local trace = self.Owner:GetEyeTrace()
local attacker = self.Owner
if trace.HitPos:Distance(self.Owner:GetShootPos()) <= 80 then

		self.Owner:SetAnimation( PLAYER_ATTACK1 )
		self.Weapon:SendWeaponAnim(ACT_VM_HITCENTER)
	bullet = {}
	bullet.Num    = 1
	bullet.Src    = self.Owner:GetShootPos()
	bullet.Dir    = self.Owner:GetAimVector()
	bullet.Spread = Vector(0, 0, 0)
	bullet.Tracer = 0
	bullet.Force  = 4
	bullet.Damage  = 0
self.Owner:FireBullets(bullet) 
if SERVER then
local dmginfo = DamageInfo()
dmginfo:SetDamageForce (self.Owner:GetAimVector())
dmginfo:SetDamageType ( DMG_CLUB )
dmginfo:SetAttacker( attacker )
dmginfo:SetInflictor( self )
dmginfo:SetDamage( GetConVar( "sk_plr_dmg_iceaxe" ):GetInt() )
trace.Entity:TakeDamageInfo( dmginfo )
end
if trace.Entity:IsPlayer() or string.find(trace.Entity:GetClass(),"npc") or string.find(trace.Entity:GetClass(),"prop_ragdoll") then
self.Weapon:EmitSound( IceAxeSound2 )

else
self.Weapon:EmitSound( IceAxeSound )
end
else
               self.Weapon:EmitSound( IceAxeSound3 )
		self.Owner:SetAnimation( PLAYER_ATTACK1 )
                self.Weapon:SendWeaponAnim(ACT_VM_MISSCENTER)
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

function SWEP:Holster()
return true;
end

function SWEP:SecondaryAttack()
self.Weapon:SetNextSecondaryFire(CurTime() + 0.4)
self:SetNextPrimaryFire( CurTime() + 0.4)
self.Owner:ViewPunch( Angle( math.random(2.0, 4.0), math.random(-2.0, -1.0), 0 ) )
local attacker = self.Owner
local trace = self.Owner:GetEyeTrace()
if trace.HitPos:Distance(self.Owner:GetShootPos()) <= 80 then
		self.Owner:SetAnimation( PLAYER_ATTACK1 )
                self.Weapon:SendWeaponAnim(ACT_VM_HITCENTER)
	bullet = {}
	bullet.Num    = 1
	bullet.Src    = self.Owner:GetShootPos()
	bullet.Dir    = self.Owner:GetAimVector()
	bullet.Spread = Vector(0, 0, 0)
	bullet.Tracer = 0
	bullet.Force  = 8
	bullet.Damage = 0
self.Owner:FireBullets(bullet) 
if SERVER then
local dmginfo = DamageInfo()
dmginfo:SetDamageForce (self.Owner:GetAimVector())
dmginfo:SetDamageType ( DMG_CLUB )
dmginfo:SetAttacker( attacker )
dmginfo:SetInflictor( self )
dmginfo:SetDamage( GetConVar( "sk_plr_dmg_iceaxe_alt" ):GetInt() )
trace.Entity:TakeDamageInfo( dmginfo )
end
if trace.Entity:IsPlayer() or string.find(trace.Entity:GetClass(),"npc") or string.find(trace.Entity:GetClass(),"prop_ragdoll") then
self.Weapon:EmitSound( IceAxeSound2 )
else
self.Weapon:EmitSound( IceAxeSound )
end
else
	self.Weapon:EmitSound( IceAxeSound3 )
		self.Owner:SetAnimation( PLAYER_ATTACK1 )
		self.Weapon:SendWeaponAnim(ACT_VM_MISSCENTER)
end

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


-------------------------------------------------------------------
SWEP.Spawnable      = true
SWEP.AdminSpawnable  = false
-----------------------------------------------
SWEP.ViewModel      = "models/weapons/v_iceaxe_beta.mdl"
SWEP.WorldModel   = "models/weapons/w_iceaxe_beta.mdl"
SWEP.HoldType			= "melee"
-----------------------------------------------
SWEP.Primary.Delay		= 0.25
SWEP.Primary.Recoil		= 0
SWEP.Primary.Damage		= 10
SWEP.Primary.NumShots		= 1		
SWEP.Primary.Cone		= 0
SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic   	= true
SWEP.Primary.Ammo         	= "none" 
-------------------------------------------------
SWEP.Secondary.Delay			= 0.4
SWEP.Secondary.Recoil			= 0
SWEP.Secondary.Damage			= 20
SWEP.Secondary.NumShots			= 1
SWEP.Secondary.Cone			= 0
SWEP.Secondary.ClipSize			= -1
SWEP.Secondary.DefaultClip		= -1
SWEP.Secondary.Automatic   		= true
SWEP.Secondary.Ammo         		= "none"
-------------------------------------------------