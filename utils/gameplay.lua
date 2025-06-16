function increaseCardSelection(num)
    SMODS.change_play_limit(num)
    SMODS.change_discard_limit(num)
    SUPF.PLAY_LIMIT_MOD = SUPF.PLAY_LIMIT_MOD + num
end

function getProbability()
    return G.GAME and G.GAME.probabilities.normal or 1
end

function flipCardToEnhance(card, cardarea, enhancement)
    G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1')
                    card:juice_up(0.3, 0.3)
                    return true
                end
            }))
        delay(0.2)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    card:set_ability(G.P_CENTERS[enhancement])
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('tarot2', 1, 0.6)
                    card:juice_up(0.3, 0.3)
                    return true
                end
            }))
        delay(0.5)
end