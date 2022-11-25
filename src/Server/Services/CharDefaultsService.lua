local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")

local Shared = shared.RoRooms.Shared

local Knit = require(Shared.Packages.knit)

local CharDefaultsService = Knit.CreateService {
    Name = "CharDefaultsService";
}

function CharDefaultsService:KnitStart()
    Players.PlayerAdded:Connect(function(Player)
        Player.CharacterAdded:Connect(function(Char)
            CollectionService:AddTag(Char, "NametaggedChar")
        end)
    end)
end

return CharDefaultsService