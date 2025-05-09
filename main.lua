-- ZAM Shader UI (Loadable from GitHub)
-- By ChatGPT

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Player = Players.LocalPlayer

-- UI Setup
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ZAM_UI"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = Player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 500)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BackgroundTransparency = 1
mainFrame.Parent = screenGui

local uicorner = Instance.new("UICorner", mainFrame)
uicorner.CornerRadius = UDim.new(0, 18)

-- Loading Animation
mainFrame:TweenSize(UDim2.new(0, 400, 0, 500), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 1)
wait(0.5)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.15, 0)
title.BackgroundTransparency = 1
title.Text = "ZAM SHADER UI"
title.Font = Enum.Font.FredokaOne
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Parent = mainFrame

local loading = Instance.new("TextLabel")
loading.Size = UDim2.new(1, 0, 0.15, 0)
loading.Position = UDim2.new(0, 0, 0.15, 0)
loading.BackgroundTransparency = 1
loading.Text = "Loading..."
loading.Font = Enum.Font.Gotham
loading.TextColor3 = Color3.fromRGB(100, 255, 255)
loading.TextScaled = true
loading.Parent = mainFrame

wait(2)
loading.Text = "Almost Done..."
wait(1.5)
loading.Text = "Ready!"

-- Buttons
local function makeButton(name, text, pos, callback)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Size = UDim2.new(0.8, 0, 0.12, 0)
    btn.Position = pos
    btn.AnchorPoint = Vector2.new(0.5, 0)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    btn.Parent = mainFrame

    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 8)

    btn.MouseButton1Click:Connect(callback)
end

-- Shader Effects
local function clearEffects()
    for _, eff in ipairs(Lighting:GetChildren()) do
        if eff:IsA("BlurEffect") or eff:IsA("ColorCorrectionEffect") then
            eff:Destroy()
        end
    end
end

local function enableBlur()
    local blur = Instance.new("BlurEffect")
    blur.Size = 24
    blur.Name = "ZAM_Blur"
    blur.Parent = Lighting
end

local function enableColorCorrection()
    local cc = Instance.new("ColorCorrectionEffect")
    cc.Contrast = 0.25
    cc.Saturation = 0.25
    cc.TintColor = Color3.fromRGB(200, 220, 255)
    cc.Name = "ZAM_Color"
    cc.Parent = Lighting
end

-- Place buttons
makeButton("btn1", "Enable Blur", UDim2.new(0.5, 0, 0.35, 0), function()
    clearEffects()
    enableBlur()
end)

makeButton("btn2", "Enable Color Shader", UDim2.new(0.5, 0, 0.5, 0), function()
    clearEffects()
    enableColorCorrection()
end)

makeButton("btn3", "Both Effects", UDim2.new(0.5, 0, 0.65, 0), function()
    clearEffects()
    enableBlur()
    enableColorCorrection()
end)

makeButton("btn4", "Clear Effects", UDim2.new(0.5, 0, 0.8, 0), function()
    clearEffects()
end)
