-- Emphasis

SMODS.Sound {
    key = "emphasis",
    path = "emphasis.ogg"
}

do
SMODS.Joker {

  key = 'emphasis',

  config = { extra = { mult = 20 } },
  
  rarity = 2,
  
  cost = 5,
  
  atlas = 'Jokers',
  pos = { x = 1, y = 1 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = { card.ability.extra.mult }
      }
  end,
  
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card == context.cardarea.cards[#context.cardarea.cards] then
        context.other_card.supf_do_emphasis = true
        return {
          mult_mod = card.ability.extra.mult,
          message = localize{ type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult }}
        }
      end
    end
  end
}
end