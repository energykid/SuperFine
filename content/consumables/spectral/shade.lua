SMODS.Consumable {
    key = 'shade',
    set = 'Spectral',

    atlas = 'Spectrals', 
    pos = { x = 0, y = 1 },
    
    config = { max_highlighted = 3, mod_conv = 'm_supf_ghost' },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return {
            key = 'supf_shade',
            vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv },
            colours = {HEX('9A89BB')}}
        }
    end,
}