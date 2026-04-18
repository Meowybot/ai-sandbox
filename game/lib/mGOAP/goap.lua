local astar = require("lib.astar.astar")
local goap = {}
local gomt = {}
local goas = astar
gomt.__index = gomt

function gomt:setGoal()
end

function goap.new(statess, actionss, goalss)
  local newobj = setmetatable({
    states = (statess or {}),
    actions = (actionss or {}),
    goals = (goalss or {})
  }, gomt)
  newobj.w = {}
  for i, v in pairs(actions) do
    newobj.w[i] = {}
    for j, _ in pairs(v.p) do
      newobj.w[i][j] = 1
    end
  end
  return newobj
end

return goap