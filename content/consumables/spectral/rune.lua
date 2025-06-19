SMODS.DrawStep {
    key = 'supf_rune',
    order = -200,
    
    func = function(card, layer)
        if G.jokers and card.config.center.discovered then
            if not card.shouldBeRuneHighlighted then
                for i, v in ipairs(SUPF.ATTUNEMENTS) do
                    if card.config.center.key == 'j_'..v.base then 
                        card.shouldBeRuneHighlighted = true
                    end
                end
            end
            if card.shouldBeRuneHighlighted and SUPF.RUNE_SELECTED then
                card.runicGlowScale = card.runicGlowScale or 0
                card.runicGlowTimer = card.runicGlowTimer or 0
                card.runicGlowTimer = card.runicGlowTimer + 1
                card.runicGlowScale = lerp(card.runicGlowScale, 0.55, 0.05)
                drawFloatingSprite(card, 'supf_AttunementGlow', {x = 0, y = 0}, card.runicGlowTimer * math.rad(5), card.runicGlowScale + (math.sin(card.runicGlowTimer / 30) * 0.02), 0, 0, 'runic_glow')
            else
                if card.runicGlowScale then
                    card.runicGlowScale = lerp(card.runicGlowScale, 0, 0.05)
                    card.runicGlowTimer = card.runicGlowTimer + card.runicGlowScale * 2
                    drawFloatingSprite(card, 'supf_AttunementGlow', {x = 0, y = 0}, card.runicGlowTimer * math.rad(5), card.runicGlowScale + (math.sin(card.runicGlowTimer / 30) * 0.02), 0, 0, 'runic_glow')
                end
            end
        end
    end
}

SMODS.load_file('content/particles/attunement_burst.lua')()

SMODS.Sound {
    key = "attunement_jingle",
    path = "attunement_jingle.ogg"
}

SMODS.Consumable {
    key = 'rune',
    set = 'Spectral',

    atlas = 'Spectrals', 
    pos = { x = 0, y = 0 },

    soul_rate = 0.006,

    keep_on_use = function(self, card)
        return card.area ~= G.consumeables
    end, 

    config = {extra = {is_rune = true}},
    
    loc_vars = function(self, info_queue, card)
        return {
            key = "supf_rune",
            vars = {
                colours = { 
                    SUPF.GRADIENTS.ATTUNED
                }
            }
        }
    end,

    can_use = function(self, card)
        if card.area ~= G.consumeables then return true end
        if #G.jokers.highlighted == 1 then 
            for i, v in ipairs(SUPF.ATTUNEMENTS) do
                if G.jokers.highlighted[1].config.center.key == 'j_'..v.base then return true end
            end
        end
        return false
    end,

    use = function(self, card, area, copier)

        local oldCard = G.jokers.highlighted[1]
        local spot = 0
        for i = 1, #G.jokers.cards, 1 do
            if G.jokers.cards[i] == oldCard then
                spot = i
            end
        end

        local pos = getCardPosition(G.jokers.cards[spot])
        for _ = 0, 24, 1 do
            table.insert(SUPF.PARTICLES, #SUPF.PARTICLES + 1, NewAttunementBurst(pos.x, pos.y, 3 + (math.random(80) / 10)))
        end
        table.insert(SUPF.PARTICLES, #SUPF.PARTICLES + 1, NewAttunementExplosion(pos.x, pos.y))
        play_sound("supf_attunement_jingle", 1, 1)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.6,
            blockable = false,
            func = function()
                for i, v in ipairs(SUPF.ATTUNEMENTS) do
                    if G.jokers.highlighted[1].config.center.key == 'j_'..v.base then
                        --G.jokers.highlighted[1]:start_dissolve({G.C.BLACK, G.C.ORANGE, G.C.RED, G.C.GOLD, G.C.JOKER_GREY}, true, 0.05, true)
                        G.jokers.cards[spot] = SMODS.create_card({
                            set = 'Joker', 
                            area = G.jokers, 
                            key = "j_"..v.attuned,
                            skip_materialize = true
                        })
                        G.jokers.cards[spot]:set_card_area(G.jokers)
                        G.jokers.cards[spot].T = oldCard.T
                        G.jokers.cards[spot].CT = oldCard.CT
                        G.jokers.cards[spot].VT = oldCard.VT
                    end
                end
                return true
            end
        }))
    end,

    hidden = true,
    soul_set = 'Joker',
    can_repeat_soul = true,

    draw = function(self, card, layer)
        if card.config.center.discovered then
            card.runic_timer = card.runic_timer or 0
            card.runic_timer = card.runic_timer + 1
            local rot = math.sin(card.runic_timer / 46) * math.rad(10)
            local sc = 0.5 * (math.sin(card.runic_timer / 62) * 0.1)
            drawFloatingSprite(card, 'supf_Spectrals', {x = 2, y = 0}, rot + math.rad(card.runic_timer), 0.35, 0, 0, 'the_rune_spiral')
            love.graphics.setShader()
            drawFloatingSprite(card, 'supf_Spectrals', {x = 1, y = 0}, rot, sc, 0, 0, 'the_rune')

            SUPF.RUNE_SELECTED = false
            if G.consumeables and G.consumeables.highlighted then
                for i, v in ipairs(G.consumeables.highlighted) do
                    if G.consumeables.highlighted[i] == card then
                        SUPF.RUNE_SELECTED = true
                    end
                end
            end
        end
    end
}