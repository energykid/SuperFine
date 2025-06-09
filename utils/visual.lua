function getCardPosition(card)
  card = card or {}
  if card ~= {} then
    local xx = card.CT.x * (G.TILESCALE*G.TILESIZE) + (35 * G.TILESCALE / 2)
    local yy = card.CT.y * (G.TILESCALE*G.TILESIZE) + (47 * G.TILESCALE / 2)
    return {x = xx, y = yy}
  else
    return {x = 0, y = 0}
  end
end

function getAreaPosition(area)
  area = area or {}
  if area ~= {} then
    local xx = area.VT.x * (G.TILESCALE*G.TILESIZE)
    local yy = area.VT.y * (G.TILESCALE*G.TILESIZE)
    return {x = xx, y = yy}
  else
    return {x = 0, y = 0}
  end
end

function getScreenOffset()
  local sc = G.TILESCALE * G.TILESIZE * G.CANV_SCALE
  return {x = SUPF.WINDOW_PAD.x * sc, y = SUPF.WINDOW_PAD.y * sc}
end

function scalePosition(xxx, yyy)
    local xx = xxx * G.TILESCALE
    local yy = yyy * G.TILESCALE
  return {x = xx, y = yy}
end

function drawShadedSprite(x, y, r, sx, sy, atlas, fr, maxfr, shadow)
  r = r or 0
  sx = sx or 1
  sy = sy or sx
  atlas = atlas or ""
  fr = fr or 0
  maxfr = maxfr or 1
  shadow = shadow or 2
  
  local w, h = love.graphics.getDimensions()
  
  if atlas ~= "" then
    love.graphics.setColor(0, 0, 0, 0.4)
    love.graphics.draw(
      G.ASSET_ATLAS[atlas].image,
      love.graphics.newQuad(fr, 0, 1, 1, maxfr, 1),
      lerp(x, w / 2, 0.015 * (shadow / 2)),
      y + scalePosition(0, shadow).y,
      r,
      G.ASSET_ATLAS[atlas].px * (G.TILESCALE / 4) * sx,
      G.ASSET_ATLAS[atlas].py * (G.TILESCALE / 4) * sy,
      0.5, 0.5)
    
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(
      G.ASSET_ATLAS[atlas].image,
      love.graphics.newQuad(fr, 0, 1, 1, maxfr, 1),
      x,
      y,
      r,
      G.ASSET_ATLAS[atlas].px * (G.TILESCALE / 4) * sx,
      G.ASSET_ATLAS[atlas].py * (G.TILESCALE / 4) * sy,
      0.5, 0.5)
  end
end

function drawFloatingSprite(card, atlas, pos, rot, sc, xoff, yoff, index)
  rot = rot or 0
  sc = sc or 1
  index = index or 1

  local spr = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS[atlas], {x = pos.x, y = pos.y})
  spr:set_role({major = card, role_type = 'Glued', draw_major = card})
  spr:draw_shader('dissolve', 0, nil, false, card.children.center, sc, rot, xoff, yoff, nil, 0.6)
  spr:draw_shader('dissolve', nil, nil, false, card.children.center, sc, rot, xoff, yoff)
end