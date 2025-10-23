--[
=========================================
           Hardexz Hub : Blox Fruits
        Feito por: starhub295
=========================================
]]

-- Carrega Kavo UI Library (interface)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Hardexz Hub : Blox Fruits", "DarkTheme")

-- ===== Discord =====
local TabDiscord = Window:NewTab("Discord")
local SectionDiscord = TabDiscord:NewSection("Entre no nosso Discord para suporte!")

-- ===== Farm =====
local TabFarm = Window:NewTab("Farm")
local SectionFarm = TabFarm:NewSection("Configurações de Farm")

local tool = "Melee"
SectionFarm:NewDropdown("Select Tool", "Escolha sua ferramenta de farm", {"Melee", "Sword", "Blox Fruit", "Gun"}, function(current)
    tool = current
end)
SectionFarm:NewDropdown("UI Scale", "Ajuste o tamanho da interface", {"Small", "Medium", "Large"}, function(scale)
    -- Não precisa implementar, só visual
end)

SectionFarm:NewLabel("Farm")

SectionFarm:NewToggle("Auto Farm Level", "Farmar nível automaticamente", function(state)
    _G.AutoFarmLevel = state
    while _G.AutoFarmLevel do
        -- Lógica de auto farm de level (placeholder)
        wait(1)
    end
end)

SectionFarm:NewToggle("Auto Farm Nearest", "Farmar mobs mais próximos", function(state)
    _G.AutoFarmNearest = state
    while _G.AutoFarmNearest do
        -- Lógica de auto farm nearest (placeholder)
        wait(1)
    end
end)

SectionFarm:NewToggle("Auto Factory", "Farma a Factory a cada 130min", function(state)
    _G.AutoFactory = state
    while _G.AutoFactory do
        -- Lógica de auto factory (placeholder)
        wait(1)
    end
end)

-- ===== Ectoplasm =====
local SectionEcto = TabFarm:NewSection("Ectoplasm")
SectionEcto:NewToggle("Auto Farm Ectoplasm", "Farmar Ectoplasm automaticamente", function(state)
    _G.AutoEctoplasm = state
    while _G.AutoEctoplasm do
        -- Lógica farm ectoplasm (placeholder)
        wait(1)
    end
end)

-- ===== Christmas =====
local SectionXmas = TabFarm:NewSection("Christmas")
SectionXmas:NewLabel("Next Gift: 46:31")
SectionXmas:NewToggle("Auto Christmas Gift", "Coleta presente de natal automaticamente", function(state)
    _G.AutoGift = state
    while _G.AutoGift do
        -- Lógica coleta presente de natal (placeholder)
        wait(1)
    end
end)
SectionXmas:NewToggle("Auto Store Holiday Gift", "Guarda presente automaticamente", function(state)
    _G.AutoStoreGift = state
    while _G.AutoStoreGift do
        -- Lógica guarda presente (placeholder)
        wait(1)
    end
end)

-- ===== Abas Vazias (igual imagem) =====
local TabSea = Window:NewTab("Sea")
TabSea:NewSection("Em breve...")

local TabQuests = Window:NewTab("Quests/Items")
TabQuests:NewSection("Em breve...")

local TabFruit = Window:NewTab("Fruit/Raid")
TabFruit:NewSection("Em breve...")

local TabStats = Window:NewTab("Stats")
TabStats:NewSection("Em breve...")

local TabTeleport = Window:NewTab("Teleport")
TabTeleport:NewSection("Em breve...")

local TabVisual = Window:NewTab("Visual")
TabVisual:NewSection("Em breve...")

local TabShop = Window:NewTab("Shop")
TabShop:NewSection("Em breve...")

local TabMisc = Window:NewTab("Misc")
TabMisc:NewSection("Em breve...")

