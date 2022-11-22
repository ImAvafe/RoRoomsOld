local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPlayer = game:GetService("StarterPlayer")

local Shared = ReplicatedStorage.RoRoomsCode
local Client = StarterPlayer.StarterPlayerScripts.RoRoomsCode

local Fusion = require(Shared.ExtPackages.fusion)

local Hydrate = Fusion.Hydrate
local WithChild = Fusion.WithChild
local Children = Fusion.Children

local UIInstances = Client.UI.Instances

return function (Props)
    return Hydrate(UIInstances.ScrollingList:Clone()) {
        Name = Props.Name,
        AnchorPoint = Props.AnchorPoint,
        -- Position = Props.Position,
        Size = Props.Size,

        [WithChild "ScrollingFrame"] = {
            [Children] = Props[Children]
        }
    }
end