-- Lucky Ticket
SMODS.Joker {

  key = 'supf_luckyTicket',

  config = { dolers = 1000, extra = { odds = 500 } },
  
  rarity = 1,
  
  cost = 4,
  
  atlas = 'Jokers',
  pos = { x = 7, y = 0 },

  loc_vars = function(self, info_queue, card)    
    return { vars = { card.ability.dolers, card.ability.extra.odds, getProbability() } }
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