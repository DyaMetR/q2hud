--[[------------
  Q U A K E II
Heads Up Display
   Weapon data
]]--------------

if CLIENT then
  -- Default half-life weapons
  Q2HUD:AddWeaponModel("models/weapons/w_crowbar.mdl", "hcrowbar");
  Q2HUD:AddWeaponClassIcon("weapon_physcannon", "hgrav");
  Q2HUD:AddWeaponClassIcon("weapon_physgun", "hphys");
  Q2HUD:AddWeaponModel("models/weapons/w_physcannon", "hgrav");
  Q2HUD:AddWeaponModel("models/weapons/w_pistol.mdl", "hpistol");
  Q2HUD:AddWeaponModel("models/weapons/w_357.mdl", "h357");
  Q2HUD:AddWeaponModel("models/weapons/w_smg1.mdl", "hsmg");
  Q2HUD:AddWeaponModel("models/weapons/w_irifle.mdl", "har2");
  Q2HUD:AddWeaponModel("models/weapons/w_shotgun.mdl", "hshotgun");
  Q2HUD:AddWeaponModel("models/weapons/w_crossbow.mdl", "hcrossbow");
  Q2HUD:AddWeaponModel("models/weapons/w_rocket_launcher.mdl", "hrpg");
  Q2HUD:AddWeaponModel("models/weapons/w_grenade.mdl", "qammo0");
  Q2HUD:AddWeaponModel("models/weapons/w_slam.mdl", "qammo0");
  Q2HUD:AddWeaponModel("models/weapons/w_camera.mdl", "hcamera");
  Q2HUD:AddWeaponModel("models/weapons/w_toolgun.mdl", "htool");

  -- Quake II SWEPs support
  Q2HUD:AddWeaponClassIcon("weapon_q2_blaster", "qpistol");
  Q2HUD:AddWeaponClassIcon("weapon_q2_grenadelauncher", "qgren");
  Q2HUD:AddWeaponClassIcon("weapon_q2_hyperblaster", "qhyper");
  Q2HUD:AddWeaponClassIcon("weapon_q2_machinegun", "qsmg");
  Q2HUD:AddWeaponClassIcon("weapon_q2_chaingun", "qchain");
  Q2HUD:AddWeaponClassIcon("weapon_q2_railgun", "qgauss");
  Q2HUD:AddWeaponClassIcon("weapon_q2_shotgun", "qshotgun");
  Q2HUD:AddWeaponClassIcon("weapon_q2_supershotgun", "qsuper");
  Q2HUD:AddWeaponClassIcon("weapon_q2_shotgun", "qshotgun");
  Q2HUD:AddWeaponClassIcon("weapon_q2_handgrenade", "qammo0");
  Q2HUD:AddWeaponClassIcon("weapon_q2_rocketlauncher", "qrocket");
  Q2HUD:AddWeaponClassIcon("weapon_q2_bfg10k", "qbfg");

  -- Quake weapon icon references
  Q2HUD.QuakeWeapons.pistol = "qpistol";
  Q2HUD.QuakeWeapons.shotgun = "qshotgun";
  Q2HUD.QuakeWeapons.super = "qsuper";
  Q2HUD.QuakeWeapons.smg = "qsmg";
  Q2HUD.QuakeWeapons.chain = "qchain";
  Q2HUD.QuakeWeapons.gren = "qgren";
  Q2HUD.QuakeWeapons.rocket = "qrocket";
  Q2HUD.QuakeWeapons.hyper = "qhyper";
  Q2HUD.QuakeWeapons.gauss = "qgauss";
  Q2HUD.QuakeWeapons.bfg = "qbfg";

  -- Info for the weapon icon generator
  Q2HUD.WeaponByHoldType = {
    ["smg"] = Q2HUD.QuakeWeapons.smg,
    ["ar2"] = Q2HUD.QuakeWeapons.hyper,
    ["shotgun"] = Q2HUD.QuakeWeapons.shotgun,
    ["rpg"] = Q2HUD.QuakeWeapons.rocket,
    ["grenade"] = "qammo0",
    ["slam"] = "qammo0",
    ["crossbow"] = Q2HUD.QuakeWeapons.gauss,
    ["physgun"] = Q2HUD.QuakeWeapons.bfg,
    ["camera"] = "hcamera"
  };

  Q2HUD.WeaponByAmmo = {
    ["Pistol"] = Q2HUD.QuakeWeapons.smg,
    ["357"] = Q2HUD.QuakeWeapons.gauss,
    ["SMG1"] = Q2HUD.QuakeWeapons.smg,
    ["Buckshot"] = Q2HUD.QuakeWeapons.super,
    ["Grenade"] = Q2HUD.QuakeWeapons.gren,
    ["RPG_Round"] = Q2HUD.QuakeWeapons.rocket,
    ["XBowBolt"] = Q2HUD.QuakeWeapons.gauss,
    ["AR2"] = Q2HUD.QuakeWeapons.hyper,
    ["AR2AltFire"] = Q2HUD.QuakeWeapons.bfg,
    ["SMG_Grenade"] = Q2HUD.QuakeWeapons.gren
  };

end
