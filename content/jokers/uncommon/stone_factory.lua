-- Stone Factory

SMODS.Joker {

  key = 'stoneFactory',
  
  rarity = 3,
  
  cost = 5,
  
  atlas = 'Jokers',
  pos = { x = 4, y = 1 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = { 
        localize { type = 'name_text', set = 'Enhanced', key = 'm_stone' },
        localize { type = 'name_text', set = 'Enhanced', key = 'm_supf_fire' },
        localize { type = 'name_text', set = 'Enhanced', key = 'm_supf_ice' }
        }
      }
  end,
  
  calculate = function(self, card, context)
    if context.joker_main then
      local fire = false
      local ice = false
      for i, c in ipairs(context.scoring_hand) do
        if SMODS.has_enhancement(c, 'm_supf_fire') then fire = true end
        if SMODS.has_enhancement(c, 'm_supf_ice') then ice = true end
        if fire and ice then break end
      end
      if fire and ice then 
        
        card.ability.cards_to_create = card.ability.cards_to_create or 2
        local cen = nil
        local cards = {}
          local _suit, _rank =
            pseudorandom_element(SMODS.Suits, pseudoseed('grim_create')).card_key, 'A'
          for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
          if enhancement_center.key == 'm_stone' then
            cen = enhancement_center
          end
        end
        cards[#cards+1] = create_playing_card({
          front = G.P_CARDS[_suit .. '_' .. _rank],
          center = cen
        }, G.deck, nil)

        SMODS.calculate_context({ playing_card_added = true, cards = cards })
        
      end
    end
  end
}