--!strict

local Types = require(script.Parent.ArcadeMachineTypes)
local ArcadeConfigFactory = require(script.Parent.ArcadeMachineConfig.ArcadeConfigFactory)
local ArcadeMachineModel = require(script.Parent.ArcadeMachineModel)

local ArcadeMachineFactory = {}

function ArcadeMachineFactory.Create(name:string, IsEnhanced:boolean, endTime:number, configData:Types.ArcadeMachineConfigType?): Types.ArcadeMachineModel
	configData = ArcadeConfigFactory.Create(configData or {})
	return ArcadeMachineModel.new(name, IsEnhanced, endTime, configData)
end

return ArcadeMachineFactory
