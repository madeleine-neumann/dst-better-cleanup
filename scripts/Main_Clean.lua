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

--清理
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

--公告
local function Clean(inst)
    TheNet:Announce("40秒后清理服务器，不想被清理的东西赶紧捡起来！")
    inst:DoTaskInTime(40, CleanPrefab)
end
    
--查找玩家ID
local function GetPlayerById(playerid)
    for _, v in ipairs(AllPlayers) do
        if v ~= nil and v.userid and v.userid == playerid then
            return v
        end
    end
    return nil
end

--获取玩家指令
_GL.Networking_Say = function(guid, userid, name, prefab, message, colour, whisper, isemote, ...)
    Old_Networking_Say(guid, userid, name, prefab, message, colour, whisper, isemote, ...)
    if string.lower(message) == "$clean" then
        local player = GetPlayerById(userid)
        if player then
            if not (TheNet:GetIsServerAdmin() and player.components and player.Network:IsServerAdmin()) then
                player:DoTaskInTime(0.5, function() if player.components.talker then player.components.talker:Say(player:GetDisplayName() .. ", " .. "管理员才能用此命令") end end)
                return
            end
            player:DoTaskInTime(0.5, function() if player.components.talker then player.components.talker:Say("清理中...") CleanPrefab() end end)
        end
    end
end

--定时任务
if GetModConfigData("cleanmodel") then
    AddPrefabPostInit("world", function(inst) inst:DoPeriodicTask(GetModConfigData("time") * TUNING.TOTAL_DAY_TIME, Clean) end)
    --GetModConfigData("time") * TUNING.TOTAL_DAY_TIME 
end
