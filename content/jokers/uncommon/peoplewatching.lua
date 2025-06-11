-- Peoplewatching
do
SMODS.Joker {

  key = 'peoplewatching',

  config = { extra = { mult = 20 }, face_cards_scored = 0 },
  
  rarity = 2,
  
  cost = 3,
  
  atlas = 'Jokers',
  pos = { x = 3, y = 1 },

  loc_vars = function(self, info_queue, card)
    return {
      key = "supf_peoplewatching",
      vars = { card.ability.extra.Xmult }
      }
  end,
  
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
end

