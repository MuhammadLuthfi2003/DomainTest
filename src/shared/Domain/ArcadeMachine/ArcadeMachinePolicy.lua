--!strict
local Types = require(script.Parent.ArcadeMachineTypes)

local ArcadeMachinePolicy = {}

function ArcadeMachinePolicy.CanStartGame(
	model: Types.ArcadeMachineModel,
	playerMoney: number,
	config: Types.ArcadeMachineConfigType
): (boolean, string?)
	if model.Status == Types.MachineStatus.Playing then
		return false, "Machine is currently occupied"
	end

	if model.Status == Types.MachineStatus.Broken then
		return false, "Machine is broken"
	end

	if model.Status == Types.MachineStatus.Repairing then
		return false, "Machine is repairing"
	end

	if playerMoney < config.PlayCost then
		return false, "Insufficient funds"
	end

	return true
end

function ArcadeMachinePolicy.CanRepair(
	model: Types.ArcadeMachineModel,
	playerMoney: number
): (boolean, string?)
	if model.Status ~= Types.MachineStatus.Broken then
		return false, "Machine does not need repair"
	end
	if playerMoney < model.Config.RepairCost then
		return false, "Insufficient funds for repair"
	end
	return true
end

function ArcadeMachinePolicy.CanCollectMoney(model: Types.ArcadeMachineModel): boolean
	return model.CollectedMoney > 0
end

return ArcadeMachinePolicy
