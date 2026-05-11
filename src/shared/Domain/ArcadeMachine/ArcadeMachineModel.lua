--!strict

local Types = require(script.Parent.ArcadeMachineTypes)

local ArcadeMachineModel = {}

function ArcadeMachineModel.new(name:string, IsEnhanced:boolean, endTime:number, configData:Types.ArcadeMachineConfigType)
	return {
		Name = name,
		Status = "Idle",
		IsEnhanced = IsEnhanced,
		CollectedMoney = 0,
		GameEndTime = endTime,
		Config = configData,
	}
end

return ArcadeMachineModel