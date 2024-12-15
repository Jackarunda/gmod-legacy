AddCSLuaFile()

SWEP.PrintName	= "Hands"
SWEP.Author		= "Jackarunda"
SWEP.Spawnable	= false
SWEP.UseHands	= false
SWEP.DrawAmmo	= false
SWEP.DrawWeaponInfoBox = false
SWEP.DrawCrosshair = false
SWEP.BounceWeaponIcon = false

SWEP.ViewModel	= ""
SWEP.WorldModel	= ""

SWEP.Slot			= 0
SWEP.SlotPos		= 5

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= true
SWEP.Secondary.Ammo			= "none"
function SWEP:Initialize()
	self:SetHoldType("normal")
end

function SWEP:PrimaryAttack()
end

function SWEP:SecondaryAttack()
end

function SWEP:Holster()
	return true
end

function SWEP:Deploy()
	return true
end

function SWEP:Think()
end