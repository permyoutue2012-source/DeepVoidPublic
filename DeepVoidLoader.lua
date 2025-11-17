local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "DeepVoid Loader",
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

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "DeepVoid Loader",
      Subtitle = "Key System",
      Note = "In the Discord", -- Use this to tell the user how to get a key
      FileName = "DeepVoidKey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/DPkEXv2D"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

-- Supported Games List
local SupportedGames = {
    [6182305461] = {
        Name = "Infamy",
        ScriptURL = "https://raw.githubusercontent.com/permyoutue2012-source/DeepVoid/refs/heads/main/DeepVoid-Infamy.lua?token=GHSAT0AAAAAADPMVHYTXUTEKN2WPRHGL4LK2I2W3LA"
    }
    -- Add more games here in the future:
    -- [gameId] = {Name = "Game Name", ScriptURL = "https://raw.githubusercontent.com/..."}
}

-- Main Tab
local MainTab = Window:CreateTab("Loader", 4483362458) -- Title, Image

-- Section
local MainTabSection = MainTab:CreateSection("Game Loader")

-- Function to check current game and load appropriate script
local function loadGameScript()
    local currentGameId = game.PlaceId
    local supportedGame = SupportedGames[currentGameId]
    
    if supportedGame then
        Rayfield:Notify({
            Title = "Game Detected",
            Content = "Loading " .. supportedGame.Name .. " script...",
            Duration = 3,
        })
        
        -- Load the game-specific script
        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet(supportedGame.ScriptURL))()
        end)
        
        if not success then
            Rayfield:Notify({
                Title = "Load Error",
                Content = "Failed to load " .. supportedGame.Name .. " script: " .. errorMessage,
                Duration = 6,
            })
        end
    else
        Rayfield:Notify({
            Title = "Game Not Supported",
            Content = "This game is not currently supported by DeepVoid Hub.",
            Duration = 6,
        })
        
        -- Show current game ID for debugging
        print("Current Game ID:", currentGameId)
        print("Game Name:", game:GetService("MarketplaceService"):GetProductInfo(currentGameId).Name)
    end
end

-- Function to get current game info
local function getCurrentGameInfo()
    local currentGameId = game.PlaceId
    local supportedGame = SupportedGames[currentGameId]
    
    if supportedGame then
        return supportedGame.Name .. " (Supported)"
    else
        local gameName = "Unknown Game"
        local success, result = pcall(function()
            return game:GetService("MarketplaceService"):GetProductInfo(currentGameId).Name
        end)
        if success then
            gameName = result
        end
        return gameName .. " (Not Supported)"
    end
end

-- Display current game info
local CurrentGameLabel = MainTab:CreateLabel({
    Name = "Current Game: " .. getCurrentGameInfo(),
})

-- Load Game Button
local Button = MainTab:CreateButton({
   Name = "Load Game Script",
   Callback = function()
       loadGameScript()
   end,
})

-- Supported Games List Display
local SupportedGamesSection = MainTab:CreateSection("Supported Games")

-- Create labels for each supported game
for gameId, gameInfo in pairs(SupportedGames) do
    local GameLabel = MainTab:CreateLabel({
        Name = "✓ " .. gameInfo.Name .. " (ID: " .. gameId .. ")",
    })
end

-- Instructions Section
local InstructionsSection = MainTab:CreateSection("Instructions")

local InstructionsLabel = MainTab:CreateLabel({
    Name = "1. Make sure you're in a supported game",
})

local InstructionsLabel2 = MainTab:CreateLabel({
    Name = "2. Click 'Load Game Script' to load the hub",
})

local InstructionsLabel3 = MainTab:CreateLabel({
    Name = "3. Use the new window that appears",
})

-- Auto-detect and notify on script start
task.spawn(function()
    wait(2) -- Wait a bit for the UI to load
    
    local currentGameId = game.PlaceId
    local supportedGame = SupportedGames[currentGameId]
    
    if supportedGame then
        Rayfield:Notify({
            Title = "DeepVoid Loader",
            Content = "Welcome! " .. supportedGame.Name .. " is supported. Click 'Load Game Script' to start.",
            Duration = 8,
        })
    else
        Rayfield:Notify({
            Title = "DeepVoid Loader",
            Content = "Game not supported. Check the Loader tab for supported games.",
            Duration = 8,
        })
    end
end)
