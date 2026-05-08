local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "MeHub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "My Own Hub",
   LoadingSubtitle = "Script Hub",
   ShowText = "MeHub", -- for mobile users to unhide Rayfield, change if you'd like
   Theme = "AmberGlow", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from emitting warnings when the script has a version mismatch with the interface.

   -- ScriptID = "sid_a4f2c1908e3b", -- Your Script ID from developer.sirius.menu — enables analytics, managed keys, and script hosting

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "MeHub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include Discord.gg/. E.g. Discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the Discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique, as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that the system will accept, can be RAW file links (pastebin, github, etc.) or simple strings ("hello", "key22")
   }
})

local MainTab = Window:CreateTab("Main/Misc", 4483362458) -- Title, Image

      local Button = MainTab:CreateButton({
   Name = "Fly",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
   end,
})

      local Slider = MainTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 500},
   Increment = 1,
   Suffix = "o",
   CurrentValue = 16,
   Flag = "WalkSpeedSlider", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value     
   end,
})

      local Slider = MainTab:CreateSlider({
   Name = "JumpPower",
   Range = {50, 500},
   Increment = 1,
   Suffix = "o",
   CurrentValue = 50,
   Flag = "JumpPowerSlider", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value     
   end,
})

     local Button = MainTab:CreateButton({
   Name = "Fullbright ",
   Callback = function()
        local Lighting = game:GetService("Lighting")
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "FullbrightUI"

local toggleBtn = Instance.new("TextButton", screenGui)
toggleBtn.Size = UDim2.new(0, 120, 0, 40)
toggleBtn.Position = UDim2.new(0.5, -60, 0.05, 0) -- Top center
toggleBtn.Text = "Fullbright: OFF"
toggleBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Draggable = true

local enabled = false
local connections = {}

local function setFullbright(state)
    enabled = state
    if enabled then
        toggleBtn.Text = "Fullbright: ON"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        
        -- Apply settings
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        Lighting.GlobalShadows = false
        
        -- Lock settings (Anti-Reset)
        connections.Ambient = Lighting:GetPropertyChangedSignal("Ambient"):Connect(function()
            if enabled then Lighting.Ambient = Color3.fromRGB(255, 255, 255) end
        end)
        connections.Outdoor = Lighting:GetPropertyChangedSignal("OutdoorAmbient"):Connect(function()
            if enabled then Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255) end
        end)
        connections.Shadows = Lighting:GetPropertyChangedSignal("GlobalShadows"):Connect(function()
            if enabled then Lighting.GlobalShadows = false end
        end)
    else
        toggleBtn.Text = "Fullbright: OFF"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        
        -- Disconnect locks
        for _, conn in pairs(connections) do conn:Disconnect() end
        connections = {}
        
        -- Restore default-ish lighting
        Lighting.Ambient = Color3.fromRGB(127, 127, 127)
        Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
        Lighting.GlobalShadows = true
    end
end

toggleBtn.MouseButton1Click:Connect(function()
    setFullbright(not enabled)
end)

   end,
})

local Button = MainTab:CreateButton({
   Name = "Rejoin Server (INSTANT) ",
   Callback = function()
	    local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Rejoin the same server instance
TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)

   end,
})

