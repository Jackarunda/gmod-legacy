--fack
--By Jackarunda

AddCSLuaFile('cl_init.lua')
AddCSLuaFile('shared.lua')
include('shared.lua')

function ENT:SpawnFunction(ply, tr)

	//if not tr.Hit then return end

	local SpawnPos=tr.HitPos+tr.HitNormal*16
	local ent=ents.Create("ent_jack_minebox")
	ent:SetPos(SpawnPos)
	ent:SetNetworkedEntity("Owenur",ply)
	ent:Spawn()
	ent:Activate()
	
	local effectdata=EffectData()
	effectdata:SetEntity(ent)
	util.Effect("propspawn",effectdata)
	
	return ent

end

function ENT:Initialize()

	self:SetModel("models/props/CS_militia/footlocker01_closed.mdl")
	self:SetMaterial("models/entities/mat_jack_minebox")

	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:DrawShadow(true)

	local phys=self:GetPhysicsObject()
	if phys:IsValid()then
		phys:Wake()
		phys:SetMass(800)
		phys:SetMaterial("metal")
	end
	
	self.BeingUsed=false
	
	self:SetUseType(SIMPLE_USE)
end

function ENT:PhysicsCollide(data,physobj)
	// Play sound on bounce
	if(data.Speed>150 and data.DeltaTime>0.2)then
		self:EmitSound("Metal_Box.ImpactHard")
		self:EmitSound("Weapon.ImpactSoft")
		self:EmitSound("Weapon.ImpactSoft")
	end
end

function ENT:OnTakeDamage(dmginfo)
	self:TakePhysicsDamage(dmginfo)
end

function ENT:Use(activator,caller)
	if(self.BeingUsed)then return end
	if(activator:IsPlayer())then
		if not(activator:HasWeapon("wep_jack_landmine"))then
			self:SetModel("models/props/CS_militia/footlocker01_open.mdl")
			self:SetMaterial("models/entities/mat_jack_minebox")
			self.BeingUsed=true
			self:EmitSound("vehicles/atv_ammo_open.wav")
			self:EmitSound("BaseCombatCharacter.AmmoPickup")
			self:EmitSound("vehicles/atv_ammo_open.wav")
			activator:Give("wep_jack_landmine")
			activator:SelectWeapon("wep_jack_landmine")
			timer.Simple(.5,function()
				if(IsValid(self))then
					self:SetModel("models/props/CS_militia/footlocker01_closed.mdl")
					self:SetMaterial("models/entities/mat_jack_minebox")
					timer.Simple(4.5,function() if(IsValid(self))then self.BeingUsed=false end end)
					self:EmitSound("vehicles/atv_ammo_close.wav")
					self:EmitSound("vehicles/atv_ammo_close.wav")
				end
			end)
		end
	end
end

function ENT:ProvideForPaintJob()
	self:SetModel("models/props/CS_militia/footlocker01_open.mdl")
	self:SetMaterial("models/entities/mat_jack_minebox")
	self.BeingUsed=true
	self:EmitSound("vehicles/atv_ammo_open.wav")
	timer.Simple(1.5,function()
		if(IsValid(self))then
			self:SetModel("models/props/CS_militia/footlocker01_closed.mdl")
			self:SetMaterial("models/entities/mat_jack_minebox")
			timer.Simple(2,function() if(IsValid(self))then self.BeingUsed=false end end)
			self:EmitSound("vehicles/atv_ammo_close.wav")
		end
	end)
end

function ENT:Think()

end

function ENT:OnRemove()

end