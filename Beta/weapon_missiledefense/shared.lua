if SERVER then

	AddCSLuaFile( "shared.lua" )
	
end
SWEP.Sound = Sound ("Weapon_MissileDefense.Attack")
SWEP.LastSoundRelease = 0
SWEP.RestartDelay = 0
SWEP.RandomEffectsDelay = 0.2
local MissileDefenseSound = Sound( "Weapon_MissileDefense.Attack")
local MissileDefenseSound2 = Sound( "Weapon_MissileDefense.Turn")
local MissileDefenseSound3 = Sound( "Weapon_MissileDefense.Reload")
if CLIENT then

SWEP.Category = "Half-Life 2"
SWEP.HoldType			= "shotgun"
language.Add("weapon_missiledefense", "Missile Defense")
SWEP.PrintName = "Missile Defense"
SWEP.Slot = 0
SWEP.SlotPos = 4
SWEP.DrawAmmo = true
SWEP.DrawCrosshair = true
SWEP.ViewModelFOV = GetConVar( "viewmodel_fov" )
SWEP.ViewModelFlip = false
SWEP.UseHands = true
SWEP.Purpose = "A heavy machine gun that was taken off a damaged Missile Defense, it still works suprisingly."
SWEP.Instructions = "Hold MOUSE1 to fire and attack missiles."
SWEP.DrawWeaponInfoBox	= true
SWEP.BounceWeaponIcon = false 

end
 

function SWEP:Think() 
	if SERVER then
		if self.Owner:KeyPressed (IN_ATTACK) then 
//		self:EmitSound( MissileDefenseSound2 )
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
				self:EmitSound( MissileDefenseSound3 )
			end
		end
		if not self.Owner:Alive() then
		self:EndSound()
		end
		self.LastFrame = CurTime()
		self.Weapon:SetNWBool ("on", self.SoundPlaying)
			end
		end

function SWEP:Initialize()
		self:SetWeaponHoldType(self.HoldType)

util.PrecacheSound("")
	if CLIENT then
	
		// Create a new table for every weapon instance
		self.VElements = table.FullCopy( self.VElements )
		self.WElements = table.FullCopy( self.WElements )
		self.ViewModelBoneMods = table.FullCopy( self.ViewModelBoneMods )
		self:CreateModels(self.VElements) // create viewmodels
		self:CreateModels(self.WElements) // create worldmodels
		
		// init view model bone build function
		if IsValid(self.Owner) then
			local vm = self.Owner:GetViewModel()
			if IsValid(vm) then
				self:ResetBonePositions(vm)
				
				// Init viewmodel visibility
				if (self.ShowViewModel == nil or self.ShowViewModel) then
					vm:SetColor(Color(255,255,255,255))
				else
					// we set the alpha to 1 instead of 0 because else ViewModelDrawn stops being called
					vm:SetColor(Color(255,255,255,1))
					// ^ stopped working in GMod 13 because you have to do Entity:SetRenderMode(1) for translucency to kick in
					// however for some reason the view model resets to render mode 0 every frame so we just apply a debug material to prevent it from drawing
					vm:SetMaterial("Debug/hsv")	
				end
			end
		end
	end
end

if CLIENT then
	SWEP.vRenderOrder = nil
	function SWEP:ViewModelDrawn()
		
		local vm = self.Owner:GetViewModel()
		if !IsValid(vm) then return end
		
		if (!self.VElements) then return end
		
		self:UpdateBonePositions(vm)
		if (!self.vRenderOrder) then
			
			// we build a render order because sprites need to be drawn after models
			self.vRenderOrder = {}
			for k, v in pairs( self.VElements ) do
				if (v.type == "Model") then
					table.insert(self.vRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.vRenderOrder, k)
				end
			end
			
		end
		for k, name in ipairs( self.vRenderOrder ) do
		
			local v = self.VElements[name]
			if (!v) then self.vRenderOrder = nil break end
			if (v.hide) then continue end
			
			local model = v.modelEnt
			local sprite = v.spriteMaterial
			
			if (!v.bone) then continue end
			
			local pos, ang = self:GetBoneOrientation( self.VElements, v, vm )
			
			if (!pos) then continue end
			
			if (v.type == "Model" and IsValid(model)) then
				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				model:SetAngles(ang)
				//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )
				
				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end
				
				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end
				
				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end
				
				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end
				
			elseif (v.type == "Sprite" and sprite) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
				
			elseif (v.type == "Quad" and v.draw_func) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()
			end
			
		end
		
	end
	SWEP.wRenderOrder = nil
	function SWEP:DrawWorldModel()
		
		if (self.ShowWorldModel == nil or self.ShowWorldModel) then
			self:DrawModel()
		end
		
		if (!self.WElements) then return end
		
		if (!self.wRenderOrder) then
			self.wRenderOrder = {}
			for k, v in pairs( self.WElements ) do
				if (v.type == "Model") then
					table.insert(self.wRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.wRenderOrder, k)
				end
			end
		end
		
		if (IsValid(self.Owner)) then
			bone_ent = self.Owner
		else
			// when the weapon is dropped
			bone_ent = self
		end
		
		for k, name in pairs( self.wRenderOrder ) do
		
			local v = self.WElements[name]
			if (!v) then self.wRenderOrder = nil break end
			if (v.hide) then continue end
			
			local pos, ang
			
			if (v.bone) then
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent )
			else
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent, "ValveBiped.Bip01_R_Hand" )
			end
			
			if (!pos) then continue end
			
			local model = v.modelEnt
			local sprite = v.spriteMaterial
			
			if (v.type == "Model" and IsValid(model)) then
				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				model:SetAngles(ang)
				//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )
				
				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end
				
				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end
				
				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end
				
				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end
				
			elseif (v.type == "Sprite" and sprite) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
				
			elseif (v.type == "Quad" and v.draw_func) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()
			end
			
		end
		end
	end
