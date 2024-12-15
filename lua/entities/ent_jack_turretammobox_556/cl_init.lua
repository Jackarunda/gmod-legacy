//local Shit=Material("models/entities/mat_jack_apersbomb")
include('shared.lua')
ENT.Base="ent_jack_turretammobox_base"
function ENT:Initialize()
	--wat
end
function ENT:Draw()
	self:DrawModel()
end
function ENT:OnRemove()
	
end
language.Add("ent_jack_ammobox_556","5.56x45mm AmmoBox")