return {
  descriptions = {
    Joker = {
      supf_ecstaticJoker = {
        name = "Ecstatic Joker",
        text = {
          "{X:mult,C:white}X#1#{} Mult"
        }
      },
      supf_voidcard = {
        name = "Voidcard",
        text = {
          "Debuffs all jokers",
          "to the left",
          "of Voidcard",
          "{X:mult,C:white}X#1#{} Mult, plus",
          "{X:mult,C:white}X#1#{} Mult for",
          "each joker debuffed"
        }
      },
      supf_cucumber = {
        name = "Cucumber",
        text = {
          "{C:mult}+#1#{} Mult",
          "At end of round,",
          "{C:green}1 in #2#{} chance to",
          "negate this card's",
          "effect until the",
          "next round ends"
        }
      },
      supf_cucumber_alt = {
        name = "Cucumber",
        text = {
          "Does nothing",
          "At end of next round,",
          "increase value back",
          "to {C:mult}+#1#{} Mult"
        }
      },
      supf_cicada = {
        name = "Cicada",
        text = {
          "{C:mult}+#1#{} Mult",
          "At end of round,",
          "multiply this",
          "value by 2,",
          "up to a maximum of",
          "{C:mult}128{} Mult"
        }
      },
      supf_cicadas = {
        name = "#2# Cicadas",
        text = {
          "{C:mult}+#1#{} Mult",
          "At end of round,",
          "multiply this",
          "value by 2,",
          "up to a maximum of",
          "{C:mult}128{} Mult"
        }
      },
      supf_glimby = {
        name = "Glimby",
        text = {
          "{X:mult,C:white}X#1#{} Mult",
          "If any Cucumber scores",
          "from adjacent Joker slot,",
          "gives {X:mult,C:white}X#2#{} Mult",
          "then {C:red,E:1}explodes"
        }
      },
      supf_whimsy = {
        name = "Whimsy",
        text = {
          "{C:chips}+#1#{} Chips",
          "when played card",
          "with an {C:attention}Enhancement",
          "is scored"
        }
      },
      supf_wonder = {
        name = "Wonder",
        text = {
          "{C:mult}+#1#{} Mult",
          "when played card",
          "with an {C:attention}Edition",
          "is scored"
        }
      },
      supf_luckyTicket = {
        name = "Lucky Ticket",
        text = {
          "{C:green}1 in #2#{} chance at",
          "end of round to",
          "gain {C:attention}$#1#{}"
        }
      },
      supf_peoplewatching = {
        name = 'Peoplewatching',
        text = {
          'Gain {C:mult}+20{} Mult',
          'if played hand',
          'contains at least',
          '{C:attention}3 face cards'
        }
      },
      supf_archibald = {
        name = 'Archibald',
        text = {
          'Upon {C:attention}selecting',
          'or {C:attention}skipping{} Blind,',
          'create {C:mult}#1# {C:attention}enhanced',
          '{C:attention}Polychrome Aces',
          'and add them to',
          'your deck'
        }
      },
      supf_overachiever = {
        name = 'Overachiever',
        text = {
          'Played {C:attention}Aces{} give',
          '{C:mult}+#2#{} Mult when scored',
          'Retrigger first played',
          '{C:attention}Ace {C:mult}#1#{} times',
        }
      },
      supf_blueJava = {
        name = 'Blue Java',
        text = {
          '{X:mult,C:white}X#1#{} Mult',
          '{C:green}1 in #2#{} chance to gain',
          '{X:mult,C:white}X#3#{} Mult at end of round',
          '{C:green}1 in #4#{} chance to gain',
          '{X:mult,C:white}X#5#{} Mult at end of round',
          '{C:green}1 in #6#{} chance to {C:red,E:1}reset{} to',
          '{X:mult,C:white}X3{} Mult at end of round'
        }
      }
    }
  },
  misc = {
    dictionary={
      k_supf_attuned = "Attuned"
    }
  }
}