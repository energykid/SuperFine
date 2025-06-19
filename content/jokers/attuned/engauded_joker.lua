NewAttunement('greedy_joker', 'supf_engaudedJoker')

SMODS.Joker {

  key = 'engaudedJoker',

  config = { engaudedjoker = true, extra = { suit = 'Diamonds', minimum = 6 } },
  
  rarity = "supf_attuned",
  
  cost = 15,
  
  atlas = 'AttunedJokers',
  pos = { x = 3, y = 2 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = { 'Diamond', card.ability.extra.minimum, colours = { G.C.SUITS[card.ability.extra.suit] } }
      }
  end,

  draw = function(self, card, layer)
    if card.config.center.discovered then
      local timer = G.TIMERS.REAL

      card.visualtimer = card.visualtimer or 0

      card.visualtimer = card.visualtimer + 1

      local timeroff = timer + 0.25

      local scale_mod = 0.07 + 0.02*math.sin(1.8*(timeroff)) + 0.00*math.sin(((timeroff) - math.floor((timeroff)))*math.pi*14)*(1 - ((timeroff) - math.floor((timeroff))))^3
      local rotate_mod = 0.05*math.sin(1.219*(timeroff)) + 0.00*math.sin(((timeroff))*math.pi*5)*(1 - ((timeroff) - math.floor((timeroff))))^2

      drawFloatingSprite(card, "supf_AttunedJokers", { x = 5, y = 2 }, 0, scale_mod * 0.7, 0, 0, 'engauded_symbol')
      drawFloatingSprite(card, "supf_AttunedJokers", { x = 4, y = 2 }, rotate_mod, (scale_mod * 1.2) - 0.015 + (math.sin(card.visualtimer / 50) * 0.05), 0, 0, 'engauded_face')
    end
  end,
  
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local mlt = 0
      for _, reference_card in ipairs(context.scoring_hand) do
        if reference_card:is_suit(card.ability.extra.suit) then
          mlt = mlt + 4
        end
      end
      if context.other_card:is_suit(card.ability.extra.suit) then
        mlt = math.max(mlt, card.ability.extra.minimum)
        return {
          mult_mod = mlt,
          message = localize{ type = 'variable', key = 'a_mult', vars = { mlt }}
        }
      end
    end
  end
}