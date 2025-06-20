-- Rainstorm
NewAttunement('splash', 'supf_rainstorm')
SMODS.DrawStep {
  key = 'supf_rainstorm',
  order = 20,
  func = function(card)
    if card.ability.rainstorm and card.config.center.discovered then
      local timer = G.TIMERS.REAL

      card.visualtimer = card.visualtimer or 0

      card.visualtimer = card.visualtimer + 1

      local timeroff = timer + 0.25

      local scale_mod = 0.07 + 0.02*math.sin(1.8*(timeroff)) + 0.00*math.sin(((timeroff) - math.floor((timeroff)))*math.pi*14)*(1 - ((timeroff) - math.floor((timeroff))))^3
      local rotate_mod = 0.05*math.sin(1.219*(timeroff)) + 0.00*math.sin(((timeroff))*math.pi*5)*(1 - ((timeroff) - math.floor((timeroff))))^2

      local rnd1 = -50 + math.random(100)
      local rnd2 = -50 + math.random(100)
      rnd1 = rnd1 * 0.00025
      rnd2 = rnd2 * 0.00025

      drawFloatingSpriteLegacy(card, "supf_AttunedJokers", { x = 1, y = 2 }, 0, 0.05 - (scale_mod * 0.6), 0, 0, 'rainstorm_background')
      drawFloatingSpriteLegacy(card, "supf_AttunedJokers", { x = 2, y = 2 }, 0, (scale_mod * 1.2), 0, 0, 'rainstorm_foreground')

    end
  end,
  conditions = {vortex = false, facing = "front", discovered = true}
}
SMODS.Joker {

  key = 'rainstorm',

  config = { rainstorm = true, extra = { Xmult = 1.25 } },
  
  rarity = "supf_attuned",
  
  cost = 15,
  
  atlas = 'AttunedJokers',
  pos = { x = 0, y = 2 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = { card.ability.extra.Xmult }
      }
  end,
  
  calculate = function(self, card, context)
    if context.modify_scoring_hand and not context.blueprint then
      context.other_card.should_count_for_rainstorm = nil
      local b = false
      for index, value in ipairs(context.scoring_hand) do
        if (value == context.other_card) then b = true end
      end
      if not b then
        context.other_card.should_count_for_rainstorm = true
        return { 
          add_to_hand = true 
        }
      end
    end
    if context.individual and context.cardarea == G.play then
      if context.other_card.should_count_for_rainstorm then
        return { 
				Xmult_mod = card.ability.extra.Xmult,
        message = localize{ type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult }}
        }
      end
    end
  end
}