-- HardexzUIBuilder ModuleScript
-- Coloque este ModuleScript em ReplicatedStorage com o nome "HardexzUIBuilder"
local UIBuilder = {}

local function create(class, props)
    local obj = Instance.new(class)
    if props then
        for k, v in pairs(props) do
            if k == "Parent" then
                obj.Parent = v
            else
                pcall(function() obj[k] = v end)
            end
        end
    end
    return obj
end

local THEME = {
    Background = Color3.fromRGB(12, 12, 12),
    Panel = Color3.fromRGB(20, 20, 20),
    Accent = Color3.fromRGB(32, 32, 32),
    Text = Color3.fromRGB(240, 240, 240),
    AccentSmall = Color3.fromRGB(40, 40, 40),
    Highlight = Color3.fromRGB(98, 157, 255),
}

local function makeToggle(name, parent, initial, callback)
    local row = create("Frame", {
        Parent = parent,
        BackgroundColor3 = THEME.Panel,
        Size = UDim2.new(1, 0, 0, 48),
        BorderSizePixel = 0,
    })
    create("UICorner", {Parent = row, CornerRadius = UDim.new(0,8)})
    create("TextLabel", {
        Parent = row,
        Text = name,
        TextColor3 = THEME.Text,
        BackgroundTransparency = 1,
        Size = UDim2.new(0.76, -8, 1, 0),
        Position = UDim2.new(0, 12, 0, 0),
        Font = Enum.Font.GothamSemibold,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local toggleBtn = create("TextButton", {
        Parent = row,
        Text = "",
        BackgroundColor3 = initial and THEME.Highlight or THEME.AccentSmall,
        Size = UDim2.new(0, 44, 0, 26),
        Position = UDim2.new(1, -58, 0.5, -13),
        AutoButtonColor = false,
    })
    create("UICorner", {Parent = toggleBtn, CornerRadius = UDim.new(0,6)})
    local state = initial or false
    local function setState(v)
        state = v
        toggleBtn.BackgroundColor3 = state and THEME.Highlight or THEME.AccentSmall
        if callback then
            pcall(callback, state)
        end
    end
    toggleBtn.MouseButton1Click:Connect(function()
        setState(not state)
    end)
    return row, setState
end

local function makeButton(name, parent, callback)
    local btn = create("TextButton", {
        Parent = parent,
        BackgroundColor3 = THEME.Panel,
        Size = UDim2.new(1, 0, 0, 40),
        BorderSizePixel = 0,
        Text = name,
        TextColor3 = THEME.Text,
        Font = Enum.Font.GothamSemibold,
        TextSize = 15,
    })
    create("UICorner", {Parent = btn, CornerRadius = UDim.new(0,8)})
    btn.MouseButton1Click:Connect(function()
        if callback then pcall(callback) end
    end)
    return btn
end

function UIBuilder:Create(parent)
    local screenGui = create("ScreenGui", {Parent = parent, Name = "HardexzHubGUI", ResetOnSpawn = false})
    local root = create("Frame", {
        Parent = screenGui,
        BackgroundColor3 = THEME.Background,
        AnchorPoint = Vector2.new(0.5,0.5),
        Position = UDim2.new(0.5, 0.5, 0.5, 0),
        Size = UDim2.new(0, 960, 0, 540),
        BorderSizePixel = 0,
    })
    create("UICorner", {Parent = root, CornerRadius = UDim.new(0,12)})

    local sidebar = create("Frame", {Parent = root, BackgroundTransparency = 1, Size = UDim2.new(0, 220, 1, 0), Position = UDim2.new(0, 8, 0, 8)})
    local sideBg = create("Frame", {Parent = sidebar, BackgroundColor3 = THEME.Panel, Size = UDim2.new(1, 0, 1, -16), Position = UDim2.new(0, 0, 0, 8), BorderSizePixel = 0})
    create("UICorner", {Parent = sideBg, CornerRadius = UDim.new(0,10)})
    create("UIPadding", {Parent = sideBg, PaddingLeft = UDim.new(0,12), PaddingTop = UDim.new(0,12), PaddingBottom = UDim.new(0,12)})
    local sideLayout = create("UIListLayout", {Parent = sideBg, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0,10)})

    local function addSidebarItem(text, idx)
        local b = create("TextButton", {Parent = sideBg, Text = text, BackgroundColor3 = Color3.fromRGB(28,28,28), Size = UDim2.new(1, -8, 0, 44), Font = Enum.Font.GothamSemibold, TextSize = 15, TextColor3 = THEME.Text, BorderSizePixel = 0})
        create("UICorner", {Parent = b, CornerRadius = UDim.new(0,8)})
        b.LayoutOrder = idx
        b.MouseButton1Click:Connect(function()
            for _, child in ipairs(sideBg:GetChildren()) do
                if child:IsA("TextButton") then
                    child.BackgroundColor3 = Color3.fromRGB(28,28,28)
                    child.TextColor3 = THEME.Text
                end
            end
            b.BackgroundColor3 = THEME.AccentSmall
            b.TextColor3 = THEME.Highlight
        end)
    end

    local menu = {"Discord","Farm","Sea","Islands","Quests/Items","Fruit/Raid","Stats","Teleport","Visual","Shop","Misc"}
    for i, v in ipairs(menu) do addSidebarItem(v, i) end

    local topbar = create("Frame", {Parent = root, BackgroundColor3 = THEME.Accent, Size = UDim2.new(1, -236, 0, 64), Position = UDim2.new(0, 236, 0, 8), BorderSizePixel = 0})
    create("UICorner", {Parent = topbar, CornerRadius = UDim.new(0,10)})
    create("TextLabel", {Parent = topbar, Text = "Hardexz Hub: Blox fruits  -by Hey star", TextColor3 = THEME.Text, BackgroundTransparency = 1, Size = UDim2.new(0.9, 0, 1, 0), Position = UDim2.new(0, 14, 0, 0), Font = Enum.Font.GothamBold, TextSize = 18, TextXAlignment = Enum.TextXAlignment.Left})

    local content = create("Frame", {Parent = root, BackgroundColor3 = THEME.Background, Size = UDim2.new(1, -236, 1, -88), Position = UDim2.new(0, 236, 0, 80), BorderSizePixel = 0})
    create("UICorner", {Parent = content, CornerRadius = UDim.new(0,10)})

    local scroll = create("ScrollingFrame", {Parent = content, BackgroundTransparency = 1, Size = UDim2.new(1, -28, 1, -28), Position = UDim2.new(0, 14, 0, 14), CanvasSize = UDim2.new(0,0,2,0), ScrollBarThickness = 6})
    create("UIPadding", {Parent = scroll, PaddingLeft = UDim.new(0,8), PaddingRight = UDim.new(0,8), PaddingTop = UDim.new(0,8)})
    local listLayout = create("UIListLayout", {Parent = scroll, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0,10)})
    listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    local function addSection(titleText)
        local sec = create("Frame", {Parent = scroll, BackgroundColor3 = THEME.Panel, Size = UDim2.new(1, -12, 0, 64), BorderSizePixel = 0})
        create("UICorner", {Parent = sec, CornerRadius = UDim.new(0,8)})
        create("TextLabel", {Parent = sec, Text = titleText, TextColor3 = THEME.Text, BackgroundTransparency = 1, Size = UDim2.new(1, -24, 0, 24), Position = UDim2.new(0, 12, 0, 8), Font = Enum.Font.GothamBold, TextSize = 16, TextXAlignment = Enum.TextXAlignment.Left})
        return sec
    end

    local farmSec = addSection("Farm")
    farmSec.LayoutOrder = 1
    local tf, s1 = makeToggle("Auto Farm Level", scroll, false, function(state) print("Auto Farm Level", state) end)
    tf.LayoutOrder = 2
    local tf2, s2 = makeToggle("Auto Farm Nearest", scroll, false, function(state) print("Auto Farm Nearest", state) end)
    tf2.LayoutOrder = 3
    local tf3, s3 = makeToggle("Auto Factory", scroll, false, function(state) print("Auto Factory", state) end)
    tf3.LayoutOrder = 4

    local ectoSec = addSection("Ectoplasm")
    ectoSec.LayoutOrder = 5
    local te1, _ = makeToggle("Auto Farm Ectoplasm", scroll, false, function(state) print("Auto Ecto", state) end)
    te1.LayoutOrder = 6

    local chestSec = addSection("Chest")
    chestSec.LayoutOrder = 7
    local tc1, _ = makeToggle("Auto Chest [Tween]", scroll, false, function(state) print("Auto Chest", state) end)
    tc1.LayoutOrder = 8

    local quick = create("Frame", {Parent = scroll, BackgroundColor3 = THEME.Accent, Size = UDim2.new(1, -12, 0, 84), BorderSizePixel = 0})
    create("UICorner", {Parent = quick, CornerRadius = UDim.new(0,8)})
    create("TextLabel", {Parent = quick, Text = "Quick Actions", BackgroundTransparency = 1, TextColor3 = THEME.Text, Font = Enum.Font.GothamSemibold, TextSize = 15, Position = UDim2.new(0, 12, 0, 8), Size = UDim2.new(1, -24, 0, 22), TextXAlignment = Enum.TextXAlignment.Left})
    local quickFrame = create("Frame", {Parent = quick, BackgroundTransparency = 1, Position = UDim2.new(0, 12, 0, 36), Size = UDim2.new(1, -24, 0, 40)})
    local btn1 = makeButton("Teleport To Boss", quickFrame, function() print("Teleport pressed") end)
    btn1.Size = UDim2.new(0.48, 0, 1, 0)
    btn1.Position = UDim2.new(0, 0, 0, 0)
    local btn2 = makeButton("Start Farm", quickFrame, function() print("Start Farm pressed") end)
    btn2.Size = UDim2.new(0.48, 0, 1, 0)
    btn2.Position = UDim2.new(0.52, 0, 0, 0)
    quick.LayoutOrder = 9

    listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        local sizeY = listLayout.AbsoluteContentSize.Y + 20
        scroll.CanvasSize = UDim2.new(0, 0, 0, sizeY)
    end)

    return screenGui
end

return UIBuilder
