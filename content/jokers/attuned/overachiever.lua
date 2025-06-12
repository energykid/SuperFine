-- Overachiever
NewAttunement('Scholar', 'supf_overachiever')

SMODS.DrawStep {
  key = 'supf_overachiever',
  order = 20,
  func = function(card)
    if card.ability.overachiever then
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

      drawFloatingSprite(card, "supf_AttunedJokers", { x = 2, y = 0 }, rotate_mod, scale_mod * 1.05, (math.sin((card.visualtimer + 7) / 33) * 0.05), (math.sin(card.visualtimer / 32) * 0.05), 2)
      drawFloatingSprite(card, "supf_AttunedJokers", { x = 1, y = 0 }, rotate_mod * 1.1, scale_mod * 1.1, 0, 0, 3)

    end
  end,
  conditions = {vortex = false, facing = "front"}
}
SMODS.Joker {

  key = 'overachiever',

  config = { extra = { mult = 6 }, overachiever = true, repetitions = 3, cards_scored = 0 },
  
  rarity = "supf_attuned",
  
  cost = 15,
  
  atlas = 'AttunedJokers',
  pos = { x = 0, y = 0 },

  loc_vars = function(self, info_queue, card)
    return {
      key = "supf_overachiever",
      vars = { card.ability.repetitions, card.ability.extra.mult }
      }
  end,
  
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:get_id() == 14 then
        return {
          message = "Aced!",
          colour = G.C.RED,
          mult_mod = card.ability.extra.mult
        }
      end
    end
    if context.repetition and context.cardarea == G.play then
      if context.other_card:get_id() == 14 then
        card.ability.cards_scored = card.ability.cards_scored + 1
        if card.ability.cards_scored <= card.ability.repetitions then
          return {
            message = "Again!",
            repetitions = card.ability.repetitions
          }
        end
      end
    end
    if context.final_scoring_step then
      card.ability.cards_scored = 0
    end
  end
}