--[[------------
  Q U A K E II
Heads Up Display
     Numbers
]]--------------

if CLIENT then
  -- Parameters
  Q2HUD.CritNumber = "red";
  local time = 0.35;
  local nW, nH = 15, 22;

  -- Variables
  local blink = false;
  local tick = 0;

  -- Methods
  --[[
    Returns the string piece that belongs to the red numbers
    @return {string} Q2HUD.CritNumber;
  ]]
  function Q2HUD:GetCritNumber()
    return self.CritNumber;
  end

  --[[
    Changes the string piece that belongs to the red numbers
    @param {string} name
    @void
  ]]
  function Q2HUD:SetCritNumber(name)
    self.CritNumber = name;
  end

  --[[
    Draws a number
    @param {number} number
    @param {number} x
    @param {number} y
    @param {number|NULL|nil} crit
    @param {number} align
    @param {number} scale
    @void
  ]]
  function Q2HUD:DrawNumber(number, x, y, crit, textAlign, align, scale)
    textAlign = textAlign or 0; -- Text alignment
    align = align or 0; -- Alignment
    scale = scale or 1; -- Scale
    crit = crit or nil; -- The number needed to reach in order to blink, make it NULL to always red and nil so it doesn't blink
    local digitSeparation = 1; -- How separated are digits

    -- If the number is equal or below the critical amount, it'll blink
    local str = "";
    if crit ~= nil and (crit == NULL or (number <= crit and blink)) then
      str = self:GetCritNumber();
    end

    -- Draw the numbers
    local tab = string.ToTable(tostring(number)); -- The number transformed into a table
    for k, num in pairs(tab) do
      if (textAlign >= 1) then
        local c = (#tab - k) + 1;
        local b = tab[c];
        self:DrawSprite(b..str, x - k*(nW*scale + digitSeparation*scale), y - (nH - self:GetSprite(num).h)*scale, align, scale);
      else
        self:DrawSprite(num..str, x + k*(nW*scale + digitSeparation*scale), y - (nH - self:GetSprite(num).h)*scale, align, scale);
      end
    end
  end

  -- Blink cyckle
  local function BlinkCycle()
    if (tick < CurTime()) then
      blink = not blink;
      tick = CurTime() + time;
    end
  end
  Q2HUD:AddElement("blinkCycle", BlinkCycle);

end
