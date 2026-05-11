--!strict

local ArcadeMachineModel = require(script.Parent.ArcadeConfigModel)
local ArcadeMachineTypes = require(script.Parent.Parent.ArcadeMachineTypes)

local ArcadeMachineConfigFactory = {}

function ArcadeMachineConfigFactory.Create(data:table): ArcadeMachineTypes.ArcadeMachineConfigType
	return ArcadeMachineModel.new(data)
end

return ArcadeMachineConfigFactory