-- Hizmetler
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer

-- GUI Temeli
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NebuloPremiumV1"
ScreenGui.ResetOnSpawn = false

-- Exploit Koruma Entegrasyonu
if syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = CoreGui
elseif gethui then
    ScreenGui.Parent = gethui()
else
    ScreenGui.Parent = CoreGui
end

-- Ana Panel (Görsel olarak daha asil bir koyu ton ve gölge efekti)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 290, 0, 170)
-- İlk başta ekranın biraz daha altında başlasın (Giriş animasyonu için)
MainFrame.Position = UDim2.new(0.5, -145, 0.6, -85)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.ClipsDescendants = true
MainFrame.BackgroundTransparency = 1 -- Animasyonla görünecek
MainFrame.Parent = ScreenGui

-- Yuvarlatılmış Köşeler
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

-- Parlayan Neon Çerçeve (Breathe/Nefes Alma animasyonu eklenecek)
local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(0, 255, 140)
MainStroke.Thickness = 0 -- Animasyonla büyüyecek
MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
MainStroke.Transparency = 1
MainStroke.Parent = MainFrame

-- Başlık Kısmı
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 45)
TitleBar.BackgroundTransparency = 1
TitleBar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -20, 1, 0)
Title.Position = UDim2.new(0, 18, 0, 2)
Title.BackgroundTransparency = 1
Title.Text = "NEBULO <font color='#00ff8c'>V1</font>"
Title.RichText = true
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextTransparency = 1
Title.Parent = TitleBar

-- Aktiflik Durum Işığı (Neon Glow efekti gibi parlayacak)
local StatusDot = Instance.new("Frame")
StatusDot.Name = "StatusDot"
StatusDot.Size = UDim2.new(0, 8, 0, 8)
StatusDot.Position = UDim2.new(1, -25, 0.5, -4)
StatusDot.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
StatusDot.BorderSizePixel = 0
StatusDot.BackgroundTransparency = 1
StatusDot.Parent = TitleBar

local DotCorner = Instance.new("UICorner")
DotCorner.CornerRadius = UDim.new(1, 0)
DotCorner.Parent = StatusDot

local DotStroke = Instance.new("UIStroke")
DotStroke.Color = Color3.fromRGB(200, 50, 50)
DotStroke.Thickness = 1.5
DotStroke.Transparency = 1
DotStroke.Parent = StatusDot

-- Tuş Bilgi Etiketi
local BindInfo = Instance.new("TextLabel")
BindInfo.Name = "BindInfo"
BindInfo.Size = UDim2.new(1, -30, 0, 15)
BindInfo.Position = UDim2.new(0, 18, 0, 36)
BindInfo.BackgroundTransparency = 1
BindInfo.Text = "[V] tuşu ile arayüzü gizle"
BindInfo.TextColor3 = Color3.fromRGB(120, 120, 130)
BindInfo.TextSize = 10
BindInfo.Font = Enum.Font.GothamMedium
BindInfo.TextXAlignment = Enum.TextXAlignment.Left
BindInfo.TextTransparency = 1
BindInfo.Parent = MainFrame

-- Şık Bölücü Çizgi
local Divider = Instance.new("Frame")
Divider.Name = "Divider"
Divider.Size = UDim2.new(1, -36, 0, 1)
Divider.Position = UDim2.new(0, 18, 0, 56)
Divider.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
Divider.BorderSizePixel = 0
Divider.BackgroundTransparency = 1
Divider.Parent = MainFrame

-- Buton Konteyner
local ButtonContainer = Instance.new("Frame")
ButtonContainer.Name = "ButtonContainer"
ButtonContainer.Size = UDim2.new(1, -36, 0, 52)
ButtonContainer.Position = UDim2.new(0, 18, 0, 72)
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.Parent = MainFrame

-- Canavar Gibi Özelleştirilmiş Bhop Butonu
local BhopButton = Instance.new("TextButton")
BhopButton.Name = "BhopButton"
BhopButton.Size = UDim2.new(1, 0, 1, 0)
BhopButton.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
BhopButton.BorderSizePixel = 0
BhopButton.Text = "BUNNYHOP"
BhopButton.TextColor3 = Color3.fromRGB(120, 120, 130)
BhopButton.TextSize = 13
BhopButton.Font = Enum.Font.GothamBold
BhopButton.AutoButtonColor = false
BhopButton.TextTransparency = 1
BhopButton.Parent = ButtonContainer

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 10)
ButtonCorner.Parent = BhopButton

local ButtonStroke = Instance.new("UIStroke")
ButtonStroke.Color = Color3.fromRGB(28, 28, 35)
ButtonStroke.Thickness = 1.2
ButtonStroke.Transparency = 1
ButtonStroke.Parent = BhopButton

