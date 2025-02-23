//local Shit=Material("models/entities/mat_jack_apersbomb")
include('shared.lua')
language.Add("env_fire","Fire")
function ENT:Initialize()
	--wat
end
function ENT:Draw()
	self:DrawModel()
end
function ENT:OnRemove()
	
end
language.Add("ent_jack_aidfuel_propane","Propane Tank")