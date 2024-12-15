//local Shit=Material("models/entities/mat_jack_apersbomb")
include('shared.lua')
function ENT:Initialize()
	--dyke
end
function ENT:Draw()
	self:DrawModel()
end
function ENT:OnRemove()
	
end
language.Add("ent_jack_armorpanel_medium","Armored Panel")