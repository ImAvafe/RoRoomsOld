local Shared = shared.RoRooms.Shared
local Client = shared.RoRooms.Client

local Fusion = require(Shared.ExtPackages.fusion)

local Hydrate = Fusion.Hydrate
local Out = Fusion.Out
local Value = Fusion.Value
local Observer = Fusion.Observer
local OnEvent = Fusion.OnEvent

local UIInstances = Client.UI.Instances

return function (Props)
    local Text = Value("")

    local TextBox = Hydrate(UIInstances.TextBox:Clone()) {
        Name = Props.Name,
        AnchorPoint = Props.AnchorPoint,
        Position = Props.Position,
        Size = Props.Size,
        PlaceholderText = Props.PlaceholderText,
        ClearTextOnFocus = Props.ClearTextOnFocus,
        LayoutOrder = Props.LayoutOrder,
        
        Text = Text,
        [Out "Text"] = Text,
        [OnEvent "FocusLost"] = function()
            if Props.OnFocusLost then
                Props.OnFocusLost(Text:get())
            end
        end,
    }

    Observer(Text):onChange(function()
        local NewText = Text:get() or ""
        Text:set(NewText:sub(1, Props.CharLimit or -1))
    end)

    return TextBox
end