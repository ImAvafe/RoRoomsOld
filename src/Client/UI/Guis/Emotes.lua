local Shared = shared.RoRooms.Shared
local Client = shared.RoRooms.Client

local Fusion = require(Shared.ExtPackages.fusion)
local States = require(Client.UI.States)

local New = Fusion.New
local Children = Fusion.Children
local ForValues = Fusion.ForValues
local Computed = Fusion.Computed

local UIComponents = Client.UI.Components

local MainFrame = require(UIComponents.MainFrame)
local ScrollingList = require(UIComponents.ScrollingList)
local TextButton = require(UIComponents.TextButton)
local Title = require(UIComponents.Title)

return function(Props)
    return New "ScreenGui" {
        Name = "EmotesGui",
        Parent = Props.Parent,
        ResetOnSpawn = false,
        Enabled = Computed(function()
            local CurrentMainGui = States.CurrentMainGui:get()
            return CurrentMainGui == script.Name
        end),
    
        [Children] = {
            MainFrame {
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.fromScale(0.91, 0.5),
                Size = UDim2.fromOffset(210, 451),
                ChildSpacing = 9,
                BottomPaddingDisabled = true,
    
                [Children] = {
                    New "UIPadding" {
                        PaddingRight = UDim.new(0, 12),
                        PaddingLeft = UDim.new(0, 12),
                        PaddingTop = UDim.new(0, 9),
                        PaddingBottom = UDim.new(0, 0),
                    },

                    Title {
                        Text = "Emotes",
                    },
                    ScrollingList {
                        Size = UDim2.new(UDim.new(1, 0), UDim.new(0, 404)),
    
                        [Children] = {
                            New "UIListLayout" {
                                Padding = UDim.new(0, 11),
                                SortOrder = Enum.SortOrder.LayoutOrder,
                            },
                            New "UIPadding" {
                                PaddingTop = UDim.new(0, 2),
                                PaddingLeft = UDim.new(0, 3),
                                PaddingRight = UDim.new(0, 3),
                            },
    
                            ForValues(shared.RoRooms.Config.Features.Emotes:GetChildren(), function(Emote: Animation)
                                local Emoji = Emote:GetAttribute("Emoji")
                                return TextButton {
                                    Name = Emote.Name,
                                    Text = (Emoji and Emoji.." " or "")..Emote.Name,
                                    LayoutOrder = Emote:GetAttribute("LayoutOrder"),
                                    OnActivated = function()
                                        States.EmotesController:PlayEmote(Emote)
                                    end
                                }
                            end)
                        }
                    }
                }
            }
        }
    }
end