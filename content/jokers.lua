SMODS.Atlas {
	key = "Jokers",
	path = "supf_Jokers.png",
	px = 71,
	py = 95
}

-- Ecstatic Joker
SMODS.Joker {

  key = 'ecstaticJoker',

  config = { extra = { Xmult = 1.2 } },
  
  rarity = 2,
  
  cost = 5,
  
  atlas = 'Jokers',
  pos = { x = 0, y = 0 },

  loc_vars = function(self, info_queue, card)
    return {
      key = "supf_ecstaticJoker",
      vars = { card.ability.extra.Xmult }
      }
  end,
  
  calculate = function(self, card, context)
    if context.joker_main then
      return {
				Xmult_mod = card.ability.extra.Xmult,
        message = localize{ type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult }}
      }
    end
  end
}

-- Cucumber
SMODS.Joker {

  key = 'supf_cucumber',

  config = { extra = { mult = 15, odds = 3 } },
  
  rarity = 1,
  
  cost = 4,
  
  atlas = 'Jokers',
  pos = { x = 2, y = 0 },

  loc_vars = function(self, info_queue, card)
    local KEY = "supf_cucumber"
    if card.ability.extra.mult == 0 then
      KEY = "supf_cucumber_alt"
    end
    
    return { key = KEY }
  end,
  
  calculate = function(self, card, context)
    if context.joker_main then
      if card.ability.extra.mult ~= 0 then 
        return {
          mult_mod = card.ability.extra.mult,
          message = localize{ type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult }}
        }
      end
    end
    if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
      if card.ability.extra.mult == 0 then 
        card.ability.extra.mult = 10 
        return {
					message = 'Reset!'
				}
      elseif pseudorandom('gros_michel2') < G.GAME.probabilities.normal / card.ability.extra.odds then
        card.ability.extra.mult = 0
        return {
					message = 'Disabled!'
				}
      end
    end
  end
}

-- Cicadas
SMODS.Atlas {
	key = "cicada",
	path = "supf_cicada.png",
	px = 14,
	py = 24
}

CicadaTimer = 0

function drawCicada(tbl)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(
    G.ASSET_ATLAS["supf_cicada"].image,
    love.graphics.newQuad(0, 0, 1, 1, 1, 1),
    tbl.x,
    tbl.y,
    0,
    G.ASSET_ATLAS["supf_cicada"].px * (G.TILESCALE / 4),
    G.ASSET_ATLAS["supf_cicada"].py * (G.TILESCALE / 4),
    0.5, 0.5)
end

SMODS.DrawStep {
  key = 'supf_cicadas',
  order = 0,
  func = function(card, layer)
    
    if card.ability.cicadasToDraw then      
      for i, cic in pairs(card.ability.cicadasToDraw) do
        cic.t = cic.t + 1
        cic.x = getCardPosition(card).x - 17.5 + (math.sin(cic.t / cic.xmod) * 35)
        cic.y = getCardPosition(card).y - 17.5 + (math.sin(cic.t / cic.ymod) * 35)
      end
      
      for i, cic in pairs(card.ability.cicadasToDraw) do
        drawCicada(cic)
      end
    end
  end
}

SMODS.Joker {

  key = 'supf_cicadas',

  config = { extra = { mult = 2 }, cicadas = 1, cicadasToDraw = {
      
      {x = 0, y = 0, xmod = 7 + (math.random(1000) / 100), ymod = 7 + (math.random(1000) / 100), t = math.random(1000) / 100}
      
      } },
  
  rarity = 3,
  
  cost = 6,
  
  atlas = 'Jokers',
  pos = { x = 3, y = 0 },

  loc_vars = function(self, info_queue, card)    
    local KEY = "supf_cicada"
    if (card.ability.cicadas > 1) then KEY = "supf_cicadas" end
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
      if (card.ability.extra.mult < 1024) then 
        card.ability.extra.mult = card.ability.extra.mult * 2
        card.ability.cicadas = card.ability.cicadas * 2
        
        for i = #card.ability.cicadasToDraw, card.ability.cicadas - 1 do
          table.insert(card.ability.cicadasToDraw, #card.ability.cicadasToDraw, {x = 0, y = 0, xmod = 7 + (math.random(1000) / 100), ymod = 7 + (math.random(1000) / 100), t = math.random(1000) / 100})
        end
      end
    end
  end
}

-- Voidcard
SMODS.load_file("content/particles/voidcard_particle.lua")()
SMODS.Joker {
  key = 'voidcard',
  
  config = { extra = { Xmult = 1 }, amount = 1 },
  
  rarity = 3,
  
  cost = 6,
  
  atlas = 'Jokers',
  pos = { x = 1, y = 0 },
  
  loc_vars = function(self, info_queue, card)
    return {
      key = "supf_voidcard",
      vars = { card.ability.extra.Xmult }
    }
  end,
  
  calculate = function(self, card, context)
    if context.before then
      card.ability.amount = 1
      local myPosition = 0
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then
          myPosition = i
          break
        end
      end
      for i = 1, myPosition - 1 do
        local pos = getCardPosition(G.jokers.cards[i])
        local blst = NewVoidBlast(pos.x, pos.y, i)
        table.insert(SupfParticles, #SupfParticles + 1, blst)
        G.jokers.cards[i].VT.scale = G.jokers.cards[i].VT.scale * 0.8
        SMODS.debuff_card(G.jokers.cards[i], true, 'supf_cardVoided')
        card.ability.amount = card.ability.amount + 1
      end
      if (myPosition ~= 0) then
        return {
          message = "Voided",
          colour = G.C.JOKER_GREY
        }
      end
    end
    
    if context.joker_main then 
      local amt = card.ability.extra.Xmult * card.ability.amount
      return {
        Xmult_mod = amt,
        message = localize{ type = 'variable', key = 'a_xmult', vars = { amt }}
      }
    end
    
    if context.selling_card and context.card == card then
      for i = 1, #G.jokers.cards do
        SMODS.debuff_card(G.jokers.cards[i], false, 'supf_cardVoided')
      end
    end
      
    if context.end_of_round then
      for i = 1, #G.jokers.cards do
        SMODS.debuff_card(G.jokers.cards[i], false, 'supf_cardVoided')
      end
    end
  end
}
