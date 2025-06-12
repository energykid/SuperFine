-- Archibald
do
SMODS.DrawStep {
  key = 'supf_archibald',
  order = 20,
  func = function(card)
    if card.ability.archibald and card.config.center.discovered then
      local timer = G.TIMERS.REAL

      local timeroff = timer + 0.25

      local scale_mod = 0.07 + 0.02*math.sin(1.8*(timeroff)) + 0.00*math.sin(((timeroff) - math.floor((timeroff)))*math.pi*14)*(1 - ((timeroff) - math.floor((timeroff))))^3
      local rotate_mod = 0.05*math.sin(1.219*(timeroff)) + 0.00*math.sin(((timeroff))*math.pi*5)*(1 - ((timeroff) - math.floor((timeroff))))^2

      local xoff = 0
      local yoff = 0

      if card.config.center.rotlayer == 2 then
        rotate_mod = rotate_mod + (timeroff)
      end

      if card.config.center.facelayer == 2 then
        xoff = 0.05*math.sin(0.8*timeroff)
        yoff = 0.05*math.sin((1.6*timeroff)+0.5)
      end

      drawFloatingSprite(card, "supf_Jokers", { x = 9, y = 0 }, rotate_mod, scale_mod, xoff, yoff, 1)

    end
  end,
  conditions = {vortex = false, facing = "front", discovered = true}
}

SMODS.Joker {

  key = 'archibald',

  config = { archibald = true, cards_to_create = 2 },
  
  rarity = 4,
  
  cost = 20,
  
  atlas = 'Jokers',
  pos = { x = 8, y = 0 },

  loc_vars = function(self, info_queue, card)
    return {
      key = "supf_archibald",
      vars = { card.ability.cards_to_create }
      }
  end,
  
  calculate = function(self, card, context)
    if context.skip_blind or context.setting_blind then
      card.ability.cards_to_create = card.ability.cards_to_create or 2
      for i = 1, card.ability.cards_to_create, 1 do
        local cards = {}
          local _suit, _rank =
            pseudorandom_element(SMODS.Suits, pseudoseed('grim_create')).card_key, 'A'
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
  end
}
end

