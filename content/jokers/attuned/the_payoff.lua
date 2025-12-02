-- The Payoff
NewAttunement('delayed_grat', 'supf_thePayoff')
SMODS.Joker {
    key = "thePayoff",

    blueprint_compat = false,
    
    rarity = "supf_attuned",
    
    cost = 15,
    
    atlas = 'AttunedJokers',

    pos = { x = 0, y = 4 },

    config = { Xmult_gain = 0.25, extra = { dollars = 2, Xmult = 2 } },
    
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult, card.ability.extra.dollars, card.ability.Xmult_gain } }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers then
            if G.GAME.current_round.discards_used == 0 then
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.Xmult_gain
                return {
                    message = "Moving Up!"
                }
            end
        end
        if (context.joker_main) then
            return
            {
                Xmult = card.ability.extra.Xmult
            }
        end
    end,

    calc_dollar_bonus = function(self, card)
        return G.GAME.current_round.discards_used == 0 and G.GAME.current_round.discards_left > 0 and
            G.GAME.current_round.discards_left * card.ability.extra.dollars or nil
    end,
    
    draw = function(self, card, layer)
        if card.config.center.discovered then
        local timer = G.TIMERS.REAL

        card.visualtimer = card.visualtimer or 0

        card.visualtimer = card.visualtimer + 1

        local timeroff = timer + 0.25

        local scale_mod = 0.07 + 0.02*math.sin(1.8*(timeroff)) + 0.00*math.sin(((timeroff) - math.floor((timeroff)))*math.pi*14)*(1 - ((timeroff) - math.floor((timeroff))))^3
        local rotate_mod = 0.05*math.sin(1.219*(timeroff)) + 0.00*math.sin(((timeroff))*math.pi*5)*(1 - ((timeroff) - math.floor((timeroff))))^2

        local sc = (scale_mod * 1.2) - 0.015 + (math.sin(card.visualtimer / 50) * 0.05)

        drawFloatingSprite(card, "supf_AttunedJokers", { x = 1, y = 4 }, {
            rotation = rotate_mod * 0.5, 
            scale = scale_mod * 0.7, 
            position = {x = 0, y = 0}
        }, 'thePayoff_Splotches')

        drawFloatingSprite(card, "supf_AttunedJokers", { x = 2, y = 4 }, {
            rotation = rotate_mod, 
            scale = sc / 2,
            position = {x = 0, y = 0}
        }, 'thePayoff_Stars')

        end
    end,
}