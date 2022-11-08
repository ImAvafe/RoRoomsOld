local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

local Shared = ReplicatedStorage.RoRoomsCode
local Server = ServerScriptService.RoRoomsCode

local Loader = require(Shared.Packages.loader)

Loader.SpawnAll(
	Loader.LoadDescendants(Server.Services, Loader.MatchesName("Service$")),
    "OnInit",
	"OnStart"
)