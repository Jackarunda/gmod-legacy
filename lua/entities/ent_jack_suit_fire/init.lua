--box
--By Jackarunda
AddCSLuaFile('cl_init.lua')
AddCSLuaFile('shared.lua')
include('shared.lua')
function ENT:SpawnFunction(ply,tr)
	local SpawnPos=tr.HitPos+tr.HitNormal*16
	local ent=ents.Create("ent_jack_suit_fire")
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
	self:SetModel("models/props_junk/cardboard_box003a.mdl")
	self:SetColor(Color(128,128,128))
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)	
	self:SetSolid(SOLID_VPHYSICS)
	self:DrawShadow(true)
	local phys=self:GetPhysicsObject()
	if phys:IsValid()then
		phys:Wake()
		phys:SetMass(45)
	end
	self:SetUseType(SIMPLE_USE)
	self.Remaining=50
	self.NextUseTime=0
end
function ENT:PhysicsCollide(data, physobj)
	if((data.Speed>80)and(data.DeltaTime>0.2))then
		self:EmitSound("Body.ImpactSoft")
	end
end
function ENT:OnTakeDamage(dmginfo)
	self:TakePhysicsDamage(dmginfo)
end
function ENT:Use(activator,caller)
	if(activator:IsPlayer())then
		if not((activator.JackyArmor.Vest)or(activator.JackyArmor.Helmet)or(activator.JackyArmor.Suit))then
			JackaBodyArmorUpdate(activator,"Suit","Fire-Faraday",self:GetColor())
			activator:EmitSound("snd_jack_clothequip.wav",70,90)
			JackaGenericUseEffect(activator)
			self:Remove()
		end
	end
end
function ENT:Think()
	--pfahahaha
end
function ENT:OnRemove()
	
end