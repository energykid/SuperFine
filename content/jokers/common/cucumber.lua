-- Cucumber
SMODS.Joker {

  key = 'supf_cucumber',

  config = { extra = { mult = 15, odds = 3, multBack = 15 }, isCucumber = true },
  
  rarity = 1,
  
  cost = 4,
  
  atlas = 'Jokers',
  pos = { x = 2, y = 0 },

  loc_vars = function(self, info_queue, card)
    local KEY = "supf_cucumber"
    if card.ability.extra.mult == 0 then
      KEY = "supf_cucumber_alt"
    end
    
    return { key = KEY, vars = { card.ability.extra.mult, card.ability.extra.odds, card.ability.extra.multBack, getProbability() } }
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
