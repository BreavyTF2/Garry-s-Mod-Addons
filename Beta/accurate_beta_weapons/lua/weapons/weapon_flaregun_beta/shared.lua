if SERVER then
	AddCSLuaFile( "shared.lua" )
	SWEP.Weight				= 5
	SWEP.AutoSwitchTo		= false
	SWEP.AutoSwitchFrom		= false
end

if CLIENT then
language.Add("weapon_flaregun_beta", "Flare Gun")

SWEP.PrintName = "Flare Gun"
SWEP.Slot = 1
SWEP.SlotPos = 5
SWEP.DrawAmmo = true
SWEP.DrawCrosshair = true
SWEP.ViewModelFOV = 54
SWEP.AutoIconAngle = Angle(0,0,90)//AutoIcons Fix
SWEP.ViewModelFlip = false
SWEP.WepSelectIcon = surface.GetTextureID("HUD/swepicons/weapon_flaregun_beta") 
SWEP.DrawWeaponInfoBox	= true
SWEP.Purpose = "Hey, here's a thought. I've got a cigarette lighter. You've got a gun. Maybe you should go first. -Odell"
SWEP.Instructions = "Press MOUSE1 to fire flares."
SWEP.BounceWeaponIcon = false 
SWEP.UseHands = true
end
local FlareFire = Sound( "Weapon_Flaregun.Single" )
local FlareReload = Sound( "Weapon_Flaregun.Reload" )
sound.Add( {
	name = "Weapon_Flaregun.Single",
	channel = CHAN_WEAPON,
	volume = 100,
	level = SNDLVL_GUNFIRE,
	pitch = "PITCH_NORM",
	sound = "weapons/flaregun/fire.wav"

} )
sound.Add( {
	name = "Weapon_Flaregun.Reload",
	channel = CHAN_ITEM,
	volume = 100,
	level = SNDLVL_NORM,
	pitch = "PITCH_NORM",
	sound = "weapons/flaregun/reload.wav"

} )

SWEP.Base 		= "weapon_base"
SWEP.Category	= "Half-Life 2"
SWEP.HoldType	= "pistol"
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.ViewModel = "models/weapons/c_flaregun_beta.mdl"
SWEP.WorldModel = "models/weapons/w_flaregun_beta.mdl"

game.AddAmmoType( { name = "FlareRound", dmgtype = DMG_BURN, tracer = TRACER_LINE, 	plydmg = GetConVar( "sk_plr_dmg_flare_round" ):GetInt(), npcdmg = GetConVar( "sk_npc_dmg_flare_round" ):GetInt(), maxcarry = 20, force =  600} )
if ( CLIENT ) then language.Add( "FlareRound_ammo", "Flares" ) end
SWEP.Primary.Recoil            = 2
SWEP.Primary.Sound = Sound( "weapons/flaregun/fire.wav" )
SWEP.Primary.ClipSize = 1
SWEP.Primary.DefaultClip = GetConVar( "sk_max_flare_round" ):GetInt()
SWEP.Primary.Automatic = false
SWEP.Primary.Delay = 1
SWEP.Primary.Ammo = "FlareRound"

SWEP.Secondary.ClipSize = 1
SWEP.Secondary.DefaultClip = 1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo		= "none"

function SWEP:Deploy()
	self.Weapon:SendWeaponAnim(ACT_VM_DRAW);
	self:SetNextPrimaryFire( CurTime() + self:SequenceDuration())
	self:Idle()
	return true
end

