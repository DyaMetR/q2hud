--[[------------
  Q U A K E II
Heads Up Display
  Sprite data
]]--------------

  if CLIENT then
  -- Numbers
  for i=0, 9 do
    Q2HUD:AddSprite(tostring(i), 32, 32);
  end
  Q2HUD:AddSprite("-", 32, 32);

  -- Red numbers
  for i=0, 9 do
    Q2HUD:AddSprite(tostring(i)..Q2HUD:GetCritNumber(), 32, 32);
  end
  Q2HUD:AddSprite("-"..Q2HUD:GetCritNumber(), 32, 32);

  -- Health & Armor
  Q2HUD:AddSprite("cross", 32, 32);
  Q2HUD:AddSprite("damage", 64, 32);
  for i=0, 2 do
    Q2HUD:AddSprite("armor"..tostring(i), 32, 32);
  end

  -- Quake ammo & weapons
  for i=0, 5 do
    Q2HUD:AddSprite("qammo"..tostring(i), 32, 32);
  end

  for _, icon in pairs(Q2HUD.QuakeWeapons) do
    Q2HUD:AddSprite(icon, 32, 32);
  end

  -- Half-life ammo & weapons
  for i=0, 6 do
    Q2HUD:AddSprite("hammo"..tostring(i), 32, 32);
  end

  for _, icon in pairs(Q2HUD:GetWeaponModels()) do
    Q2HUD:AddSprite(icon, 32, 32);
  end

  for _, icon in pairs(Q2HUD:GetWeaponClasses()) do
    Q2HUD:AddSprite(icon, 32, 32);
  end

end
