local Shared = shared.RoRooms.Shared
local Client = shared.RoRooms.Client

local Knit = require(Shared.Packages.knit)

local EmotesGui = require(Client.UI.Guis.Emotes)

local UIController

local EmotesController = Knit.CreateController {
    Name = "EmotesController",
}

function EmotesController:PlayEmote(EmoteAnim: Animation)
    local Char = Knit.Player.Character
    local Humanoid = Char.Humanoid
    if EmoteAnim:GetAttribute("EmoteType") ~= "CustomAnim" then
        local HumanoidDesc = Humanoid.HumanoidDescription
        if not HumanoidDesc:GetEmotes()[EmoteAnim.Name] then
            HumanoidDesc:AddEmote(EmoteAnim.Name, string.gsub(EmoteAnim.AnimationId, "%D+", ""))
        end
        Humanoid:PlayEmote(EmoteAnim.Name)
    else
        local EmoteKeyseq = Humanoid:LoadAnimation(EmoteAnim)
        EmoteKeyseq:Play()
    end
end

function EmotesController:KnitStart()
    UIController = Knit.GetController("UIController")
    
    UIController:MountUI(EmotesGui{})
end

return EmotesController