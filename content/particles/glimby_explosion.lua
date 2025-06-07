
SMODS.Atlas {
	key = "explosion",
	path = "supf_explosion.png",
	px = 72,
	py = 101
}

SMODS.Sound {
  key = "explosion",
  path = "explosion.ogg"
}

function NewExplosion(x, y)
  local blast = NewParticle(x, y, "supf_explosion", 10)
  
  blast.Frame = 0

  blast.MaxFrames = 18
  
  blast.ScaleX = 2
  blast.ScaleY = 2
  
  blast.rotationTimer = math.random(500) / 500 * 3
  blast.rotationScale = 20
  
  blast.scaleDest = 7
  blast.ShadowHeight = 1.5
  
  blast.Update = function(tbl)
    tbl.BaseUpdate(tbl)
    
    tbl.FrameCounter = tbl.FrameCounter + 1
    
    tbl.rotationTimer = tbl.rotationTimer + 1
    tbl.rotationScale = lerp(tbl.rotationScale, 0, 0.3)
    tbl.Rotation = lerp(tbl.Rotation, math.sin(tbl.rotationTimer) * math.rad(tbl.rotationScale), 0.8)
    tbl.scaleDest = lerp(tbl.scaleDest, 4, 0.35)
    tbl.ScaleX = lerp(tbl.ScaleX, tbl.scaleDest, 0.5)
    tbl.ScaleY = lerp(tbl.ScaleY, tbl.scaleDest, 0.5)
    
    tbl.Frame = tbl.Frame + 1
    
    if (tbl.Frame >= tbl.MaxFrames) then 
      tbl.Destroy(tbl) 
    end
    
    tbl.FrameCounter = 0
  end
  
  return blast
end