function SWEP:Think()
local attacker = self.Owner
local dmginfo = DamageInfo()
local FlareRoundAmmoType = game.GetAmmoID("FlareRound")
dmginfo:SetAmmoType(FlareRoundAmmoType)
dmginfo:SetDamageType( DMG_BURN )
dmginfo:SetDamage(GetConVar( "sk_plr_dmg_flare_round" ):GetInt()/2)
dmginfo:SetAttacker( attacker )
dmginfo:SetInflictor( self )
	if ( self.Owner:KeyReleased( IN_ATTACK ) || ( !self.Owner:KeyDown( IN_ATTACK ) && self.Sound ) ) then	
		self:Idle()
		end
	if !self.Flare or !IsValid( self.Flare ) then return end
    if self.Flare:WaterLevel() > 0 then self.Flare:Fire( "Die", "0.1", 0 ) end
	for k, v in pairs( ents.FindInSphere( self.Flare:GetPos(), 12 ) ) do
		if IsValid( v ) and ( v:IsNPC() or v:IsPlayer() ) and v != self.Owner and v:Health() > 0 then
			v:Ignite( 30, 1 )
			if self.Flare:IsOnGround() then
			else
			v:TakeDamageInfo( dmginfo )
			 end
			
		end
	end
end

function SWEP:PrimaryAttack()
    if self:Clip1() <= 0 then
	self:SendWeaponAnim(ACT_VM_DRYFIRE)
		self:Reload()
	return
	end
	self.Weapon:SetNextPrimaryFire( CurTime() + 1)
	self.Weapon:EmitSound( FlareFire )
	self:LaunchFlare()	
	self.Weapon:TakePrimaryAmmo( 1 )
	self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
	self.Weapon:SetNetworkedFloat( "LastShootTime", CurTime() )
end

function SWEP:SecondaryAttack()
    if self:Clip1() <= 0 then
		self:SendWeaponAnim(ACT_VM_DRYFIRE)
		self:Reload()
	return
	end
	self.Weapon:SetNextSecondaryFire( CurTime() + 1)
	self.Weapon:EmitSound( FlareFire )
	self:LaunchFlare2()	
	self.Weapon:TakePrimaryAmmo( 1 )
	self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
	self.Weapon:SetNetworkedFloat( "LastShootTime", CurTime() )
end

function SWEP:LaunchFlare()
	local tracer = self.Owner:GetEyeTrace()
	local Forward = self.Owner:EyeAngles():Forward()
	local Right = self.Owner:EyeAngles():Right()
	local Up = self.Owner:EyeAngles():Up()
if SERVER then
	self.Flare = ents.Create("env_flare")
	self.Flare:SetPos( self.Owner:GetShootPos() + Forward * 18 + Right * 6 + Up * -3)
	self.Flare:SetAngles( self.Owner:EyeAngles() )
//	self.Flare:SetKeyValue( "scale", "5" )
	self.Flare:Spawn()
	self.Flare:Activate()
    self.Flare:Fire( "Launch", "1500", 0 )
	self.Flare:Fire( "Die", "30" )
end
end
function SWEP:LaunchFlare2()
	local tracer = self.Owner:GetEyeTrace()
	local Forward = self.Owner:EyeAngles():Forward()
	local Right = self.Owner:EyeAngles():Right()
	local Up = self.Owner:EyeAngles():Up()
if SERVER then
	self.Flare = ents.Create("env_flare")
	self.Flare:SetPos( self.Owner:GetShootPos() + Forward * 18 + Right * 6 + Up * -3)
	self.Flare:SetAngles( self.Owner:EyeAngles() )
//	self.Flare:SetKeyValue( "scale", "5" )
	self.Flare:Spawn()
	self.Flare:Fire( "Launch", "500", 0 )
	self.Flare:SetFriction( 0.85 )
	self.Flare:SetGravity( 1.0 )
	self.Flare:SetMoveType( MOVETYPE_FLYGRAVITY, MOVECOLLIDE_FLY_BOUNCE )
	self.Flare:Activate()
	self.Flare:Fire( "Die", "30" )
end
end

function SWEP:Reload()
	if ( self:Clip1() < self.Primary.ClipSize && self.Owner:GetAmmoCount( self.Primary.Ammo ) > 0 ) then
	if self:DefaultReload( ACT_VM_RELOAD ) then 
	self.Weapon:EmitSound( FlareReload )
	self:SetNextPrimaryFire( CurTime())
	self:SetNextSecondaryFire( CurTime())
	self:NextThink( CurTime() + 0.5 )
	self:Idle()
		end
	end
end

function SWEP:Initialize()
	self:SetWeaponHoldType(self.HoldType)
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