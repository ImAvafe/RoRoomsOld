local Shared = shared.RoRooms.Shared
local Client = shared.RoRooms.Client

local Fusion = require(Shared.ExtPackages.fusion)
local ColourUtils = require(Shared.Packages.colourutils)

local Hydrate = Fusion.Hydrate
local Value = Fusion.Value
local Computed = Fusion.Computed
local OnEvent = Fusion.OnEvent

local UIInstances = Client.UI.Instances

local DefaultColor = UIInstances.TextButton.BackgroundColor3
local HoveredColor = ColourUtils.Darken(DefaultColor, 0.05)

return function (Props)
    local Hovered = Value(false)
    local BackgroundColor3 = Computed(function()
        local IsHovered = Hovered:get()
        return IsHovered and HoveredColor or DefaultColor
    end)

    return Hydrate(UIInstances.TextButton:Clone()) {
        Name = Props.Name,
        AnchorPoint = Props.AnchorPoint,
        Position = Props.Position,
        Size = Props.Size,
        Text = Props.Text,
        LayoutOrder = Props.LayoutOrder,
        BackgroundColor3 = BackgroundColor3,

        [OnEvent "Activated"] = Props.OnActivated,
        [OnEvent "MouseEnter"] = function()
            Hovered:set(true)
        end,
        [OnEvent "MouseLeave"] = function()
            Hovered:set(false)
        end,
    }
end