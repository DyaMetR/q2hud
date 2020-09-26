--[[------------
  Q U A K E II
Heads Up Display
  Characters
]]--------------

if CLIENT then
  -- Parameters
  local COLOUR = Color(255,255,255)
  local IMAGE = Material("q2hud/chars.png");
  local chars = {
    ['a'] = 1,
    ['b'] = 2,
    ['c'] = 3,
    ['d'] = 4,
    ['e'] = 5,
    ['f'] = 6,
    ['g'] = 7,
    ['h'] = 8,
    ['i'] = 9,
    ['j'] = 10,
    ['k'] = 11,
    ['l'] = 12,
    ['m'] = 13,
    ['n'] = 14,
    ['o'] = 15,
    ['p'] = 16,
    ['q'] = 17,
    ['r'] = 18,
    ['s'] = 19,
    ['t'] = 20,
    ['u'] = 21,
    ['v'] = 22,
    ['w'] = 23,
    ['x'] = 24,
    ['y'] = 25,
    ['z'] = 26,
    ['A'] = 27,
    ['B'] = 28,
    ['C'] = 29,
    ['D'] = 30,
    ['E'] = 31,
    ['F'] = 32,
    ['G'] = 33,
    ['H'] = 34,
    ['I'] = 35,
    ['J'] = 36,
    ['K'] = 37,
    ['L'] = 38,
    ['M'] = 39,
    ['N'] = 40,
    ['O'] = 41,
    ['P'] = 42,
    ['Q'] = 43,
    ['R'] = 44,
    ['S'] = 45,
    ['T'] = 46,
    ['U'] = 47,
    ['V'] = 48,
    ['W'] = 49,
    ['X'] = 50,
    ['Y'] = 51,
    ['Z'] = 52,
    ['0'] = 53,
    ['1'] = 54,
    ['2'] = 55,
    ['3'] = 56,
    ['4'] = 57,
    ['5'] = 58,
    ['6'] = 59,
    ['7'] = 60,
    ['8'] = 61,
    ['9'] = 62,
    ['-'] = 63,
    ['='] = 64,
    ['_'] = 65,
    ['+'] = 66,
    [','] = 67,
    ['.'] = 68,
    ['/'] = 69,
    ['<'] = 70,
    ['>'] = 71,
    ['?'] = 72,
    ['!'] = 73,
    ['@'] = 74,
    ['#'] = 75,
    ['$'] = 76,
    ['%'] = 77,
    ['^'] = 78,
    ['&'] = 79,
    ['*'] = 80,
    ['('] = 81,
    [')'] = 82,
    ['['] = 83,
    [']'] = 84,
    ['\''] = 85,
    [' '] = 86,
    ['{'] = 87,
    ['}'] = 88,
    ['\'\''] = 89,
    ['|'] = 90
  }
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
    surface.SetDrawColor(COLOUR);
    surface.SetMaterial(IMAGE);
    for k, char in pairs(string.ToTable(text)) do
      if not chars[char] then continue end
      local pos = chars[char] - 1
      local u, v = charW*pos+1, 0;
      surface.DrawTexturedRectUV(x + w*k*scale, y, w*scale, h*scale, u/fileW, v/fileH, (u + charW)/fileW, (v + charH)/fileH);
    end
  end

end
