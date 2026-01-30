if (SERVER) then
   AddCSLuaFile ("shared.lua");
   SWEP.Weight = 5;
   SWEP.AutoSwitchTo = false;
   SWEP.AutoSwitchFrom = false;
end
SWEP.PrintName = "Brickbat (Headcrab)";
SWEP.Slot = 1;
SWEP.SlotPos = 2;
SWEP.DrawAmmo = false;
SWEP.DrawCrosshair = true;
//SWEP.Author = "Alieneer and The One Epicplayer"; //Unneeded
SWEP.Contact = "";
SWEP.Purpose = "Throw allied headcrabs to attack your enemies!";
SWEP.Instructions = "Left click to throw a headcrab.";
SWEP.Category = "Half-Life 2"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/c_brickbat.mdl";
SWEP.WorldModel = "models/weapons/w_bb_headcrab.mdl";
SWEP.Primary.ClipSize = -1;
SWEP.Primary.DefaultClip = -1;
SWEP.Primary.Automatic = false;
SWEP.Primary.Ammo = "none";
SWEP.Secondary.ClipSize = -1;
SWEP.Secondary.DefaultClip = -1;
SWEP.Secondary.Automatic = false;
SWEP.Secondary.Ammo = "none";
local ShootSound = Sound ("NPC_HeadCrab.Gib");

function SWEP:Initialize()

	self:SetHoldType("melee")

end

function SWEP:Reload()
end
function SWEP:Think()
end
function SWEP:throw_attack ()
	local Forward = self.Owner:EyeAngles():Forward()
	local tr = self.Owner:GetEyeTrace();
	self.Weapon:SendWeaponAnim(ACT_VM_THROW)
	self:EmitSound (ShootSound);
	self.BaseClass.ShootEffects (self);
	if (!SERVER) then return end;
	local ent = ents.Create ("npc_headcrab_fast");
	if ( !IsValid( ent ) ) then return end
	local Forward = self.Owner:GetAimVector()
	local Up = self.Owner:EyeAngles():Up()
	ent:SetPos( self.Owner:GetShootPos() + Forward * 32 + Up * -20)
	ent:SetOwner( self.Owner )
	ent:SetVelocity( Up * 300 + Forward * 400 )
	ent:SetAngles( Angle(0,self.Owner:GetAngles().y,0) )
	ent:SetKeyValue( "spawnflags",4 )
	ent:Spawn();
	ent:Activate()
	if GetConVarNumber("brickbat_playerfriendly") == 1 then 
		ent:AddRelationship("player D_LI 99")
	else ent:AddEntityRelationship(self.Owner, 3, 99)
	end
	ent:SetModel ("models/2001headcrab.mdl")
	timer.Simple(0.5, function() 
		self.Weapon:SendWeaponAnim(ACT_VM_DRAW) 
		if GetConVarNumber("brickbat_killcrabs") == 1 then 
			ent:SetOwner(NULL )
		end
	end)
	self:SetNextPrimaryFire( CurTime() + 1 )
	cleanup.Add(self.Owner, "props", ent);
	undo.Create("Headcrab (Brickbat)");
	undo.AddEntity(ent);
	undo.SetPlayer(self.Owner);
	undo.Finish();
end
function SWEP:PrimaryAttack()
	self:throw_attack ();
end
function SWEP:SecondaryAttack()
end
