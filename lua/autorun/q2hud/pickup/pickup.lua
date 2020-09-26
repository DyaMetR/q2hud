--[[------------
  Q U A K E II
Heads Up Display
 Pickup display
]]--------------

if CLIENT then
  -- Parameters
  local color = Color(66,60,24);
  local time = 2.5;
  local add = 0.12;
  local delay = 0.04;

  -- Variables
  local icon = "";
  local name = "";
  local amount = 0;
  local anim = false;
  local tick = 0;
  local timer = 0;
  local tab = {
    [ "$pp_colour_addr" ] = 0,
    [ "$pp_colour_addg" ] = 0,
    [ "$pp_colour_addb" ] = 0,
    [ "$pp_colour_brightness" ] = 0,
    [ "$pp_colour_contrast" ] = 1,
    [ "$pp_colour_colour" ] = 1,
    [ "$pp_colour_mulr" ] = 0,
    [ "$pp_colour_mulg" ] = 0,
    [ "$pp_colour_mulb" ] = 0
  };

  -- Methods
  --[[
    Draws the pickup overlay with an icon and description
    @param {string} itemIcon
    @param {string} itemName
  ]]
  function Q2HUD:DrawPickup(itemIcon, itemName)
    icon = itemIcon;
    name = itemName;
    amount = 1;
    anim = true;
    timer = CurTime() + time;
  end

  -- Element
  local function PickupOverlay()
    if (Q2HUD.Config:IsEnabled() == 0 or Q2HUD.Config:DrawPickupEffect() == 0) then return end;
    local scale = Q2HUD.Config:GetHUDScale();
    local x, y = (ScrW()/2) - (Q2HUD:GetElement("ammo").size + 28 + 12)*scale, ScrH() - 4*scale - 20*scale;

    if anim then
      if tick < CurTime() then
        if amount - add > 0 then
          amount = amount - add;
        else
          amount = 0;
        end
        tick = CurTime() + delay;
      end

      if timer < CurTime() then
        anim = false;
      end

      draw.RoundedBox(0, 0, 0, ScrW(), ScrH(), Color(color.r,color.g,color.b, 110*amount));

      tab[ "$pp_colour_addr" ] = (color.r/255)*amount;
      tab[ "$pp_colour_addg" ] = (color.g/255)*amount;
      tab[ "$pp_colour_addb" ] = (color.b/255)*amount;
      DrawColorModify( tab );
    end
  end
  hook.Add("RenderScreenspaceEffects", "q2hud_pickup_effect", PickupOverlay);

  local function PickupIcon()
    if anim then
      local scale = Q2HUD.Config:GetHUDScale();
      local x, y = (ScrW()/2) - (Q2HUD:GetElement("ammo").size + Q2HUD:GetElement("health").size + 28 - 12)*scale, ScrH() - 4*scale - 20*scale;
      Q2HUD:DrawText(x + 21*scale, y - 24*scale, name);
      if Q2HUD:GetSprite(icon) ~= nil then
        Q2HUD:DrawSprite(icon, x, y, nil, scale);
      end
    end
  end
  Q2HUD:AddElement("pickup", PickupIcon, 0);

  -- Hooks
  local items = {
    ["item_healthkit"] = {name = "Health", icon = "cross"},
    ["item_healthvial"] = {name = "Health", icon = "cross"},
    ["item_battery"] = {name = "Armor Shard", icon = "armor0"}
  }

  hook.Add("HUDItemPickedUp", "q2hud_pick_item", function(itemName)
    if (Q2HUD.Config:IsEnabled() == 1 and Q2HUD.Config:DrawPickupEffect() == 1) then
      Q2HUD:DrawPickup(items[itemName].icon, language.GetPhrase(items[itemName].name));
    else
      return;
    end
  end);

  hook.Add("HUDWeaponPickedUp", "q2hud_pick_weapon", function(weaponEntity)
    if (Q2HUD.Config:IsEnabled() == 1 and Q2HUD.Config:DrawPickupEffect() == 1) then
      Q2HUD:DrawPickup(Q2HUD:GetWeaponIcon(weaponEntity), language.GetPhrase(weaponEntity:GetPrintName()));
    else
      return;
    end
  end);

  hook.Add("HUDAmmoPickedUp", "q2hud_pick_ammo", function(ammoName, amount)
    if (Q2HUD.Config:IsEnabled() == 1 and Q2HUD.Config:DrawPickupEffect() == 1) then
      Q2HUD:DrawPickup(Q2HUD:GetRealAmmoIcon(ammoName), Q2HUD:GetRealAmmoName(ammoName));
    else
      return;
    end
  end);

  hook.Add("HUDDrawPickupHistory", "q2hud_pick_disable", function()
    if (Q2HUD.Config:IsEnabled() == 1 and Q2HUD.Config:DrawPickupEffect() == 1) then
      return false;
    else
      return;
    end
  end);

end
