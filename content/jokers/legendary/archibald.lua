-- Archibald

SMODS.Joker {

  key = 'archibald',

  config = { archibald = true },
  
  rarity = 4,
  
  cost = 20,
  
  atlas = 'Jokers',
  pos = { x = 8, y = 0 },
  soul_pos = { x = 9, y = 0 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = { card.ability.cards_to_create }
      }
  end,
  
  calculate = function(self, card, context)
    if context.skip_blind or context.setting_blind then
      card.ability.cards_to_create = card.ability.cards_to_create or 2
      local cards = {}
      local _suit, _rank = pseudorandom_element(SMODS.Suits, pseudoseed('supf_archibald')).card_key, 'A'
      local cen_pool = {}
      for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
        if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
          cen_pool[#cen_pool + 1] = enhancement_center
        end
      end
      cards[#cards+1] = create_playing_card({
        front = G.P_CARDS[_suit .. '_' .. _rank],
        center = pseudorandom_element(cen_pool, pseudoseed('supf_archibald'))
      }, G.deck, nil)

      cards[#cards]:set_edition({polychrome = true}, true, true)

      SMODS.calculate_context({ playing_card_added = true, cards = cards })
    end
  end
}
