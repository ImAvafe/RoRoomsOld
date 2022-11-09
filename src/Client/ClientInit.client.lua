local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPlayerScripts = game:GetService("StarterPlayer").StarterPlayerScripts

local Shared = ReplicatedStorage.RoRoomsCode
local Client = StarterPlayerScripts.RoRoomsCode

local Knit = require(Shared.Packages.knit)

Knit.AddControllers(Client.Controllers)

Knit.Start():andThen(function()
	print("KnitClient started!")
end):catch(warn)