SMODS.Consumable {

    key = 'elements',
    set = 'Tarot',

    atlas = 'Tarots', 
    pos = { x = 2, y = 0 },
    
    config = { max_highlighted = 4 },

    can_use = function(self, card)
        local currenthand = G.hand
        if card.area == G.consumeables then
            if #currenthand.highlighted >= 2 and #currenthand.highlighted ~= 0 then 
                return true
            else
                return false
            end
        else
            return true
        end
    end,

    use = function(self, card, area, copier)
      local currenthand = G.hand
      
      for i, _card in ipairs(currenthand.highlighted) do
        if (i <= 1) then
          forceFlipCardToEnhance(_card, 'm_supf_fire', i / 3, i / 10)
        elseif (i >= #currenthand.highlighted) then
          forceFlipCardToEnhance(_card, 'm_supf_ice', i / 3, i / 10)
        end
      end
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['m_supf_fire']
        info_queue[#info_queue + 1] = G.P_CENTERS['m_supf_ice']
        return {
            vars = {
            localize { type = 'name_text', set = 'Enhanced', key = 'm_supf_fire' },
            localize { type = 'name_text', set = 'Enhanced', key = 'm_supf_ice' }
            }
        }
    end,
}
