--!strict
local Types = require(script.Parent.ArcadeMachineTypes)
local MachineStatus = Types.MachineStatus

local ArcadeMachineRules = {}

function ArcadeMachineRules.StartGame(
	model: Types.ArcadeMachineModel,
	currentTime: number,
	config: Types.ArcadeMachineConfigType
): Types.ArcadeMachineModel
    if model.Status ~= MachineStatus.Idle then
        return model
    end
	local newModel = table.clone(model)
	newModel.Status = MachineStatus.Playing
	newModel.CollectedMoney += config.PlayCost
	newModel.GameEndTime = currentTime + config.GameDuration
	return newModel
end

function ArcadeMachineRules.StartRepair(model: Types.ArcadeMachineModel, currentTime: number, config: Types.ArcadeMachineConfigType): Types.ArcadeMachineModel
    if model.Status ~= MachineStatus.Broken then
        return model
    end
    local newModel = table.clone(model)
    newModel.Status = MachineStatus.Repairing
    newModel.RepairEndTime = currentTime + config.RepairDuration
    return newModel
end

function ArcadeMachineRules.FinishRepair(model: Types.ArcadeMachineModel): Types.ArcadeMachineModel
    if model.Status ~= MachineStatus.Repairing then
        return model
    end
    local newModel = table.clone(model)
    newModel.Status = MachineStatus.Idle
    newModel.RepairEndTime = 0
    return newModel
end

function ArcadeMachineRules.FinishGame(model: Types.ArcadeMachineModel): Types.ArcadeMachineModel
	local newModel = table.clone(model)
	newModel.Status = MachineStatus.Idle
	newModel.GameEndTime = 0
	return newModel
end

function ArcadeMachineRules.CollectMoney(model: Types.ArcadeMachineModel): Types.ArcadeMachineModel
	local newModel = table.clone(model)
	newModel.CollectedMoney = 0
	return newModel
end

function ArcadeMachineRules.SetBroken(model: Types.ArcadeMachineModel, isBroken: boolean): Types.ArcadeMachineModel
    if model.Status ~= MachineStatus.Idle then
        return model
    end
	local newModel = table.clone(model)
	newModel.Status = isBroken and MachineStatus.Broken or MachineStatus.Idle
	return newModel
end

return ArcadeMachineRules