-- Aktiflik Durum Çizgisi (Neon Çizgi)
local ActiveIndicator = Instance.new("Frame")
ActiveIndicator.Name = "ActiveIndicator"
ActiveIndicator.Size = UDim2.new(0, 0, 0, 3)
ActiveIndicator.Position = UDim2.new(0.5, 0, 1, -3)
ActiveIndicator.BackgroundColor3 = Color3.fromRGB(0, 255, 140)
ActiveIndicator.BorderSizePixel = 0
ActiveIndicator.BackgroundTransparency = 1
ActiveIndicator.Parent = BhopButton

local IndicatorCorner = Instance.new("UICorner")
IndicatorCorner.CornerRadius = UDim.new(0, 2)
IndicatorCorner.Parent = ActiveIndicator

----------------------------------------------------
-- AKICI SÜRÜKLEME SİSTEMİ (LERP/TWEEN TABANLI)
----------------------------------------------------
local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    local targetPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    -- Akıcılığı sağlayan Tween
    TweenService:Create(MainFrame, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = targetPos}):Play()
end

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

----------------------------------------------------
-- AKICI GİRİŞ (INTRO) ANİMASYONU
----------------------------------------------------
task.spawn(function()
    task.wait(0.2)
    -- Panel görünürlüğü ve yukarı süzülme efekti
    TweenService:Create(MainFrame, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, -145, 0.4, -85),
        BackgroundTransparency = 0
    }):Play()
    
    TweenService:Create(MainStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quad), {Thickness = 1.5, Transparency = 0}):Play()
    task.wait(0.15)
    
    -- İçeriklerin sırayla ekranda belirmesi (Fade-in)
    TweenService:Create(Title, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {TextTransparency = 0}):Play()
    TweenService:Create(StatusDot, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {BackgroundTransparency = 0}):Play()
    TweenService:Create(DotStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Transparency = 0}):Play()
    task.wait(0.08)
    TweenService:Create(BindInfo, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {TextTransparency = 0}):Play()
    TweenService:Create(Divider, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {BackgroundTransparency = 0}):Play()
    task.wait(0.08)
    TweenService:Create(BhopButton, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {TextTransparency = 0}):Play()
    TweenService:Create(ButtonStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Transparency = 0}):Play()
    TweenService:Create(ActiveIndicator, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {BackgroundTransparency = 0}):Play()
end)

----------------------------------------------------
-- BUNNYHOP MOTORU (EVADE OYUNUNA ÖZEL)
----------------------------------------------------
local bhopEnabled = false

RunService.PreRender:Connect(function()
    if not bhopEnabled then return end
    
    local character = LocalPlayer.Character
    if not character then return end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    
    if humanoid and rootPart and UserInputService:IsKeyDown(Enum.KeyCode.Space) then
        local hipHeight = humanoid.HipHeight
        local detectionRange = (hipHeight > 0 and (hipHeight + 2.0)) or 3.3
        
        local params = RaycastParams.new()
        params.FilterType = Enum.RaycastFilterType.Exclude
        params.FilterDescendantsInstances = {character}
        
        local raycastResult = workspace:Raycast(rootPart.Position, Vector3.new(0, -detectionRange, 0), params)
        
        if raycastResult or humanoid.FloorMaterial ~= Enum.Material.Air then
            if rootPart.AssemblyLinearVelocity.Y <= 2 then
                humanoid.Jump = true
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping) -- Evade script engellemesini aşar
            end
        end
    end
end)

----------------------------------------------------
-- GELİŞMİŞ GÖRSEL EFEKTLER VE ETKİLEŞİMLER
----------------------------------------------------
local tweenInfoFast = TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tweenInfoSqueeze = TweenInfo.new(0.1, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

-- Neon Çerçeve Nefes Alma (Breathe) Animasyonu
task.spawn(function()
    while true do
        if bhopEnabled then
            TweenService:Create(MainStroke, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(0, 120, 60)}):Play()
            task.wait(1.2)
            TweenService:Create(MainStroke, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(0, 255, 140)}):Play()
            task.wait(1.2)
        else
            TweenService:Create(MainStroke, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(40, 40, 50)}):Play()
            task.wait(1.5)
        end
    end
end)

-- Durum Işığı Pulse Efekti
task.spawn(function()
    while true do
        if bhopEnabled then
            TweenService:Create(StatusDot, TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(0, 180, 100)}):Play()
            TweenService:Create(DotStroke, TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(0, 180, 100), Thickness = 3}):Play()
            task.wait(0.6)
            TweenService:Create(StatusDot, TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(0, 255, 140)}):Play()
            TweenService:Create(DotStroke, TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(0, 255, 140), Thickness = 1.5}):Play()
            task.wait(0.6)
        else
            StatusDot.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
            DotStroke.Color = Color3.fromRGB(200, 50, 50)
            DotStroke.Thickness = 1.5
            task.wait(0.5)
        end
    end
