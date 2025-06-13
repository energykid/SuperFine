-- The Scroll

SMODS.Blind {
    key = 'scroll',
    atlas = 'Blinds', 
    pos = { y=0 },
    loc_vars = function(self)
        return {}
    end,
    boss = {min = 0},
    boss_colour = HEX('516936'),
    debuff_hand = function(self, cards, hand, handname, check)
        local suits = {}
        
        for i1, card in ipairs(cards) do
            local b = false
            for i2, suit in ipairs(suits) do
                if (card.config.card.suit == suit) then
                    b = true
                end
            end
            if not b then
                suits[#suits+1] = card.config.card.suit
            end
        end

        return #suits < 2
    end
}