local Button = MainTab:CreateButton({
   Name = "Fog Remover",
   Callback = function()
         local Lighting = game:GetService("Lighting")
local player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")

-- UI Setup
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "FogRemoverUI"

local toggleBtn = Instance.new("TextButton", screenGui)
toggleBtn.Size = UDim2.new(0, 130, 0, 40)
toggleBtn.Position = UDim2.new(0.5, -65, 0.1, 0)
toggleBtn.Text = "Fog Remover: OFF"
toggleBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Draggable = true

local fogEnabled = false
local connections = {}

local function setFog(state)
    fogEnabled = state
    if fogEnabled then
        toggleBtn.Text = "Fog Remover: ON"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        
        -- Remove Fog
        Lighting.FogEnd = 9e9
        Lighting.FogStart = 9e9
        
        -- Anti-Reset: Prevents the game from bringing fog back
        connections.End = Lighting:GetPropertyChangedSignal("FogEnd"):Connect(function()
            if fogEnabled then Lighting.FogEnd = 9e9 end
        end)
        connections.Start = Lighting:GetPropertyChangedSignal("FogStart"):Connect(function()
            if fogEnabled then Lighting.FogStart = 9e9 end
        end)
    else
        toggleBtn.Text = "Fog Remover: OFF"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        
        -- Stop forcing settings
        for _, conn in pairs(connections) do conn:Disconnect() end
        connections = {}
        
        -- Restore default-ish fog (Roblox default is usually 100,000 or game-specific)
        Lighting.FogEnd = 100000
        Lighting.FogStart = 0
    end
end

toggleBtn.MouseButton1Click:Connect(function()
    setFog(not fogEnabled)
end)
 
   end,
})

local Button = MainTab:CreateButton({
   Name = "X-ray (see through walls)",
   Callback = function()
         local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local RunService = game:GetService("RunService")

-- Main UI setup
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "XrayHubUI"

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 220, 0, 160)
frame.Position = UDim2.new(0.5, -110, 0.2, 0)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.Active = true
frame.Draggable = true

-- Toggle Button
local toggleBtn = Instance.new("TextButton", frame)
toggleBtn.Size = UDim2.new(0, 200, 0, 40)
toggleBtn.Position = UDim2.new(0, 10, 0, 10)
toggleBtn.Text = "X-Ray: OFF"
toggleBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
toggleBtn.TextColor3 = Color3.new(1,1,1)

-- Slider Bar
local sliderBar = Instance.new("Frame", frame)
sliderBar.Size = UDim2.new(0, 200, 0, 10)
sliderBar.Position = UDim2.new(0, 10, 0, 85)
sliderBar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

local sliderBtn = Instance.new("TextButton", sliderBar)
sliderBtn.Size = UDim2.new(0, 20, 0, 20)
sliderBtn.Position = UDim2.new(0.5, -10, -0.5, 0)
sliderBtn.Text = ""
sliderBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)

local valLabel = Instance.new("TextLabel", frame)
valLabel.Size = UDim2.new(0, 200, 0, 20)
valLabel.Position = UDim2.new(0, 10, 0, 60)
valLabel.BackgroundTransparency = 1
valLabel.TextColor3 = Color3.new(1,1,1)
valLabel.Text = "Transparency: 0.5"

-- Destroy Button
local destroyBtn = Instance.new("TextButton", frame)
destroyBtn.Size = UDim2.new(0, 200, 0, 30)
destroyBtn.Position = UDim2.new(0, 10, 0, 120)
destroyBtn.Text = "Destroy Script"
destroyBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
destroyBtn.TextColor3 = Color3.new(1,1,1)

-- Xray Logic
local xrayEnabled = false
local transparencyValue = 0.5
local dragging = false

local function updateXray()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and not obj.Parent:FindFirstChild("Humanoid") then
            obj.LocalTransparencyModifier = xrayEnabled and transparencyValue or 0
        end
    end
end

-- Slider functionality
sliderBtn.MouseButton1Down:Connect(function() dragging = true end)
game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)

RunService.RenderStepped:Connect(function()
    if dragging then
        local mousePos = game:GetService("UserInputService"):GetMouseLocation().X
        local relativePos = mousePos - sliderBar.AbsolutePosition.X
        local percentage = math.clamp(relativePos / sliderBar.AbsoluteSize.X, 0, 1)
        sliderBtn.Position = UDim2.new(percentage, -10, -0.5, 0)
        transparencyValue = percentage
        valLabel.Text = "Transparency: " .. string.format("%.2f", transparencyValue)
        if xrayEnabled then updateXray() end
    end
end)

