--[[---------------------------------------------------------------------------
The fonts that Strife's Banner uses
---------------------------------------------------------------------------]]
local function loadFonts()


    surface.CreateFont("colchester", {
        size = 60,
        weight = 200,
        antialias = true,
        shadow = false,
        font = "colchester"})

    surface.CreateFont("runescape", {
        size = 24,
        weight = 500,
        antialias = false,
        shadow = true,
        font = "runescape"})
		
	    surface.CreateFont("alterna", {
        size = 24,
        weight = 500,
        antialias = true,
        shadow = false,
        font = "alterna"})
end
loadFonts()