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

-- Cucumber

SMODS.Joker {

  key = 'supf_cucumber',

  config = { extra = { mult = 15, odds = 3 }, isCucumber = true },
  
  rarity = 1,
  
  cost = 4,
  
  atlas = 'Jokers',
  pos = { x = 2, y = 0 },

  loc_vars = function(self, info_queue, card)
    local KEY = "supf_cucumber"
    if card.ability.extra.mult == 0 then
      KEY = "supf_cucumber_alt"
    end
    
    return { key = KEY, vars = { card.ability.extra.mult, card.ability.extra.odds } }
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
        card.ability.extra.mult = 15
        return {
					message = 'Reset!'
				}
      elseif pseudorandom('supf_cucumber') < G.GAME.probabilities.normal / card.ability.extra.odds then
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
    
    if card.ability.cicadasToDraw then      
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
  end
}

SMODS.Joker {

  key = 'supf_cicadas',

  config = { extra = { mult = 1 }, cicadas = 1, cicadasToDraw = {
      
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

-- Lucky Ticket

SMODS.Joker {

  key = 'supf_luckyTicket',

  config = { dolers = 1000, extra = { odds = 500 } },
  
  rarity = 1,
  
  cost = 4,
  
  atlas = 'Jokers',
  pos = { x = 7, y = 0 },

  loc_vars = function(self, info_queue, card)    
    return { key = "supf_luckyTicket", vars = { card.ability.dolers, card.ability.odds } }
  end,
  
  calculate = function(self, card, context)
    if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
      if pseudorandom('supf_luckyTicket') < G.GAME.probabilities.normal / card.ability.extra.odds then
        return {
          dollars = card.ability.dolers,
					message = 'Jackpot!'
				}
      else
        return {
					message = 'Nope!'
				}
      end
    end
  end
}

-- Wonder

SMODS.Joker {
  key = 'wonder',
  
  config = { extra = { mult = 4 } },
  
  rarity = 1,
  
  cost = 4,
  
  atlas = 'Jokers',
  pos = { x = 6, y = 0 },
  
  loc_vars = function(self, info_queue, card)
    return {
      key = "supf_wonder",
      vars = { card.ability.extra.mult }
    }
  end,
  
  calculate = function(self, card, context)
    
    if context.individual and context.cardarea == G.play then
      if (context.other_card.edition) then
        local amt = card.ability.extra.mult
        return {
          mult_mod = amt,
          message = localize{ type = 'variable', key = 'a_mult', vars = { amt }}
        }
      end
    end
  end
}

-- Whimsy

SMODS.Joker {
  key = 'whimsy',
  
  config = { extra = { chips = 30 } },
  
  rarity = 1,
  
  cost = 4,
  
  atlas = 'Jokers',
  pos = { x = 5, y = 0 },
  
  loc_vars = function(self, info_queue, card)
    return {
      key = "supf_whimsy",
      vars = { card.ability.extra.chips }
    }
  end,
  
  calculate = function(self, card, context)
    
    if context.individual and context.cardarea == G.play then
      if (context.other_card.config.center ~= G.P_CENTERS.c_base) then
        local amt = card.ability.extra.chips
        return {
          chips_mod = amt,
          message = localize{ type = 'variable', key = 'a_chips', vars = { amt }}
        }
      end
    end
  end
}
-- Glimby
SMODS.load_file("content/particles/glimby_explosion.lua")()

SMODS.Atlas {
	key = "glimby_arrow",
	path = "supf_glimby_arrow.png",
	px = 52,
	py = 34
}

SMODS.DrawStep {
  key = 'supf_glimby',
  order = 0,
  func = function(card, layer)
    if card.ability.arrowtimer then
      card.ability.arrowtimer = card.ability.arrowtimer + 1
      local at = card.ability.arrowtimer
      local pos = getCardPosition(card)
      local sc = 3.5 + (math.sin(at / 28) * 0.1)
      drawShadedSprite(pos.x + scalePosition(0, 6).y, pos.y - scalePosition(0, 18).y, math.sin(at / 35) * math.rad(7.5), sc, sc, "supf_glimby_arrow")
    end
  end
}

-- WE GOT GLIMBY!!!!!

SMODS.Joker {
  key = 'glimby',
  
  config = { extra = { Xmult = 3 }, arrowtimer = 0, XmultWhenCucumber = 10, shouldExplode = false },
  
  rarity = 3,
  
  cost = 8,
  
  atlas = 'Jokers',
  pos = { x = 4, y = 0 },
  
  loc_vars = function(self, info_queue, card)
    return {
      key = "supf_glimby",
      vars = { card.ability.extra.Xmult, card.ability.XmultWhenCucumber }
    }
  end,
  
  calculate = function(self, card, context)
    
    if context.joker_main then 
      local amt = card.ability.extra.Xmult
      local slot = 1
      for i, v in ipairs(G.jokers.cards) do
        if G.jokers.cards[i] == card then
          slot = i
          break
        end
      end

      if G.jokers.cards[slot - 1] ~= nil then
        if G.jokers.cards[slot - 1].ability.isCucumber then
          card.ability.shouldExplode = true
          amt = card.ability.XmultWhenCucumber
        end
      end

      if G.jokers.cards[slot + 1] ~= nil then
        if G.jokers.cards[slot + 1].ability.isCucumber then
          card.ability.shouldExplode = true
          if amt == card.ability.XmultWhenCucumber then
            amt = card.ability.XmultWhenCucumber * 2
          else
            amt = card.ability.XmultWhenCucumber
          end
        end
      end
      
      return {
        Xmult_mod = amt,
        message = localize{ type = 'variable', key = 'a_xmult', vars = { amt }}
      }
    end

    if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
      if card.ability.shouldExplode then
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.1,
          blockable = false,
          func = function()
            local pos = getCardPosition(card)
            table.insert(SupfParticles, NewExplosion(pos.x, pos.y))
            play_sound("supf_explosion", 1, 1)
            G.jokers:remove_card(card)
            card:remove()
            card = nil
            return true;
          end
        }))
      end
    end
    
  end
}

-- Peoplewatching
SMODS.Joker {

  key = 'peoplewatching',

  config = { extra = { mult = 20 }, face_cards_scored = 0 },
  
  rarity = 2,
  
  cost = 3,
  
  atlas = 'Jokers',
  pos = { x = 0, y = 0 },

--[[
  loc_vars = function(self, info_queue, card)
    return {
      key = "supf_peoplewatching",
      vars = { card.ability.extra.Xmult }
      }
  end,
]]

  loc_txt = {
    name = 'Peoplewatching',
    text = {
      'Gain {C:mult}+20{} Mult',
      'if played hand',
      'contains at least',
      '{C:attention}3 face cards'
    }
  },
  
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:is_face() then
        card.ability.face_cards_scored = card.ability.face_cards_scored + 1
        if card.ability.face_cards_scored == 3 then
          return {
            message = "Score!",
            colour = G.C.GREEN,
            mult_mod = card.ability.extra.mult
          }
        end
      end
    end
    if context.before then
      card.ability.face_cards_scored = 0
    end
  end
}