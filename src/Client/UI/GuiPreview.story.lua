local GuiModules = script.Parent.Guis:GetChildren()

return function(Target)
    local Guis = {}

    for _, GuiModule in ipairs(GuiModules) do
        local GuiNameSplit = string.split(GuiModule.Name, ".")
        local StorySuffix = GuiNameSplit[2]
        
        if not StorySuffix then
            local Gui = require(GuiModule)
            table.insert(Guis, Gui {
                Parent = Target
            })
        end
    end

    return function()
        for _, Gui in ipairs(Guis) do
            Gui:Destroy()
        end
    end
end