local Shared = shared.RoRooms.Shared
local Client = shared.RoRooms.Client

local Knit = require(Shared.Packages.knit)

local ProfileGui = require(Client.UI.Guis.Profile)

local UIController

local ProfileController = Knit.CreateController {
    Name = "ProfileController",
}

function ProfileController:KnitStart()
    UIController = Knit.GetController("UIController")
    
    UIController:MountUI(ProfileGui{})
end

return ProfileController