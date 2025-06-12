-- Glimby
SMODS.load_file("content/particles/glimby_explosion.lua")()

SMODS.Atlas {
	key = "glimby_arrow",
	path = "supf_glimby_arrow.png",
	px = 52,
	py = 34
}

SMODS.DrawStep {
  key = 'supf_glimby',
  order = 0,
  func = function(card, layer)
    if card.ability.arrowtimer then
      card.ability.arrowtimer = card.ability.arrowtimer + 1
      local at = card.ability.arrowtimer
      local sc = 0.5 + (math.sin(at / 28) * 0.05)
      local rot = math.sin(at / 35) * math.rad(2.5)
      drawFloatingSprite(card, 'supf_glimby_arrow', {x = 0, y = 0}, rot, sc, 0.25, 0.25 + (math.sin(at / 24) * 0.01), 'glimby_arrow')
    end
  end,
  conditions = {vortex = false, facing = "front"}
}

-- WE GOT GLIMBY!!!!!

SMODS.Joker {
  key = 'glimby',
  
  config = { extra = { Xmult = 3 }, arrowtimer = 0, XmultWhenCucumber = 10, shouldExplode = false },
  
  rarity = 3,
  
  cost = 8,
  
  atlas = 'Jokers',
  pos = { x = 4, y = 0 },
  
  loc_vars = function(self, info_queue, card)
    return {
      key = "supf_glimby",
      vars = { card.ability.extra.Xmult, card.ability.XmultWhenCucumber }
    }
  end,
  
  calculate = function(self, card, context)
    
    if context.joker_main then 
      local amt = card.ability.extra.Xmult
      local slot = 1
      for i, v in ipairs(G.jokers.cards) do
        if G.jokers.cards[i] == card then
          slot = i
          break
        end
      end

      if G.jokers.cards[slot - 1] ~= nil then
        if G.jokers.cards[slot - 1].ability.isCucumber then
          card.ability.shouldExplode = true
          amt = card.ability.XmultWhenCucumber
        end
      end

      if G.jokers.cards[slot + 1] ~= nil then
        if G.jokers.cards[slot + 1].ability.isCucumber then
          card.ability.shouldExplode = true
          if amt == card.ability.XmultWhenCucumber then
            amt = card.ability.XmultWhenCucumber * 2
          else
            amt = card.ability.XmultWhenCucumber
          end
        end
      end
      
      return {
        Xmult_mod = amt,
        message = localize{ type = 'variable', key = 'a_xmult', vars = { amt }}
      }
    end

    if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
      if card.ability.shouldExplode then
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.1,
          blockable = false,
          func = function()
            local pos = getCardPosition(card)
            table.insert(SupfParticles, NewExplosion(pos.x, pos.y))
            play_sound("supf_explosion", 1, 1)
            G.jokers:remove_card(card)
            card:remove()
            card = nil
            return true;
          end
        }))
      end
    end
    
  end
}

