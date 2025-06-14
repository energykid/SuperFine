-- The Stack

SMODS.Sound {
    key = "stack_reducechips",
    path = "stack_reducechips.ogg"
}
SMODS.Blind {
    key = 'stack',
    atlas = 'Blinds',
    mult = 1.75,
    pos = { y=2 },
    loc_vars = function(self)
        return {}
    end,
    boss = {min = 3},
    boss_colour = HEX('804380')
}