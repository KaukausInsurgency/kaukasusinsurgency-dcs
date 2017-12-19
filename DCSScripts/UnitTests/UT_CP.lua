-- Unit Tests for Capture Point Class

UT.TestCase("CP", 
  function()
    UT.ValidateSetup(function() return ZONE:New("TestCPZone") ~= nil end)  -- zone must exist in ME
  end, 
  function()
    UT.TestData.Zone = ZONE:New("TestCPZone")
    UT.TestData.Vec3 = UT.TestData.Zone:GetVec3(0)
  end,
    function()
      local function count_hash(hash)
        local _c = 0
        for i, p in pairs(hash) do
          _c = _c + 1
        end
        return _c
      end
      
      
      
      -- testing base contructor
      if true then
        local _cp = CP:New("Test CP", "TestCPZone", CP.Enum.CAPTUREPOINT)
        UT.TestCompare(function() return _cp ~= nil end)
        UT.TestCompare(function() return _cp.Zone ~= nil end)
        UT.TestCompare(function() return _cp.Name == "Test CP" end)
        UT.TestCompare(function() return _cp.Zone.ZoneName == UT.TestData.Zone.ZoneName end)
        UT.TestCompare(function() return _cp.SpawnZone1 == nil end)
        UT.TestCompare(function() return _cp.SpawnZone2 == nil end)
        UT.TestCompare(function() return _cp.Text == nil end)
        UT.TestCompare(function() return _cp.Type == CP.Enum.CAPTUREPOINT end)
        UT.TestCompare(function() return _cp.Defenses ~= nil end)
        UT.TestCompare(function() return count_hash(_cp.Defenses) == 0 end)
        UT.TestCompare(function() return _cp.Position.X == UT.TestData.Vec3.z end)      -- DCS treats the z axis as the 2d x axis from the map point of view
        UT.TestCompare(function() return _cp.Position.Y == UT.TestData.Vec3.x end)      -- DCS treats the x axis as the 2d y axis from the map point of view
      end
      
      -- testing constructor with 1 optional param
      if true then
        local _cp = CP:New("Test CP", "TestCPZone", CP.Enum.CAPTUREPOINT, "TestCPZone")
        UT.TestCompare(function() return _cp ~= nil end)
        UT.TestCompare(function() return _cp.Zone ~= nil end)
        UT.TestCompare(function() return _cp.Name == "Test CP" end)
        UT.TestCompare(function() return _cp.Zone.ZoneName == UT.TestData.Zone.ZoneName end)
        UT.TestCompare(function() return _cp.SpawnZone1.ZoneName == UT.TestData.Zone.ZoneName end)
        UT.TestCompare(function() return _cp.SpawnZone2 == nil end)
        UT.TestCompare(function() return _cp.Text == nil end)
        UT.TestCompare(function() return _cp.Type == CP.Enum.CAPTUREPOINT end)
        UT.TestCompare(function() return _cp.Defenses ~= nil end)
        UT.TestCompare(function() return count_hash(_cp.Defenses) == 0 end)
        UT.TestCompare(function() return _cp.Position.X == UT.TestData.Vec3.z end)      -- DCS treats the z axis as the 2d x axis from the map point of view
        UT.TestCompare(function() return _cp.Position.Y == UT.TestData.Vec3.x end)      -- DCS treats the x axis as the 2d y axis from the map point of view      
      end
      
      -- testing constructor with 2 optional param
      if true then
        local _cp = CP:New("Test CP", "TestCPZone", CP.Enum.CAPTUREPOINT, "TestCPZone", "TestCPZone")
        UT.TestCompare(function() return _cp ~= nil end)
        UT.TestCompare(function() return _cp.Zone ~= nil end)
        UT.TestCompare(function() return _cp.Name == "Test CP" end)
        UT.TestCompare(function() return _cp.Zone.ZoneName == UT.TestData.Zone.ZoneName end)
        UT.TestCompare(function() return _cp.SpawnZone1.ZoneName == UT.TestData.Zone.ZoneName end)
        UT.TestCompare(function() return _cp.SpawnZone2.ZoneName == UT.TestData.Zone.ZoneName end)
        UT.TestCompare(function() return _cp.Text == nil end)
        UT.TestCompare(function() return _cp.Type == CP.Enum.CAPTUREPOINT end)
        UT.TestCompare(function() return _cp.Defenses ~= nil end)
        UT.TestCompare(function() return count_hash(_cp.Defenses) == 0 end)
        UT.TestCompare(function() return _cp.Position.X == UT.TestData.Vec3.z end)      -- DCS treats the z axis as the 2d x axis from the map point of view
        UT.TestCompare(function() return _cp.Position.Y == UT.TestData.Vec3.x end)      -- DCS treats the x axis as the 2d y axis from the map point of view      
      end
        
      -- testing constructor with 3 optional param
      if true then
        local _cp = CP:New("Test CP", "TestCPZone", CP.Enum.CAPTUREPOINT, "TestCPZone", "TestCPZone", "VHF 130.000 AM MHz")
        UT.TestCompare(function() return _cp ~= nil end)
        UT.TestCompare(function() return _cp.Zone ~= nil end)
        UT.TestCompare(function() return _cp.Name == "Test CP" end)
        UT.TestCompare(function() return _cp.Zone.ZoneName == UT.TestData.Zone.ZoneName end)
        UT.TestCompare(function() return _cp.SpawnZone1.ZoneName == UT.TestData.Zone.ZoneName end)
        UT.TestCompare(function() return _cp.SpawnZone2.ZoneName == UT.TestData.Zone.ZoneName end)
        UT.TestCompare(function() return _cp.Text == "VHF 130.000 AM MHz" end)
        UT.TestCompare(function() return _cp.Type == CP.Enum.CAPTUREPOINT end)
        UT.TestCompare(function() return _cp.Defenses ~= nil end)
        UT.TestCompare(function() return count_hash(_cp.Defenses) == 0 end)
        UT.TestCompare(function() return _cp.Position.X == UT.TestData.Vec3.z end)      -- DCS treats the z axis as the 2d x axis from the map point of view
        UT.TestCompare(function() return _cp.Position.Y == UT.TestData.Vec3.x end)      -- DCS treats the x axis as the 2d y axis from the map point of view      
      end
      
      
      
      
      if true then
        local _cp = CP:New("Test CP", "TestCPZone", CP.Enum.CAPTUREPOINT)
        -- testing SetDefenseUnit method
        UT.TestFunction(CP.SetDefenseUnit, _cp, "TestKey", 5)
        UT.TestCompare(function() return count_hash(_cp.Defenses) == 1 end)
        UT.TestCompare(function() return _cp.Defenses["TestKey"] ~= nil end)
        UT.TestCompare(function() return _cp.Defenses["TestKey"].qty == 0 end)
        UT.TestCompare(function() return _cp.Defenses["TestKey"].cap == 5 end)
        
        -- testing Fortify method
        UT.TestFunction(CP.Fortify, _cp, "TestKey", 1)
        UT.TestCompare(function() return _cp.Defenses["TestKey"].qty == 1 end)
        UT.TestCompareOnce(function() return _cp:Fortify("TestKey", 1) == true end)
        UT.TestCompare(function() return _cp.Defenses["TestKey"].qty == 2 end)
        UT.TestFunction(CP.Fortify, _cp, "TestKey", 22)
        UT.TestCompareOnce(function() return _cp:Fortify("TestKey", 22) == false end)
      
        -- testing Unfortify method
        UT.TestFunction(CP.SetDefenseUnit, _cp, "MockKey", 5)
        UT.TestFunction(CP.Unfortify, _cp, "MockKey", 25)   -- this should just set qty to 0
        UT.TestCompare(function() return _cp.Defenses["MockKey"].qty == 0 end)      
        UT.TestFunction(CP.Fortify, _cp, "MockKey", 5)
        UT.TestCompare(function() return _cp.Defenses["MockKey"].qty == 5 end)  -- checking to ensure no side effects to Unfortify
        UT.TestFunction(CP.Unfortify, _cp, "MockKey", 1)
        UT.TestCompare(function() return _cp.Defenses["MockKey"].qty == 4 end)
        UT.TestFunction(CP.Unfortify, _cp, "MockKey", 1)
        UT.TestCompare(function() return _cp.Defenses["MockKey"].qty == 3 end)
        UT.TestFunction(CP.Unfortify, _cp, "MockKey", 2)
        UT.TestCompare(function() return _cp.Defenses["MockKey"].qty == 1 end)
        UT.TestFunction(CP.Unfortify, _cp, "MockKey", -1)                       -- checking that negative numbers dont cause any wierd issues
        UT.TestCompare(function() return _cp.Defenses["MockKey"].qty == 1 end)
        
        -- testing ViewResources method
        UT.TestFunction(CP.ViewResources, _cp)
        UT.TestFunction(CP.GetResourceEncoded, _cp)
      end
      
      
      if true then
        local _cp = CP:New("Test CP", "TestCPZone", CP.Enum.CAPTUREPOINT)
        -- testing GetOwnership method
        _cp.BlueUnits = 1
        _cp.RedUnits = 0
        UT.TestCompare(function() return _cp:GetOwnership() == "Blue" end)
        _cp.BlueUnits = 0
        _cp.RedUnits = 0
        UT.TestCompare(function() return _cp:GetOwnership() == "Neutral" end)
        _cp.BlueUnits = 0
        _cp.RedUnits = 1
        UT.TestCompare(function() return _cp:GetOwnership() == "Red" end)
        _cp.BlueUnits = 1
        _cp.RedUnits = 1
        UT.TestCompare(function() return _cp:GetOwnership() == "Contested" end)
        
        -- testing SetCoalitionCounts method
        UT.TestFunction(CP.SetCoalitionCounts, _cp, 0, 0)
        UT.TestCompare(function() return _cp:GetOwnership() == "Neutral" end)
        UT.TestFunction(CP.SetCoalitionCounts, _cp, 1, 0)
        UT.TestCompare(function() return _cp:GetOwnership() == "Red" end)
        UT.TestFunction(CP.SetCoalitionCounts, _cp, 0, 1)
        UT.TestCompare(function() return _cp:GetOwnership() == "Blue" end)
        UT.TestFunction(CP.SetCoalitionCounts, _cp, 1, 1)
        UT.TestCompare(function() return _cp:GetOwnership() == "Contested" end)
      
      end    
    end)
  
