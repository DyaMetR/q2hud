--[[------------
  Q U A K E II
Heads Up Display
 Weapon images
]]--------------

if CLIENT then
  -- Parameters
  local PISTOL_HOLDTYPES = {"pistol", "revolver", "duel"};
  Q2HUD.WeaponModels = {}; -- A list of weapon models
  Q2HUD.WeaponClasses = {}; -- A list of weapon classes
  Q2HUD.QuakeWeapons = {}; -- A list of quake weapon icons

  -- Methods
  --[[
    Adds a weapon model related to an icon
    @param {string} model
    @param {string} icon
    @void
  ]]
  function Q2HUD:AddWeaponModel(model, icon)
    self.WeaponModels[model] = icon;
  end

  --[[
    Gets the icon of a weapon model
    @param {string} model
    @return {string} icon
  ]]
  function Q2HUD:GetWeaponModelIcon(model)
    return self.WeaponModels[model];
  end

  --[[
    Returns the weapon models list
    @return {table} Q2HUD.WeaponModels
  ]]
  function Q2HUD:GetWeaponModels()
    return self.WeaponModels;
  end

  --[[
    Adds a weapon class related to an icon
    @param {string} class
    @param {string} icon
    @void
  ]]
  function Q2HUD:AddWeaponClassIcon(class, icon)
    self.WeaponClasses[class] = icon;
  end

  --[[
    Gets the icon of a weapon class
    @param {string} class
    @return {string} icon
  ]]
  function Q2HUD:GetWeaponClassIcon(class)
    return self.WeaponClasses[class];
  end

  --[[
    Returns the weapon classes list
    @return {table} Q2HUD.WeaponClasses
  ]]
  function Q2HUD:GetWeaponClasses()
    return self.WeaponClasses;
  end

  --[[
    Returns the icon of a weapon
    @param {Weapon} weapon
    @return {string} icon
  ]]
  function Q2HUD:GetWeaponIcon(weapon)
    local icon = "null";
    local model = self:GetWeaponModelIcon(weapon:GetWeaponWorldModel());
    local class = self:GetWeaponClassIcon(weapon:GetClass());

    if (model ~= nil) then
      icon = model;
    elseif (class ~= nil) then
      icon = class;
    else
      icon = self:GenerateWeaponIcon(weapon);
    end

    return icon;
  end

  --[[
    Tries to generate an icon from the weapon data
    @param {Weapon} weapon
    @return {string} icon
  ]]
  function Q2HUD:GenerateWeaponIcon(weapon)
    local holdtype = weapon:GetHoldType();
    local ammotype = weapon:GetPrimaryAmmoType();
    local icon = "";

    if icon == "" then
      if (table.HasValue(PISTOL_HOLDTYPES, holdtype)) then
        icon = self.QuakeWeapons.pistol;
      else
        if Q2HUD.WeaponByAmmo[game.GetAmmoName(ammotype)] ~= nil then
          icon = Q2HUD.WeaponByAmmo[game.GetAmmoName(ammotype)];
        else
          icon = Q2HUD.WeaponByHoldType[holdtype] or "hcrowbar";
        end
      end
    end

    return icon;
  end

end
