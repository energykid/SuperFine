SMODS.load_file("math.lua")()
SMODS.load_file("systems/particle_manager.lua")()
SMODS.load_file("content/jokers.lua")()

if SMODS and SMODS.current_mod then
  
	SMODS.Atlas({
		key = "modicon",
		path = "mng_icon.png",
		px = 32,
		py = 32,
	})

end

function Mng_DrawEverything()
  
  for i = 1, #MngParticles do
    if MngParticles[i] ~= nil then
      MngParticles[i].Update(MngParticles[i])
    end
  end
  
  for i = 1, #MngParticles do
    if MngParticles[i] ~= nil then
      MngParticles[i].Draw(MngParticles[i])
    end
  end
  
end