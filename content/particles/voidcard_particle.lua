SMODS.Atlas {
	key = "VoidBlast",
	path = "mng_VoidBlast.png",
	px = 48,
	py = 64
}

SMODS.Sound {
  key = "voidcard_proc",
  path = "voidcard_proc.ogg"
}

function NewVoidBlast(x, y, delay)
  local blast = NewParticle(x, y, "mng_VoidBlast", 10)
  
  blast.Frame = -delay
  
  blast.ScaleX = 2.5
  blast.ScaleY = 2.5
  
  blast.Update = function(tbl)
    tbl.BaseUpdate(tbl)
    
    tbl.FrameCounter = tbl.FrameCounter + 1
    
    if tbl.FrameCounter >= 4 then
      tbl.Frame = tbl.Frame + 1
      

      if (tbl.Frame == 3) then
        play_sound("mng_voidcard_proc", 0.4 + (math.random(12) / 10), 1)
      end
      
      if (tbl.Frame >= tbl.MaxFrames) then 
        tbl.Destroy(tbl) 
      end
      
      tbl.FrameCounter = 0
    end
  end
  
  return blast
end