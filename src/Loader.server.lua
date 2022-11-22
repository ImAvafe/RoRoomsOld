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

local function SetupRoRoomsConfig()
    local RoRoomsConfig = ROROOMS_LOADER:FindFirstChild("RoRoomsConfig")
    if not RoRoomsConfig then
        RoRoomsConfig = Instance.new("Configuration")
        RoRoomsConfig.Name = "RoRoomsConfig"
    end
    RoRoomsConfig.Parent = ReplicatedStorage.RoRoomsCode
end

local function RemoveLoader()
    ROROOMS_LOADER:Destroy()
end

local function EnableDirectoriesScripts(Directories: table)
    for _, Directory in ipairs(Directories) do
        for _, Child in ipairs(Directory:GetDescendants()) do
            if Child:IsA("Script") or Child:IsA("LocalScript") then
                Child.Disabled = false
            end
        end
    end
end

local function InstallDirectory(Directory, TargetDirectory: Instance)
    Directory.Name = "RoRoomsCode"
    Directory.Parent = TargetDirectory
end

local function InstallDirectories()
    for _, DirectoryName in ipairs(DIRECTORY_LOAD_ORDER) do
        local Directory = script:FindFirstChild(DirectoryName)
        local TargetDirectory = TARGET_DIRECTORY_MAP[DirectoryName]

        assert(Directory, " directory "..DirectoryName.." not found")
        assert(TargetDirectory, "Invalid target directory for "..DirectoryName)

        InstallDirectory(Directory, TargetDirectory)
    end
end

-- Loading process


InstallDirectories()
SetupRoRoomsConfig()
EnableDirectoriesScripts({ServerScriptService.RoRoomsCode})
RemoveLoader()