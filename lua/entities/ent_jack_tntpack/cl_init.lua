
include('shared.lua')

function ENT:Initialize()

end

function ENT:Draw()

	self:DrawModel()

end

function ENT:OnRemove()

end

language.Add("ent_jack_tntpack","TNT Charge")
killicon.Add("ent_jack_tntpack","vgui/killicons/ent_jack_plastisplosion_KI",Color(255,255,255,255))
