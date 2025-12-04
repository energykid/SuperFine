

function NewCustomSmokeParticle(pos, vel, atlas, scale, rotation, func)
    local blast = NewParticle(pos.x, pos.y, atlas, 6)

    blast.ExtraFunction = func or function(tbl) end

    blast.Frame = 0

    blast.MaxFrames = G.ASSET_ATLAS[atlas].image:getWidth() / G.ASSET_ATLAS[atlas].px
    
    blast.ScaleX = scale
    blast.ScaleY = scale

    blast.Rotation = rotation

    blast.Xvel = vel.x
    blast.Yvel = vel.y

    blast.speedDown = 0.8 + (math.random(100) / 100 * 0.1)
    
    blast.Update = function(tbl)
        tbl.BaseUpdate(tbl)

        tbl.ExtraFunction(tbl)

        tbl.Xvel = tbl.Xvel * tbl.speedDown
        tbl.Yvel = tbl.Yvel * tbl.speedDown
        
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