local TheNet = GLOBAL.TheNet
local TheSim = GLOBAL.TheSim
local IsServer = TheNet:GetIsServer() or TheNet:IsDedicated()

if IsServer then
    modimport("scripts/Main_Clean.lua")
end