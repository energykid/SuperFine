-- Time Bomb

SMODS.Sound {
    key = "timebomb_boom",
    path = "timebomb_boom.ogg"
}

SMODS.Sound {
    key = "timebomb_tick",
    path = "timebomb_tick.ogg"
}

SMODS.Atlas {
	key = "timebomb_puff",
	path = "supf_timebomb_puff.png",
	px = 12,
	py = 10
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

function boom(card)
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        blockable = true,
        func = function()
            play_sound("supf_timebomb_boom", 1, 1)
            for _ = 1, 10, 1 do
                addParticle(NewCustomSmokeParticle(getCardPosition(card), vec2(math.random(-36, 36), math.random(-27, 27)), "supf_timebomb_puff", 9, 0, function(t) t.Xvel = t.Xvel * 0.8; t.Yvel = t.Yvel * 0.8; t.ScaleX = lerp(t.ScaleX, 7, 0.15); t.ScaleY = lerp(t.ScaleY, 14, 0.15); t.Yvel = t.Yvel - 1 end));
            end
            return true
        end
    }))
end

SMODS.Joker {

    key = 'timeBomb',

    config = { max_cards_scored = 10, cards_scored = 0, extra = { mult = 15 } },

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
                boom(context.other_card)
                return {
                    message = "Kaboom!",
                    colour = G.C.RED,
                    mult_mod = card.ability.extra.mult
                }
            elseif (card.ability.cards_scored >= card.ability.max_cards_scored - 3) then
                tick()
            end
        end
        if context.joker_main then
        end
    end
}