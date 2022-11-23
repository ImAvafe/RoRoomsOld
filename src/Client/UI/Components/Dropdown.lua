local Shared = shared.RoRooms.Shared
local Client = shared.RoRooms.Client

local Fusion = require(Shared.ExtPackages.fusion)

local Hydrate = Fusion.Hydrate
local Value = Fusion.Value
local WithChild = Fusion.WithChild
local Computed = Fusion.Computed

local UIInstances = Client.UI.Instances

return function (Props)
    local Selection = Value(Props.Options[1])
    local Enabled = #Props.Options > 1
    local Text = Computed(function()
        return Selection:get().Text
    end)
    local TextColor3 = Computed(function()
        return Selection:get().Color
    end)

    return Hydrate(UIInstances.Dropdown:Clone()) {
        Name = Props.Name,
        AnchorPoint = Props.AnchorPoint,
        Position = Props.Position,
        Size = Props.Size,
        LayoutOrder = Props.LayoutOrder,
        Text = Text,
        TextColor3 = TextColor3,
        TextTransparency = (Enabled and 1) or 0.45,

        [WithChild "DropdownIcon"] = {
            ImageTransparency = (Enabled and 1) or 0.45
        },
    }
end