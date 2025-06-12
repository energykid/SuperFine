SUPF = {}

SUPF.WINDOW_PAD = {x = 0, y = 0}
SUPF.DRAW_SCALE = 1
SUPF.FLOATING_SPRITES = {}
SUPF.GRADIENTS = {}
SUPF.ATTUNEMENTS = {}
SUPF.RUNE_SELECTED = false -- visual

function do_folder(folder)
  local joker_src = NFS.getDirectoryItems(SMODS.current_mod.path .. folder)
  for _, file in ipairs(joker_src) do
    sendInfoMessage("Loading " .. file, "SuperFine!!")
    assert(SMODS.load_file(folder .. "/" .. file))()
  end
end

do_folder("utils")
do_folder("systems")
SMODS.load_file("content/content_main.lua")()

if SMODS and SMODS.current_mod then
  
	SMODS.Atlas({
		key = "modicon",
		path = "supf_icon.png",
		px = 32,
		py = 32,
	})

end

function Supf_DrawEverything()
  
  SUPF.DRAW_SCALE = G.TILESCALE / 4
  
  for i = 1, #SupfParticles do
    if SupfParticles[i] ~= nil then
      SupfParticles[i].Update(SupfParticles[i])
    end
  end
  
  for i = 1, #SupfParticles do
    if SupfParticles[i] ~= nil then
      SupfParticles[i].Draw(SupfParticles[i])
    end
  end
  
end