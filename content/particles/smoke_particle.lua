
SMODS.Atlas {
	key = "SmokeParticle",
	path = "supf_SmokeParticle.png",
	px = 12,
	py = 14
}

function NewSmokeParticle(x, y, scale)
  local blast = NewParticle(x, y, "supf_SmokeParticle", 6)
  
  blast.Frame = 0

  blast.MaxFrames = 6
  
  blast.ScaleX = scale
  blast.ScaleY = scale

  blast.Xvel = (-100 + math.random(200)) / 5
  blast.Yvel = (-75 + math.random(150)) / 5

  blast.speedDown = 0.8 + (math.random(100) / 100 * 0.1)
  
  blast.Update = function(tbl)
    tbl.BaseUpdate(tbl)

    tbl.Xvel = tbl.Xvel * tbl.speedDown
    tbl.Yvel = tbl.Yvel * tbl.speedDown
    
    tbl.Yvel = tbl.Yvel - 0.15
    
    tbl.FrameCounter = tbl.FrameCounter + 1
    
    if tbl.FrameCounter > 3 then
      tbl.Frame = tbl.Frame + 1
      tbl.FrameCounter = 0
    end
    
    if (tbl.Frame >= tbl.MaxFrames) then 
      tbl.Destroy(tbl) 
    end
  end
  
  return blast
end