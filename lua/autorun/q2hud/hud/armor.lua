--[[------------
  Q U A K E II
Heads Up Display
Armor indicator
]]--------------

if CLIENT then
  local lastAP = 0;
  local time = 0;
  local anim = false;
  local size = 73;
  local function ArmorPanel()
    if LocalPlayer():Armor() <= 0 then return end;
    local ap = LocalPlayer():Armor();
    local scale = Q2HUD.Config:GetHUDScale();
    local x, y = (ScrW()/2) + (16 + 73)*scale, ScrH() - 4*scale;

    -- Damage effect
    if lastAP ~= ap then
      if lastAP > ap then
        anim = true;
        time = CurTime() + Q2HUD.Config.DamageSpriteTime;
      end
      lastAP = ap;
    end
    if anim then
      if time < CurTime() then
        anim = false;
      end
      Q2HUD:DrawSprite("damage", x+13*scale, y+8*scale, -1, scale);
    end

    -- Main sprite and numbers
    local id = math.Clamp(math.floor(LocalPlayer():Armor()/50),0,2);
    Q2HUD:DrawSprite("armor"..id, x, y+8*scale, nil, scale);
    Q2HUD:DrawNumber(ap, x-1*scale, y-1*scale, nil, 1, nil, scale);
  end
  Q2HUD:AddElement("armor", ArmorPanel, 73);
end
