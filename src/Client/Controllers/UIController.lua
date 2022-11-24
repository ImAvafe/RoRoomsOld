local Shared = shared.RoRooms.Shared
local Client = shared.RoRooms.Client

local Knit = require(Shared.Packages.knit)
local Fusion = require(Shared.ExtPackages.fusion)
local States = require(Client.UI.States)

local New = Fusion.New

local UIController = Knit.CreateController {
    Name = "UIController",
}

function UIController:MountUI(UI: Instance)
    UI.Parent = self._RoRoomsGui
end

function UIController:KnitStart()
    States:Start()

    for _, GuiModule in ipairs(Client.UI.Guis:GetChildren()) do
        if GuiModule:GetAttribute("DefaultUI") then
            local Gui = require(GuiModule)
            self:MountUI(Gui{})
        end
    end
end

function UIController:KnitInit()
    self._RoRoomsGui = New "Folder" {
        Name = "RoRoomsGui",
        Parent = Knit.Player:WaitForChild("PlayerGui"),
    }
end

return UIController