local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local StarterPlayer = game:GetService("StarterPlayer")

local ROROOMS_LOADER = ServerScriptService.RoRooms
local DIRECTORY_LOAD_ORDER = {"Shared", "Server", "Client"}
local TARGET_DIRECTORY_MAP = {
    Shared = ReplicatedStorage,
    Server = ServerScriptService,
    Client = StarterPlayer.StarterPlayerScripts,
}

-- Loading helper functions

local function InstallRoRoomsConfig()
    local RoRoomsConfig = ROROOMS_LOADER:FindFirstChild("RoRoomsConfig")
    assert(RoRoomsConfig, "Missing RoRoomsConfig")
    RoRoomsConfig.Parent = ReplicatedStorage
end

local function RemoveLoader()
    ROROOMS_LOADER:Destroy()
end

local function EnableDirectoryScripts(Directory: Instance)
    for _, Child in ipairs(Directory:GetDescendants()) do
        if Child:IsA("Script") or Child:IsA("LocalScript") then
            Child.Disabled = false
        end
    end
end

local function InstallInternalDirectory(Directory, TargetDirectory: Instance)
    Directory.Name = "RoRoomsCode"
    Directory.Parent = TargetDirectory
end

local function LoadInternalDirectories()
    for _, DirectoryName in ipairs(DIRECTORY_LOAD_ORDER) do
        local Directory = script:FindFirstChild(DirectoryName)
        local TargetDirectory = TARGET_DIRECTORY_MAP[DirectoryName]

        assert(Directory, "Internal directory "..DirectoryName.." not found")
        assert(TargetDirectory, "Invalid target directory for "..DirectoryName)

        InstallInternalDirectory(Directory, TargetDirectory)
        EnableDirectoryScripts(Directory)
    end
end

-- Loading process

InstallRoRoomsConfig()
LoadInternalDirectories()
RemoveLoader()