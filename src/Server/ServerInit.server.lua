local Shared = game:GetService("ReplicatedStorage"):FindFirstChild("RoRoomsCode")
local Server = game:GetService("ServerScriptService"):FindFirstChild("RoRoomsCode")

-- RoRooms directory locations are changed at runtime, so they need to be set once from a central source.
-- This is the most convenient way to do so with the least downsides. Don't @ me
shared.RoRooms = {
	Shared = Shared,
	Server = Server,
	Config = Shared.RoRoomsConfig,
}

local Knit = require(Shared.Packages.knit)
local Loader = require(Shared.Packages.loader)

Knit.AddServices(Server.Services)

Knit.Start():andThen(function()
	print("RoRooms server started!")

	Loader.LoadChildren(Server.Components)
end):catch(warn)