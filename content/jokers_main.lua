SMODS.Atlas {
  key = "Jokers",
  path = "supf_Jokers.png",
  px = 71,
  py = 95
}

-- Attuned Rarity
local attunedGradient = SMODS.Gradient({
    key="attuned",
    colours = {
        HEX("ffba00"),
        HEX("ffe800")
    },
    cycle = 2
})
SMODS.Rarity {
    key = "attuned",
    badge_colour = attunedGradient,
    default_weight = 0,
    
    pools = {
        ["Joker"] = false,
    },
}

do_folder("content/jokers/common")
do_folder("content/jokers/uncommon")
do_folder("content/jokers/rare")
do_folder("content/jokers/legendary")
do_folder("content/jokers/attuned")