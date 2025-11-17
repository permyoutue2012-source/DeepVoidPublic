local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Supported Games List
local SupportedGames = {
    [6182305461] = {
        Name = "Infamy",
        ScriptURL = "https://raw.githubusercontent.com/permyoutue2012-source/DeepVoidPublic/refs/heads/main/DeepVoidInfamy.lua"
    }
    -- Add more games here in the future:
    -- [gameId] = {Name = "Game Name", ScriptURL = "https://raw.githubusercontent.com/..."}
}

-- Function to load game script
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
    end
end

-- Check if current game is supported and auto-load
local currentGameId = game.PlaceId
local supportedGame = SupportedGames[currentGameId]

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
      Key = {"https://pastebin.com/raw/DPkEXv2D"}, -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
      
      -- Auto-load the game script when key is validated
      Callback = function(ValidKey)
          if ValidKey then
              if supportedGame then
                  -- Wait a moment for the UI to settle, then load the game script
                  task.spawn(function()
                      wait(1)
                      loadGameScript()
                  end)
              else
                  Rayfield:Notify({
                      Title = "Key Valid",
                      Content = "Key accepted! However, this game is not supported.",
                      Duration = 5,
                  })
              end
          end
      end
   }
})

-- Main Tab (only show if game is not supported or for manual loading)
local MainTab = Window:CreateTab("Loader", 4483362458) -- Title, Image

-- Section
local MainTabSection = MainTab:CreateSection("Game Loader")

-- Display current game info
local function getCurrentGameInfo()
    local currentGameId = game.PlaceId
    local supportedGame = SupportedGames[currentGameId]
    
    if supportedGame then
        return supportedGame.Name .. " (Supported - Auto-loading after key)"
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

local CurrentGameLabel = MainTab:CreateLabel({
    Name = "Current Game: " .. getCurrentGameInfo(),
})

-- Manual Load Button (useful if auto-load fails or for unsupported games)
local Button = MainTab:CreateButton({
   Name = "Manual Load Game Script",
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
    Name = "1. Enter your key to auto-load supported games",
})

local InstructionsLabel2 = MainTab:CreateLabel({
    Name = "2. Use 'Manual Load' if auto-load fails",
})

local InstructionsLabel3 = MainTab:CreateLabel({
    Name = "3. Check supported games list above",
})

-- Auto-detect and notify on script start
task.spawn(function()
    wait(2) -- Wait a bit for the UI to load
    
    if supportedGame then
        Rayfield:Notify({
            Title = "DeepVoid Loader",
            Content = "Welcome! " .. supportedGame.Name .. " is supported. Enter your key to auto-load.",
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
