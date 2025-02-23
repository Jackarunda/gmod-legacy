--armer
--By Jackarunda
AddCSLuaFile('cl_init.lua')
AddCSLuaFile('shared.lua')
include('shared.lua')
function ENT:SpawnFunction(ply,tr)
	local SpawnPos=tr.HitPos+tr.HitNormal*16
	local ent=ents.Create("ent_jack_bodyarmor_vest_sv")
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
	self:SetModel("models/combine_vests/bluevest.mdl")
	self:SetMaterial("models/mat_jack_bodyarmor_sv")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)	
	self:SetSolid(SOLID_VPHYSICS)
	self:DrawShadow(true)
	local phys=self:GetPhysicsObject()
	if phys:IsValid()then
		phys:Wake()
		phys:SetMass(10)
	end
	self:SetUseType(SIMPLE_USE)
	self:SetColor(Color(15,15,50))
end
function ENT:PhysicsCollide(data, physobj)
	if((data.Speed>80)and(data.DeltaTime>0.2))then
		self:EmitSound("Body.ImpactSoft")
	end
end
function ENT:OnTakeDamage(dmginfo)
	self:TakePhysicsDamage(dmginfo)
end
function ENT:Think()
	--pfahahaha
end
function ENT:OnRemove()
	
end
function ENT:Use(activator,caller)
	if(activator:IsPlayer())then
		if((activator.EZarmor)and(#table.GetKeys(activator.EZarmor.items)>0))then return end
		if((not(activator.JackyArmor.Vest))and(not(activator.JackyArmor.Suit)))then
			JackaBodyArmorUpdate(activator,"Vest","Stab Vest",self:GetColor())
			activator:EmitSound("snd_jack_clothequip.wav",70,100)
			JackaGenericUseEffect(activator)
			self:Remove()
		end
	end
end