-- Button Listeners
toggleBtn.MouseButton1Click:Connect(function()
    xrayEnabled = not xrayEnabled
    toggleBtn.Text = xrayEnabled and "X-Ray: ON" or "X-Ray: OFF"
    toggleBtn.BackgroundColor3 = xrayEnabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
    updateXray()
end)

destroyBtn.MouseButton1Click:Connect(function()
    xrayEnabled = false
    updateXray()
    screenGui:Destroy()
end)

   end,
})

local Button = MainTab:CreateButton({
   Name = "ESP (FULLPACK VERSION)",
   Callback = function()
        local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local ESP = {
    Enabled = false,
    Boxes = true,
    Tracers = true,
    Names = true,
    Distance = true,
    Color = Color3.fromRGB(255, 255, 255)
}

local Cache = {}

-- UI Setup
local ScreenGui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 200, 0, 260)
MainFrame.Position = UDim2.new(0.05, 0, 0.4, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Active = true
MainFrame.Draggable = true

local function createBtn(text, pos, callback)
    local btn = Instance.new("TextButton", MainFrame)
    btn.Size = UDim2.new(0, 180, 0, 30)
    btn.Position = pos
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- Toggle Logic
local masterBtn = createBtn("ESP: OFF", UDim2.new(0, 10, 0, 10), function()
    ESP.Enabled = not ESP.Enabled
end)

createBtn("Toggle Boxes", UDim2.new(0, 10, 0, 45), function() ESP.Boxes = not ESP.Boxes end)
createBtn("Toggle Tracers", UDim2.new(0, 10, 0, 80), function() ESP.Tracers = not ESP.Tracers end)
createBtn("Change Color (Cycle)", UDim2.new(0, 10, 0, 115), function()
    ESP.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
end)

local destroyBtn = createBtn("Destroy Script", UDim2.new(0, 10, 0, 210), function()
    ESP.Enabled = false
    task.wait(0.1)
    for _, v in pairs(Cache) do
        for _, draw in pairs(v) do draw:Remove() end
    end
    ScreenGui:Destroy()
end)

-- Rendering Logic
local function createDraw(type, properties)
    local draw = Drawing.new(type)
    for i, v in pairs(properties) do draw[i] = v end
    return draw
end

local function addPlayer(plr)
    Cache[plr] = {
        Box = createDraw("Square", {Thickness = 1, Filled = false, Transparency = 1}),
        Tracer = createDraw("Line", {Thickness = 1, Transparency = 1}),
        Text = createDraw("Text", {Size = 18, Center = true, Outline = true})
    }
end

Players.PlayerAdded:Connect(addPlayer)
for _, v in pairs(Players:GetPlayers()) do if v ~= LocalPlayer then addPlayer(v) end end

RunService.RenderStepped:Connect(function()
    masterBtn.Text = ESP.Enabled and "ESP: ON" or "ESP: OFF"
    masterBtn.BackgroundColor3 = ESP.Enabled and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)

    for plr, draws in pairs(Cache) do
        local char = plr.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChild("Humanoid")
        
        if ESP.Enabled and hrp and hum and hum.Health > 0 then
            local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
            if onScreen then
                local size = (Camera:WorldToViewportPoint(hrp.Position - Vector3.new(0, 3, 0)).Y - Camera:WorldToViewportPoint(hrp.Position + Vector3.new(0, 2.6, 0)).Y)
                
                -- Box
                draws.Box.Visible = ESP.Boxes
                draws.Box.Size = Vector2.new(size * 0.6, size)
                draws.Box.Position = Vector2.new(pos.X - draws.Box.Size.X / 2, pos.Y - draws.Box.Size.Y / 2)
                draws.Box.Color = ESP.Color

                -- Tracer
                draws.Tracer.Visible = ESP.Tracers
                draws.Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                draws.Tracer.To = Vector2.new(pos.X, pos.Y + size/2)
                draws.Tracer.Color = ESP.Color

                -- Text (Name + Dist)
                draws.Text.Visible = ESP.Names
                local dist = math.floor((hrp.Position - Camera.CFrame.Position).Magnitude)
                draws.Text.Text = string.format("%s [%sm]", plr.Name, dist)
                draws.Text.Position = Vector2.new(pos.X, pos.Y - size/2 - 20)
                draws.Text.Color = ESP.Color
            else
                for _, v in pairs(draws) do v.Visible = false end
            end
        else
            for _, v in pairs(draws) do v.Visible = false end
        end
    end
end)

   end,
})

