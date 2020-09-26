--[[------------
  Q U A K E II
Heads Up Display
 Damage overlay
]]--------------

if CLIENT then
  local lastHP = 100;
  local lastAP = 0;
  local anim = false;
  local tick = 0;
  local amount = 0;
  local accum = 0;
  local color = Color(255,255,255);
  local DAMAGE_COLOUR = Color(110, 0, 0);
  local ARMOUR_COLOUR = Color(60, 60, 60);
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

  local add = 0.1;
  local delay = 0.1;

  local function DamageEffect(diff)
    accum = accum + ((diff)/100)*7;
    amount = math.Clamp(accum,0, 1);
    if accum < 0.07 then
      tick = CurTime() + 1;
    else
      tick = CurTime() + delay;
    end
    anim = true;
  end

  local function DamageOverlay()
    if (Q2HUD.Config:IsEnabled() == 0 or Q2HUD.Config:DrawDamageEffect() == 0) then return end;
    local hp = LocalPlayer():Health();
    local ap = LocalPlayer():Armor();
    local x, y, w, h = 0, 0, ScrW(), ScrH();

    if (lastAP ~= ap) or (lastHP ~= hp) then

      if (ap > 0) then
        color = ARMOUR_COLOUR;
        DamageEffect((lastAP - ap) + (lastHP - hp));
      else
        color = DAMAGE_COLOUR;
        DamageEffect(lastHP - hp);
      end

      lastHP = hp;
      lastAP = ap;

    end

    if anim then
      if tick < CurTime() then
        if amount - add > 0 then
          amount = amount - add;
        else
          amount = 0;
          accum = 0;
          anim = false;
        end
        tick = CurTime() + delay;
      end

      draw.RoundedBox(0, x, y, w, h, Color(color.r, color.g, color.b, 150*amount));

      tab[ "$pp_colour_addr" ] = (color.r/255)*amount;
      tab[ "$pp_colour_addg" ] = (color.g/255)*amount;
      tab[ "$pp_colour_addb" ] = (color.b/255)*amount;
      DrawColorModify( tab );
    end
  end

  hook.Add("RenderScreenspaceEffects", "q2hud_damage", DamageOverlay);
end
