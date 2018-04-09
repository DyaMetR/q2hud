--[[------------
  Q U A K E II
Heads Up Display
Health indicator
]]--------------

if CLIENT then
  local lastHP = 100;
  local time = 0;
  local anim = false;
  local size = 73;
  local function HealthPanel()
    local hp = LocalPlayer():Health();
    local scale = Q2HUD.Config:GetHUDScale();
    local x, y = (ScrW()/2) - (Q2HUD:GetElement("ammo").size + 28 + 12)*scale, ScrH() - 4*scale;

    -- Damage effect
    if lastHP ~= hp then
      if lastHP > hp then
        anim = true;
        time = CurTime() + Q2HUD.Config.DamageSpriteTime;
      end
      lastHP = hp;
    end
    if anim then
      if time < CurTime() then
        anim = false;
      end
      Q2HUD:DrawSprite("damage", x+13*scale, y+8*scale, -1, scale);
    end

    -- Main sprite
    Q2HUD:DrawSprite("cross", x, y+8*scale, nil, scale);

    -- Numbers
    local crit = 25;
    if hp <= 0 then
      crit = NULL;
    end
    Q2HUD:DrawNumber(hp, x-1*scale, y-1*scale, crit, 1, nil, scale);
  end
  Q2HUD:AddElement("health", HealthPanel, size);
end
