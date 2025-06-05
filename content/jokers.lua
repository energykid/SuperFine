SMODS.Atlas {
	key = "Jokers",
	path = "mng_Jokers.png",
	px = 71,
	py = 95
}

-- Ecstatic Joker
SMODS.Joker {

  key = 'ecstaticJoker',
  
  loc_txt = {
    name = "Ecstatic Joker",
    text = {
      "{X:mult,C:white}X1.2{} Mult"
    }
  },

  config = { extra = { Xmult = 1.2 } },
  
  rarity = 2,
  
  cost = 5,
  
  atlas = 'Jokers',
  pos = { x = 0, y = 0 },

  loc_vars = function(self, info_queue, card)
    return {vars = card.ability.extra.Xmult}
  end,
  
  calculate = function(self, card, context)
    if context.joker_main then
      return {
				Xmult_mod = card.ability.extra.Xmult,
        message = localize{ type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult }}
      }
    end
  end
}

-- Voidcard
SMODS.Joker {
  key = 'voidcard',
  
  loc_txt = {
    name = "Voidcard",
    text = {
      "Debuffs all jokers to",
      "the left of Voidcard",
      "",
      "{X:mult,C:white}X1{} Mult,",
      "plus {X:mult,C:white}X1{} Mult for",
      "each joker debuffed"
    }
  },
  
  config = { extra = { Xmult = 1 }, amount = 1 },
  
  rarity = 3,
  
  cost = 7,
  
  atlas = 'Jokers',
  pos = { x = 1, y = 0 },
  
  loc_vars = function(self, info_queue, card)
    return {vars = card.ability.extra.Xmult}
  end,
  
  calculate = function(self, card, context)
    if context.before then
      card.ability.amount = 1
      local myPosition = 0
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then
          myPosition = i
          break 
        end
      end
      for i = 1, myPosition - 1 do
        table.insert(Particles, #Particles + 1, NewParticle(G.jokers.cards[i].VT.x, G.jokers.cards[i].VT.y, i - 1))
        G.jokers.cards[i].VT.scale = G.jokers.cards[i].VT.scale * 0.8
        SMODS.debuff_card(G.jokers.cards[i], true, 'mng_cardVoided')
        card.ability.amount = card.ability.amount + 1
      end
      if (myPosition ~= 0) then
        return {
          message = "VOIDED..."
        }
      end
    end
    
    if context.joker_main then 
      local amt = card.ability.extra.Xmult * card.ability.amount
      return {
        Xmult_mod = amt,
        message = localize{ type = 'variable', key = 'a_xmult', vars = { amt }}
      }
    end
    
    if context.selling_card and context.card == card then
      for i = 1, #G.jokers.cards do
        SMODS.debuff_card(G.jokers.cards[i], false, 'mng_cardVoided')
      end
    end
      
    if context.end_of_round then
      for i = 1, #G.jokers.cards do
        SMODS.debuff_card(G.jokers.cards[i], false, 'mng_cardVoided')
      end
    end
  end
}
