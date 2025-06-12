function NewAttunement(base, attuned)
    local tbl = {
        base = base,
        attuned = attuned
    }

    table.insert(SUPF.ATTUNEMENTS, tbl)

    return tbl
end