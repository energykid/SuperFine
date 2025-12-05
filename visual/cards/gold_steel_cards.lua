SMODS.Sound {
	key = "gold_card_shine",
	path = "gold_card_shine.ogg"
}
SMODS.Sound {
	key = "steel_card_shine",
	path = "steel_card_shine.ogg"
}

SUPF.GOLD = 0
SMODS.Enhancement:take_ownership('gold',
    {
	calculate = function(self, card, context)
		if context.end_of_round and context.other_card == card then
            SUPF.GOLD = 0
            G.E_MANAGER:add_event(Event({
                position = 'before',
                func = function()
                    play_sound('supf_gold_card_shine', 1 + (SUPF.GOLD * 0.1))
                    card.ability.supf_shine_timer = 0
                    card.ability.supf_shine = 0
                    SUPF.GOLD = SUPF.GOLD + 1
                    return true
                end
            }))
            delay(0.4)
        end
	end
    },
    true
)
SUPF.STEEL = 0
SMODS.Enhancement:take_ownership('steel',
    {
	calculate = function(self, card, context)
		if context.before and context.cardarea == G.hand then
            G.E_MANAGER:add_event(Event({
                position = 'after',
                func = function()
                    play_sound('supf_steel_card_shine', 1 + (SUPF.STEEL * 0.1))
                    card.ability.supf_shine_timer = 0
                    card.ability.supf_shine = 0
                    SUPF.STEEL = SUPF.STEEL + 1
                    return true
                end
            }))
            delay(0.6)
        end
	end
    },
    true
)

SMODS.Atlas {
	key = "card_shine",
	path = "supf_card_shine.png",
	px = 71,
	py = 96
}

SMODS.DrawStep({
    key = "m_gold",
    order = 0,
    func = function(card, layer)
        if getSupfModule("visual") then
            if card.ability.supf_shine then
                drawFloatingSprite(card, "supf_card_shine", vec2(card.ability.supf_shine,0), {scale = 0, shadowLength = 0}, "supf_cardShineVisual_"..tostring(card.ability.supf_shine))
                card.ability.supf_shine_timer = card.ability.supf_shine_timer + 1
                if (card.ability.supf_shine_timer >= 3) then card.ability.supf_shine_timer = 0; card.ability.supf_shine = card.ability.supf_shine + 1 end
                if card.ability.supf_shine > 7 then
                    card.ability.supf_shine = nil
                    card.ability.supf_shine_timer = nil
                end
            end
        end
    end,
    conditions = {vortex = false, facing = "front", discovered = true}
})
SMODS.DrawStep({
    key = "m_steel",
    order = 0,
    func = function(card, layer)
        if getSupfModule("visual") then
            if card.ability.supf_shine then
                drawFloatingSprite(card, "supf_card_shine", vec2(card.ability.supf_shine,0), {scale = 0, shadowLength = 0}, "supf_cardShineVisual_"..tostring(card.ability.supf_shine))
                card.ability.supf_shine_timer = card.ability.supf_shine_timer + 0.5
                if (card.ability.supf_shine_timer >= 6) then card.ability.supf_shine_timer = 0; card.ability.supf_shine = card.ability.supf_shine + 1 end
                if card.ability.supf_shine > 7 then
                    card.ability.supf_shine = nil
                    card.ability.supf_shine_timer = nil
                end
            end
        end
    end,
    conditions = {vortex = false, facing = "front", discovered = true}
})