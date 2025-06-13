
SMODS.Atlas {
	key = "attunement_burst",
	path = "supf_attunement_burst.png",
	px = 7,
	py = 9
}

function NewAttunementExplosion(x, y)
  local blast = NewParticle(x, y, "supf_AttunementGlow", 1)
  
  blast.FrameTimer = 1

  blast.MaxFrames = 1
  
  blast.ScaleX = 0.2
  blast.ScaleY = 0.2
  
  blast.rotationTimer = math.random(500) / 500 * 3
  blast.rotationScale = 5
  
  blast.ScaleX = 0
  blast.ScaleY = 0

  blast.scaleDest = 7
  
  blast.Update = function(tbl)
    tbl.BaseUpdate(tbl)
    
    tbl.FrameTimer = tbl.FrameTimer + 1
    
    if tbl.FrameTimer < 10 then
      tbl.ScaleX = lerp(tbl.ScaleX, 6.5, 0.65)
      tbl.ScaleY = lerp(tbl.ScaleY, 6.5, 0.65)
    else
      tbl.ScaleX = lerp(tbl.ScaleX, 6.5, -0.35)
      tbl.ScaleY = lerp(tbl.ScaleY, 6.5, -0.35)
    end

    tbl.rotationTimer = tbl.rotationTimer + tbl.rotationScale
    tbl.rotationScale = lerp(tbl.rotationScale, 0, 0.1)
    tbl.Rotation = math.rad(tbl.rotationTimer * 5)

    if (tbl.ScaleX < 0) then 
      tbl.Destroy(tbl)
    end
  end
  
  return blast
end

function NewAttunementBurst(x, y, scale)
  local blast = NewParticle(x, y, "supf_attunement_burst", 6)
  
  blast.Frame = 0

  blast.MaxFrames = 6
  
  blast.Rotation = math.rad(math.random(360))
  blast.rotationIncrement = math.random(500) / 500 * math.rad(80)
  
  blast.ScaleX = scale
  blast.ScaleY = scale

  blast.Xvel = (-100 + math.random(200)) / 5
  blast.Yvel = (-75 + math.random(150)) / 5

  blast.speedDown = 0.8 + (math.random(100) / 100 * 0.1)
  
  blast.Update = function(tbl)
    tbl.BaseUpdate(tbl)

    tbl.Xvel = tbl.Xvel * tbl.speedDown
    tbl.Yvel = tbl.Yvel * tbl.speedDown
    
    tbl.FrameCounter = tbl.FrameCounter + 1
    
    tbl.Rotation = tbl.Rotation + (math.rad(5) * -tbl.rotationIncrement)
    tbl.rotationIncrement = tbl.rotationIncrement * 0.999
    
    if tbl.FrameCounter > 6 then
      tbl.Frame = tbl.Frame + 1
      tbl.FrameCounter = 0
    end
    
    if (tbl.Frame >= tbl.MaxFrames) then 
      tbl.Destroy(tbl) 
    end
  end
  
  return blast
end