MngParticles = {}

MngParticle = {}

function NewParticle(x, y, atlas, numFrames)
  return {
    X = x,
    Y = y,
    ScaleX = 2,
    ScaleY = 2,
    Rotation = 0,
    Atlas = atlas,
    Xvel = 0,
    Yvel = 0,
    Frame = 0,
    MaxFrames = numFrames,
    FrameCounter = 0,
    
    BaseUpdate = function(tbl)
      tbl.X = tbl.X + tbl.Xvel
      tbl.Y = tbl.Y + tbl.Yvel
    end,
    
    Update = function(tbl)
      tbl.BaseUpdate(tbl)
      tbl.FrameCounter = tbl.FrameCounter + 1
      if tbl.FrameCounter >= 5 then
        tbl.Frame = tbl.Frame + 1
        if (tbl.Frame >= tbl.MaxFrames) then tbl.Destroy(tbl) end
        tbl.FrameCounter = 0
      end
    end,
    
    Draw = function(tbl)
      if tbl.Frame >= 0 and tbl.Frame < tbl.MaxFrames then
        spr = Sprite(tbl.X + 1, tbl.Y + 1, tbl.ScaleX, tbl.ScaleY, G.ASSET_ATLAS[tbl.Atlas], { x = tbl.Frame, y = 0 })
        spr.VT.r = tbl.Rotation
        spr:draw()
      end
    end,
    
    Destroy = function(tbl)
      local i = 1
      for k, v in pairs(MngParticles) do
        if v == tbl then i = k break end
      end
      table.remove(MngParticles, i)
    end
  }
end