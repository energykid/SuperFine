SMODS.Atlas {
	key = "VoidBlast",
	path = "supf_VoidBlast.png",
	px = 48,
	py = 64
}

SMODS.Sound {
  key = "voidcard_proc",
  path = "voidcard_proc.ogg"
}

function NewVoidBlast(x, y, delay)
  local blast = NewParticle(x, y, "supf_VoidBlast", 10)
  
  blast.Frame = -delay
  
  blast.ScaleX = 2.5
  blast.ScaleY = 2.5
  
  blast.rotationTimer = math.random(500) / 500 * 3
  blast.rotationScale = 20
  
  blast.scaleDest = 7
  blast.ShadowHeight = 1.5
  
  blast.Update = function(tbl)
    tbl.BaseUpdate(tbl)
    
    tbl.FrameCounter = tbl.FrameCounter + 1
    
    if (tbl.Frame >= 3) then
      tbl.rotationTimer = tbl.rotationTimer + 1
      tbl.rotationScale = lerp(tbl.rotationScale, 0, 0.3)
      tbl.Rotation = lerp(tbl.Rotation, math.sin(tbl.rotationTimer) * math.rad(tbl.rotationScale), 0.8)
      tbl.scaleDest = lerp(tbl.scaleDest, 3, 0.35)
      tbl.ScaleX = lerp(tbl.ScaleX, tbl.scaleDest, 0.5)
      tbl.ScaleY = lerp(tbl.ScaleY, tbl.scaleDest, 0.5)
    end
    
    if tbl.FrameCounter >= 4 then
      tbl.Frame = tbl.Frame + 1
      

      if (tbl.Frame == 3) then
        play_sound("supf_voidcard_proc", 0.4 + (math.random(12) / 10), 1)
      end
      
      if (tbl.Frame >= tbl.MaxFrames) then 
        tbl.Destroy(tbl) 
      end
      
      tbl.FrameCounter = 0
    end
  end
  
  return blast
end