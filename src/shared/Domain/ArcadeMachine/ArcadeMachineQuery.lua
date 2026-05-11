--!strict
local Types = require(script.Parent.ArcadeMachineTypes)

local ArcadeMachineQuery = {}

function ArcadeMachineQuery.IsOccupied(model: Types.ArcadeMachineModel): boolean
	return model.Status == "Playing"
end

function ArcadeMachineQuery.IsBroken(model: Types.ArcadeMachineModel): boolean
	return model.Status == "Broken"
end

function ArcadeMachineQuery.GetRevenue(model: Types.ArcadeMachineModel): number
	return model.CollectedMoney
end

function ArcadeMachineQuery.IsGameOver(model: Types.ArcadeMachineModel, currentTime: number): boolean
	if model.Status ~= "Playing" then
		return false
	end
	return currentTime >= model.GameEndTime
end

return ArcadeMachineQuery
