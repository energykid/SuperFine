function do_folder(folder)
  local joker_src = NFS.getDirectoryItems(SMODS.current_mod.path .. folder)
  for _, file in ipairs(joker_src) do
    sendInfoMessage("Loading " .. file, "SuperFine!!")
    assert(SMODS.load_file(folder .. "/" .. file))()
  end
end