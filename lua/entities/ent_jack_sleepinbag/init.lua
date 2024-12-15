--box
--By Jackarunda
AddCSLuaFile('cl_init.lua')
AddCSLuaFile('shared.lua')
include('shared.lua')
function ENT:SpawnFunction(ply,tr)
	local SpawnPos=tr.HitPos+tr.HitNormal*16
	local ent=ents.Create("ent_jack_sleepinbag")
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
	self:SetModel("models/jmod/props/sleeping_bag.mdl")
	self:SetMaterial("models/props_equipment/sleeping_jag1")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)	
	self:SetSolid(SOLID_VPHYSICS)
	self:DrawShadow(true)
	local phys=self:GetPhysicsObject()
	if phys:IsValid()then
		phys:Wake()
		phys:SetMass(35)
	end
	self:SetUseType(SIMPLE_USE)
	self.Playah=nil
	self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	self.NextSpawnTime=0
	self:SetColor(Color(100,100,100))
end
function ENT:PhysicsCollide(data, physobj)
	if((data.Speed>80)and(data.DeltaTime>0.2))then
		self:EmitSound("Body.ImpactSoft")
	end
end
function ENT:OnTakeDamage(dmginfo)
	self:TakePhysicsDamage(dmginfo)
	if((dmginfo:IsDamageType(DMG_BURN))or(dmginfo:IsDamageType(DMG_DIRECT)))then
		if(math.random(1,3)==2)then self:Remove() end
	end
end
function ENT:Use(activator,caller)
	if(activator:IsPlayer())then
		if((self.Playah)and(IsValid(self.Playah)))then
		else
			if(IsValid(activator.JackaSleepPoint))then activator.JackaSleepPoint.Playah=nil;activator.JackaSleepPoint:SetColor(Color(100,100,100)) end
			self.Playah=activator
			activator.JackaSleepPoint=self
			activator:PrintMessage(HUD_PRINTCENTER,"Spawn point set")
			local Col=activator:GetPlayerColor()
			self:SetColor(Color(255*Col.x,255*Col.y,255*Col.z))
		end
	end
end
function ENT:Think()
	--pfahahaha
end
function ENT:OnRemove()
	if(IsValid(self.Playah))then self.Playah.JackaSleepPoint=nil end
end