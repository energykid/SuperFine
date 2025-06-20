-- Blue Java
NewAttunement('cavendish', 'supf_blueJava')

SMODS.Joker {

  key = 'blueJava',

  config = { bluejava = true, extra = { Xmult = 3 }, odds1 = 4, odds2 = 10, add1 = 0.25, add2 = 1, oddsReset = 500 },
  
  rarity = "supf_attuned",
  
  cost = 15,
  
  atlas = 'AttunedJokers',
  pos = { x = 0, y = 1 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = { card.ability.extra.Xmult, card.ability.odds1, card.ability.add1, card.ability.odds2, card.ability.add2, card.ability.oddsReset, getProbability() }
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

      local sc = (scale_mod * 1.2) - 0.015 + (math.sin(card.visualtimer / 50) * 0.05)

      drawFloatingSprite(card, "supf_AttunedJokers", { x = 1, y = 1 }, {
        rotation = rotate_mod * 0.5, 
        scale = scale_mod * 0.7, 
        position = {x = 0, y = 0}
      }, 'blueJava_Lightning')

      drawFloatingSprite(card, "supf_AttunedJokers", { x = 2, y = 1 }, {
        rotation = rotate_mod, 
        scale = sc / 2,
        position = {x = 0, y = 0}
      }, 'blueJava_Banana')

    end
  end,

  calculate = function(self, card, context)
    
    if context.joker_main then
      return {
        Xmult_mod = card.ability.extra.Xmult,
        message = localize{ type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult }}
      }
    end
    
    if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
      if pseudorandom('supf_blueJava') < G.GAME.probabilities.normal / card.ability.odds1 then
        card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.add1
        return {
          message = 'Upgrade!'
        }
      else
        if pseudorandom('supf_blueJava2') < G.GAME.probabilities.normal / card.ability.odds2 then
          card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.add2
          return {
            message = 'Upgrade!'
          }
        else
          if pseudorandom('supf_blueJava3') < G.GAME.probabilities.normal / card.ability.oddsReset then
            card.ability.extra.Xmult = 3
            return {
              message = 'Unfortunate!'
            }
          else
            return {
              message = 'Nope!'
            }
          end
        end
      end
    end
  end
}