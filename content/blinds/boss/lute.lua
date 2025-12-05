-- The Lute

supf_lute_enable = function(self)
    G.E_MANAGER:add_event(
        Event({
            func = function()
                local numDolers = (#G.jokers.cards - G.jokers.config.card_limit)
                if (numDolers ~= 0) then
                    ease_dollars(numDolers, false)
                end
                return true
            end
        })
    )
end

SMODS.Blind {
    key = 'lute',
    atlas = 'Blinds',
    mult = 1.75,
    pos = { y=5 },
    loc_vars = function(self)
        return {}
    end,
    boss = {min = 2},
    boss_colour = HEX('EE7945'),
    set_blind = supf_lute_enable,
    defeat = supf_lute_disable,
    disable = supf_lute_disable
}