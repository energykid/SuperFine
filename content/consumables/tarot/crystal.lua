SMODS.Consumable {

    key = 'crystal',
    set = 'Tarot',

    atlas = 'Tarots', 
    pos = { x = 1, y = 0 },
    
    config = { max_highlighted = 2, mod_conv = 'm_supf_obsidian' },

    can_use = function(self, card)
        local currenthand = G.hand
        if card.area == G.consumeables then
            if #currenthand.highlighted <= 2 then 
                for i, _card in ipairs(currenthand.highlighted) do
                    if (_card.ability.name ~= G.P_CENTERS['m_stone'].name) and (_card.ability.name ~= G.P_CENTERS['m_glass'].name) then
                        return false
                    end
                    return true
                end
            end
        else
            return true
        end
        return false
    end,

    use = function(self, card, area, copier)

        local currenthand = G.hand
        local copyCards = function() 
            for _, _card in ipairs(currenthand.highlighted) do
                flipCardToEnhance(_card, currenthand, 'm_supf_obsidian')
            end
        end

        if card.area == G.consumeables then copyCards() elseif #currenthand.highlighted ~= 0 then copyCards() end
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return {
            vars = { card.ability.max_highlighted, 
            localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv },
            localize { type = 'name_text', set = 'Enhanced', key = 'm_stone' },
            localize { type = 'name_text', set = 'Enhanced', key = 'm_glass' }} 
        }
    end,
}
