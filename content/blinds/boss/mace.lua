-- The Mace

SMODS.Blind {
    key = 'mace',
    atlas = 'Blinds',
    mult = 1.5,
    pos = { y=4 },
    loc_vars = function(self)
        return {}
    end,
    boss = {min = 0},
    boss_colour = HEX('885259'),
    press_play = function(self)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.6,
            func = function ()
                for num, card in ipairs(G.play.cards) do
                    forceFlipCardToReduce(card, num / 3, 1, num / 20)
                end
                return true
            end
        }))
    end
}

function forceFlipCardToReduce(cards, delayTime, delayExtra, pitch)

    delayTime = delayTime or 0
    pitch = pitch or delayTime
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
                        SMODS.modify_rank(card, -1)
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                blockable = false,
                delay = 1 + delayTime + delayExtra,
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