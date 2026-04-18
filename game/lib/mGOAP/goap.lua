local astar = require("lib.astar.astar")
local goap = {}
local gomt = {}
local goas = astar
gomt.__index = gomt

local function shallow_copy(t)
  local t2 = {}
  for i, v in pairs(t) do
    t2[i] = v
  end
  return t2
end

function gomt:setGoal()
end

function goap.new(statess, actionss, goalss)
  local newobj = setmetatable({
    states = (statess or {}),
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