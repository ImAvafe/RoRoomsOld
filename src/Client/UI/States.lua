local Shared = shared.RoRooms.Shared

local Fusion = require(Shared.ExtPackages.fusion)
local Knit = require(Shared.Packages.knit)

local Value = Fusion.Value

local Controllers = {"UIController", "EmotesController"}
local Services = {}

local States = {}

function States:Start()
    for _, ControllerName in ipairs(Controllers) do
        self[ControllerName] = Knit.GetController(ControllerName)
    end
    for _, ServiceName in ipairs(Services) do
        self[ServiceName] = Knit.GetService(ServiceName)
    end
end

function States:Init()
    self.CurrentMainGui = Value("")
end

States:Init()

return States