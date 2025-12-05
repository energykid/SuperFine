-- Emphasis

SMODS.Sound {
    key = "emphasis",
    path = "emphasis.ogg"
}

SMODS.Joker {

  key = 'emphasis',

  config = { extra = { mult = 10 } },
  
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
    if context.end_of_round and context.individual then
      if context.other_card.supf_do_emphasis then
        context.other_card.supf_do_emphasis = nil
      end
    end
    if context.individual and context.cardarea == G.play then
      local allNumbered = true
      for _, c in ipairs(G.play.cards) do
        if c:is_face() then allNumbered = false end
      end
      if context.other_card == context.scoring_hand[#context.scoring_hand] and allNumbered then
        return {
          mult_mod = card.ability.extra.mult,
          message = localize{ type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult }},
          sound = 'supf_emphasis'
        }
      end
    end
  end
}