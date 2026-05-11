--!strict
local Types = require(script.Parent.ArcadeMachineTypes)

local ArcadeMachinePolicy = {}

function ArcadeMachinePolicy.CanStartGame(
	model: Types.ArcadeMachineModel,
	playerMoney: number,
	config: Types.ArcadeMachineConfigType
): (boolean, string?)
	if model.Status == "Playing" then
		return false, "Machine is currently occupied"
	end

	if model.Status == "Broken" then
		return false, "Machine is broken"
	end

	if playerMoney < config.PlayCost then
		return false, "Insufficient funds"
	end

	return true
end

function ArcadeMachinePolicy.CanCollectMoney(model: Types.ArcadeMachineModel): boolean
	return model.CollectedMoney > 0
end

return ArcadeMachinePolicy
