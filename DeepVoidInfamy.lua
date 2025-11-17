if game.placeId == 6182305461 then
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "DeepVoid Hub - Infamny",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "DeepVoid Is Made By One Person",
   LoadingSubtitle = "by DeepVirus",
   ShowText = "DeepVoid", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = "DeepVoid", -- Create a custom folder for your hub/game
      FileName = "DeepVoidSave"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "DeepVoid",
      Subtitle = "Key System",
      Note = "In the Discord", -- Use this to tell the user how to get a key
      FileName = "DeepVoidKey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/DPkEXv2D"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

-- Main Tab -- 
local MainTab = Window:CreateTab("Universal", 4483362458) -- Title, Image
-- Section --
local MainTabSection = MainTab:CreateSection("Universal")
Rayfield:Notify({
   Title = "Made with love",
   Content = "DeepVirus",
   Duration = 6.5,
   Image = nil,
})
-- Toggle1 for Main Tab --
local Toggle = MainTab:CreateToggle({
   Name = "Fly",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   -- The function that takes place when the toggle is pressed
   -- The variable (Value) is a boolean on whether the toggle is true or false
   end,
})

-- Slider1 for Main tab --
local Slider = MainTab:CreateSlider({
   Name = "Walkspeed",
   Range = {0, 150},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

-- Teleport Tab --
local TeleportTab = Window:CreateTab("Teleport", nil) -- Title, Image

-- Section --
local Section = TeleportTab:CreateSection("Main Locations")

-- Teleport function --
local function teleportToPosition(position)
    local player = game.Players.LocalPlayer
    local character = player.Character
    if character then
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            humanoidRootPart.CFrame = position
        end
    end
end

-- Buttons with teleport positions --
local Button = TeleportTab:CreateButton({
   Name = "Criminal Ai Store",
   Callback = function()
       teleportToPosition(CFrame.new(
           180.961227, 6.25, 177.052765,
           -0.0342510864, -2.06365147e-08, 0.999413252,
           -3.50929241e-08, 1, 1.944595246e-08,
           -0.999413252, -3.44062876e-08, -0.0342510864
       ))
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "CellPhone Upgrade Store",
   Callback = function()
       teleportToPosition(CFrame.new(
           294.437164, 3.12500381, 320.251617,
           -0.998987556, -4.3703921e-10, -0.0449872017,
           -4.73846684e-10, 1, 8.07513167e-10,
           0.0449872017, 8.28012658e-10, -0.998987556
       ))
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "Paradise Boulevard",
   Callback = function()
       teleportToPosition(CFrame.new(
           287.000488, 3.01315951, 804.065613,
           -0.997593284, -2.46789913e-08, 0.0693367273,
           -3.02520782e-08, 1, -7.93270871e-08,
           -0.0693367273, -8.13337504e-08, -0.997593284
       ))
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "Bank Vault 1",
   Callback = function()
       teleportToPosition(CFrame.new(
           437.634644, 4.61452818, 271.268982,
           0.999965191, 1.03398587e-08, -0.00834570359,
           -1.01681561e-08, 1, 2.06162607e-08,
           0.00834570359, -2.05306829e-08, 0.999965191
       ))
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "Bank Vault 2",
   Callback = function()
       teleportToPosition(CFrame.new(
           6.39650917, 3.15959144, 328.755615,
           0.00683351699, 7.7040248e-08, 0.999976635,
           -8.56589253e-08, 1, -7.64566792e-08,
           -0.999976635, -8.51344595e-08, 0.00683351699
       ))
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "Bank Vault 3",
   Callback = function()
       teleportToPosition(CFrame.new(
           -258.925537, 33.2163544, -257.040405,
           0.0108723575, -8.37631831e-08, 0.999940872,
           -2.97348191e-09, 1, 8.38004652e-08,
           -0.999940872, -3.88441457e-09, 0.0108723575
       ))
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "Gun Store",
   Callback = function()
       teleportToPosition(CFrame.new(
           -304.64978, 3.25132918, 80.8332977,
           -0.0152139831, 7.20511384e-09, 0.999884248,
           -5.40974021e-09, 1, -7.28826111e-09,
           -0.999884248, -5.51999779e-09, -0.0152139831
       ))
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "North Beach",
   Callback = function()
       teleportToPosition(CFrame.new(
           -93.3040695, 3.04999995, 1043.85706,
           -0.998625576, -5.53483748e-09, 0.0524111651,
           -5.90155214e-09, 1, -6.8421202e-09,
           -0.0524111651, -7.14202342e-09, -0.998625576
       ))
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "Downtown Central",
   Callback = function()
       teleportToPosition(CFrame.new(
           91.2341003, 3.00499988, -40.5582275,
           0.51762706, -1.99396428e-08, 0.855606377,
           2.71776148e-08, 1, 6.86270596e-09,
           -0.855606377, 1.97010177e-08, 0.51762706
       ))
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "Melee Weapon Store",
   Callback = function()
       teleportToPosition(CFrame.new(
           -39.1010475, 3.25000072, -89.8388443,
           0.999997437, 2.51548453e-08, -0.00226337556,
           -2.53673349e-08, 1, 9.38527052e-08,
           0.00226337556, 9.39098754e-08, 0.999997437
       ))
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "The Club",
   Callback = function()
       teleportToPosition(CFrame.new(
           454.210083, 6.10000086, 41.5794296,
           -0.0455575995, -3.77497766e-09, -0.998961687,
           3.99537159e-09, 1, -3.96111011e-09,
           0.998961687, -4.17168211e-09, -0.0455575995
       ))
   end,
})

-- Combat Tab --
local CombatTab = Window:CreateTab("Combat", nil)
local Section = CombatTab:CreateSection("Auto Farm")

-- Auto Farm Variables
local autoFarmEnabled = false
local farmConnection = nil
local reloadConnection = nil

-- Gun Mod Variables
local infiniteAmmoEnabled = false
local noRecoilEnabled = false
local rapidFireEnabled = false
local bulletDamageEnabled = false
local bulletDamageMultiplier = 10
local gunModConnection = nil

-- Helper function to check if an object is a valid NPC
local function isValidNPC(npc)
    if not npc:IsA("Model") then return false end
    if npc.Name == "corpse" then return false end -- Skip corpses
    if string.find(npc.Name:lower(), "corpse") then return false end -- Skip anything with "corpse" in name
    
    -- Check if it has necessary parts to be a living NPC
    local hasHumanoid = npc:FindFirstChild("Humanoid")
    local hasRoot = npc:FindFirstChild("HumanoidRootPart") or npc:FindFirstChild("Torso")
    
    if hasHumanoid and hasRoot then
        return hasHumanoid.Health > 0
    end
    
    return false
end

-- Helper function to get NPC root part
local function getNPCRootPart(npc)
    return npc:FindFirstChild("HumanoidRootPart") or npc:FindFirstChild("Torso")
end

-- Function to find closest NPC
local function findClosestNPC(range)
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return nil end
    
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return nil end
    
    local closestNPC = nil
    local closestDistance = range or 100
    
    -- Search through ALL NPC folders including subfolders
    local npcFolders = {
        "policeForce", 
        "wantedSevere", 
        "wantedPetty", 
        "defaultOnJoined",
        "Citizens",
        "Neutral"
    }
    
    for _, folderName in ipairs(npcFolders) do
        local folder = workspace.NPCs:FindFirstChild(folderName)
        if folder then
            -- Check if folder has direct NPCs or subfolders
            for _, npc in ipairs(folder:GetChildren()) do
                -- Handle subfolders like sheriffRef, activePoliceAIs, etc.
                if npc:IsA("Folder") then
                    -- This is a subfolder like sheriffRef, search inside it
                    for _, subNpc in ipairs(npc:GetChildren()) do
                        if isValidNPC(subNpc) then
                            local npcRoot = getNPCRootPart(subNpc)
                            if npcRoot then
                                local distance = (rootPart.Position - npcRoot.Position).Magnitude
                                if distance < closestDistance then
                                    closestDistance = distance
                                    closestNPC = subNpc
                                end
                            end
                        end
                    end
                else
                    -- This is a direct NPC
                    if isValidNPC(npc) then
                        local npcRoot = getNPCRootPart(npc)
                        if npcRoot then
                            local distance = (rootPart.Position - npcRoot.Position).Magnitude
                            if distance < closestDistance then
                                closestDistance = distance
                                closestNPC = npc
                            end
                        end
                    end
                end
            end
        end
    end
    
    return closestNPC, closestDistance
end

-- Function to modify gun stats
local function modifyGunStats()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return end
    
    -- Modify equipped guns
    for _, tool in ipairs(character:GetChildren()) do
        if tool:IsA("Tool") and tool:FindFirstChild("uniqueGunVars") then
            local gunVars = tool.uniqueGunVars
            
            -- Infinite Ammo - Modify the values directly
            if infiniteAmmoEnabled then
                if gunVars:FindFirstChild("currentMagazine") then
                    gunVars.currentMagazine.Value = gunVars.maxMagazine.Value
                end
                if gunVars:FindFirstChild("remainingAmmo") then
                    gunVars.remainingAmmo.Value = 9999
                end
            end
            
            -- No Recoil
            if noRecoilEnabled and gunVars:FindFirstChild("recoil") then
                gunVars.recoil.Value = 0
            end
            
            -- Rapid Fire
            if rapidFireEnabled and gunVars:FindFirstChild("rateOfFire") then
                gunVars.rateOfFire.Value = 0.001 -- Much faster
            end
            
            -- Bullet Damage
            if bulletDamageEnabled then
                if gunVars:FindFirstChild("bulletDamage") then
                    gunVars.bulletDamage.Value = 100 * bulletDamageMultiplier -- Base damage * multiplier
                end
                if gunVars:FindFirstChild("dmgMultiplierFromRank") then
                    gunVars.dmgMultiplierFromRank.Value = bulletDamageMultiplier
                end
            end
        end
    end
    
    -- Also modify guns in backpack
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, tool in ipairs(backpack:GetChildren()) do
            if tool:IsA("Tool") and tool:FindFirstChild("uniqueGunVars") then
                local gunVars = tool.uniqueGunVars
                
                if infiniteAmmoEnabled then
                    if gunVars:FindFirstChild("currentMagazine") then
                        gunVars.currentMagazine.Value = gunVars.maxMagazine.Value
                    end
                    if gunVars:FindFirstChild("remainingAmmo") then
                        gunVars.remainingAmmo.Value = 9999
                    end
                end
                
                if noRecoilEnabled and gunVars:FindFirstChild("recoil") then
                    gunVars.recoil.Value = 0
                end
                
                if rapidFireEnabled and gunVars:FindFirstChild("rateOfFire") then
                    gunVars.rateOfFire.Value = 0.001
                end
                
                if bulletDamageEnabled then
                    if gunVars:FindFirstChild("bulletDamage") then
                        gunVars.bulletDamage.Value = 100 * bulletDamageMultiplier
                    end
                    if gunVars:FindFirstChild("dmgMultiplierFromRank") then
                        gunVars.dmgMultiplierFromRank.Value = bulletDamageMultiplier
                    end
                end
            end
        end
    end
end

-- Continuous modification loop for infinite ammo
local function startGunModLoop()
    if gunModConnection then
        gunModConnection:Disconnect()
    end
    
    gunModConnection = game:GetService("RunService").Heartbeat:Connect(function()
        if infiniteAmmoEnabled or rapidFireEnabled or bulletDamageEnabled then
            modifyGunStats()
        end
    end)
end

-- Function to shoot at NPC
local function shootAtNPC(npc)
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return end
    
    -- Get player's gun
    local gun = nil
    for _, child in ipairs(character:GetChildren()) do
        if child:IsA("Tool") and child:FindFirstChild("uniqueGunVars") then
            gun = child
            break
        end
    end
    
    if not gun then 
        Rayfield:Notify({
            Title = "No Gun Equipped",
            Content = "Please equip a gun first!",
            Duration = 3,
        })
        return 
    end
    
    local npcRoot = getNPCRootPart(npc)
    if not npcRoot then return end
    
    -- Get player's root part for position calculation
    local playerRoot = character:FindFirstChild("HumanoidRootPart")
    if not playerRoot then return end
    
    -- Create the exact args structure
    local args = {
        [1] = npcRoot.Position, -- Target position
        [2] = playerRoot.Position, -- Player position (origin)
        [3] = npcRoot -- Hit part
    }
    
    -- Use the exact remote path
    local remotePath = workspace.NPCs.wantedSevere[player.Name][gun.Name].uniqueGunVars.fired
    
    if remotePath then
        pcall(function()
            remotePath:FireServer(unpack(args))
        end)
    end
end

-- Function to handle automatic reloading
local function setupAutoReload()
    local player = game.Players.LocalPlayer
    
    reloadConnection = game:GetService("RunService").Heartbeat:Connect(function()
        if not autoFarmEnabled then return end
        
        local character = player.Character
        if not character then return end
        
        -- Check for guns that need reloading
        for _, tool in ipairs(character:GetChildren()) do
            if tool:IsA("Tool") and tool:FindFirstChild("uniqueGunVars") then
                local gunName = tool.Name
                if string.find(gunName, "0/") and not infiniteAmmoEnabled then -- Gun is empty
                    -- Fire reload remote using the correct path
                    local args = {[1] = "reloading"}
                    
                    local reloadRemote = workspace.NPCs.wantedSevere[player.Name][tool.Name].uniqueGunVars.fired
                    
                    if reloadRemote then
                        pcall(function()
                            reloadRemote:FireServer(unpack(args))
                        end)
                    end
                end
            end
        end
    end)
end

-- Main auto farm function
local function startAutoFarm()
    stopAutoFarm() -- Ensure any previous connections are closed
    
    farmConnection = game:GetService("RunService").Heartbeat:Connect(function()
        if not autoFarmEnabled then return end
        
        -- Apply gun modifications continuously
        if infiniteAmmoEnabled or noRecoilEnabled or rapidFireEnabled or bulletDamageEnabled then
            modifyGunStats()
        end
        
        local range = 100
        local closestNPC, distance = findClosestNPC(range)
        
        if closestNPC then
            shootAtNPC(closestNPC)
            -- Small delay between shots to prevent spam
            wait(0.1)
        end
    end)
    
    -- Start auto reload
    setupAutoReload()
    
    Rayfield:Notify({
        Title = "Auto Farm Started",
        Content = "Now automatically farming NPCs",
        Duration = 3,
    })
end

local function stopAutoFarm()
    if farmConnection then
        farmConnection:Disconnect()
        farmConnection = nil
    end
    
    if reloadConnection then
        reloadConnection:Disconnect()
        reloadConnection = nil
    end
    
    Rayfield:Notify({
        Title = "Auto Farm Stopped",
        Content = "Stopped farming NPCs",
        Duration = 3,
    })
end

-- Toggle for Auto Farm
local Toggle = CombatTab:CreateToggle({
   Name = "Auto Farm NPCs",
   CurrentValue = false,
   Flag = "AutoFarmToggle",
   Callback = function(Value)
       autoFarmEnabled = Value
       
       if autoFarmEnabled then
           startAutoFarm()
       else
           stopAutoFarm()
       end
   end,
})

-- Input for Auto Farm Range
local Input = CombatTab:CreateInput({
   Name = "Farm Range",
   CurrentValue = "100",
   PlaceholderText = "Detection Range",
   RemoveTextAfterFocusLost = true,
   Flag = "FarmRangeInput",
   Callback = function(Text)
       -- Range will be used in the farm function
   end,
})

-- Section for Gun Modifications
local Section = CombatTab:CreateSection("Gun Modifications")

-- Toggle for Infinite Ammo
local Toggle = CombatTab:CreateToggle({
   Name = "Infinite Ammo",
   CurrentValue = false,
   Flag = "InfiniteAmmoToggle",
   Callback = function(Value)
       infiniteAmmoEnabled = Value
       modifyGunStats()
       startGunModLoop()
       
       if Value then
           Rayfield:Notify({
               Title = "Infinite Ammo Enabled",
               Content = "You now have unlimited ammo!",
               Duration = 3,
           })
       end
   end,
})

-- Toggle for No Recoil
local Toggle = CombatTab:CreateToggle({
   Name = "No Recoil",
   CurrentValue = false,
   Flag = "NoRecoilToggle",
   Callback = function(Value)
       noRecoilEnabled = Value
       modifyGunStats()
       
       if Value then
           Rayfield:Notify({
               Title = "No Recoil Enabled",
               Content = "Your guns have no recoil!",
               Duration = 3,
           })
       end
   end,
})

-- Toggle for Rapid Fire
local Toggle = CombatTab:CreateToggle({
   Name = "Rapid Fire",
   CurrentValue = false,
   Flag = "RapidFireToggle",
   Callback = function(Value)
       rapidFireEnabled = Value
       modifyGunStats()
       startGunModLoop()
       
       if Value then
           Rayfield:Notify({
               Title = "Rapid Fire Enabled",
               Content = "Your guns fire much faster!",
               Duration = 3,
           })
       end
   end,
})

-- Toggle for Bullet Damage
local Toggle = CombatTab:CreateToggle({
   Name = "Increased Bullet Damage",
   CurrentValue = false,
   Flag = "BulletDamageToggle",
   Callback = function(Value)
       bulletDamageEnabled = Value
       modifyGunStats()
       startGunModLoop()
       
       if Value then
           Rayfield:Notify({
               Title = "Increased Damage Enabled",
               Content = "Your bullets do " .. bulletDamageMultiplier .. "x more damage!",
               Duration = 3,
           })
       end
   end,
})

-- Slider for Damage Multiplier
local Slider = CombatTab:CreateSlider({
   Name = "Damage Multiplier",
   Range = {1, 100},
   Increment = 1,
   Suffix = "x Damage",
   CurrentValue = 10,
   Flag = "DamageMultiplierSlider",
   Callback = function(Value)
       bulletDamageMultiplier = Value
       if bulletDamageEnabled then
           modifyGunStats()
           Rayfield:Notify({
               Title = "Damage Multiplier Updated",
               Content = "Bullets now do " .. Value .. "x more damage!",
               Duration = 2,
           })
       end
   end,
})

-- Button to apply all gun mods
local Button = CombatTab:CreateButton({
   Name = "Apply All Gun Mods",
   Callback = function()
       modifyGunStats()
       Rayfield:Notify({
           Title = "Gun Mods Applied",
           Content = "All gun modifications have been applied!",
           Duration = 3,
       })
   end,
})

end
