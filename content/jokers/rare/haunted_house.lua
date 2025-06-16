-- Ecstatic Joker
do
SMODS.Joker {

  key = 'hauntedHouse',

  config = { extra = { odds = 2 } },
  
  rarity = 2,
  
  cost = 5,
  
  atlas = 'Jokers',
  pos = { x = 0, y = 0 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = { card.ability.extra.odds, getProbability() }
      }
  end,
  
  calculate = function(self, card, context)
    if context.cardarea == G.play and context.repetition and next(context.poker_hands['Full House']) then
      if context.other_card == context.scoring_hand[#context.scoring_hand] then
        if context.other_card.ability.name ~= G.P_CENTERS['m_supf_ghost'].name then
          flipCardToEnhance(context.other_card, G.play, 'm_supf_ghost')
        else
          return
          {
            message = "Again!",
            repetitions = 1
          }
        end
      end
    end
  end
}
end