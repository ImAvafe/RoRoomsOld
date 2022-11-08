local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local StarterPlayer = game:GetService("StarterPlayer")

local ROROOMS_LOADER = script.Parent
local DIRECTORY_LOAD_ORDER = {"Server", "Shared", "Client"}
local TARGET_DIRECTORY_MAP = {
    Shared = ReplicatedStorage,
    Server = ServerScriptService,
    Client = StarterPlayer.StarterPlayerScripts,
}

-- Loading helper functions

local function LoadRoRoomsConfig()
    local RoRoomsConfig = ROROOMS_LOADER:FindFirstChild("RoRoomsConfig")
    assert(RoRoomsConfig, "Missing RoRoomsConfig")
    RoRoomsConfig.Parent = ReplicatedStorage
end

local function CleanUpLoader()
    ROROOMS_LOADER:Destroy()
end

local function EnableInternalScripts(Ancestor: Instance)
    for _, Descendant in ipairs(Ancestor:GetDescendants()) do
        if Descendant:IsA("Script") then
            Descendant.Disabled = false
        end
    end
end

local function LoadInternalDirectory(Directory, TargetDirectory: Instance)
    Directory.Name = "RoRoomsCode"
    Directory.Parent = TargetDirectory
end

local function LoadInternalDirectories()
    for _, DirectoryName in ipairs(DIRECTORY_LOAD_ORDER) do
        local Directory = script:FindFirstChild(DirectoryName)
        local TargetDirectory = TARGET_DIRECTORY_MAP[DirectoryName]

        assert(Directory, "Loader directory "..DirectoryName.." not found.")
        assert(TargetDirectory, "Invalid target directory for "..DirectoryName..".")

        LoadInternalDirectory(Directory, TargetDirectory)
        EnableInternalScripts(Directory)
    end
end

-- Loading process

LoadRoRoomsConfig()
LoadInternalDirectories()
CleanUpLoader()