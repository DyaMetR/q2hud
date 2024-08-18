--[[------------
  Q U A K E II
Heads Up Display
 Ammo indicator
   with clip
]]--------------

if CLIENT then
  local size = 73;
  local function AmmoPanel()
    if not Q2HUD.Config:ShouldShowClip() or (IsValid(LocalPlayer():GetActiveWeapon()) and LocalPlayer():GetActiveWeapon() ~= nil and LocalPlayer():GetActiveWeapon():Clip1() <= -1) then return end;
    local scale = Q2HUD.Config:GetHUDScale();
    local x, y = (ScrW()/2) - 12*scale, ScrH() - 4*scale;
    local x2 = (ScrW()/2) + (28 + 15 + size*2)*scale;

    local weapon = LocalPlayer():GetActiveWeapon() or nil;

    if IsValid(weapon) and weapon ~= nil then
      local secammo = weapon:GetSecondaryAmmoType();
      local ammotype = weapon:GetPrimaryAmmoType();

      -- Primary ammunition
      if ammotype > -1 then
        local spr = Q2HUD:GetRealAmmoIcon(game.GetAmmoName(ammotype));
        local clip = weapon:Clip1() or 0;
        if clip < 0 then
          clip = 0;
        end
        local resv = LocalPlayer():GetAmmoCount(ammotype) or 0;

        -- Clip
        Q2HUD:DrawSprite(Q2HUD:GetWeaponIcon(LocalPlayer():GetActiveWeapon()), x, y+8*scale, nil, scale);

        local crit = 5;
        Q2HUD:DrawNumber(clip, x-1*scale, y-1*scale, crit, 1, nil, scale);

        -- Reserve amunition
        Q2HUD:DrawSprite(spr, x2, y+8*scale, nil, scale);
        Q2HUD:DrawNumber(resv, x2-1*scale, y-1*scale, nil, 1, nil, scale);
      end

      -- Secondary ammunition
      if secammo > -1 then
        local offset = 1;

        if (ammotype <= -1) then
          offset = 0;
        end

        local spr = Q2HUD:GetAmmoIcon(game.GetAmmoName(secammo)) or "qammo1";
        local resv = LocalPlayer():GetAmmoCount(secammo) or 0;

        Q2HUD:DrawSprite(spr, x2, y+(8-(26*offset))*scale, nil, scale);
        Q2HUD:DrawNumber(resv, x2-1*scale, y-(1 + (25*offset))*scale, nil, 1, nil, scale);
      end
    end
  end
  Q2HUD:AddElement("clip", AmmoPanel, size);
end
