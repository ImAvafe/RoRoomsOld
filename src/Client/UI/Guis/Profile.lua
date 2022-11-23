local Shared = shared.RoRooms.Shared
local Client = shared.RoRooms.Client

local Fusion = require(Shared.ExtPackages.fusion)
local States = require(Client.UI.States)

local New = Fusion.New
local Children = Fusion.Children
local Computed = Fusion.Computed

local UIComponents = Client.UI.Components

local MainFrame = require(UIComponents.MainFrame)
local Title = require(UIComponents.Title)
local TextBox = require(UIComponents.TextBox)
local Dropdown = require(UIComponents.Dropdown)

return function()
    return New "ScreenGui" {
        Name = "ProfileGui",
        Enabled = Computed(function()
            local CurrentMainGui = States.CurrentMainGui:get()
            return CurrentMainGui == script.Name
        end),
    
        [Children] = {
            MainFrame {
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.fromScale(0.91, 0.5),
                Size = UDim2.fromOffset(295, 191),
                ChildSpacing = 12,
    
                [Children] = {
                    New "UIPadding" {
                        PaddingRight = UDim.new(0, 13),
                        PaddingLeft = UDim.new(0, 13),
                        PaddingTop = UDim.new(0, 9),
                        PaddingBottom = UDim.new(0, 14),
                    },
                    
                    Title {
                        Text = "Profile",
                    },
                    TextBox {
                        Name = "NicknameInput",
                        PlaceholderText = "Name",
                        CharLimit = 20,
                        LayoutOrder = 1,
                    },
                    TextBox {
                        Name = "BioInput",
                        PlaceholderText = "Bio",
                        CharLimit = 70,
                        ClearTextOnFocus = false,
                        LayoutOrder = 2,
                    },
                    Dropdown {
                        Options = {{Text = "No Role", Color = Color3.fromRGB(250, 113, 255)}},
                        LayoutOrder = 3,
                    }
                    -- role dropdown input
                }
            }
        }
    }
end