function SWEP:GetBoneOrientation( basetab, tab, ent, bone_override )
		
		local bone, pos, ang
		if (tab.rel and tab.rel != "") then
			
			local v = basetab[tab.rel]
			
			if (!v) then return end
			
			// Technically, if there exists an element with the same name as a bone
			// you can get in an infinite loop. Let's just hope nobody's that stupid.
			pos, ang = self:GetBoneOrientation( basetab, v, ent )
			
			if (!pos) then return end
			
			pos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
		else
		
			bone = ent:LookupBone(bone_override or tab.bone)
			if (!bone) then return end
			
			pos, ang = Vector(0,0,0), Angle(0,0,0)
			local m = ent:GetBoneMatrix(bone)
			if (m) then
				pos, ang = m:GetTranslation(), m:GetAngles()
			end
			
			if (IsValid(self.Owner) and self.Owner:IsPlayer() and 
				ent == self.Owner:GetViewModel() and self.ViewModelFlip) then
				ang.r = -ang.r // Fixes mirrored models
			end
		
		end
		
		return pos, ang
	end
	function SWEP:CreateModels( tab )
		if (!tab) then return end
		// Create the clientside models here because Garry says we can't do it in the render hook
		for k, v in pairs( tab ) do
			if (v.type == "Model" and v.model and v.model != "" and (!IsValid(v.modelEnt) or v.createdModel != v.model) and 
					string.find(v.model, ".mdl") and file.Exists (v.model, "GAME") ) then
				
				v.modelEnt = ClientsideModel(v.model, RENDER_GROUP_VIEW_MODEL_OPAQUE)
				if (IsValid(v.modelEnt)) then
					v.modelEnt:SetPos(self:GetPos())
					v.modelEnt:SetAngles(self:GetAngles())
					v.modelEnt:SetParent(self)
					v.modelEnt:SetNoDraw(true)
					v.createdModel = v.model
				else
					v.modelEnt = nil
				end
				
			elseif (v.type == "Sprite" and v.sprite and v.sprite != "" and (!v.spriteMaterial or v.createdSprite != v.sprite) 
				and file.Exists ("materials/"..v.sprite..".vmt", "GAME")) then
				
				local name = v.sprite.."-"
				local params = { ["$basetexture"] = v.sprite }
				// make sure we create a unique name based on the selected options
				local tocheck = { "nocull", "additive", "vertexalpha", "vertexcolor", "ignorez" }
				for i, j in pairs( tocheck ) do
					if (v[j]) then
						params["$"..j] = 1
						name = name.."1"
					else
						name = name.."0"
					end
				end

				v.createdSprite = v.sprite
				v.spriteMaterial = CreateMaterial(name,"UnlitGeneric",params)
				
			end
		end
		
	end
	
	local allbones
	local hasGarryFixedBoneScalingYet = false

	function SWEP:UpdateBonePositions(vm)
		
		if self.ViewModelBoneMods then
			
			if (!vm:GetBoneCount()) then return end
			
			// !! WORKAROUND !! //
			// We need to check all model names :/
			local loopthrough = self.ViewModelBoneMods
			if (!hasGarryFixedBoneScalingYet) then
				allbones = {}
				for i=0, vm:GetBoneCount() do
					local bonename = vm:GetBoneName(i)
					if (self.ViewModelBoneMods[bonename]) then 
						allbones[bonename] = self.ViewModelBoneMods[bonename]
					else
						allbones[bonename] = { 
							scale = Vector(1,1,1),
							pos = Vector(0,0,0),
							angle = Angle(0,0,0)
						}
					end
				end
				
				loopthrough = allbones
			end
			// !! ----------- !! //
			
			for k, v in pairs( loopthrough ) do
				local bone = vm:LookupBone(k)
				if (!bone) then continue end
				
				// !! WORKAROUND !! //
				local s = Vector(v.scale.x,v.scale.y,v.scale.z)
				local p = Vector(v.pos.x,v.pos.y,v.pos.z)
				local ms = Vector(1,1,1)
				if (!hasGarryFixedBoneScalingYet) then
					local cur = vm:GetBoneParent(bone)
					while(cur >= 0) do
						local pscale = loopthrough[vm:GetBoneName(cur)].scale
						ms = ms * pscale
						cur = vm:GetBoneParent(cur)
					end
				end
				
				s = s * ms
				// !! ----------- !! //
				
				if vm:GetManipulateBoneScale(bone) != s then
					vm:ManipulateBoneScale( bone, s )
				end
				if vm:GetManipulateBoneAngles(bone) != v.angle then
					vm:ManipulateBoneAngles( bone, v.angle )
				end
				if vm:GetManipulateBonePosition(bone) != p then
					vm:ManipulateBonePosition( bone, p )
				end
			end
		else
			self:ResetBonePositions(vm)
		end
		   
	end
	 
	function SWEP:ResetBonePositions(vm)
		
		if (!vm:GetBoneCount()) then return end
		for i=0, vm:GetBoneCount() do
			vm:ManipulateBoneScale( i, Vector(1, 1, 1) )
			vm:ManipulateBoneAngles( i, Angle(0, 0, 0) )
			vm:ManipulateBonePosition( i, Vector(0, 0, 0) )
		end
		
	end


