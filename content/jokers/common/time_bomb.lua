-- Time Bomb

SMODS.Sound {
    key = "timebomb_boom",
    path = "timebomb_boom.ogg"
}

SMODS.Sound {
    key = "timebomb_tick",
    path = "timebomb_tick.ogg"
}

function tick()
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.01,
        blockable = true,
        func = function()
            play_sound("supf_timebomb_tick", 1, 1)
            return true
        end
    }))
end

SMODS.Joker {

    key = 'timeBomb',

    config = { max_cards_scored = 10, cards_scored = 0, extra = { mult = 20 } },

    rarity = 1,

    cost = 3,

    atlas = 'Jokers',
    pos = { x = 5, y = 1 },

    loc_vars = function(self, info_queue, card)
        return {
        vars = { card.ability.max_cards_scored, card.ability.extra.mult, card.ability.cards_scored }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            card.ability.cards_scored = card.ability.cards_scored + 1
            
            if (card.ability.cards_scored >= card.ability.max_cards_scored) then
                card.ability.cards_scored = 0
                tick()
                return {
                    message = "Kaboom!",
                    colour = G.C.RED,
                    mult_mod = card.ability.extra.mult,
                    sound = "supf_timebomb_boom"
                }
            elseif (card.ability.cards_scored > card.ability.max_cards_scored - 3) then
                tick()
            end
        end
        if context.joker_main then
        end
    end
}