end)

-- Buton Üzerine Gelme (Hover) Animasyonu
BhopButton.MouseEnter:Connect(function()
    if not bhopEnabled then
        TweenService:Create(BhopButton, tweenInfoFast, {BackgroundColor3 = Color3.fromRGB(22, 22, 28)}):Play()
        TweenService:Create(ButtonStroke, tweenInfoFast, {Color = Color3.fromRGB(70, 70, 85)}):Play()
        TweenService:Create(BhopButton, tweenInfoFast, {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
    else
        TweenService:Create(BhopButton, tweenInfoFast, {BackgroundColor3 = Color3.fromRGB(12, 38, 25)}):Play()
    end
end)

BhopButton.MouseLeave:Connect(function()
    if not bhopEnabled then
        TweenService:Create(BhopButton, tweenInfoFast, {BackgroundColor3 = Color3.fromRGB(16, 16, 20)}):Play()
        TweenService:Create(ButtonStroke, tweenInfoFast, {Color = Color3.fromRGB(28, 28, 35)}):Play()
        TweenService:Create(BhopButton, tweenInfoFast, {TextColor3 = Color3.fromRGB(120, 120, 130)}):Play()
    else
        TweenService:Create(BhopButton, tweenInfoFast, {BackgroundColor3 = Color3.fromRGB(8, 26, 18)}):Play()
    end
end)

-- Yay Efektli (Spring/Squeeze) Tıklama Animasyonu
BhopButton.MouseButton1Down:Connect(function()
    -- Tıklandığında hafifçe küçülme efekti
    TweenService:Create(BhopButton, tweenInfoSqueeze, {Size = UDim2.new(0.96, 0, 0.92, 0), Position = UDim2.new(0.02, 0, 0.04, 0)}):Play()
end)

BhopButton.MouseButton1Up:Connect(function()
    -- Bırakıldığında eski boyutuna esneyerek geri dönme efekti
    TweenService:Create(BhopButton, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0, 0, 0, 0)}):Play()
    
    bhopEnabled = not bhopEnabled
    
    if bhopEnabled then
        TweenService:Create(BhopButton, tweenInfoFast, {BackgroundColor3 = Color3.fromRGB(8, 26, 18)}):Play()
        TweenService:Create(BhopButton, tweenInfoFast, {TextColor3 = Color3.fromRGB(0, 255, 140)}):Play()
        TweenService:Create(ButtonStroke, tweenInfoFast, {Color = Color3.fromRGB(0, 255, 140)}):Play()
        TweenService:Create(ActiveIndicator, tweenInfoFast, {Size = UDim2.new(1, 0, 0, 3), Position = UDim2.new(0, 0, 1, -3)}):Play()
    else
        TweenService:Create(BhopButton, tweenInfoFast, {BackgroundColor3 = Color3.fromRGB(16, 16, 20)}):Play()
        TweenService:Create(BhopButton, tweenInfoFast, {TextColor3 = Color3.fromRGB(120, 120, 130)}):Play()
        TweenService:Create(ButtonStroke, tweenInfoFast, {Color = Color3.fromRGB(28, 28, 35)}):Play()
        TweenService:Create(ActiveIndicator, tweenInfoFast, {Size = UDim2.new(0, 0, 0, 3), Position = UDim2.new(0.5, 0, 1, -3)}):Play()
    end
end)

-- V Tuşu Gizleme Animasyonu (Çok Daha Yumuşak Fade ve Küçülme)
local menuVisible = true
local isTweening = false
local originalSize = UDim2.new(0, 290, 0, 170)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.V then
        if isTweening then return end
        isTweening = true
        
        if menuVisible then
            -- Kapatırken hem şeffaflık hem boyut küçülmesi
            TweenService:Create(MainStroke, tweenInfoFast, {Transparency = 1}):Play()
            local closeTween = TweenService:Create(MainFrame, tweenInfoFast, {
                Size = UDim2.new(0, 290, 0, 0),
                BackgroundTransparency = 1
            })
            closeTween:Play()
            closeTween.Completed:Wait()
            MainFrame.Visible = false
            menuVisible = false
        else
            MainFrame.Visible = true
            TweenService:Create(MainStroke, tweenInfoFast, {Transparency = 0}):Play()
            local openTween = TweenService:Create(MainFrame, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = originalSize,
                BackgroundTransparency = 0
            })
            openTween:Play()
            openTween.Completed:Wait()
            menuVisible = true
        end
        
        isTweening = false
    end
end)  
