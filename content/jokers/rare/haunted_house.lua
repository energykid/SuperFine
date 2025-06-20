-- Ecstatic Joker
do
SMODS.Joker {

  key = 'hauntedHouse',
  
  rarity = 3,
  
  cost = 5,
  
  atlas = 'Jokers',
  pos = { x = 2, y = 1 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = { localize { type = 'name_text', set = 'Enhanced', key = 'm_supf_ghost' } }
      }
  end,
  
  calculate = function(self, card, context)
    if context.cardarea == G.play and context.repetition and next(context.poker_hands['Full House']) then
      if context.other_card == context.scoring_hand[#context.scoring_hand] then
        if context.other_card.config.center.key == "c_base" then
          flipCardToEnhance(context.other_card, 'm_supf_ghost')
        elseif SMODS.has_enhancement(context.other_card, 'm_supf_ghost') then
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