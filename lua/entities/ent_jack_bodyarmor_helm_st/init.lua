--armer
--By Jackarunda
AddCSLuaFile('cl_init.lua')
AddCSLuaFile('shared.lua')
include('shared.lua')
function ENT:SpawnFunction(ply,tr)
	local SpawnPos=tr.HitPos+tr.HitNormal*16
	local ent=ents.Create("ent_jack_bodyarmor_helm_st")
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
	self:SetModel("models/player/items/scout/scout_bils.mdl")
	self:SetMaterial("models/mat_jack_helmetmetal")
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
	self:SetColor(Color(42,49,28))
end
function ENT:PhysicsCollide(data, physobj)
	if((data.Speed>80)and(data.DeltaTime>0.2))then
		self:EmitSound("SolidMetal.ImpactSoft")
	end
end
function ENT:OnTakeDamage(dmginfo)
	self:TakePhysicsDamage(dmginfo)
end
function ENT:Think()
	--wat
end
function ENT:OnRemove()
	
end
function ENT:Use(activator,caller)
	if(activator:IsPlayer())then
		if((activator.EZarmor)and(#table.GetKeys(activator.EZarmor.items)>0))then return end
		if((not(activator.JackyArmor.Helmet))and(not(activator.JackyArmor.Suit)))then
			JackaBodyArmorUpdate(activator,"Helmet","Steel",self:GetColor())
			activator:EmitSound("Flesh.ImpactSoft")
			JackaGenericUseEffect(activator)
			self:Remove()
		end
	end
end