local Button = MainTab:CreateButton({
   Name = "TP infront of Player",
   Callback = function()
        local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local targetPlayer = nil
local bringing = false
local connection

-- UI Setup
local screenGui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
screenGui.Name = "BringerUI"
screenGui.ResetOnSpawn = false -- THIS PREVENTS IT FROM BEING DESTROYED ON DEATH

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 200, 0, 160)
frame.Position = UDim2.new(0.5, -100, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
frame.Draggable = true

-- Text Box for Username
local textBox = Instance.new("TextBox", frame)
textBox.Size = UDim2.new(0, 180, 0, 35)
textBox.Position = UDim2.new(0, 10, 0, 10)
textBox.PlaceholderText = "Enter Username..."
textBox.Text = ""
textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textBox.TextColor3 = Color3.new(1,1,1)

-- Toggle Button
local toggleBtn = Instance.new("TextButton", frame)
toggleBtn.Size = UDim2.new(0, 180, 0, 40)
toggleBtn.Position = UDim2.new(0, 10, 0, 55)
toggleBtn.Text = "Bring: OFF"
toggleBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
toggleBtn.TextColor3 = Color3.new(1,1,1)

-- Destroy Button
local destroyBtn = Instance.new("TextButton", frame)
destroyBtn.Size = UDim2.new(0, 180, 0, 35)
destroyBtn.Position = UDim2.new(0, 10, 0, 105)
destroyBtn.Text = "Destroy Script"
destroyBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
destroyBtn.TextColor3 = Color3.new(1,1,1)

-- Find Player Function
local function getPlayer(name)
    name = name:lower()
    for _, p in pairs(Players:GetPlayers()) do
        if p.Name:lower():sub(1, #name) == name or p.DisplayName:lower():sub(1, #name) == name then
            return p
        end
    end
    return nil
end

-- Bring Logic
local function toggleBring()
    bringing = not bringing
    if bringing then
        targetPlayer = getPlayer(textBox.Text)
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            toggleBtn.Text = "Bring: ON"
            toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
            
            connection = RunService.Heartbeat:Connect(function()
                local myChar = LocalPlayer.Character
                local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
                
                if bringing and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") and myRoot then
                    local targetPos = targetPlayer.Character.HumanoidRootPart.CFrame
                    myRoot.CFrame = targetPos * CFrame.new(0, 0, -3)
                end
            end)
        else
            bringing = false
            textBox.Text = "Player Not Found"
            task.wait(1)
            textBox.Text = ""
        end
    else
        toggleBtn.Text = "Bring: OFF"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        if connection then connection:Disconnect() end
    end
end

toggleBtn.MouseButton1Click:Connect(toggleBring)

destroyBtn.MouseButton1Click:Connect(function()
    bringing = false
    if connection then connection:Disconnect() end
    screenGui:Destroy()
end)

   end,
})

local Button = MainTab:CreateButton({
   Name = "Re-Animator",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/STEVE-916-create/Uhhhhhh/main/source/reanim.lua"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Universal Aimbot and ESP",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/uchoroid/UniversalAimbotEsp/main/Universal-Aimbot-Esp", true))()
   end,
})

local HubsTab = Window:CreateTab("Tab Example", 4483362458) -- Title, Image
