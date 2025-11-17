local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "DeepVoid Loader",
   Icon = 0,
   LoadingTitle = "DeepVoid Is Made By One Person",
   LoadingSubtitle = "by DeepVirus",
   ShowText = "DeepVoid",
   Theme = "Default",
   ToggleUIKeybind = "K",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = false,
      FolderName = "DeepVoid",
      FileName = "DeepVoidSave"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "DeepVoid Loader",
      Subtitle = "Key System",
      Note = "In the Discord",
      FileName = "DeepVoidKey",
      SaveKey = false,
      GrabKeyFromSite = true,
      Key = {"https://pastebin.com/raw/DPkEXv2D"}
   }
})

-- Main Tab
local MainTab = Window:CreateTab("Loader", 4483362458)

-- Section
local MainTabSection = MainTab:CreateSection("Game Loader")

-- Infamy Button
local Button = MainTab:CreateButton({
   Name = "Infamy",
   Callback = function()
       Rayfield:Notify({
           Title = "Loading Infamy",
           Content = "Loading DeepVoid Infamy script...",
           Duration = 3,
       })
       loadstring(game:HttpGet("https://raw.githubusercontent.com/permyoutue2012-source/DeepVoidPublic/refs/heads/main/DeepVoidInfamy.lua"))()
   end,
})

-- Supported Games Section
local SupportedGamesSection = MainTab:CreateSection("Supported Games")

local GameLabel = MainTab:CreateLabel({
    Name = "✓ Infamy (ID: 6182305461)",
})

-- Instructions Section
local InstructionsSection = MainTab:CreateSection("Instructions")

local InstructionsLabel = MainTab:CreateLabel({
    Name = "1. Enter your key first",
})

local InstructionsLabel2 = MainTab:CreateLabel({
    Name = "2. Click the Infamy button to load the hub",
})
