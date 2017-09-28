--[[
GameEvent module

Exposes some functions for wrapping up DCS and KI events into a message that can be sent to TCP Server

Author: Igneous01
]]--

GameEvent = {}

GameEvent.CreateGameEvent = function(sessionID, serverID, sortieID, dcs_event_obj, realTime)
  env.info("GameEvent.CreateGameEvent called (sessionID: " 
           .. tostring(sessionID) .. ", serverID: " 
           .. tostring(serverID) .. ", sortieID: " 
           .. tostring(sortieID) .. ", dcs_event_obj: "
           .. KI.Toolbox.Dump(dcs_event_obj) .. ", realTime: "
           .. tostring(realTime) .. ")")
  if sessionID == nil or 
    serverID == nil or 
    sortieID == nil or 
    dcs_event_obj == nil or 
    dcs_event_obj.initiator == nil or
    realTime == nil then
    
    env.info("GameEvent.CreateGameEvent - invalid parameters (one or more is nil) exiting")
    return nil
  end
  
  local playerName = dcs_event_obj.initiator:getPlayerName()
  local airfield = nil
  local weapon = nil
  local weaponCategory = nil
  local target = nil
  local targetName = nil
  local targetType = nil
  local targetCategory = nil
  local targetIsPlayer = false
  local targetPlayerUCID = nil
  local targetPlayerName = nil
  
  if dcs_event_obj.place then
    airfield = dcs_event_obj.place:getName()
  end
  
  if dcs_event_obj.weapon then
    weapon = dcs_event_obj.weapon:getDesc()["displayName"]
    weaponCategory = KI.Defines.WeaponCategories[dcs_event_obj.weapon:getCategory()]
  end
  
  if dcs_event_obj.target then
    targetName = dcs_event_obj.target:getName()
    target = dcs_event_obj.target:getTypeName()
    targetType = KI.Defines.UnitTypes[target]
    targetCategory = KI.Defines.UnitCategories[dcs_event_obj.target:getCategory()]
    targetPlayerName = dcs_event_obj.target:getPlayerName()
    
    if targetPlayerName then
      targetIsPlayer = true
      targetPlayerUCID = KI.Query.FindUCID_Player(KI.MP.GetPlayerNameFix(targetPlayerName))
    end
    
  end
  
  local gameevent =
  {
    ["SessionID"] = sessionID,
    ["ServerID"] = serverID,
    ["SortieID"] = sortieID,
    ["UCID"] = KI.Query.FindUCID_Player(KI.MP.GetPlayerNameFix(playerName)),
    ["Event"] = KI.Defines.EventNames[dcs_event_obj.id],
    ["PlayerName"] = playerName,
    ["RealTime"] = realTime,
    ["GameTime"] = dcs_event_obj.time,
    ["Role"] = dcs_event_obj.initiator:getTypeName(),
    -- optional fields
    ["Airfield"] = airfield,
    ["Weapon"] = weapon,
    ["WeaponCategory"] = weaponCategory,
    ["TargetName"] = targetName,
    ["TargetModel"] = target,
    ["TargetType"] = targetType,
    ["TargetCategory"] = targetCategory,
    ["TargetIsPlayer"] = targetIsPlayer,
    ["TargetPlayerUCID"] = targetPlayerUCID,
    ["TargetPlayerName"] = targetPlayerName
  }
  
  return gameevent
end