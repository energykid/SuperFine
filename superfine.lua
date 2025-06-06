SMODS.load_file("utils/math.lua")()
SMODS.load_file("utils/visual.lua")()
SMODS.load_file("systems/particle_manager.lua")()
SMODS.load_file("content/jokers.lua")()

SUPF = {}

SUPF.WINDOW_PAD = {x = 0, y = 0}
SUPF.DRAW_SCALE = 1

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
  
  -- love.graphics.print(tostring(SUPF.WINDOW_PAD.x), 200, 100)
  -- love.graphics.print(tostring(SUPF.WINDOW_PAD.y), 200, 200)
  
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