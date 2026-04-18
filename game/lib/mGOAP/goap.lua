local astar = require("lib.astar.astar")
local goap = {}
local gomt = {}
gomt.__index = gomt

function gomt:setGoal()
end

function goap.new(statess, actionss, goalss)
  local newobj = setmetatable({
    states = (statess or {}),
    actions = (actionss or {}),
    goals = (goalss or {})
  }, gomt)
end

return goap