local astar = require("lib.astar.astar")
local goap = {}
local gomt = {}
local goas = astar --[[ not supposed to
be astar library, supposed to be the
astar ai thing but not yet
--]]
gomt.__index = gomt

goap.customtypes = {}

local function shcopy(t)
  local t2 = {}
  for i, v in pairs(t) do
    t2[i] = v
  end
  return t2
end

local function deep_copy(t)
  local t2 = {}
  for i, v in pairs(t) do
    if type(v) ~= "table" then
      t2[i] = v
    else
      t2[i] = deep_copy(v)
    end
  end
  return t2
end

function goap.addType(name, ...)
  goap.customtypes[name] = {}
  for _, v in ipairs({...}) do
    goap.customtypes[name][v] = true
  end
end

function goap.addPreset(nameot, ...)
  for _, v in ipairs({...}) do
    goap.customtypes[name][v] = true
  end
end

function goap.delPreset(nameot, ...)
  for _, v in ipairs({...}) do
    goap.customtypes[name][v] = nil
  end
end

function goap.new(statess, actionss, goalss)
  local newobj = setmetatable({
    states = (deep_copy(statess) or {}),
    actions = (actionss or {}),
    goals = (goalss or {})
  }, gomt)
  newobj.w = {}
  for i, v in pairs(actionss) do
    newobj.w[i] = {}
    for j, _ in pairs(v.p) do
      newobj.w[i][j] = 1
    end
  end
  return newobj
end

return goap