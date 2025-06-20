-- Shadow Deck
SMODS.Back {
    key = "shadow",
    atlas = "Decks",
    pos = { x = 0, y = 0 },
    unlocked = false,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    if SMODS.Ranks[v.base.value].key == 'Ace' then
                        v:set_ability(G.P_CENTERS['m_supf_ghost'])
                    end
                end
                return true
            end
        }))
    end,
    loc_vars = function(self, info_queue, back)
        return {
            vars = {
                localize { type = 'name_text', set = 'Enhanced', key = 'm_supf_ghost' },
                colours = { 
                    HEX("233E74")
                }
            }
        }
    end,
    locked_loc_vars = function(self, info_queue, back)
        local other_name = localize('k_unknown')
        if G.P_CENTERS['b_ghost'].unlocked then
            other_name = localize { type = 'name_text', set = 'Back', key = 'b_ghost' }
        end

        return { vars = { other_name } }
    end,
    check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_ghost') > 1
    end
}