--[[------------
  Q U A K E II
Heads Up Display
   Ammo images
]]--------------

if CLIENT then
  -- Parameters
  Q2HUD.AmmoIcons = {}; -- Ammunition types icons
  local defaultAmmo = {
  "AR2", "AR2AltFire", "Pistol", "SMG1", "357", "XBowBolt", "Buckshot",
  "RPG_Round", "SMG1_Grenade", "Grenade", "slam", "AlyxGun", "SniperRound",
  "SniperPenetratedRound", "Thumper", "Gravity", "Battery", "GaussEnergy",
  "CombineCannon", "AirboatGun", "StriderMinigun", "HelicopterGun", "9mmRound",
  "MP5_Grenade", "Hornet", "StriderMinigunDirect", "CombineHeavyCannon"
  }

  -- Methods
  --[[
    Adds an ammo icon
    @param {string} ammo
    @param {string} icon
    @void
  ]]
  function Q2HUD:AddAmmoIcon(ammo, icon)
    self.AmmoIcons[ammo] = icon;
  end

  --[[
    Returns an ammo icon
    @param {string} ammo
    @return {string} icon
  ]]
  function Q2HUD:GetAmmoIcon(ammo)
    return self.AmmoIcons[ammo];
  end

  --[[
    Returns the ammo icons table
    @return {table} Q2HUD.AmmoIcons
  ]]
  function Q2HUD:GetAmmoIcons()
    return self.AmmoIcons;
  end

  --[[
    Returns an ammo icon based on a filter to get the most precise representation
    @param {string} ammo
    @return {string} icon
  ]]
  function Q2HUD:GetRealAmmoIcon(ammo)
    local ammoName = ammo;
    if (table.HasValue(defaultAmmo, ammo)) then
      ammoName = ammo.."_ammo";
    end
    return Q2HUD:GetAmmoIcon(ammo) or Q2HUD:GetAmmoIcon(language.GetPhrase(ammoName)) or "qammo1";
  end

  --[[
    Returns the real ammunition name
    @param {string} ammo
    @return {string} ammoName
  ]]
  function Q2HUD:GetRealAmmoName(ammo)
    local ammoName = ammo;
    if (table.HasValue(defaultAmmo, ammo)) then
      ammoName = ammo.."_ammo";
    end
    return language.GetPhrase(ammoName);
  end

end
