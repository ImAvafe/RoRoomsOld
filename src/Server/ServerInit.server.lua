local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

local Shared = ReplicatedStorage.RoRoomsCode
local Server = ServerScriptService.RoRoomsCode

local Knit = require(Shared.Packages.knit)

Knit.AddServices(Server.Services)

Knit.Start():andThen(function()
	print("KnitServer started!")
end):catch(warn)