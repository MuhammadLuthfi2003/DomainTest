--!strict
local Types = require(script.Parent.ArcadeMachineTypes)

local ArcadeMachineRules = {}

function ArcadeMachineRules.StartGame(
	model: Types.ArcadeMachineModel,
	currentTime: number,
	config: Types.ArcadeMachineConfigType
): Types.ArcadeMachineModel
	local newModel = table.clone(model)
	newModel.Status = "Playing"
	newModel.CollectedMoney += config.PlayCost
	newModel.GameEndTime = currentTime + config.GameDuration
	return newModel
end

function ArcadeMachineRules.FinishGame(model: Types.ArcadeMachineModel): Types.ArcadeMachineModel
	local newModel = table.clone(model)
	newModel.Status = "Idle"
	newModel.GameEndTime = 0
	return newModel
end

function ArcadeMachineRules.CollectMoney(model: Types.ArcadeMachineModel): Types.ArcadeMachineModel
	local newModel = table.clone(model)
	newModel.CollectedMoney = 0
	return newModel
end

function ArcadeMachineRules.SetBroken(model: Types.ArcadeMachineModel, isBroken: boolean): Types.ArcadeMachineModel
	local newModel = table.clone(model)
	newModel.Status = isBroken and "Broken" or "Idle"
	return newModel
end

return ArcadeMachineRules
