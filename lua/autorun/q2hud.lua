--[[------------
  Q U A K E II
Heads Up Display
  Version 1.1.2
    07/04/18

By DyaMetR
]]--------------

if SERVER then
  include("q2hud/config.lua");
  AddCSLuaFile("q2hud/config.lua");

  include("q2hud/elements.lua");
  AddCSLuaFile("q2hud/elements.lua");
end

if CLIENT then
  -- Parameters
  Q2HUD = {};

  -- Includes
  include("q2hud/config.lua");
  include("q2hud/elements.lua");

  -- Paint HUD
  hook.Add("HUDPaint", "q2hud_draw", function()
    if (Q2HUD.Config ~= nil and Q2HUD.Config:IsEnabled() == 1) then
      for k, element in pairs(Q2HUD:GetElements()) do
        element.func();
      end
    end
  end);

  -- Hide elements
  local hide = {
    ["CHudHealth"] = true,
    ["CHudBattery"] = true,
    ["CHudAmmo"] = true,
    ["CHudSecondaryAmmo"] = true,
    ["CHudDamageIndicator"] = true,
    ["CHudHistoryResource"] = true
  };
  hook.Add("HUDShouldDraw", "q2hud_hide", function(name)
    if (Q2HUD.Config ~= nil and Q2HUD.Config:IsEnabled() == 1) then
      if (name == "CHudDamageIndicator" and Q2HUD.Config:DrawDamageEffect() == 0) then
        return true;
      else
        return not (hide[name] ~= nil);
      end
    else
      return true;
    end
  end);

  -- Menu
  local function menuElements( panel )
    panel:ClearControls()

    panel:AddControl( "Label" , {
      Text = "Quake II HUD Settings"
    } );

    panel:AddControl( "CheckBox", {
      Label = "Enabled",
      Command = "q2hud_enabled"}
    );

    panel:AddControl( "Slider", {
      Label = "HUD Scale",
      Type = "Float",
      Min = "0",
      Max = "10",
      Command = "q2hud_scale"}
    );

    panel:AddControl( "CheckBox", {
      Label = "Show current weapon clip ammo",
      Command = "q2hud_showclip"}
    );

    panel:AddControl( "CheckBox", {
      Label = "Enable death screen",
      Command = "q2hud_deathscreen"}
    );

    panel:AddControl( "CheckBox", {
      Label = "Show item pickup effect",
      Command = "q2hud_showpickup"}
    );

    panel:AddControl( "CheckBox", {
      Label = "Show damage effect",
      Command = "q2hud_showdamage"}
    );

    panel:AddControl( "CheckBox", {
      Label = "Show frag counter",
      Command = "q2hud_showfrags"}
    );
  end

  local function createMenu()
    spawnmenu.AddToolMenuOption( "Options", "DyaMetR", "Q2HUDSETTINGS", "Quake II HUD", "", "", menuElements )
  end
  hook.Add( "PopulateToolMenu", "q2hud_menu", createMenu );

end
