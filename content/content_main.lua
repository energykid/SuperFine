-- Enhancement Atlas
SMODS.Atlas {
  key = "Enhancements",
  path = "supf_Enhancements.png",
  px = 71,
  py = 95
}

-- Blind Atlas
SMODS.Atlas {
  key = "Blinds",
  path = "supf_Blinds.png",
  px = 34,
  py = 34,
  atlas_table = 'ANIMATION_ATLAS', 
  frames = 21
}

-- Joker Atlas
SMODS.Atlas {
  key = "Jokers",
  path = "supf_Jokers.png",
  px = 71,
  py = 95
}
-- Attuned Joker Atlas
SMODS.Atlas {
  key = "AttunedJokers",
  path = "supf_AttunedJokers.png",
  px = 71,
  py = 95
}

-- Spectral Atlas
SMODS.Atlas {
  key = "Spectrals",
  path = "supf_Spectrals.png",
  px = 71,
  py = 95
}
SMODS.Atlas {
  key = "AttunementGlow",
  path = "supf_AttunementGlow.png",
  px = 71,
  py = 95
}

-- Attuned Rarity
SUPF.GRADIENTS.ATTUNED = SMODS.Gradient({
    key="attuned",
    colours = {
        HEX("FF741C"),
        HEX("FFC600")
    },
    cycle = 2
})
SMODS.Rarity {
    key = "attuned",
    badge_colour = SUPF.GRADIENTS.ATTUNED,
    default_weight = 0,
    
    pools = {
        ["Joker"] = false,
    },
}

-- Enhancements
do_folder("content/enhancements")

-- Blinds
do_folder("content/blinds/boss")

-- Jokers
do_folder("content/jokers/common")
do_folder("content/jokers/uncommon")
do_folder("content/jokers/rare")
do_folder("content/jokers/legendary")
do_folder("content/jokers/attuned")

-- Spectrals
do_folder("content/consumables/spectral")