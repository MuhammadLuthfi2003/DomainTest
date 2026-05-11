--!strict

export type MachineStatus = "Idle" | "Playing" | "Broken" | "Repairing"

export type ArcadeMachineConfigType = {
	PlayCost: number,
	GameDuration: number,
	RepairCost: number,
	RepairDuration:number,
}

export type ArcadeMachineModel = {
	Name: string,
	Status: MachineStatus,
	IsEnhanced: boolean,
	CollectedMoney: number,
	GameEndTime: number, -- 0 if not playing
    RepairEndTime: number, -- 0 if not repairing
	Config: ArcadeMachineConfigType,
}

return nil
