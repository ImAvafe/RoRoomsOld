local Shared = shared.RoRooms.Shared
local Client = shared.RoRooms.Client

local Fusion = require(Shared.ExtPackages.fusion)

local Hydrate = Fusion.Hydrate

local UIInstances = Client.UI.Instances

return function (Props)
    return Hydrate(UIInstances.Title:Clone()) {
        Name = Props.Name,
        AnchorPoint = Props.AnchorPoint,
        Position = Props.Position,
        Size = Props.Size,
        Text = Props.Text,
        TextSize = Props.TextSize,
    }
end