--[[------------
  Q U A K E II
Heads Up Display
   Utilities
]]--------------

-- Includes
if SERVER then
  include("sprites.lua");
  AddCSLuaFile("sprites.lua");

  include("numbers.lua");
  AddCSLuaFile("numbers.lua");

  include("weapons.lua");
  AddCSLuaFile("weapons.lua");

  include("ammo.lua");
  AddCSLuaFile("ammo.lua");

  include("chars.lua");
  AddCSLuaFile("chars.lua");
end

if CLIENT then
  include("sprites.lua");
  include("numbers.lua");
  include("weapons.lua");
  include("ammo.lua");
  include("chars.lua");
end
