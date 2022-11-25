local Shared = shared.RoRooms.Shared
local Config = shared.RoRooms.Config

local TextService = game:GetService("TextService")

local Knit = require(Shared.Packages.knit)
local Promise = require(Shared.Packages.promise)

local UserProfileService = Knit.CreateService {
    Name = "UserProfileService";
    Client = {};
}

function UserProfileService.Client:ChangeNickname(Player: Player, Nickname: string)
    if typeof(Nickname) == "string" and string.len(Nickname) <= 20 then
        Promise.new(function(resolve)
            resolve(TextService:FilterStringAsync(Nickname, Player.UserId):GetNonChatStringForBroadcastAsync())
        end):andThen(function(FilteredNickname)
            Player:SetAttribute("Nickname", FilteredNickname)
        end)
    end
end

function UserProfileService.Client:ChangeRole(Player: Player, Role: Instance)
    if typeof(Role) == "Instance" and Role.Parent == Config.Roles then
        Player:SetAttribute("Role", Role.Name)
    end
end

return UserProfileService