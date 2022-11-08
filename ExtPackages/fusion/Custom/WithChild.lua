--!strict

--[[
	A special key for property tables, which stores a reference to the instance
	in a user-provided Value object.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local applyInstanceProps = require(Package.Instances.applyInstanceProps)
local semiWeakRef = require(Package.Instances.semiWeakRef)
-- local logError = require(Package.Logging.logError)
-- local xtypeof = require(Package.Utility.xtypeof)

local function WithChild(childName: string): PubTypes.SpecialKey
	local withChildKey = {}
	withChildKey.type = "SpecialKey"
	withChildKey.kind = "WithChild"
	withChildKey.stage = "observer"

	function withChildKey:apply(properties, applyToRef: PubTypes.SemiWeakRef, cleanupTasks: {PubTypes.Task})
		local instance = applyToRef.instance:FindFirstChild(childName)

		
		
        applyInstanceProps(properties, semiWeakRef(instance))
        
        table.insert(cleanupTasks, function()
            
        end)
    end

	return withChildKey
end

return WithChild