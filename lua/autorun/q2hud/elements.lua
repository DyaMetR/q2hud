--[[------------
  Q U A K E II
Heads Up Display
    Elements
]]--------------

if SERVER then
  include("util/util.lua");
  AddCSLuaFile("util/util.lua");

  include("data/data.lua");
  AddCSLuaFile("data/data.lua");

  include("pickup/pickup.lua");
  AddCSLuaFile("pickup/pickup.lua");

  include("hud/hud.lua");
  AddCSLuaFile("hud/hud.lua");

  include("death/death.lua");
  AddCSLuaFile("death/death.lua");
end

if CLIENT then
  -- Parameters
  Q2HUD.Elements = {}; -- The main elements list

  -- Methods
  --[[
    Adds an element to draw
    @param {number} id
    @param {function} func
    @param {number} size
    @void
  ]]
  function Q2HUD:AddElement(id, func, size)
    self.Elements[id] = {func = func, size = size};
  end

  --[[
    Returns the element table
    @return {table} Q2HUD.Elements
  ]]
  function Q2HUD:GetElements()
    return self.Elements;
  end

  --[[
    Returns an element
    @param {number} id
    @return {table} element
  ]]
  function Q2HUD:GetElement(id)
    return self:GetElements()[id];
  end

  -- Includes
  include("config.lua");
  include("util/util.lua");
  include("data/data.lua");
  include("pickup/pickup.lua");
  include("hud/hud.lua");
  include("death/death.lua");

end
