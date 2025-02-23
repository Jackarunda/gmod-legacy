--box
--By Jackarunda
AddCSLuaFile('cl_init.lua')
AddCSLuaFile('shared.lua')
include('shared.lua')
function ENT:SpawnFunction(ply,tr)
	local SpawnPos=tr.HitPos+tr.HitNormal*16
	local ent=ents.Create("ent_jack_aidfood")
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
	self:SetModel("models/props/cs_office/Cardboard_box03.mdl")
	self:SetMaterial("models/mat_jack_aidfood")
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
	self.Remaining=50
	self.NextUseTime=0
end
function ENT:PhysicsCollide(data, physobj)
	if((data.Speed>80)and(data.DeltaTime>0.2))then
		--self:EmitSound("DryWall.ImpactHard")
		self:EmitSound("Cardboard.ImpactHard")
		self:EmitSound("Weapon.ImpactSoft")
	end
end
function ENT:OnTakeDamage(dmginfo)
	self:TakePhysicsDamage(dmginfo)
end
function ENT:Use(activator,caller)
	if(activator:IsPlayer())then
		if(self.NextUseTime<CurTime())then
			self.NextUseTime=CurTime()+20
			self:GetEatenBy(activator)
			JackaGenericUseEffect(activator)
			timer.Simple(.3,function()
				if(IsValid(self))then
					self:GetEatenBy(activator)
				end
			end)
			timer.Simple(.6,function()
				if(IsValid(self))then
					self:GetEatenBy(activator)
				end
			end)
			timer.Simple(.9,function()
				if(IsValid(self))then
					self:GetEatenBy(activator)
				end
			end)
			timer.Simple(1.2,function()
				if(IsValid(self))then
					self:GetEatenBy(activator)
				end
			end)
		end
	end
end
function ENT:GetEatenBy(ply)
	ply:EmitSound("snd_jack_eat"..tostring(math.random(1,9))..".wav",75,math.Rand(90,110))
	ply:ViewPunch(Angle(1,0,0))
	if(ply:Health()<100)then
		ply:SetHealth(ply:Health()+1)
	end
	self.Remaining=self.Remaining-1
	if(self.Remaining<=0)then self:Remove() end
end
function ENT:Think()
	--pfahahaha
end
function ENT:OnRemove()
	
end