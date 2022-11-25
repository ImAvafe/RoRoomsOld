local Players = game:GetService("Players")

local Shared = shared.RoRooms.Shared
local Client = shared.RoRooms.Client

local Component = require(Shared.Packages.component)
local Fusion = require(Shared.ExtPackages.fusion)

local Hydrate = Fusion.Hydrate
local Value = Fusion.Value
local WithChild = Fusion.WithChild

local Nametag = Component.new {
    Tag = "NametaggedChar"
}

function Nametag:Start()
    local Nickname = Value(self._Player:GetAttribute("Nickname") or self._Player.DisplayName)
    local Role = Value(self._Player:GetAttribute("Role") or "")
    
    self._NametagUI = Hydrate(Client.UI.Instances.Nametag:Clone()) {
        Parent = self.Instance,
        Adornee = self.Instance:WaitForChild("Head"),

        [WithChild "Nickname"] = {
            Text = Nickname,
        },
        [WithChild "Role"] = {
            Text = Role,
        },
    }
    
    self._Player:GetAttributeChangedSignal("Nickname"):Connect(function()
        local PlayerNickname = self._Player:GetAttribute("Nickname")
        Nickname:set(PlayerNickname ~= "" and PlayerNickname or self._Player.DisplayName)
    end)
end

function Nametag:Construct()
    self._Player = Players:GetPlayerFromCharacter(self.Instance)
end

return Nametag