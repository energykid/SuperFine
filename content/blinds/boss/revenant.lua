-- The Revenant

SMODS.Blind {
    key = 'revenant',
    atlas = 'Blinds',
    mult = 1.5,
    pos = { y=3 },
    loc_vars = function(self)
        return {}
    end,
    boss = {min = 4},
    boss_colour = HEX('6D758D'),
    set_blind = function(self)
        G.E_MANAGER:add_event(Event({
            blocking = false,
            func = function ()
                increaseCardSelection(-1)
                return G.GAME.blind.name ~= 'bl_supf_revenant'
            end
        }))
    end
}