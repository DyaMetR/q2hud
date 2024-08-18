--[[------------
  Q U A K E II
Heads Up Display
  Death screen
]]--------------

if CLIENT then
  -- Parameters
  local roll = 30;
  local pitch = 20;

  -- Variables
  local cameraPos = Vector(0,0,0);
  local cameraAngle = Angle(0,0,0);
  local alive = true;
  local rotation = 0;
  local tick = 0;

  -- Hooks
  local function Death()
    if (not Q2HUD.Config:IsEnabled()) or (not Q2HUD.Config:DeathScreenEnabled()) then return end;
    if not LocalPlayer():Alive() then
      local tr = util.TraceLine( {
      	start = LocalPlayer():GetPos(),
      	endpos = LocalPlayer():GetPos() - Vector(0,0,5)
      } );

      if alive then
        cameraAngle = LocalPlayer():GetAngles();
      end

      if not tr.Hit or alive then
        cameraPos = LocalPlayer():GetPos() + Vector(0,0,5);
      end

      alive = false;

      if rotation < 1 then
        if tick < CurTime() then
          rotation = rotation + 0.05;
          tick = CurTime() + 0.01;
        end
      end

      if LocalPlayer():GetRagdollEntity() ~= nil and IsValid(LocalPlayer():GetRagdollEntity()) then
        LocalPlayer():GetRagdollEntity():SetNoDraw(true);
      end
    else
      if not alive then
        rotation = 0;
        alive = true;
      end
    end
  end
  hook.Add("Think", "q2hud_deathscreen", Death);

  local function Camera( ply, origin, angles, fov, znear, zfar )
    if (LocalPlayer():Alive()) or (not Q2HUD.Config:IsEnabled()) or (not Q2HUD.Config:DeathScreenEnabled()) then return end;

    local view = {};

    view.origin = cameraPos;
    view.angles = Angle((cameraAngle.p*(1-rotation))-pitch*rotation, cameraAngle.y, cameraAngle.r + roll*rotation);
    view.fov = fov;

    return view;
  end
  hook.Add("CalcView", "q2hud_camera", Camera);

end
