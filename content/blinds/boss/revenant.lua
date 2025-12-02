-- The Revenant

supf_rev_enable = function(self)
  SUPF.REV_EFFECT = true
  G.E_MANAGER:add_event(Event({
    blocking = false,
    func = function ()
      increaseCardSelection(-1)
      return not SUPF.REV_EFFECT
    end
  }))
end

supf_rev_disable = function(self)
  SUPF.REV_EFFECT = false
end

SMODS.Blind {
    key = 'revenant',
    atlas = 'Blinds',
    mult = 1.5,
    pos = { y=3 },
    loc_vars = function(self)
        return {}
    end,
    boss = {min = 4},
    boss_colour = HEX('6D758D'),
    set_blind = supf_rev_enable,
    defeat = supf_rev_disable,
    disable = supf_rev_disable
}