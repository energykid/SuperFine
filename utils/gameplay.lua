function increaseCardSelection(num)
    SMODS.change_play_limit(num)
    SMODS.change_discard_limit(num)
    SUPF.PLAY_LIMIT_MOD = SUPF.PLAY_LIMIT_MOD + num
end

function getProbability()
    return G.GAME and G.GAME.probabilities.normal or 1
end