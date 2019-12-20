local _GL = GLOBAL
local TheNet = _GL.TheNet
local TheWorld = _GL.TheWorld
local IsServer = TheNet:GetIsServer() or TheNet:IsDedicated()
local Ents = _GL.Ents
local require = _GL.require
local Old_Networking_Say = _GL.Networking_Say
local AllPlayers = _GL.AllPlayers
local PrefabList, EventPrefabList = require "Clean_List" ()
local modconf = {}
local modconfcount = {}
local stump = GetModConfigData("stump")
local iseventclean = GetModConfigData("iseventclean")
local eventcleancount = GetModConfigData("eventcleancount")
local stumpcount = GetModConfigData("stumpcount")

if not IsServer then
    return
end

for i,v in pairs(PrefabList) do
    modconf[i] = GetModConfigData(v)
    modconfcount[i] = GetModConfigData(v.."count")
end

local function CleanPrefab()
    local instcount = {}
    for _,v in pairs(Ents) do
        if v.prefab ~= nil and not v.inlimbo then

            local pf = v.prefab

            if PrefabList[pf] ~= nil and modconf[pf] then
                if instcount[pf] == nil then
                    instcount[pf] = 1
                else
                    instcount[pf] = instcount[pf] + 1
                end
                if instcount[pf] > modconfcount[pf] then
                    v:Remove()
                end
            end

            if iseventclean and EventPrefabList[pf] ~= nil then
                if instcount[pf] == nil then
                    instcount[pf] = 1
                else
                    instcount[pf] = instcount[pf] + 1
                end
                if instcount[pf] > eventcleancount then
                    v:Remove()
                end
            end

            if stump and v:HasTag("stump") then
                if instcount[pf] == nil then
                    instcount[pf] = 1
                else
                    instcount[pf] = instcount[pf] + 1
                end
                if instcount[pf] > stumpcount then
                    v:Remove()
                end
            end
        end
    end
end


local function Clean(inst)
    TheNet:Announce("The server will be cleand up in 40 Seconds, quickly pick up what you don't want to be cleaned up!！")
    inst:DoTaskInTime(40, CleanPrefab)
end


local function GetPlayerById(playerid)
    for _, v in ipairs(AllPlayers) do
        if v ~= nil and v.userid and v.userid == playerid then
            return v
        end
    end
    return nil
end

_GL.Networking_Say = function(guid, userid, name, prefab, message, colour, whisper, isemote, ...)
    Old_Networking_Say(guid, userid, name, prefab, message, colour, whisper, isemote, ...)
    if string.lower(message) == "$clean" then
        local player = GetPlayerById(userid)
        if player then
            if not (TheNet:GetIsServerAdmin() and player.components and player.Network:IsServerAdmin()) then
                player:DoTaskInTime(0.5, function() if player.components.talker then player.components.talker:Say(player:GetDisplayName() .. ", " .. "Only administrators can use this command") end end)
                return
            end
            player:DoTaskInTime(0.5, function() if player.components.talker then player.components.talker:Say("Cleaning up ...") CleanPrefab() end end)
        end
    end
end

--定时任务
if GetModConfigData("cleanmodel") then
    AddPrefabPostInit("world", function(inst) inst:DoPeriodicTask(GetModConfigData("time") * TUNING.TOTAL_DAY_TIME, Clean) end)
    --GetModConfigData("time") * TUNING.TOTAL_DAY_TIME
end
