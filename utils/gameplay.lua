function increaseCardSelection(num)
    SMODS.change_play_limit(num)
    SMODS.change_discard_limit(num)
    SUPF.PLAY_LIMIT_MOD = SUPF.PLAY_LIMIT_MOD + num
end

function getProbability()
    return G.GAME and G.GAME.probabilities.normal or 1
end

function flipCardToEnhance(cards, cardarea, enhancement)

    cards = cards[1] and cards or {cards}

    G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                for i, card in ipairs(cards) do
                    play_sound('tarot1', 1)
                    card:juice_up(0.3, 0.5)
                end
                return true
            end
        }))
        
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    for i, card in ipairs(cards) do
                        card:flip()
                        play_sound('card1', 1)
                        card:juice_up(0.3, 0.3)
                    end
                    return true
                end
            }))
            delay(0.2)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    for i, card in ipairs(cards) do
                        card:set_ability(G.P_CENTERS[enhancement])
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    for i, card in ipairs(cards) do
                        card:flip()
                        play_sound('tarot2', 1, 0.6)
                        card:juice_up(0.3, 0.3)
                    end
                    return true
                end
            }))
        delay(0.5)
end

function forceFlipCardToEnhance(cards, cardarea, enhancement, delayTime, pitch)

    delayTime = delayTime or 0
    pitch = pitch or 0
    cards = cards[1] and cards or {cards}

    G.E_MANAGER:add_event(Event({
            trigger = 'after',
            blockable = false,
            delay = 0.4 + delayTime,
            func = function()
                for i, card in ipairs(cards) do
                    play_sound('tarot1', 1 + pitch)
                    card:juice_up(0.3, 0.5)
                end
                return true
            end
        }))
        
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                blockable = false,
                delay = 0.55 + delayTime,
                func = function()
                    for i, card in ipairs(cards) do
                        card:flip()
                        play_sound('card1', 1 + pitch)
                        card:juice_up(0.3, 0.3)
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                blockable = false,
                delay = 0.85 + delayTime,
                func = function()
                    for i, card in ipairs(cards) do
                        card:set_ability(G.P_CENTERS[enhancement])
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                blockable = false,
                delay = 1 + delayTime,
                func = function()
                    for i, card in ipairs(cards) do
                        card:flip()
                        play_sound('tarot2', 1 + pitch, 0.6)
                        card:juice_up(0.3, 0.3)
                    end
                    return true
                end
            }))
        --delay(1.5 + delayTime)
end