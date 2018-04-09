--[[------------
  Q U A K E II
Heads Up Display
  Characters
]]--------------

if CLIENT then
  -- Parameters
  local image = "q2hud/chars.png";
  local chars = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p",
    "q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H",
    "I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
    "0","1","2","3","4","5","6","7","8","9","-","=","_","+",",",".","/","<",">",
    "?","!","@","#","$","%","^","&","*","(",")","[","]","'"," ",
    "{","}","''","|" };
  local w, h = 8, 8;
  local charW, charH = 8*2, 8*2;
  local fileW, fileH = 1437, 16;

  -- Methods
  --[[
    Draws a text with the valid chars
    @param {string} text
    @void
  ]]
  function Q2HUD:DrawText(x, y, text)
    local scale = self.Config:GetHUDScale();
    surface.SetDrawColor(Color(255,255,255));
    surface.SetMaterial(Material(image));
    for k, char in pairs(string.Explode("", text)) do
      if (table.HasValue(chars, char)) then
        local pos = table.KeyFromValue(chars, char)-1;
        local u, v = charW*pos+1, 0;
        surface.DrawTexturedRectUV(x + w*k*scale, y, w*scale, h*scale, u/fileW, v/fileH, (u + charW)/fileW, (v + charH)/fileH);
      end
    end
  end

end
