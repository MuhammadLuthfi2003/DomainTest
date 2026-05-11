--!strict
local Types = require(script.Parent.ArcadeMachineTypes)

local ArcadeMachineFactory = {}

function ArcadeMachineFactory.Create(
	name: string,
	isEnhanced: boolean,
	configData: any?
): Types.ArcadeMachineModel
	local data = configData or {}
	
	-- Inline config construction (replaces ArcadeConfigFactory)
	local config: Types.ArcadeMachineConfigType = {
		PlayCost = data.PlayCost or 0,
		GameDuration = data.GameDuration or 0,
		RepairCost = data.RepairCost or 0,
		RepairDuration = data.RepairDuration or 0,
	}

	-- Inline model construction (replaces ArcadeMachineModel.new)
	return {
		Name = name,
		Status = Types.MachineStatus.Idle,
		IsEnhanced = isEnhanced,
		CollectedMoney = 0,
		GameEndTime = 0,
		RepairEndTime = 0,
		Config = config,
	}
end

return ArcadeMachineFactory
