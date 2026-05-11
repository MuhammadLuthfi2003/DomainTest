local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)

local Players = game:GetService("Players")
local PlayerScripts = Players.LocalPlayer:WaitForChild("PlayerScripts")

-- // REGISTER CONTROLLERS // --
Knit.AddControllers(PlayerScripts:WaitForChild("Client"):WaitForChild("Controllers"))

-- // START KNIT // --
Knit.Start():andThen(function()
    print("Knit Client Started")
end):catch(warn)
