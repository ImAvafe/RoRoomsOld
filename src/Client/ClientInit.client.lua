local Shared = game:GetService("ReplicatedStorage"):FindFirstChild("RoRoomsCode")
local Client = game:GetService("StarterPlayer"):WaitForChild("StarterPlayerScripts"):FindFirstChild("RoRoomsCode")

-- RoRooms directory locations are changed at runtime, so they need to be set once from a central source.
-- This is the most convenient way to do so with the least downsides. Don't @ me
shared.RoRooms = {
	Shared = Shared,
	Client = Client,
	Config = Shared.RoRoomsConfig,
}

local Knit = require(Shared.Packages.knit)

Knit.AddControllers(Client.Controllers)

Knit.Start():andThen(function()
	print("RoRooms client started!")
end):catch(warn)