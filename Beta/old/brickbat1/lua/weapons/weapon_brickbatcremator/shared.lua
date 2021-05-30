if SERVER then
	AddCSLuaFile ("shared.lua")
	SWEP.Weight		= 5
	SWEP.AutoSwitchTo	= false
	SWEP.AutoSwitchFrom	= false
	SWEP.HoldType		= "grenade"
end
 
if CLIENT then
language.Add("weapon_brickbatcremator", "Brickbat Cremator")

	SWEP.Category = "Half-Life 2 Leak"
	SWEP.PrintName = "Brickbat Cremator"
	SWEP.Slot = 4
	SWEP.SlotPos = 1
	SWEP.DrawAmmo = true
	SWEP.DrawCrosshair = true
	SWEP.ViewModelFOV = GetConVar( "viewmodel_fov" )
	SWEP.ViewModelFlip = false
	SWEP.DrawWeaponInfoBox	= false
	SWEP.WepSelectIcon = surface.GetTextureID("HUD/swepicons/molotov_cocktail") 
	SWEP.BounceWeaponIcon = false 
	SWEP.HoldType		= "grenade"


	
end

SWEP.Spawnable 		= true
SWEP.AdminSpawnable 	= true
SWEP.HoldType		= "grenade"
SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/c_bb_cremator.mdl"
SWEP.WorldModel = "models/weapons/w_bb_cremator.mdl"

game.AddAmmoType( { name = "bp_junk" } )
if ( CLIENT ) then language.Add( "bp_junk_ammo", "Cremator Heads" ) end

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "bp_junk"
 
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

local ShootSound = Sound("Weapon_Crowbar.Single")

function SWEP:Initialize()
		self:SetWeaponHoldType(self.HoldType)
	end
 
function SWEP:Deploy()
	self.Weapon:SendWeaponAnim(ACT_VM_DRAW);
	self:SetNextPrimaryFire( CurTime() + self:SequenceDuration())
	self:SetNextSecondaryFire( CurTime() + self:SequenceDuration())
	self:NextThink( CurTime() + self:SequenceDuration() )
	self:Idle()
   return true
end

function SWEP:Holster( )
	self:StopIdle()
	if timer.Exists("anim_timer"..tostring(self.Weapon)) then
	if timer.Exists("idle_timer"..tostring(self.Weapon)) then
		timer.Remove("anim_timer"..tostring(self.Weapon))
		timer.Remove("idle_timer"..tostring(self.Weapon))
	end
	end

	return true
end

function SWEP:Reload()
end
 
function SWEP:Think()
end
 
function SWEP:Launch (model_file)
	local tr = self.Owner:GetEyeTrace()
	local Forward = self.Owner:EyeAngles():Forward()
	local Right = self.Owner:EyeAngles():Right()
	local Up = self.Owner:EyeAngles():Up()
 
	self:EmitSound(ShootSound)
	self.BaseClass.ShootEffects(self)

	if (!SERVER) then return end
 
	local ent = ents.Create("prop_physics")
	ent:SetModel(model_file)
 
	ent:SetPos( self.Owner:GetShootPos() + Forward * 8 + Right * 6 + Up * -3)
	ent:SetAngles(self.Owner:EyeAngles())
	ent:Spawn()

	local phys = ent:GetPhysicsObject()
 
	if !(phys && IsValid(phys)) then ent:Remove() return end
 
	ent:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
	phys:ApplyForceCenter(self.Owner:GetAimVector() * 90000 )
	timer.Simple(0.25, function() ent:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE) end)
	// Call conversion to weapon entity
	timer.Simple(5, function() self:ConvertToWeapon(ent) end)
end
 
function SWEP:PrimaryAttack()
if ( self.Owner:GetAmmoCount( self.Primary.Ammo ) > 0 ) then
	self:Launch("models/weapons/w_bb_cremator.mdl")
	self.Weapon:SendWeaponAnim(ACT_VM_THROW)
	self:StopIdle()
	self.Weapon:SetNextPrimaryFire( CurTime() + 1.2 )
	timer.Create( "anim_timer"..tostring(self.Weapon), 0.5, 1, function() self:ResetAnim() end )
	timer.Create( "idle_timer"..tostring(self.Weapon), 1.5, 1, function() self:Idle() end )
	self:TakePrimaryAmmo( 1 )
	end
	
end

function SWEP:SecondaryAttack()
end

function SWEP:ResetAnim( )

	self.Weapon:SendWeaponAnim( ACT_VM_DRAW )

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

// Bubba's messy code
function SWEP:ConvertToWeapon(item)
if ( !IsValid(item)) then return end
local replacement = ents.Create("weapon_brickbatcremator")
replacement:SetPos(item:GetPos())
replacement:SetAngles(item:GetAngles())
replacement:Spawn()
item:Remove()
end