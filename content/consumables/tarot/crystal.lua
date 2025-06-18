SMODS.Consumable {

    key = 'crystal',
    set = 'Tarot',

    atlas = 'Tarots', 
    pos = { x = 1, y = 0 },
    
    config = { max_highlighted = 2, mod_conv = 'm_supf_obsidian' },

    can_use = function(self, card)
        local currenthand = G.hand
        if card.area == G.consumeables then
            if #currenthand.highlighted <= 2 and #currenthand.highlighted ~= 0 then 
                local b = true
                for _, _card in ipairs(currenthand.highlighted) do
                    if not SMODS.has_enhancement(playing_card, 'm_stone') and not SMODS.has_enhancement(playing_card, 'm_glass') then
                        b = false
                    end
                end
                return b
            else
                return false
            end
        else
            return true
        end
    end,

    use = function(self, card, area, copier)

        local currenthand = G.hand
        local copyCards = function()
            for i, _card in ipairs(currenthand.highlighted) do
                forceFlipCardToEnhance(_card, currenthand, 'm_supf_obsidian', i / 3, i / 10)
            end
        end

        if card.area == G.consumeables and #currenthand.highlighted ~= 0 and #currenthand.highlighted <= 2 then 
            copyCards()
        elseif #currenthand.highlighted ~= 0 then 
            copyCards()
        end
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
