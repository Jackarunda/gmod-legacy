--mark eighty tew jenraal prrpus bawmb
--By Jackarunda

AddCSLuaFile('cl_init.lua')
AddCSLuaFile('shared.lua')
include('shared.lua')

function ENT:SpawnFunction(ply, tr)

	//if not tr.Hit then return end

	local SpawnPos=tr.HitPos+tr.HitNormal*16
	local ent=ents.Create("ent_jack_mark82")
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

	self:SetAngles(Angle(0,0,90))

	self:SetModel("models/props_phx/jk-82.mdl")
	if(math.random(1,4)==3)then
		self:SetMaterial("jhoenix_storms/text"..math.random(1,8))
	end

	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)	
	self:SetSolid(SOLID_VPHYSICS)
	self:DrawShadow(true)
	
	self.Exploded=false

	local phys=self:GetPhysicsObject()
	if phys:IsValid()then
		phys:Wake()
		phys:SetMass(600)
	end
	
	local FuzeModel=ents.Create("prop_dynamic")
	FuzeModel:SetModel("models/props_junk/PopCan01a.mdl")
	FuzeModel:SetMaterial("phoenix_storms/grey_steel")
	FuzeModel:SetPos(self:GetPos()+Vector(62,-10,0))
	FuzeModel:SetAngles(Angle(-90,0,0))
	FuzeModel:SetParent(self)
	FuzeModel:Spawn()
	FuzeModel:Activate()
	self:DeleteOnRemove(FuzeModel)

	self.TailFins=ents.Create("prop_physics")
	self.TailFins:SetModel("models/props_junk/cardboard_box001a.mdl")
	self.TailFins:SetPos(self:GetPos()-self:GetForward()*250+self:GetUp()*10)
	self.TailFins.AreJackyTailFins=true
	self.TailFins:Spawn()
	self.TailFins:Activate()
	self.TailFins:SetNotSolid(true)
	self.TailFins:SetNoDraw(true)
	self:DeleteOnRemove(self.TailFins)
	constraint.Weld(self,self.TailFins,0,0,0,true)

	self.NextUseTime=CurTime()
	self.Heat=0
	
	local Settings=physenv.GetPerformanceSettings()
	if(Settings.MaxVelocity<5000)then Settings.MaxVelocity=5000 end
	physenv.SetPerformanceSettings(Settings)
	
	if not(WireAddon==nil)then self.Inputs=Wire_CreateInputs(self,{"Detonate"}) end
end

function ENT:TriggerInput(iname,value)
	if(value==1)then
		self:Detonate()
	end
end

function ENT:Detonate()

	// OH SHI-
	
	if(self.Exploded)then return end
	self.Exploded=true
	
	local SelfPos=self:LocalToWorld(self:OBBCenter())
	
	sound.Play("BaseExplosionEffect.Sound",SelfPos)
	sound.Play("weapons/explode4.wav",SelfPos,100,150)
	sound.Play("snd_jack_c4splodeclose.wav",SelfPos,110,100)
	sound.Play("snd_jack_c4splodefar.wav",SelfPos,160,100)

	local splad=EffectData()
	splad:SetOrigin(SelfPos)
	splad:SetScale(10)
	util.Effect("eff_jack_bombdetonate",splad,true,true)
	
	self:EmitSound("BaseExplosionEffect.Sound")
	sound.Play("weapons/explode3.wav",self:GetPos(),100,150)
	sound.Play("weapons/explode3.wav",self:GetPos(),100,130)
	sound.Play("weapons/explode3.wav",self:GetPos(),100,120)
	
	local Blamo=ents.Create("ent_jack_bigshrapnelsplosion")
	Blamo:SetPos(SelfPos+Vector(0,0,11))
	Blamo.Owner=self
	Blamo:Spawn()
	Blamo:Activate()
	
	local Spl=ents.Create("ent_jack_plastisplosion")
	Spl:SetPos(SelfPos+Vector(0,0,9))
	Spl.BasePower=500
	Spl.BlastRadius=1500
	Spl.ParentEntity=self
	Spl:Spawn()
	Spl:Activate()

	self:Remove()
end

function ENT:PhysicsCollide(data, physobj)
	if(data.Speed>1500)then
		if(self.Armed)then
			self:Detonate()
		end
	elseif((data.Speed>80)and(data.DeltaTime>0.2))then
		self:EmitSound("Canister.ImpactHard")
	end
end

function ENT:OnTakeDamage(dmginfo)
	local hitter=dmginfo:GetAttacker()
	if((dmginfo:IsExplosionDamage())and(dmginfo:GetDamage()>120))then
		self:Detonate()
	end
	self:TakePhysicsDamage(dmginfo)
end

function ENT:Use(activator,caller)
	if(activator:IsPlayer())then
		if not(self.NextUseTime<CurTime())then return end
		self.NextUseTime=CurTime()+.5
		if not(self.Armed)then
			local Num=activator:GetNetworkedInt("JackyDetGearCount")
			if(Num>0)then
				JackySimpleOrdnanceArm(self,activator,"Set: Impact")
				self.Armed=true
			else
				activator:ChatPrint("You need a Fuzing Equipment to arm the bomb.")
				self.NextUseTime=CurTime()+1.5
				self.NextFuzeTime=CurTime()+1.5
			end
		else
			JackyOrdnanceDisarm(self,activator,"")
			self.Armed=false
			local Wap=activator:GetActiveWeapon()
			if(IsValid(Wap))then Wap:SendWeaponAnim(ACT_VM_DRAW) end
		end
	end
end

function ENT:Think()
	if(self:IsOnFire())then
		self.Heat=self.Heat+1
		if(self.Heat>100)then
			self:Detonate()
		end
	else
		self.Heat=self.Heat-1
	end
end

function ENT:OnRemove()
end