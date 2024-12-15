include('shared.lua')

SWEP.PrintName			= "M67 Fragmentation Grenade"			// 'Nice' Weapon name (Shown on HUD)	
SWEP.Slot				= 4							// Slot in the weapon selection menu
SWEP.SlotPos			= 1							// Position in the slot
SWEP.Instructions	="A U.S. Military M67 fragmentation hand grenade with an M213 four-second fuze. Upon detonation, disperses upwards of 1000 fragments in all directions to produce casualties.\n\nPublished fatality radius of 5 meters and casualty radius of 15 meters, though fragments can fly to and wound at much greater distances.\n\nLMB to throw, RMB to pull out pin, RMB again to release spoon."
SWEP.DrawWeaponInfoBox =true
SWEP.DrawCrosshair	 =false --crosshairs are for big loose pussies
SWEP.BounceWeaponIcon=false

// Override this in your SWEP to set the icon in the weapon selection
SWEP.WepSelectIcon	= surface.GetTextureID("weapons/wep_jack_fraggrenade_WSI")

/*---------------------------------------------------------
	Name: SWEP:CustomAmmoDisplay()
	Desc: Have to override this so you GET an ammocounter
----------------------------------------------------------*/
function SWEP:CustomAmmoDisplay()
end

function SWEP:ViewModelDrawn()
	self:SCKViewModelDrawn()
end

function SWEP:DrawWorldModel()
	self:SCKDrawWorldModel()
end

/*-----------------------------------------------------------
	for sprinting
	and holding your hand out when you're gonna throw
------------------------------------------------------------*/
local MoveAmount=0
function SWEP:GetViewModelPosition(pos,ang)
	local Up=ang:Up()
	local Right=ang:Right()
	local Forward=ang:Forward()

	if(self:GetOwner():KeyDown(IN_SPEED))then
		MoveAmount=MoveAmount+0.5
	else
		MoveAmount=MoveAmount-0.5
	end
	if(MoveAmount>10)then
		MoveAmount=10
	elseif(MoveAmount<0)then
		MoveAmount=0
	end
	pos=pos+Right*-MoveAmount
	pos=pos+Up*-MoveAmount

	if(self.dt.State==5)then
		self.BobScale=0.2
		self.SwayScale=0.2
		ang:RotateAroundAxis(ang:Right(),2.6)
		ang:RotateAroundAxis(ang:Up(),11.4)
		ang:RotateAroundAxis(ang:Forward(),-102.7)
		local NewUp=ang:Up()
		local NewRight=ang:Right()
		local NewForward=ang:Forward()
		pos=pos+NewRight*-9.6
		pos=pos+NewForward*4
		pos=pos+NewUp*5.2
		pos=pos-Up*10
	else
		self.BobScale=2
		self.SwayScale=2
	end
	return pos,ang
end