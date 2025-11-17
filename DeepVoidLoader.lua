-- Supported Games List
local SupportedGames = {
    [6182305461] = {
        Name = "Infamy",
        Script = "loadstring(game:HttpGet('https://raw.githubusercontent.com/permyoutue2012-source/DeepVoidPublic/refs/heads/main/DeepVoidInfamy.lua'))()"
    }
    -- Add more games here like:
    -- [123456789] = {
    --     Name = "Another Game",
    --     Script = "loadstring(game:HttpGet('https://raw.githubusercontent.com/.../script.lua'))()"
    -- }
}

-- Check if current game is supported
local currentGame = SupportedGames[game.PlaceId]

if currentGame then
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    
    local Window = Rayfield:CreateWindow({
       Name = "DeepVoid Loader - " .. currentGame.Name,
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
          Key = {"https://pastebin.com/raw/DPkEXv2D"},
          Callback = function(ValidKey)
              if ValidKey then
                  -- Run the specific script for this game
                  loadstring(currentGame.Script)()
              end
          end
       }
    })
else
    -- Game not supported
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "DeepVoid",
        Text = "This game is not supported.",
        Duration = 5
    })
end
