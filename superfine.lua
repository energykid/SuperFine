SUPF = {}

SUPF.WINDOW_PAD = {x = 0, y = 0}
SUPF.DRAW_SCALE = 1
SUPF.PARTICLES = {}
SUPF.FLOATING_SPRITES = {}
SUPF.GRADIENTS = {}
SUPF.ATTUNEMENTS = {}
SUPF.PLAY_LIMIT_MOD = 0
SUPF.MURDER_FRAMES = 0
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
  
	SMODS.Atlas({
		key = "MurderJoker",
		path = "supf_MurderJoker.png",
		px = 32,
		py = 32,
	})

end

function Supf_UpdateEverything()

  SUPF.MURDER_FRAMES = SUPF.MURDER_FRAMES - 1
  if G.hand then
    SMODS.change_play_limit(-SUPF.PLAY_LIMIT_MOD)
    SMODS.change_discard_limit(-SUPF.PLAY_LIMIT_MOD)
    SUPF.PLAY_LIMIT_MOD = 0
  end

  for i = 1, #SUPF.PARTICLES do
    if SUPF.PARTICLES[i] ~= nil then
      SUPF.PARTICLES[i].Update(SUPF.PARTICLES[i])
    end
  end

end

function Supf_DrawEverything()
  
  SUPF.DRAW_SCALE = G.TILESCALE / 4

  local debugtext = ''
  if debugtext ~= '' then
    love.graphics.print(debugtext, 100, 100)
  end
  
  for i = 1, #SUPF.PARTICLES do
    if SUPF.PARTICLES[i] ~= nil then
      SUPF.PARTICLES[i].Draw(SUPF.PARTICLES[i])
    end
  end

  if SUPF.MURDER_FRAMES > 0 then
    love.graphics.setCanvas(G.CANVAS)
    love.graphics.scale(G.CANV_SCALE)
    
    local wid, hei = love.graphics.getDimensions()

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(
      G.ASSET_ATLAS["supf_MurderJoker"].image,
      love.graphics.newQuad(0, 0, 1, 1, 1, 1),
      0,
      0,
      0,
      wid,
      hei,
      0, 0
    )
  end
  
end