SupfParticles = {}

function NewParticle(x, y, atl, numFrames)
  return {
    X = x,
    Y = y,
    ScaleX = 2,
    ScaleY = 2,
    Rotation = 0,
    Atlas = atl,
    Xvel = 0,
    Yvel = 0,
    Frame = 0,
    MaxFrames = numFrames,
    FrameCounter = 0,
    Shadow = true,
    ShadowHeight = 1,
    
    FinalFrame = love.graphics.newQuad(0,0,1,1,1,1),
    
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
        tbl.FinalFrame = love.graphics.newQuad(tbl.Frame, 0, 1, 1, tbl.MaxFrames, 1)
        
        if (tbl.Shadow) then
          
          local width, height = love.graphics.getDimensions()
          
          love.graphics.setColor(0, 0, 0, 0.4)
          love.graphics.draw(
              G.ASSET_ATLAS[tbl.Atlas].image,
              tbl.FinalFrame,
              lerp(tbl.X, width / 2, 0.025 * tbl.ShadowHeight * (G.TILESCALE / 4)),
              lerp(tbl.Y, height / 2, 0.025 * tbl.ShadowHeight * (G.TILESCALE / 4)),
              tbl.Rotation,
              G.ASSET_ATLAS[tbl.Atlas].px * tbl.ScaleX * (G.TILESCALE / 4),
              G.ASSET_ATLAS[tbl.Atlas].py * tbl.ScaleY * (G.TILESCALE / 4),
              0.5, 0.5
          )
        end
        
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(
            G.ASSET_ATLAS[tbl.Atlas].image,
            tbl.FinalFrame,
            tbl.X,
            tbl.Y,
            tbl.Rotation,
            G.ASSET_ATLAS[tbl.Atlas].px * tbl.ScaleX * (G.TILESCALE / 4),
            G.ASSET_ATLAS[tbl.Atlas].py * tbl.ScaleY * (G.TILESCALE / 4),
            0.5, 0.5
        )
      end
    end,
    
    Destroy = function(tbl)
      local i = 1
      for k, v in pairs(SupfParticles) do
        if v == tbl then i = k break end
      end
      table.remove(SupfParticles, i)
    end
  }
end