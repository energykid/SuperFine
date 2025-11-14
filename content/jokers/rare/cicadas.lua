-- Cicadas

SMODS.Atlas {
	key = "cicada",
	path = "supf_cicada.png",
	px = 14,
	py = 24
}

CicadaTimer = 0

function drawCicada(tbl)
  local r = 0
  if (tbl.xv and tbl.yv) then
    r = math.atan2(tbl.yv, tbl.xv) + math.rad(90)
  end
  drawShadedSprite(tbl.x, tbl.y, r, 1, 1, "supf_cicada")
end

SMODS.DrawStep {
  key = 'supf_cicadas',
  order = 0,
  func = function(card, layer)
    
    if card.ability.cicadasToDraw and card.config.center.discovered then      
      for i, cic in pairs(card.ability.cicadasToDraw) do
        cic.t = cic.t + 1
        local pos = scalePosition(45 / 2, 57 / 2)
        local pos2 = scalePosition(math.sin(cic.t / cic.xmod * 1.2462) * 10, math.sin(cic.t / cic.xmod * 1.1356) * 12)
        cic.xv = (getCardPosition(card).x + (math.sin(cic.t / cic.xmod) * pos.x) + (math.sin(cic.t / cic.xmod * 1.20836) * pos2.x)) - cic.x
        cic.yv = (getCardPosition(card).y + (math.sin(cic.t / cic.ymod) * pos.y) + (math.sin(cic.t / cic.xmod * 1.08326) * pos2.y)) - cic.y
        cic.x = cic.x + cic.xv
        cic.y = cic.y + cic.yv
      end
      
      for i, cic in pairs(card.ability.cicadasToDraw) do
        drawCicada(cic)
      end
    end
  end,
  conditions = {vortex = false, facing = "front", discovered = true}
}

SMODS.Joker {

  key = 'cicadas',

  config = { extra = { mult = 1 }, cicadas = 1, cicadasToDraw = {
      
      {x = 0, y = 0, xmod = 7 + (math.random(1000) / 100), ymod = 7 + (math.random(1000) / 100), t = math.random(1000) / 100}
      
      } },
  
  rarity = 3,
  
  cost = 6,
  
  atlas = 'Jokers',
  pos = { x = 3, y = 0 },

  loc_vars = function(self, info_queue, card)    
    local KEY = "j_supf_cicada"
    if (card.ability.cicadas > 1) then KEY = "j_supf_cicadas" end
    return {
      key = KEY,
      vars = { card.ability.extra.mult, card.ability.cicadas }
      }
  end,
  
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        mult_mod = card.ability.extra.mult,
        message = localize{ type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult }}
      }
    end
    if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
      if (card.ability.extra.mult < 128) then 
        card.ability.extra.mult = card.ability.extra.mult * 2
        card.ability.cicadas = card.ability.cicadas * 2
        
        for i = #card.ability.cicadasToDraw, card.ability.cicadas - 1 do
          table.insert(card.ability.cicadasToDraw, #card.ability.cicadasToDraw, {x = 0, y = 0, xmod = 7 + (math.random(1000) / 100), ymod = 7 + (math.random(1000) / 100), t = math.random(1000) / 100})
        end
        
        return {
          message = "+"..tostring(card.ability.extra.mult / 2).." Mult",
          colour = G.C.RED
        }
      end
    end
  end
}