function getCardPosition(card)
  card = card or {}
  if card ~= {} then
    local xx = card.VT.x * (G.TILESCALE*G.TILESIZE) + (35 * G.TILESCALE)
    local yy = card.VT.y * (G.TILESCALE*G.TILESIZE) + (47 * G.TILESCALE)
    return {x = xx, y = yy}
  else
    return {x = 0, y = 0}
  end
end