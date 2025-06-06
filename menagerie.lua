SMODS.load_file("math.lua")()
SMODS.load_file("systems/particle_manager.lua")()
SMODS.load_file("content/particles.lua")()
SMODS.load_file("content/jokers.lua")()

tm = 0

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
  
  --[[
  
  tm = tm + 0.2
  if tm >= 10 then tm = 0 end
  
  --local spr2 = Sprite(0.5, 0, 2, 2, G.ASSET_ATLAS["mng_VoidBlast"], { x = math.floor(tm), y = 0 })
  --spr2:draw()
  
  if (#VoidBlasts > 0) then
    for i = 0, #VoidBlasts do
      local vb = nil
      if VoidBlasts[i] ~= nil then
        vb = VoidBlasts[i]
        
        VoidBlasts[i].Update(VoidBlasts[i])
        
        if vb.Frame >= 0 and vb.Frame < 10 then
          local spr = Sprite(vb.X + 1, vb.Y + 1, 2.5, 2.5, G.ASSET_ATLAS["mng_VoidBlast"], { x = vb.Frame, y = 0 })
          spr:draw()
        end
      end
    end
  end
  
  ]]
end