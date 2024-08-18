--[[------------
  Q U A K E II
Heads Up Display
 Frags indicator
]]--------------

if CLIENT then
  local size = 73;
  local function FragPanel()
    if not Q2HUD.Config:DrawFragCount() then return end;
    local scale = Q2HUD.Config:GetHUDScale();
    local x, y = ScrW() - 4*scale, (Q2HUD:GetSprite("0").h - 4)*scale;
    Q2HUD:DrawNumber(LocalPlayer():Frags(), x, y, nil, 1, nil, scale);
  end
  Q2HUD:AddElement("frags", FragPanel, size);
end
