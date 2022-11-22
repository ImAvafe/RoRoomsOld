local Shared = shared.RoRooms.Shared
local Client = shared.RoRooms.Client

local Fusion = require(Shared.ExtPackages.fusion)

local Hydrate = Fusion.Hydrate
local Value = Fusion.Value

local UIInstances = Client.UI.Instances

return function (Props)
    local Selection = Value(Props.Options[1])

    return Hydrate(UIInstances.Dropdown:Clone()) {
        Name = Props.Name,
        AnchorPoint = Props.AnchorPoint,
        Position = Props.Position,
        Size = Props.Size,
        LayoutOrder = Props.LayoutOrder,
        Text = Selection:get()
    }
end