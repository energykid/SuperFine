-- Ecstatic Joker
do
SMODS.Joker {

  key = 'ecstaticJoker',

  config = { extra = { Xmult = 1.2 } },
  
  rarity = 2,
  
  cost = 5,
  
  atlas = 'Jokers',
  pos = { x = 0, y = 0 },

  loc_vars = function(self, info_queue, card)
    return {
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
end