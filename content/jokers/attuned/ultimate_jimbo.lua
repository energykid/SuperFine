-- Blue Java
NewAttunement('Joker', 'supf_ultimateJimbo')

SMODS.DrawStep {
  key = 'supf_ultimateJimbo',
  order = 20,
  func = function(card)
    if card.ability.ultimateJimbo and card.config.center.discovered then
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

      drawFloatingSprite(card, "supf_AttunedJokers", { x = 4, y = 0 }, rotate_mod * 0.5, (scale_mod * 1.2) - 0.015 + (math.sin(card.visualtimer / 50) * 0.05), 0, 0, "ultimate_jimbo_face")
      drawFloatingSprite(card, "supf_AttunedJokers", { x = 5, y = 0 }, 0, 0.1, 0, 0, "ultimate_jimbo_overlay")

    end
  end,
  conditions = {vortex = false, facing = "front", discovered = true}
}
SMODS.Joker {

  key = 'ultimateJimbo',

  config = { ultimateJimbo = true, extra = { mult = 4, Xmult = 1, Xmult_inc = 0.2 } },
  
  rarity = "supf_attuned",
  
  cost = 15,
  
  atlas = 'AttunedJokers',
  pos = { x = 3, y = 0 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = { card.ability.extra.mult, card.ability.extra.Xmult, card.ability.extra.Xmult_inc }
      }
  end,
  
  calculate = function(self, card, context)
    
    if context.joker_main then
      return {
        mult_mod = card.ability.extra.mult,
        Xmult_mod = card.ability.extra.Xmult,
        message = localize{ type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult }}
      }
    end
    if (context.individual and context.cardarea == G.play) or context.discard then
      card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_inc
    end
    if context.end_of_round and context.cardarea == G.jokers then
      card.ability.extra.Xmult = 1
    end
  end
}