SMODS.Atlas {
	key = "VoidBlast",
	path = "mng_VoidBlast.png",
	px = 48,
	py = 64
}

VoidBlasts = {}
newVoidBlast = function(x, y, delay)
  return {
    X = x,
    Y = y,
    Frame = -delay,
    FrameCounter = 0,
    
    Update = function(tbl)
      tbl.FrameCounter = tbl.FrameCounter + 1
      if tbl.FrameCounter >= 5 then
        tbl.Frame = tbl.Frame + 1
        if (tbl.Frame >= 10) then tbl.Destroy(tbl) end
        tbl.FrameCounter = 0
      end
    end,
    
    Destroy = function(tbl)
      local i = 1
      for k, v in pairs(VoidBlasts) do
        if v == tbl then i = k break end
      end
      table.remove(VoidBlasts, i)
    end
  }
end

SMODS.load_file("content/jokers.lua")()

function Mng_DrawEverything()
  
  if (#VoidBlasts > 0) then
    for i = 0, #VoidBlasts do
      local vb = nil
      if VoidBlasts[i] ~= nil then
        vb = VoidBlasts[i]
        
        VoidBlasts[i].Update(VoidBlasts[i])
        
        if vb.Frame >= 0 and vb.Frame < 10 then
          local spr = Sprite(vb.X + 54, vb.Y + 35.5, 2, 2 * 2, G.ASSET_ATLAS["mng_VoidBlast"], { x = vb.Frame, y = 0 })
          spr:draw()
        end
      end
    end
  end
end