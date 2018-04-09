--[[------------
  Q U A K E II
Heads Up Display
Main HUD Elements
]]--------------

-- Includes
if SERVER then
  include("damage.lua");
  AddCSLuaFile("damage.lua");

  include("ammo.lua");
  AddCSLuaFile("ammo.lua");

  include("clip.lua");
  AddCSLuaFile("clip.lua");

  include("health.lua");
  AddCSLuaFile("health.lua");

  include("armor.lua");
  AddCSLuaFile("armor.lua");

  include("frags.lua");
  AddCSLuaFile("frags.lua");
end

if CLIENT then
  include("damage.lua");
  include("ammo.lua");
  include("clip.lua");
  include("health.lua");
  include("armor.lua");
  include("frags.lua");
end
