--[[------------
  Q U A K E II
Heads Up Display
   Ammo data
]]--------------

if CLIENT then
  -- Default Half-Life 2 ammo
  Q2HUD:AddAmmoIcon("Pistol", "hammo0");
  Q2HUD:AddAmmoIcon("357", "hammo1");
  Q2HUD:AddAmmoIcon("SMG1", "hammo2");
  Q2HUD:AddAmmoIcon("AR2", "hammo3");
  Q2HUD:AddAmmoIcon("SMG1_Grenade", "hammo4");
  Q2HUD:AddAmmoIcon("AR2AltFire", "hammo5");
  Q2HUD:AddAmmoIcon("XBowBolt", "hammo6");
  Q2HUD:AddAmmoIcon("Buckshot", "qammo2");
  Q2HUD:AddAmmoIcon("RPG_Round", "qammo3");
  Q2HUD:AddAmmoIcon("Grenade", "qammo0");
  Q2HUD:AddAmmoIcon("slam", "qammo0");

  -- Quake II SWEPs support
  Q2HUD:AddAmmoIcon("Cells", "qammo5");
  Q2HUD:AddAmmoIcon("Slugs", "qammo4");
end
