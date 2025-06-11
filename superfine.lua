SMODS.load_file("utils/math.lua")()
SMODS.load_file("utils/visual.lua")()
SMODS.load_file("utils/file.lua")()
SMODS.load_file("systems/particle_manager.lua")()
SMODS.load_file("content/jokers_main.lua")()

SUPF = {}

SUPF.WINDOW_PAD = {x = 0, y = 0}
SUPF.DRAW_SCALE = 1
SUPF.FLOATING_SPRITES = {}

if SMODS and SMODS.current_mod then
  
	SMODS.Atlas({
		key = "modicon",
		path = "supf_icon.png",
		px = 32,
		py = 32,
	})

end

function Supf_DrawEverything()
  
  SUPF.DRAW_SCALE = G.TILESCALE / 4
  
  for i = 1, #SupfParticles do
    if SupfParticles[i] ~= nil then
      SupfParticles[i].Update(SupfParticles[i])
    end
  end
  
  for i = 1, #SupfParticles do
    if SupfParticles[i] ~= nil then
      SupfParticles[i].Draw(SupfParticles[i])
    end
  end
  
end