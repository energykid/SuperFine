SUPF.MONEY_UP = 0
SUPF.MONEY_UP_TIMER = 0
SUPF.MONEY_UP_AMT = 0

SMODS.Atlas {
	key = "money_up",
	path = "supf_money_up.png",
	px = 21,
	py = 17
}

SMODS.Sound {
	key = "money_up",
	path = "money_up.ogg"
}

SUPF.DOLLARS_LASTFRAME = 0

tableInsert(SUPF.UPDATE_SCRIPTS, function()

    if (getSupfModule("extra_visual")) then
        if (G.GAME) then
            if (G.GAME.dollars) then
                if G.GAME.dollars > SUPF.DOLLARS_LASTFRAME then
                    SUPF.MONEY_UP = math.max(SUPF.MONEY_UP, 0)
                    SUPF.MONEY_UP = SUPF.MONEY_UP + (G.GAME.dollars - SUPF.DOLLARS_LASTFRAME)
                    SUPF.MONEY_UP_AMT = 0
                end
                SUPF.DOLLARS_LASTFRAME = G.GAME.dollars
            end
        end

        if (G.HUD and SUPF.MONEY_UP > 0) then
            SUPF.MONEY_UP_TIMER = SUPF.MONEY_UP_TIMER + 1
            if SUPF.MONEY_UP_TIMER > 5 then
                play_sound('supf_money_up', 1 + (SUPF.MONEY_UP_AMT * 0.02), 0.2)
                SUPF.MONEY_UP_AMT = SUPF.MONEY_UP_AMT + 1
                SUPF.MONEY_UP = SUPF.MONEY_UP - 1
                SUPF.MONEY_UP_TIMER = 0
                local p = getAreaPosition(G.HUD:get_UIE_by_ID("dollar_text_UI"))
                local part = NewCustomParticle(
                    vec2(p.x + 80 + math.random(10), p.y + math.random(10)),
                    vec2(6, 0),
                    'supf_money_up',
                    5,
                    0,
                    function(t) 
                        t.Xvel = t.Xvel * 0.8; 
                        t.ScaleY = lerp(t.ScaleY, 4, 0.2); 
                        t.ScaleX = lerp(t.ScaleX, 4, 0.2);
                        if t.Frame > 11 then t.Yvel = t.Yvel - 0.5 end
                    end
                )
                part.ScaleY = 0
                part.ScaleX = 15
                part.Shadow = false
                tableInsert(SUPF.PARTICLES, part)
                if (SUPF.MONEY_UP_AMT >= 100) then
                    SUPF.MONEY_UP = 0
                end
            end
        end
    end
end)