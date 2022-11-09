local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPlayer = game:GetService("StarterPlayer")

local Shared = ReplicatedStorage.RoRoomsCode
local Client = StarterPlayer.StarterPlayerScripts.RoRoomsCode

local Knit = require(Shared.Packages.knit)

local EmotesController = Knit.CreateController {
    Name = "EmotesController",
}

function EmotesController:KnitStart()
    
end

return EmotesController