return {
  descriptions = {
    Joker = {
      j_supf_ecstaticJoker = {
        name = "Ecstatic Joker",
        text = {
          "{X:mult,C:white}X#1#{} Mult"
        }
      },
      j_supf_emphasis = {
        name = "Emphasis!",
        text = {
          'Last played card',
          'gives {C:mult}+#1#{} Mult'
        }
      },
      j_supf_voidcard = {
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
      j_supf_cucumber = {
        name = "Cucumber",
        text = {
          "{C:mult}+#1#{} Mult",
          "At end of round,",
          "{C:green}#4# in #2#{} chance to",
          "negate this card's",
          "effect until the",
          "next round ends"
        }
      },
      j_supf_cucumber_alt = {
        name = "Cucumber",
        text = {
          "Does nothing",
          "At end of next round,",
          "increase value back",
          "to {C:mult}+#3#{} Mult"
        }
      },
      j_supf_cicada = {
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
      j_supf_cicadas = {
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
      j_supf_glimby = {
        name = "Glimby",
        text = {
          "{X:mult,C:white}X#1#{} Mult",
          "If any Cucumber scores",
          "from adjacent Joker slot,",
          "gives {X:mult,C:white}X#2#{} Mult",
          "then {C:red,E:1}explodes"
        }
      },
      j_supf_hauntedHouse = {
        name = "Haunted House",
        text = {
          "When playing a {C:blue}Full House{},",
          "if final scoring card",
          "is not a {C:tarot,T:m_supf_ghost}#1#{},",
          "convert it into one",
          "Otherwise, {C:attention}retrigger it"
        }
      },
      j_supf_whimsy = {
        name = "Whimsy",
        text = {
          "{C:chips}+#1#{} Chips",
          "when played card",
          "with an {C:attention}Enhancement",
          "is scored"
        }
      },
      j_supf_wonder = {
        name = "Wonder",
        text = {
          "{C:mult}+#1#{} Mult",
          "when played card",
          "with an {C:attention}Edition",
          "is scored"
        }
      },
      j_supf_luckyTicket = {
        name = "Lucky Ticket",
        text = {
          "{C:green}#3# in #2#{} chance at",
          "end of round to",
          "gain {C:attention}$#1#{}"
        }
      },
      j_supf_peoplewatching = {
        name = 'Peoplewatching',
        text = {
          'Gain {C:mult}+20{} Mult',
          'if played hand',
          'contains at least',
          '{C:attention}3 face cards'
        }
      },
      j_supf_archibald = {
        name = 'Archibald',
        text = {
          'Upon {C:attention}selecting',
          'or {C:attention}skipping{} Blind,',
          'create an {C:attention}enhanced',
          '{C:attention}Polychrome Ace',
          'and add them to',
          'your deck'
        }
      },
      j_supf_overachiever = {
        name = 'Overachiever',
        text = {
          'Played {C:attention}Aces{} give',
          '{C:mult}+#2#{} Mult when scored',
          'Retrigger first played',
          '{C:attention}Ace {C:mult}#1#{} times',
        }
      },
      j_supf_blueJava = {
        name = 'Blue Java',
        text = {
          '{X:mult,C:white}X#1#{} Mult',
          '{C:green}#7# in #2#{} chance to gain',
          '{X:mult,C:white}X#3#{} Mult at end of round',
          '{C:green}#7# in #4#{} chance to gain',
          '{X:mult,C:white}X#5#{} Mult at end of round',
          '{C:green}#7# in #6#{} chance to {C:red,E:1}reset{} to',
          '{X:mult,C:white}X3{} Mult at end of round'
        }
      },
      j_supf_rainstorm = {
        name = 'Storm',
        text = {
          'Every {C:attention}played card',
          'counts in scoring',
          'Played cards that',
          'otherwise {C:red}wouldn\'t',
          'be scored will additionally',
          'give {X:mult,C:white}X#1#{} Mult'
        }
      },
      j_supf_ultimateJimbo = {
        name = 'Ultimate Jimbo',
        text = {
          '{C:mult}+#1#{} Mult',
          '{X:mult,C:white}X1{} Mult, plus',
          '{X:mult,C:white}X#3#{} Mult for each',
          'card played or discarded',
          'this round',
          '{C:inactive}(Currently {C:white,X:inactive}X#2# {C:inactive} Mult)'
        }
      },
      j_supf_murderJoker = {
        name = '{C:red}MURDER JOKER',
        text = {
          'If played hand is a',
          '{C:attention}Four of a Kind,',
          '{E:1,C:red}KILL THEM ALL{} and',
          '{E:1,C:red}STEAL{} their {E:1,C:red}WALLETS!!!',
          '{C:inactive}(Destroys all four cards,',
          '{C:inactive}giving you 1/4 of their',
          '{C:inactive}rank as money)'
        }
      },
      j_supf_enamoredJoker = {
        name = 'Enamored Joker',
        text = {
          'Cards of {V:1}#1#{} suit',
          'give {E:1}quadruple{} the amount',
          'of {V:1}#1#{} cards in',
          '{C:attention}scoring hand{} as Mult',
          'when scored',
          '{C:inactive}(Minimum of {C:mult}+#2#{C:inactive} Mult)'
        }
      },
      j_supf_engaudedJoker = {
        name = 'Engauded Joker',
        text = {
          'Cards of {V:1}#1#{} suit',
          'give {E:1}quadruple{} the amount',
          'of {V:1}#1#{} cards in',
          '{C:attention}scoring hand{} as Mult',
          'when scored',
          '{C:inactive}(Minimum of {C:mult}+#2#{C:inactive} Mult)'
        }
      },
      j_supf_enragedJoker = {
        name = 'Enraged Joker',
        text = {
          'Cards of {V:1}#1#{} suit',
          'give {E:1}quadruple{} the amount',
          'of {V:1}#1#{} cards in',
          '{C:attention}scoring hand{} as Mult',
          'when scored',
          '{C:inactive}(Minimum of {C:mult}+#2#{C:inactive} Mult)'
        }
      },
      j_supf_engorgedJoker = {
        name = 'Engorged Joker',
        text = {
          'Cards of {V:1}#1#{} suit',
          'give {E:1}quadruple{} the amount',
          'of {V:1}#1#{} cards in',
          '{C:attention}scoring hand{} as Mult',
          'when scored',
          '{C:inactive}(Minimum of {C:mult}+#2#{C:inactive} Mult)'
        }
      },
      j_supf_violentVisage = {
        name = 'Violent Visage',
        text = {
          'Played {C:attention}face cards{}',
          'permanently gain {C:chips}+#1#{}',
          'Chips and {C:mult}+#2#{} Mult',
          'when scored'
        }
      }
    },
    Tarot = {
      c_supf_crystal = {
        name = 'The Crystal',
        text = {
          "Enhances {C:attention}#1#{} selected",
          "#3#s or",
          "#4#s into",
          "{V:1}#2#s",
        }
      },
    },
    Spectral = {
      supf_rune = {
        name = 'Rune',
        text = {
          'Convert selected Joker',
          'into its {V:1,E:1}Attuned{} form',
          '{C:inactive}(Compatible Jokers will glow)'
        }
      },
      supf_shade = {
        name = 'Shade',
        text={
          "Enhances {C:attention}#1#{} selected",
          "cards into",
          "{V:1}#2#s",
        },
      }
    },
    Enhanced = {
      m_supf_ghost = {
        name="Ghost Card",
        text={
          '{C:red}Does not count{} towards',
          'selection limit'
        }
      },
      m_supf_obsidian = {
        name="Obsidian Card",
        text={
          '{C:white,X:chips}X#1#{} chips and {C:white,X:mult}X#2#{} mult',
          'no rank or suit'
        }
      }
    },
    Blind = {
      bl_supf_scroll = {
        name = "The Scroll",
        text = {
          'Hands must not contain',
          'exactly two suits'
        }
      },
      bl_supf_canvas = {
        name = "The Canvas",
        text = {
          'Hands must not contain',
          'exactly four suits'
        }
      },
      bl_supf_stack = {
        name = "The Stack",
        text = {
          'X0.9 total chips',
          'after each hand played'
        }
      },
      bl_supf_revenant = {
        name = "The Revenant",
        text = {
          '-1 hand selection size',
        }
      },
      bl_supf_mace = {
        name = "The Mace",
        text = {
          'Reduces rank of played',
          'cards before scoring'
        }
      }
    },
    Back = {
      b_supf_shadow = {
        name = 'Shadow Deck',
        text = {
          'Starting {C:attention}Aces{} become',
          '{V:1,T:m_supf_ghost}#1#s'
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