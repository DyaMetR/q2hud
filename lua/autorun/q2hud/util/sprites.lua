--[[------------
  Q U A K E II
Heads Up Display
    Sprites
]]--------------

if CLIENT then
  -- Parameters
  local PATH = "q2hud/"; -- The folder where the materials are stored
  Q2HUD.Sprites = {}; -- The sprites list

  -- Methods
  --[[
    Returns the data from a sprite
    @param {string} id
    @return {table} spriteData
  ]]
  function Q2HUD:GetSprite(id)
    return self.Sprites[id];
  end

  --[[
    Adds a sprite to the list
    @param {string} id
    @param {number} w
    @param {number} h
    @param {string} file
    @void
  ]]
  function Q2HUD:AddSprite(id, w, h, texture)
    texture = texture or id;
    self.Sprites[id] = {w = w, h = h, texture = surface.GetTextureID(PATH .. texture)};
  end

  --[[
    Draws a sprite from the spritesheet
    @param {string} file
    @param {number} x
    @param {number} y
    @param {number} w
    @param {number} h
    @param {number} align
    @param {number} scale
    @void
  ]]
  function Q2HUD:DrawSpriteRect(texture, x, y, w, h, align, scale)
    align = align or 0; -- Alignment
    scale = scale or 1; -- Scale
    surface.SetTexture(texture);
    surface.SetDrawColor(255, 255, 255);
    surface.DrawTexturedRect(x + math.Round(w * align * scale), y + math.Round(-h * scale), math.Round(w * scale), math.Round(h * scale))
  end

  --[[
    Draws a sprite from the list
    @param {string} id
    @param {number} x
    @param {number} y
    @param {number} align
    @param {number} scale
    @void
  ]]
  function Q2HUD:DrawSprite(id, x, y, align, scale)
    align = align or 0; -- Alignment
    scale = scale or 1; -- Scale
    local spr = self:GetSprite(id);
    self:DrawSpriteRect(spr.texture, x, y, spr.w, spr.h, align, scale);
  end

end
