--!strict

local ArcadeConfigModel = {}

function ArcadeConfigModel.new(data:table)
	return {
		PlayCost = data.PlayCost or 0,
		GameDuration = data.GameDuration or 0,
		RepairCost = data.RepairCost or 0,
		RepairDuration = data.RepairDuration or 0,
	}
end

return ArcadeConfigModel
