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

function getScreenOffset()
  local sc = G.TILESCALE * G.TILESIZE * G.CANV_SCALE
  return {x = SUPF.WINDOW_PAD.x * sc, y = SUPF.WINDOW_PAD.y * sc}
end

function scalePosition(xxx, yyy)
    local xx = xxx * G.TILESCALE
    local yy = yyy * G.TILESCALE
  return {x = xx, y = yy}
end