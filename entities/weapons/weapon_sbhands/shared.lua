SWEP.PrintName			= "Unarmed" -- This will be shown in the spawn menu, and in the weapon selection menu
SWEP.Author			= "Strife's Banner" -- These two options will be shown when you have the weapon highlighted in the weapon selection menu
SWEP.Instructions		= "Yer fists!"

SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo		= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo		= "none"

SWEP.Weight			= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Slot			= 1
SWEP.SlotPos			= 2
SWEP.DrawAmmo			= false
SWEP.DrawCrosshair		= true

SWEP.WorldModel			= "models/weapons/v_hands.mdl"
SWEP.ViewModel			= "models/weapons/v_hands.mdl"
SWEP.ViewModelFlip = false
SWEP.UseHands = true
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false


--
-- Called when the left mouse button is pressed
--
function SWEP:Initialize()

	self:SetHoldType( "normal" )
	ply = self:GetOwner()
end


function SWEP:PrimaryAttack()

end

--
-- Called when the rightmouse button is pressed
--
function SWEP:SecondaryAttack(tr)
self:GetOwner():SetVelocity(Vector(0, 0, 200))
end

