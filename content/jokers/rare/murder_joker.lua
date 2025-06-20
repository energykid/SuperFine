-- Murder Joker

SMODS.Sound {
    key = "murderjoker",
    path = "murderjoker.ogg"
}

do
SMODS.Joker {

  key = 'murderJoker',

  config = { extra = { Xmult = 1.2 } },
  
  rarity = 3,
  
  cost = 5,
  
  atlas = 'Jokers',
  pos = { x = 3, y = 1 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = { card.ability.extra.Xmult }
      }
  end,
  
  calculate = function(self, card, context)
    if context.before and next(context.poker_hands['Four of a Kind']) then
      card.ability.murder = true
    end
    if context.final_scoring_step and context.cardarea == G.jokers and card.ability.murder then
      local dolers = 0
      for _, c in ipairs(context.scoring_hand) do
        dolers = dolers + math.ceil(c.rank and c.rank / 4 or 2)
      end
      for _, c in ipairs(context.scoring_hand) do
        c.destroyed = true
      end
      G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
              SUPF.MURDER_FRAMES = 10
              play_sound('supf_murderjoker')
              for _, c in ipairs(context.scoring_hand) do
                c:start_dissolve({G.C.RED}, true, 0, true)
              end
              return true
            end
        }))
      card.ability.murder = false
      return {
        dollars = dolers
      }
    end
  end
}
end