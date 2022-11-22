local Shared = shared.RoRooms.Shared
local Client = shared.RoRooms.Client

local Fusion = require(Shared.ExtPackages.fusion)
local States = require(Client.UI.States)

local Hydrate = Fusion.Hydrate
local Value = Fusion.Value
local OnEvent = Fusion.OnEvent
local WithChild = Fusion.WithChild

local UIInstances = Client.UI.Instances

return function (Props)
    local Hovered = Value(false)

    return Hydrate(UIInstances.SideMenuButton:Clone()) {
        Name = Props.GuiName,
        AnchorPoint = Props.AnchorPoint,
        Position = Props.Position,
        Size = Props.Size,
        LayoutOrder = Props.LayoutOrder,
        Text = Props.GuiName,

        [OnEvent "Activated"] = function()
            local CurrentMainGui = States.CurrentMainGui:get()
            if CurrentMainGui ~= Props.GuiName then
                States.CurrentMainGui:set(Props.GuiName)
            else
                States.CurrentMainGui:set("")
            end
        end,
        [OnEvent "MouseEnter"] = function()
            Hovered:set(true)
        end,
        [OnEvent "MouseLeave"] = function()
            Hovered:set(false)
        end,

        [WithChild "Icon"] = {
            Image = Props.Icon,
        },
    }
end