sound.Add( {
	name = "Weapon_MissileDefense.Attack",
	channel = CHAN_BODY,
	volume = VOL_NORM,
	level = 100,
	pitch = "PITCH_NORM",
	sound = {"weapons/hmg1_1.wav", "weapons/hmg1_2.wav", "weapons/hmg1_3.wav"}

} )
sound.Add( {
	name = "Weapon_MissileDefense.Reload",
	channel = CHAN_BODY,
	volume = VOL_NORM,
	level = 100,
	pitch = "PITCH_NORM",
	sound = "weapons/ar1_boltback.wav"
} )

sound.Add( {
	name = "Weapon_MissileDefense.Turn",
	channel = CHAN_BODY,
	volume = VOL_NORM,
	level = 100,
	pitch = "PITCH_NORM",
	sound = "npc/entity/turret/turret_loop1.wav"

} )

function SWEP:PrimaryAttack()

self.Weapon:SetNextPrimaryFire(CurTime() + 0.05)
local trace = self.Owner:GetEyeTrace()
local attacker = self.Owner
local dmginfo = DamageInfo()
dmginfo:SetDamageForce (self.Owner:GetAimVector())
dmginfo:SetDamageType ( DMG_MISSILEDEFENSE )
		self.Owner:SetAnimation( PLAYER_ATTACK1 )
		self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK )
	bullet = {}
	bullet.Num    = 1
	bullet.Src    = self.Owner:GetShootPos()
	bullet.Dir    = self.Owner:GetAimVector()
	bullet.Spread = Vector(0, 0, 0)
	bullet.Tracer = 4
	bullet.Force  = 4
	bullet.Damage  = 0
dmginfo:SetAttacker( attacker )
dmginfo:SetInflictor( self )

dmginfo:SetDamage( 4000/trace.HitPos:Distance(self.Owner:GetShootPos())* 0.25 + 4)
	bullet.Callback = dmginfo


self.Owner:FireBullets(bullet) 
trace.Entity:TakeDamageInfo( dmginfo )
self.Weapon:EmitSound( MissileDefenseSound )
if string.find(trace.Entity:GetClass(),"rpg") or string.find(trace.Entity:GetClass(),"apc") then
dmginfo:SetDamage( 4000 - trace.HitPos:Distance(self.Owner:GetShootPos()))

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
function SWEP:CreateSound ()
	self.SoundObject = CreateSound (self.Weapon, self.Sound)
	self.SoundObject:Play()
end

function SWEP:EndSound ()
	if self.SoundObject then
		self.SoundObject:Stop()
	end
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
SWEP.ViewModelBoneMods = {
	["ValveBiped.MissileDefense"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(-2, 0, 0), angle = Angle(0, 0, 0) }
}
SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/weapons/c_missile_defense.mdl", bone = "ValveBiped.Pump", rel = "", pos = Vector(9.5, 20, -3.5), angle = Angle(80, 1, -90), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.ViewModel      = "models/weapons/c_missiledefens.mdl"
SWEP.WorldModel   = "models/weapons/c_missile_defense.mdl"
SWEP.HoldType			= "shotgun"
-----------------------------------------------
SWEP.Primary.Delay		= 0.01
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
	function table.FullCopy( tab )
		if (!tab) then return nil end
		
		local res = {}
		for k, v in pairs( tab ) do
			if (type(v) == "table") then
				res[k] = table.FullCopy(v) // recursion ho!
			elseif (type(v) == "Vector") then
				res[k] = Vector(v.x, v.y, v.z)
			elseif (type(v) == "Angle") then
				res[k] = Angle(v.p, v.y, v.r)
			else
				res[k] = v
			end
		end
		
		return res
		
	end
	