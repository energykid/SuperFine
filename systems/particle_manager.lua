Particles = {}

function Particle:new(x, y, atlas, numFrames)
  X = x,
  Y = y,
  Atlas = atlas,
  Xvel = 0,
  Yvel = 0,
  Frame = 0,
  MaxFrames = numFrames,
  FrameCounter = 0,
    
  Update = BaseParticleUpdate,
    
  Draw = BaseParticleDraw,
    
  Destroy = function(tbl)
    local i = 1
    for k, v in pairs(VoidBlasts) do
      if v == tbl then i = k break end
    end
    table.remove(VoidBlasts, i)
end

BaseParticleDraw = function(tbl)
  if vb.Frame >= 0 and tbl.Frame < tbl.MaxFrames then
    local spr = Sprite(tbl.X + 1, tbl.Y + 1, 2.5, 2.5, G.ASSET_ATLAS[tbl.Atlas], { x = tbl.Frame, y = 0 })
    spr:draw()
  end
end

BaseParticleUpdate = function(tbl)
  tbl.X = tbl.X + tbl.Xvel
  tbl.Y = tbl.Y + tbl.Yvel
  tbl.FrameCounter = tbl.FrameCounter + 1
  if tbl.FrameCounter >= 5 then
    tbl.Frame = tbl.Frame + 1
    if (tbl.Frame >= tbl.MaxFrames) then tbl.Destroy(tbl) end
    tbl.FrameCounter = 0
  end
end