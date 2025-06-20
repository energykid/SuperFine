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
      vars = { card.ability.extra.chips }
    }
  end,
  
  calculate = function(self, card, context)
    
    if context.individual and context.cardarea == G.play then
      if (context.other_card.config.center ~= G.P_CENTERS.c_base) then
        local amt = card.ability.extra.chips
        return {
          chips_mod = amt,
          message = localize{ type = 'variable', key = 'a_chips', vars = { amt }},
          colour = G.C.BLUE
        }
      end
    end
  end
}