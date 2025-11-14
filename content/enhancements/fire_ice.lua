SMODS.Enhancement {
    key = 'fire',
    atlas = 'Enhancements',
    config = {
      conditional_x_mult = 1.5,
    },
    pos = { x = 2, y = 0 },
    calculate = function(self, card, context)
      if context.main_scoring and context.cardarea == G.play then
        for _, c in ipairs(context.scoring_hand) do
          if SMODS.has_enhancement(c, 'm_supf_ice') then
            return {
              message = "Fire!",
              xmult = card.ability.conditional_x_mult
            }
          end
        end
      end
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.conditional_x_mult } }
    end
}
SMODS.Enhancement {
    key = 'ice',
    atlas = 'Enhancements', 
    pos = { x = 3, y = 0 },
    config = {
      conditional_x_chips = 1.5,
    },
    calculate = function(self, card, context)
      if context.main_scoring and context.cardarea == G.play then
        for _, c in ipairs(context.scoring_hand) do
          if SMODS.has_enhancement(c, 'm_supf_fire') then
            return {
              message = "Ice!",
              xchips = card.ability.conditional_x_chips
            }
          end
        end
      end
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.conditional_x_chips } }
    end
}