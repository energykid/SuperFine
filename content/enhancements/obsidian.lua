SMODS.Enhancement {
    key = 'obsidian',
    atlas = 'Enhancements', 
    pos = { x = 1, y = 0 },
    config = {
        x_chips = 1.5,
        x_mult = 1.5
    },
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    weight = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.x_chips, card.ability.x_mult } }
    end
}