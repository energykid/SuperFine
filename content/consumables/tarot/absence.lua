SMODS.Consumable {

    key = 'absence',
    set = 'Tarot',

    atlas = 'Tarots', 
    pos = { x = 0, y = 0 },
    
    config = { max_highlighted = 3 },

    use = function(self, card, area, copier)
        local currenthand = G.hand

        if (card ~= nil) then
            local copyCards = function()
                local debuffableCards = {}
                for index, value in ipairs(currenthand.cards) do
                    if not value.highlighted then
                        debuffableCards[#debuffableCards + 1] = value
                    end
                end
                local debuffedCard = pseudorandom_element(debuffableCards, pseudoseed('supf_absence'))
                if debuffedCard then
                    flipCardsThenRun(debuffedCard, function(c) SMODS.debuff_card(c, true, "supf_perma_debuff") end)
                end
                for i, _card in ipairs(currenthand.highlighted) do
                    local cen_pool = {}
                    for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                        cen_pool[#cen_pool + 1] = enhancement_center.key
                        end
                    end
                    forceFlipCardToEnhance(_card, pseudorandom_element(cen_pool, pseudoseed("supf_absence")), i / 3, i / 10)
                end
            end

            if card.area == G.consumeables and #currenthand.highlighted ~= 0 and #currenthand.highlighted <= card.ability.max_highlighted then 
                copyCards()
            elseif #currenthand.highlighted ~= 0 then 
                copyCards()
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.max_highlighted },
        }
    end
}
