local a = Instance.new("TextLabel")
a.Size = UDim2.new(0.8, 0, 0.05, 0)
a.Position = UDim2.new(0.1, 0, 0, 0)
a.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
a.TextColor3 = Color3.new(1, 1, 1)
a.Text = "Total Price: $0.00"
a.Parent = blackroseshopTab
local b = Instance.new("TextBox")
b.Size = UDim2.new(0.8, 0, 0.1, 0)
b.Position = UDim2.new(0.1, 0, 0.05, 0)
b.PlaceholderText = "Search what you'd like to buy from us..."
b.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
b.TextColor3 = Color3.new(1, 1, 1)
b.ClearTextOnFocus = false
b.Text = ""
b.Parent = blackroseshopTab
local c = Instance.new("ScrollingFrame")
c.Size = UDim2.new(0.8, 0, 0.8, 0)
c.Position = UDim2.new(0.1, 0, 0.18, 0)
c.AutomaticCanvasSize = Enum.AutomaticSize.Y
c.ScrollingDirection = Enum.ScrollingDirection.Y
c.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
c.Parent = blackroseshopTab
local d = Instance.new("UIListLayout")
d.Padding = UDim.new(0, 5)
d.Parent = c
d.SortOrder = Enum.SortOrder.LayoutOrder
local function e()
    local f = 0
    for g, h in ipairs(items) do
        f = f + h.price * h.quantity
    end
    a.Text = string.format("Total Price: $%.2f", f)
end
local function i(h)
    local j = Instance.new("Frame")
    j.Size = UDim2.new(1, 0, 0, 50)
    j.BackgroundTransparency = 0
    j.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    local k = Instance.new("UIStroke")
    k.Color = Color3.new(1, 1, 1)
    k.Thickness = 1
    k.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    k.Parent = j
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(0.5, 0, 1, 0)
    l.Position = UDim2.new(0, 0, 0, 0)
    l.BackgroundTransparency = 1
    l.TextColor3 = Color3.new(1, 1, 1)
    l.Text = string.format("%s - $%.2f", h.name, h.price)
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Parent = j
    local m = Instance.new("TextBox")
    m.Size = UDim2.new(0.2, 0, 0.8, 0)
    m.Position = UDim2.new(0.5, 0, 0.1, 0)
    m.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    m.TextColor3 = Color3.new(1, 1, 1)
    m.Text = tostring(h.quantity)
    m.ClearTextOnFocus = false
    m.Parent = j
    local n = Instance.new("TextButton")
    n.Size = UDim2.new(0.125, 0, 0.8, 0)
    n.Position = UDim2.new(0.7, 0, 0.1, 0)
    n.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    n.TextColor3 = Color3.new(1, 1, 1)
    n.Text = "+"
    n.Font = Enum.Font.SourceSansBold
    n.TextSize = 24
    n.Parent = j
    local o = Instance.new("TextButton")
    o.Size = UDim2.new(0.125, 0, 0.8, 0)
    o.Position = UDim2.new(0.85, 0, 0.1, 0)
    o.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    o.TextColor3 = Color3.new(1, 1, 1)
    o.Text = "−"
    o.Font = Enum.Font.SourceSansBold
    o.TextSize = 24
    o.Parent = j
    local function p()
        m.Text = tostring(h.quantity)
        e()
    end
    n.MouseButton1Click:Connect(
        function()
            h.quantity = h.quantity + 1
            p()
        end
    )
    o.MouseButton1Click:Connect(
        function()
            if h.quantity > 0 then
                h.quantity = h.quantity - 1
                p()
            end
        end
    )
    m.FocusLost:Connect(
        function(q)
            if q then
                local r = tonumber(m.Text)
                if r and r >= 0 then
                    h.quantity = r
                else
                    m.Text = tostring(h.quantity)
                end
                e()
            end
        end
    )
    return j
end
local s = Instance.new("TextBox")
s.Size = UDim2.new(0.8, 0, 0.1, 0)
s.Position = UDim2.new(1, 0, 0.25, 0)
s.PlaceholderText = "Item Quantities"
s.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
s.TextColor3 = Color3.new(1, 1, 1)
s.ClearTextOnFocus = false
s.Text = ""
s.Parent = blackroseshopTab
local t = Instance.new("TextButton")
t.Size = UDim2.new(0.8, 0, 0.1, 0)
t.Position = UDim2.new(1, 0, 0.10, 0)
t.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
t.TextColor3 = Color3.new(1, 1, 1)
t.Text = "Update Quantities"
t.Font = Enum.Font.SourceSansBold
t.TextSize = 24
t.Parent = blackroseshopTab
local function u()
    local v = "Item Quantities:\n"
    local f = 0
    for g, h in ipairs(items) do
        if h.quantity > 0 then
            v = v .. string.format("%s: %d\n", h.name, h.quantity)
            f = f + h.price * h.quantity
        end
    end
    v = v .. string.format("\nTotal Price: $%.2f", f)
    s.Text = v
end
t.MouseButton1Click:Connect(
    function()
        u()
    end
)
local w = {}
for g, h in ipairs(items) do
    local j = i(h)
    j.Parent = c
    w[h.name] = j
end
local x = Instance.new("Frame")
x.Size = UDim2.new(1, 0, 0, 100)
x.BackgroundTransparency = 1
x.Parent = c
b:GetPropertyChangedSignal("Text"):Connect(
    function()
        local y = b.Text:lower()
        for g, h in ipairs(items) do
            local j = w[h.name]
            if y == "" or h.name:lower():find(y) then
                j.Visible = true
            else
                j.Visible = false
            end
        end
    end
)