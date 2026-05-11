--!strict
local Types = require(script.Parent.ArcadeMachineTypes)

local ArcadeMachineQuery = {}

function ArcadeMachineQuery.IsOccupied(model: Types.ArcadeMachineModel): boolean
	return model.Status == Types.MachineStatus.Playing
end

function ArcadeMachineQuery.IsBroken(model: Types.ArcadeMachineModel): boolean
	return model.Status == Types.MachineStatus.Broken
end

function ArcadeMachineQuery.GetRevenue(model: Types.ArcadeMachineModel): number
	return model.CollectedMoney
end

function ArcadeMachineQuery.IsGameOver(model: Types.ArcadeMachineModel, currentTime: number): boolean
	if model.Status ~= Types.MachineStatus.Playing then
		return false
	end
	return currentTime >= model.GameEndTime
end

function ArcadeMachineQuery.IsRepairFinished(model: Types.ArcadeMachineModel, currentTime: number): boolean
	if model.Status ~= Types.MachineStatus.Repairing then
		return false
	end
	return currentTime >= model.RepairEndTime
end


return ArcadeMachineQuery
