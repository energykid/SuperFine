-- Voidcard
do
SMODS.load_file("content/particles/voidcard_particle.lua")()
SMODS.Joker {
  key = 'voidcard',
  
  config = { extra = { Xmult = 1 }, amount = 1 },
  
  rarity = 3,
  
  cost = 6,
  
  atlas = 'Jokers',
  pos = { x = 1, y = 0 },
  
  loc_vars = function(self, info_queue, card)
    return {
      vars = { card.ability.extra.Xmult }
    }
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
        local pos = getCardPosition(G.jokers.cards[i])
        local blst = NewVoidBlast(pos.x, pos.y, i)
        table.insert(SUPF.PARTICLES, #SUPF.PARTICLES + 1, blst)
        G.jokers.cards[i].VT.scale = G.jokers.cards[i].VT.scale * 0.8
        SMODS.debuff_card(G.jokers.cards[i], true, 'supf_cardVoided')
        card.ability.amount = card.ability.amount + 1
      end
      if (myPosition ~= 0) then
        return {
          message = "Voided",
          colour = G.C.JOKER_GREY
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
        SMODS.debuff_card(G.jokers.cards[i], false, 'supf_cardVoided')
      end
    end
      
    if context.end_of_round then
      for i = 1, #G.jokers.cards do
        SMODS.debuff_card(G.jokers.cards[i], false, 'supf_cardVoided')
      end
    end
  end
}
end