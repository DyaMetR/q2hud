--[[------------
  Q U A K E II
Heads Up Display
      Data
]]--------------

if SERVER then
  include("weapons.lua")
  AddCSLuaFile("weapons.lua")

  include("ammo.lua");
  AddCSLuaFile("ammo.lua");

  include("sprites.lua");
  AddCSLuaFile("sprites.lua");
end

if CLIENT then
  -- Includes
  include("weapons.lua")
  include("ammo.lua");
  include("sprites.lua");

end
