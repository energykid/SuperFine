-- The Sky

supf_sky_enable = function(self)
    local emptySlots = (G.consumeables.config.card_limit - #G.consumeables.cards)
    if emptySlots < 2 then
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, v in ipairs(G.deck.cards) do
                    SMODS.debuff_card(v, true, "supf_sky_debuff")
                end
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            blocking = false,
            blockable = false,
            func = function()
                local emptSlots = (G.consumeables.config.card_limit - #G.consumeables.cards)
                if emptSlots >= 2 then
                    for _, v in ipairs(G.deck.cards) do
                        SMODS.debuff_card(v, false, "supf_sky_debuff")
                    end
                    for _, v in ipairs(G.hand.cards) do
                        SMODS.debuff_card(v, false, "supf_sky_debuff")
                    end
                    return true
                end
                return false
            end
        }))
    end
end

supf_sky_disable = function(self)
    for _, v in ipairs(G.deck.cards) do
        SMODS.debuff_card(v, false, "supf_sky_debuff")
    end
end

SMODS.Blind {
    key = 'sky',
    atlas = 'Blinds',
    mult = 1.75,
    pos = { y=6 },
    loc_vars = function(self)
        return {}
    end,
    boss = {min = 2},
    boss_colour = HEX('5993D9'),
    set_blind = supf_sky_enable,
    disable = supf_sky_disable,
    defeat = supf_sky_disable
}