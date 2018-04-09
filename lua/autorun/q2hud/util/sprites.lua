--[[------------
  Q U A K E II
Heads Up Display
    Sprites
]]--------------

if CLIENT then
  -- Parameters
  local path = "q2hud/"; -- The folder where the materials are stored
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
  function Q2HUD:AddSprite(id, w, h, file)
    file = file or id;
    self.Sprites[id] = {w = w, h = h, file = file};
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
  function Q2HUD:DrawSpriteRect(file, x, y, w, h, align, scale)
    align = align or 0; -- Alignment
    scale = scale or 1; -- Scale
    local xOffset = w * align * scale; -- x offset based on alignment and scale
    local yOffset = -h * scale; -- y offset based on scale

    --[[surface.SetMaterial(Material(path..file..ext, "$smooth = 0")); -- Load the texture
    surface.SetDrawColor(Color(255,255,255)); -- White color
    surface.DrawTexturedRect(x + xOffset, y + yOffset, w * scale, h * scale); -- Draw the desired sprite]]
    draw.TexturedQuad( {
    	texture = surface.GetTextureID(path..file),
    	color	= Color( 255, 255, 255, 255 ),
    	x 	= x + xOffset,
    	y 	= y + yOffset,
    	w 	= w * scale,
    	h 	= h * scale
    } );
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
    self:DrawSpriteRect(spr.file, x, y, spr.w, spr.h, align, scale);
  end

end
