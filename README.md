-- Script LocalScript dentro de StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Criar a interface
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "ControleGUI"

-- Botão para Invisibilidade
local invisButton = Instance.new("TextButton", screenGui)
invisButton.Position = UDim2.new(0, 10, 0, 10)
invisButton.Size = UDim2.new(0, 150, 0, 50)
invisButton.Text = "Toggle Invisibilidade"

-- Slider para Velocidade
local speedLabel = Instance.new("TextLabel", screenGui)
speedLabel.Position = UDim2.new(0, 10, 0, 70)
speedLabel.Size = UDim2.new(0, 150, 0, 20)
speedLabel.Text = "Velocidade: 16"

local speedSlider = Instance.new("Slider", screenGui)
speedSlider.Position = UDim2.new(0, 10, 0, 100)
speedSlider.Size = UDim2.new(0, 150, 0, 20)
speedSlider.Min = 1
speedSlider.Max = 5
speedSlider.Value = 1

-- Botão para ESP
local espButton = Instance.new("TextButton", screenGui)
espButton.Position = UDim2.new(0, 10, 0, 140)
espButton.Size = UDim2.new(0, 150, 0, 50)
espButton.Text = "Ativar ESP"

local espActive = false
local espParts = {}

-- Variáveis de controle
local invisibilityEnabled = false

-- Função para ajustar velocidade
local function setSpeed(multiplier)
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid.WalkSpeed = 16 * multiplier
    end
end

-- Função para toggle invisibilidade
local function toggleInvisibility()
    invisibilityEnabled = not invisibilityEnabled
    if character and character:FindFirstChild("HumanoidRootPart") then
        if invisibilityEnabled then
            character.HumanoidRootPart.Transparency = 1
        else
            character.HumanoidRootPart.Transparency = 0
        end
    end
end

-- Função para ativar/desativar ESP
local function toggleESP()
    espActive = not espActive
    if espActive then
        -- Adiciona caixas ao redor dos jogadores
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local box = Instance.new("BoxHandleAdornment")
                box.Size = p.Character.HumanoidRootPart.Size * 1.2
                box.Adornee = p.Character.HumanoidRootPart
                box.Color3 = Color3.new(1, 0, 0)
                box.Transparency = 0.5
                box.AlwaysOnTop = true
                box.Parent = p.Character.HumanoidRootPart
                table.insert(espParts, box)
            end
        end
    else
        -- Remove as caixas
        for _, box in pairs(espParts) do
            if box then
                box:Destroy()
            end
        end
        espParts = {}
    end
end

-- Conectar botões
invisButton.MouseButton1Click:Connect(toggleInvisibility)
espButton.MouseButton1Click:Connect(toggleESP)
speedSlider.Changed:Connect(function()
    local val = speedSlider.Value
    setSpeed(val)
    speedLabel.Text = "Velocidade: " .. math.floor(16 * val)
end)

-- Atualizar ESP dinamicamente (se jogadores entrarem ou saírem)
Players.PlayerAdded:Connect(function(p)
    if espActive and p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
        local box = Instance.new("BoxHandleAdornment")
        box.Size = p.Character.HumanoidRootPart.Size * 1.2
        box.Adornee = p.Character.HumanoidRootPart
        box.Color3 = Color3.new(1, 0, 0)
        box.Transparency = 0.5
        box.AlwaysOnTop = true
        box.Parent = p.Character.HumanoidRootPart
        table.insert(espParts, box)
    end
end)

Players.PlayerRemoving:Connect(function(p)
    -- Opcional: remover caixas ao sair
end)

-- Loop para manter invisibilidade se ativada
RunService.RenderStepped:Connect(function()
    if invisibilityEnabled and character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.Transparency = 1
    end
end)
