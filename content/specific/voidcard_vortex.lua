TexturePath = SMODS.MODS_DIR .. "/MyMenagerie/assets/2x/mng_VoidBlast.png"
VoidBlastTexture = love.graphics.newImage(TexturePath)

VoidBlasts = {}

newVoidBlast = function(x, y, delay)
  return {
    X = x,
    Y = y,
    Frame = -delay,
    FrameCounter = 0,
    
    Update = function(tbl)
      tbl.FrameCounter = tbl.FrameCounter + 1
      if tbl.FrameCounter >= 3 then
        tbl.Frame = tbl.Frame + 1
        if (tbl.Frame > 10) then tbl.Destroy(tbl) end
      end
    end
    
    Destroy = function(tbl)
      local i = 1
      for k, v in pairs(VoidBlasts) do
        if v == tbl then i = k break end
      end
      table.remove(VoidBlasts, i)
    end
  }
end

G.E_MANAGER:add_event(Event({
    func = function() 
      for i = 1, #VoidBlasts do
        VoidBlasts[i].Update(VoidBlasts[i])
      end
    end
}))

SMODS.DrawStep {
  key = "draw_Voidvortex",
  order = 100,
  func = function(card, layer)
    if layer == 'card' then
      for i = 1, #VoidBlasts do
        local vb = VoidBlasts[i]
        
        love.graphics.draw(VoidBlastTexture, 
          love.graphics.newQuad(math.max(vb.Frame, 0) * 48, 0, 48, 64, 480, 64),
          vb.X,
          vb.Y)
      end
    end
  end
}