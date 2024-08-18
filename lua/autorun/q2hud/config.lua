
--[[------------
  Q U A K E II
Heads Up Display
 Configuration
]]--------------

if CLIENT then
  -- Parameters
  Q2HUD.Config = {};
  Q2HUD.Config.DamageSpriteTime = 0.2;

  -- Convars
  Q2HUD.Config.Enabled = CreateClientConVar("q2hud_enabled", 1);
  Q2HUD.Config.HUDScale = CreateClientConVar("q2hud_scale", 2);
  Q2HUD.Config.ShowClip = CreateClientConVar("q2hud_showclip", 0);
  Q2HUD.Config.DeathScreen = CreateClientConVar("q2hud_deathscreen", 1);
  Q2HUD.Config.ShowPickupEffect = CreateClientConVar("q2hud_showpickup", 1);
  Q2HUD.Config.ShowDamageEffect = CreateClientConVar("q2hud_showdamage", 1);
  Q2HUD.Config.ShowFrags = CreateClientConVar("q2hud_showfrags", 0);

  -- Methods
  --[[
    Returns whether the HUD is enabled
    @return {number} enabled
  ]]
  function Q2HUD.Config:IsEnabled()
    return self.Enabled:GetBool();
  end

  --[[
    Returns the HUD scale
    @return {number} scale
  ]]
  function Q2HUD.Config:GetHUDScale()
    return self.HUDScale:GetFloat();
  end

  --[[
    Returns whether the clip should be shown or not
    @return {number} showClip
  ]]
  function Q2HUD.Config:ShouldShowClip()
    return self.ShowClip:GetBool();
  end

  --[[
    Returns whether the death screen is enabled
    @return {number} deathScreen
  ]]
  function Q2HUD.Config:DeathScreenEnabled()
    return self.DeathScreen:GetBool();
  end

  --[[
    Returns whether the pickup effect should be displayed
    @return {number} showPickupEffect
  ]]
  function Q2HUD.Config:DrawPickupEffect()
    return self.ShowPickupEffect:GetBool();
  end

  --[[
    Returns whether the damage effect should be displayed
    @return {number} showDamageEffect
  ]]
  function Q2HUD.Config:DrawDamageEffect()
    return self.ShowDamageEffect:GetBool();
  end

  --[[
    Returns whether the frag counter should be shown or not
    @return {number} showFrags
  ]]
  function Q2HUD.Config:DrawFragCount()
    return self.ShowFrags:GetBool();
  end

end
