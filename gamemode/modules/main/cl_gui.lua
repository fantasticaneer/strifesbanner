
-- hide default health / shieldbattery
local hide = {
	["CHudHealth"] = true,
	["CHudBattery"] = true
}

hook.Add( "HUDShouldDraw", "HideHUD", function( name )
	if ( hide[ name ] ) then return false end

	-- Don't return anything here, it may break other addons that rely on this hook.
end )

-- Derma stuff begins
local TexturedQuadStructure = { -- this thing sets the texture for the character Dframe
	texture = surface.GetTextureID( 'vgui/menu/dermascroll' ),
	color	= Color( 255, 0, 255, 255 ),
	x 	= 0,
	y 	= 0,
	w 	= ( ScrW() * 0.8 ),
	h 	= ( ScrH() * 0.45 ),
}

function newcharframe()
	-- hi fantastic here these are the infos you need to get
	-- LocalPlayer():GetNWString("sex") / players sex
	-- LocalPlayer():GetNWString("model") / players model filepath
	-- LocalPlayer():GetNWString("firstname") / players firstname
	-- LocalPlayer():GetNWString("lastname") / players lastname

        local frame1 = vgui.Create("DFrame")
        surface.PlaySound( "strifesbanner/sbintro.wav" )
        frame1:SetPos( ((ScrW() / 2) - (ScrW() * 0.4)) , ((ScrH() / 2) - (ScrH() * 0.225)))
        frame1:SetSize( ScrW() * 0.8, ScrH() * 0.45 )
		frame1:SetTitle(LocalPlayer():GetNWString("firstname") .. " " .. LocalPlayer():GetNWString("lastname"))
        frame1:MakePopup()
		frame1.Paint = function( self, w, h ) -- 'function Frame:Paint( w, h )' works too
		frame1:ShowCloseButton(false)
	draw.TexturedQuad( TexturedQuadStructure ) -- Draw a red box instead of the frame
end
		local acceptb = vgui.Create("DButton", frame1) -- making a button for accepting new character stuff
		acceptb:SetSize( ScrW() * 0.12, ScrH() * 0.04 )
		acceptb:SetPos( (((ScrW() * 0.8) / 2) - (ScrW() * 0.06)), (ScrH() * 0.40))
		acceptb:SetText( "Accept New Character" )
	acceptb.DoClick = function()
		print( "Player Accept Button Pressed" )
		frame1:Close()
	end
	local ava = vgui.Create( "DModelPanel" , frame1 ) -- an avatar image showing their selected model
	ava:SetModel( "models/player/kleiner.mdl" ) -- Change this later to whatever the player clicks on
	ava:SetSize( ScrW() * 0.4, ScrH() * 0.4 )
	ava:SetPos( (((ScrW() * 0.8) / 2)), (ScrH() * 0.01) )
	function ava:LayoutEntity( Entity ) return end -- disables default rotation
	
	function ava:LayoutEntity( ent ) -- sets the avatar fov and plays an animation

	ava:SetFOV( 90 )	-- update FOV
	ent:SetSequence( ent:LookupSequence( "TAUNT_LAUGH" ) )	-- FLEX
	if ( ent:GetCycle() >= 0.95 ) then ent:SetCycle( 0.05 ) end	-- YOUR
	ava:RunAnimation()	-- MUSCLES
end
	
end
concommand.Add("newcharframe", newcharframe)
-- End of derma stuff
