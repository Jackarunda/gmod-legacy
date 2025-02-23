AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

function ENT:SpawnFunction(ply,tr)
	local SpawnPos=tr.HitPos+tr.HitNormal*16
	local ent=ents.Create("ent_jack_fgweaponbox_epsilon")
	ent:SetPos(SpawnPos)
	ent:Spawn()
	ent:Activate()
	
	local effectdata=EffectData()
	effectdata:SetEntity(ent)
	util.Effect("propspawn",effectdata)
	
	return ent
end

function ENT:Initialize()
	self:SetModel("models/mass_effect_3/weapons/misc/ammojox.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:DrawShadow(true)
	
	self:SetUseType(SIMPLE_USE)
	
	self:SetCollisionGroup(COLLISION_GROUP_NONE)
	
	local phys=self:GetPhysicsObject()
	if(phys:IsValid())then
		phys:Wake()
		phys:SetMass(75)
		phys:SetMaterial("metal")
	end
	
	self:SetDTBool(0,true)
	
	util.PrecacheSound("snd_jack_boxopen.wav")
	
	util.PrecacheModel("models/weapons/v_halo_jeagle.mdl")
	util.PrecacheModel("models/weapons/w_pistol.mdl")
	util.PrecacheModel("models/mass_effect_3/weapons/misc/battery jack.mdl")
	util.PrecacheModel("models/mass_effect_3/weapons/pistols/m-5 jhalanx.mdl")
	util.PrecacheModel("models/mass_effect_3/weapons/misc/jeatsink.mdl")
	
	util.PrecacheSound("snd_jack_iceloop.wav")
	util.PrecacheSound("snd_jack_fgpistoldraw.wav")
	util.PrecacheSound("snd_jack_smallcharge.wav")
	util.PrecacheSound("snd_jack_iceshot.wav")
	util.PrecacheSound("snd_jack_displaysoff.wav")
	util.PrecacheSound("snd_jack_displayson.wav")
	util.PrecacheSound("snd_jack_beginice.wav")
	util.PrecacheSound("snd_jack_endice.wav")
	util.PrecacheSound("snd_jack_icereload.wav")
	util.PrecacheSound("snd_jack_nuclearfgc_start.wav")
	util.PrecacheSound("snd_jack_nuclearfgc_end.wav")
end

function ENT:Think()
end

function ENT:PhysicsCollide(data,physobj)
	if(data.DeltaTime>.1)then
		if(data.Speed>200)then
			self:EmitSound("Canister.ImpactHard")
		elseif(data.Speed>20)then
			self:EmitSound("Canister.ImpactSoft")
		end
	end
end

function ENT:OnTakeDamage(dmginfo)
	self:TakePhysicsDamage(dmginfo)
end

function ENT:Use(activator)
	if(self.Used)then return end
	if not(activator:HasWeapon("wep_jack_fungun_epsilon"))then
		sound.Play("snd_jack_boxopen.wav",self:GetPos(),70,95)
		activator:EmitSound("BaseCombatCharacter.AmmoPickup")
	
		activator:Give("wep_jack_fungun_epsilon")
		activator:SelectWeapon("wep_jack_fungun_epsilon")
		
		self:SetBodygroup(1,1)
		self.Used=true
		SafeRemoveEntityDelayed(self,30)
		self:SetDTBool(0,false)
	end
end