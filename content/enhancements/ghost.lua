SMODS.Enhancement {
    key = 'ghost',
    atlas = 'Enhancements', 
    pos = { x = 0, y = 0 },
    update = function(self, card, dt)
        local shouldSelect = false

        for _, reference_card in ipairs(card.area.highlighted) do
            if reference_card == card then
                shouldSelect = true
                break
            end
        end
        
        if shouldSelect and card.area == G.hand and not card.debuff then
            increaseCardSelection()
        end
    end
}