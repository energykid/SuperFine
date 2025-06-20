-- Blue Java
NewAttunement('scary_face', 'supf_violentVisage')

SMODS.Joker {

  key = 'violentVisage',

  config = { extra = { chips = 30, mult = 5 } },
  
  rarity = "supf_attuned",
  
  cost = 15,
  
  atlas = 'AttunedJokers',
  pos = { x = 0, y = 3 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = { card.ability.extra.chips, card.ability.extra.mult }
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

      local rnd1 = -50 + math.random(100)
      local rnd2 = -50 + math.random(100)
      rnd1 = rnd1 * 0.00025
      rnd2 = rnd2 * 0.00025

      drawFloatingSpriteLegacy(card, "supf_AttunedJokers", { x = 2, y = 3 }, rotate_mod * 0.2, scale_mod * 0.7, rnd1, rnd2, 'violent_visage_1')
      drawFloatingSpriteLegacy(card, "supf_AttunedJokers", { x = 1, y = 3 }, rotate_mod * 4, (scale_mod * 1.2) - 0.015 + (math.sin(card.visualtimer / 50) * 0.05), rnd1 * 2, rnd2 * 2, 'violent_visage_2')

    end
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:is_face() then
        context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + card.ability.extra.chips
        context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.mult
        return {message = 'Upgrade!', colour = HEX("8F1400")}
      end
    end
  end
}