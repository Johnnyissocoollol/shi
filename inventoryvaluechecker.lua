setclipboard = function() end

local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local database = require(ReplicatedStorage:WaitForChild("Database"):WaitForChild("Sync"):WaitForChild("Item"))

local itemValues = {
    ["TravelerGun"] = 4750,
    ["TravelersGun"] = 4750,
    ["Evergun"] = 3475,
    ["TreeGun2023"] = 3475,
    ["Constellation"] = 2725,
    ["Evergreen"] = 2525,
    ["TreeKnife2023"] = 2525,
    ["Turkey"] = 2450,
    ["Turkey2023"] = 2450,
    ["Alienbeam"] = 2000,
    ["UFOKNIFE"] = 2000,
    ["VampireGun"] = 1700,
    ["VampiresGun"] = 1700,
    ["Darkshot"] = 1550,
    ["Darksword"] = 1525,
    ["Raygun"] = 1325,
    ["Blossom"] = 1265,
    ["Blossom_G"] = 1265,
    ["Sakura"] = 1255,
    ["Sakura_K"] = 1255,
    ["Sunrise"] = 1000,
    ["Bauble"] = 900,
    ["Snowcannon"] = 825,
    ["Soul"] = 525,
    ["Sunset"] = 525,
    ["SunsetKnife"] = 525,
    ["Spirit"] = 515,
    ["RainbowGun"] = 420,
    ["Flora"] = 410,
    ["Rainbow"] = 410,
    ["Rainbow_K"] = 410,
    ["Bloom"] = 400,
    ["HeartWand"] = 330,
    ["Ocean"] = 280,
    ["Ocean_G"] = 280,
    ["Waves"] = 275,
    ["Waves_K"] = 275,
    ["Xenoknife"] = 270,
    ["Xenoshot"] = 270,
    ["FlowerwoodGun"] = 260,
    ["SnowDagger"] = 260,
    ["Flowerwood"] = 255,
    ["FlowerwoodKnife"] = 255,
    ["Blizzard"] = 250,
    ["Snowstorm"] = 250,
    ["Watergun"] = 250,
    ["Treat"] = 165,
    ["Sweet"] = 160,
    ["Borealis"] = 155,
    ["Australis"] = 150,
    ["Bat"] = 120,
    ["Pearlshine"] = 100,
    ["Pearl"] = 95,
    ["Pearl_G"] = 95,
    ["Candy"] = 80,
    ["Heartblade"] = 68,
    ["Luger"] = 45,
    ["RedLuger"] = 42,
    ["Candleflame"] = 38,
    ["Darkbringer"] = 38,
    ["ElderwoodBlade"] = 38,
    ["ElderwoodKnife"] = 38,
    ["ElderwoodRevolver"] = 38,
    ["ElderwoodGun"] = 38,
    ["Iceblaster"] = 38,
    ["Makeshift"] = 38,
    ["Phantom"] = 38,
    ["Phantom2022"] = 38,
    ["Spectre"] = 38,
    ["Spectre2022"] = 38,
    ["Sugar"] = 37,
    ["Lightbringer"] = 35,
    ["Ornament"] = 28,
    ["GreenLuger"] = 25,
    ["Amerilaser"] = 23,
    ["Hallowgun"] = 23,
    ["Laser"] = 23,
    ["Icebeam"] = 20,
    ["Nightblade"] = 20,
    ["Shark"] = 20,
    ["SwirlyGun"] = 20,
    ["Blaster"] = 18,
    ["Iceflake"] = 18,
    ["Plasmabeam"] = 18,
    ["BattleAxeII"] = 17,
    ["BattleaxeII"] = 17,
    ["GingerLuger"] = 17,
    ["OldGlory"] = 17,
    ["Pixel"] = 17,
    ["Plasmablade"] = 17,
    ["Slasher"] = 17,
    ["Cookiecane"] = 15,
    ["Eternalcane"] = 15,
    ["EternalCane"] = 15,
    ["Gemstone"] = 15,
    ["Gingerblade"] = 15,
    ["Gingermint"] = 15,
    ["Gingermint_G"] = 15,
    ["Jinglegun"] = 15,
    ["Lugercane"] = 15,
    ["Minty"] = 15,
    ["Nebula"] = 15,
    ["SwirlyBlade"] = 15,
    ["VampiresEdge"] = 15,
    ["Virtual"] = 15,
    ["Deathshard"] = 13,
    ["BattleAxe"] = 12,
    ["Battleaxe"] = 12,
    ["Bioblade"] = 10,
    ["Chill"] = 10,
    ["Clockwork"] = 10,
    ["EternalIII"] = 10,
    ["EternalIV"] = 10,
    ["Fang"] = 10,
    ["Frostsaber"] = 10,
    ["Heat"] = 10,
    ["Spider"] = 10,
    ["Tides"] = 10,
    ["Eternal"] = 8,
    ["EternalII"] = 8,
    ["HallowsBlade"] = 8,
    ["HallowsEdge"] = 8,
    ["Handsaw"] = 8,
    ["Xmas"] = 8,
    ["Boneblade"] = 7,
    ["Frostbite"] = 7,
    ["Ghostblade"] = 7,
    ["IceDragon"] = 7,
    ["IceShard"] = 7,
    ["ChromaTravelersGun"] = 220000,
    ["ChromaTravelerGun"] = 220000,
    ["ChromaEvergun"] = 76000,
    ["TreeGun2023Chroma"] = 76000,
    ["ChromaEvergreen"] = 60000,
    ["TreeKnife2023Chroma"] = 60000,
    ["ChromaBauble"] = 35000,
    ["ChromaVampiresGun"] = 29000,
    ["ChromaVampireGun"] = 29000,
    ["ChromaConstellation"] = 27000,
    ["ChromaAlienbeam"] = 24000,
    ["UFOKNIFECHROMA"] = 24000,
    ["ChromaRaygun"] = 14500,
    ["ChromaSunrise"] = 11500,
    ["ChromaSnowcannon"] = 8500,
    ["ChromaBlizzard"] = 8000,
    ["ChromaSunset"] = 6500,
    ["ChromaHeartWand"] = 4750,
    ["HeartWandChroma"] = 4750,
    ["ChromaSnowDagger"] = 4500,
    ["ChromaSnowstorm"] = 4250,
    ["ChromaWatergun"] = 3400,
    ["ChromaTreat"] = 2600,
    ["ChromaSweet"] = 2300,
    ["ChromaOrnament"] = 1800,
    ["ChromaDarkbringer"] = 70,
    ["ChromaticDarkbringer"] = 70,
    ["ChromaticLightbringer"] = 65,
    ["ChromaLightbringer"] = 65,
    ["ChromaticLuger"] = 52,
    ["ChromaticCandleflame"] = 42,
    ["ChromaticElderwoodBlade"] = 42,
    ["ChromaticLaser"] = 42,
    ["ChromaticSwirlyGun"] = 42,
    ["ChromaSwirlyGun"] = 42,
    ["ChromaCookiecane"] = 38,
    ["ChromaSlasher"] = 38,
    ["ChromaDeathshard"] = 35,
    ["ChromaFang"] = 32,
    ["ChromaGemstone"] = 32,
    ["ChromaGingerblade"] = 32,
    ["ChromaHeat"] = 32,
    ["ChromaSeer"] = 32,
    ["ChromaShark"] = 32,
    ["ChromaSaw"] = 30,
    ["ChromaTides"] = 30,
    ["ChromaBoneblade"] = 25,
    ["ChromaFireBat"] = 5,
    ["ChromaFireBear"] = 5,
    ["ChromaFireBunny"] = 5,
    ["ChromaFireCat"] = 5,
    ["ChromaFireDog"] = 5,
    ["ChromaFireFox"] = 5,
    ["ChromaFirePig"] = 5,
    ["Gingerscope"] = 17750,
    ["TravelerAxe"] = 8400,
    ["Celestial"] = 2000,
    ["VampireAxe"] = 1225,
    ["Harvester"] = 250,
    ["Icepiercer"] = 120,
    ["Icebreaker"] = 68,
    ["Batwing"] = 45,
    ["ElderwoodScythe"] = 42,
    ["SwirlyAxe"] = 42,
    ["Hallowscythe"] = 32,
    ["Logchopper"] = 18,
    ["Icewing"] = 15,
    ["DefaultGun"] = 0,
    ["DefaultKnife"] = 0,
    ["Reaver"] = 0,
    ["Reaver_Legendary"] = 0,
    ["Reaver_Godly"] = 0,
    ["Reaver_Ancient"] = 0,
    ["IceHammer"] = 0,
    ["IceHammer_Legendary"] = 0,
    ["IceHammer_Godly"] = 0,
    ["IceHammer_Ancient"] = 0,
    ["Gingerscythe"] = 0,
    ["Gingerscythe_Legendary"] = 0,
    ["Gingerscythe_Godly"] = 0,
    ["Gingerscythe_Ancient"] = 0,
    ["TestItem"] = 0,
    ["Season1TestKnife"] = 0,
    ["Cracks"] = 0,
    ["Icecrusher"] = 0,
    ["???"] = 0,
    ["Dartbringer"] = 0,
    ["TravelerAxeRed"] = 0,
    ["TravelerAxeBronze"] = 0,
    ["TravelerAxeSilver"] = 0,
    ["TravelerAxeGold"] = 0,
    ["BlueCamo_K_2022"] = 0,
    ["GreenCamo_K_2022"] = 0,
    ["SharkSeeker"] = 0,
    ["SunsetGun"] = 525,
    ["ChromaSunset"] = 6500
}

local rarityTable = {
    "Common",
    "Uncommon",
    "Rare",
    "Legendary",
    "Godly",
    "Ancient",
    "Unique",
    "Vintage"
}

local function getWeaponRarityIndex(rarity)
    return table.find(rarityTable, rarity)
end

local function CalculateInventory()
    local inventory = {}
    local totalValue = 0
    local godlyCount = 0
    local ancientCount = 0
    local chromaCount = 0
    local uniqueCount = 0
    
    local realData = ReplicatedStorage.Remotes.Inventory.GetProfileData:InvokeServer(plr.Name)
    
    if realData and realData.Weapons and realData.Weapons.Owned then
        for dataId, amount in pairs(realData.Weapons.Owned) do
            local itemData = database[dataId]
            if itemData then
                local name = itemData.ItemName or dataId
                local rarity = itemData.Rarity or "Common"
                local isChroma = itemData.Chroma or false
                local value = itemValues[dataId] or 0
                
                if value == 0 then
                    local rarityIndex = getWeaponRarityIndex(rarity)
                    if rarityIndex then
                        if rarityIndex >= getWeaponRarityIndex("Godly") then
                            value = 2
                        elseif rarityIndex >= getWeaponRarityIndex("Ancient") then
                            value = 3
                        elseif rarityIndex >= getWeaponRarityIndex("Unique") then
                            value = 5
                        elseif rarityIndex >= getWeaponRarityIndex("Vintage") then
                            value = 1
                        end
                    end
                end
                
                local totalItemValue = value * amount
                
                if rarity == "Godly" then godlyCount = godlyCount + amount end
                if rarity == "Ancient" then ancientCount = ancientCount + amount end
                if rarity == "Unique" then uniqueCount = uniqueCount + amount end
                if isChroma then chromaCount = chromaCount + amount end
                
                if totalItemValue > 0 then
                    table.insert(inventory, {
                        Name = name,
                        DataID = dataId,
                        Rarity = rarity,
                        IsChroma = isChroma,
                        Amount = amount,
                        Value = value,
                        TotalValue = totalItemValue
                    })
                end
                
                totalValue = totalValue + totalItemValue
            end
        end
    end
    
    table.sort(inventory, function(a, b)
        return a.TotalValue > b.TotalValue
    end)
    
    return {
        items = inventory,
        totalValue = totalValue,
        itemCount = #inventory,
        godlyCount = godlyCount,
        ancientCount = ancientCount,
        chromaCount = chromaCount,
        uniqueCount = uniqueCount
    }
end

local function CreateLoadingScreen()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "InventoryLoader"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = plr:WaitForChild("PlayerGui")
    
    local overlay = Instance.new("Frame")
    overlay.Size = UDim2.new(1, 0, 1, 0)
    overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    overlay.BackgroundTransparency = 0.6
    overlay.BorderSizePixel = 0
    overlay.Parent = screenGui
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 400, 0, 200)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
    mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = overlay
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0, 50)
    titleLabel.Position = UDim2.new(0, 0, 0, 20)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "Loading..."
    titleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    titleLabel.TextSize = 22
    titleLabel.Font = Enum.Font.SourceSans
    titleLabel.Parent = mainFrame
    
    local subtitleLabel = Instance.new("TextLabel")
    subtitleLabel.Size = UDim2.new(1, 0, 0, 30)
    subtitleLabel.Position = UDim2.new(0, 0, 0, 60)
    subtitleLabel.BackgroundTransparency = 1
    subtitleLabel.Text = "Please wait, calculating value this might take a while"
    subtitleLabel.TextColor3 = Color3.fromRGB(160, 160, 165)
    subtitleLabel.TextSize = 14
    subtitleLabel.Font = Enum.Font.SourceSans
    subtitleLabel.Parent = mainFrame
    
    local loadingBg = Instance.new("Frame")
    loadingBg.Size = UDim2.new(0.8, 0, 0, 12)
    loadingBg.Position = UDim2.new(0.1, 0, 0, 110)
    loadingBg.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
    loadingBg.BorderSizePixel = 0
    loadingBg.Parent = mainFrame
    
    local loadingBar = Instance.new("Frame")
    loadingBar.Size = UDim2.new(0, 0, 1, 0)
    loadingBar.BackgroundColor3 = Color3.fromRGB(150, 150, 155)
    loadingBar.BorderSizePixel = 0
    loadingBar.Parent = loadingBg
    
    local function AnimateLoading()
        local startTime = tick()
        local duration = 9
        
        while tick() - startTime < duration do
            local progress = (tick() - startTime) / duration
            loadingBar.Size = UDim2.new(progress, 0, 1, 0)
            task.wait(0.1)
        end
        
        loadingBar.Size = UDim2.new(1, 0, 1, 0)
        task.wait(0.5)
        
        return screenGui
    end
    
    return screenGui, AnimateLoading
end

local function CreateResultGUI(inventoryData)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "InventoryResult"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = plr:WaitForChild("PlayerGui")
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 400, 0, 450)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -225)
    mainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.Parent = screenGui
    
    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 35)
    titleBar.BackgroundColor3 = Color3.fromRGB(55, 55, 60)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = mainFrame
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 1, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "Inventory Value"
    titleLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    titleLabel.TextSize = 16
    titleLabel.Font = Enum.Font.SourceSans
    titleLabel.Parent = titleBar
    
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 25, 0, 25)
    closeBtn.Position = UDim2.new(1, -30, 0, 5)
    closeBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 85)
    closeBtn.BorderSizePixel = 0
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
    closeBtn.TextSize = 14
    closeBtn.Font = Enum.Font.SourceSans
    closeBtn.Parent = titleBar
    closeBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)
    
    local totalFrame = Instance.new("Frame")
    totalFrame.Size = UDim2.new(1, -20, 0, 70)
    totalFrame.Position = UDim2.new(0, 10, 0, 45)
    totalFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    totalFrame.BorderSizePixel = 0
    totalFrame.Parent = mainFrame
    
    local totalLabel = Instance.new("TextLabel")
    totalLabel.Size = UDim2.new(1, 0, 1, 0)
    totalLabel.BackgroundTransparency = 1
    totalLabel.Text = string.format("Total Value: %s", inventoryData.totalValue)
    totalLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    totalLabel.TextSize = 22
    totalLabel.Font = Enum.Font.SourceSans
    totalLabel.Parent = totalFrame
    
    local statsFrame = Instance.new("Frame")
    statsFrame.Size = UDim2.new(1, -20, 0, 25)
    statsFrame.Position = UDim2.new(0, 10, 0, 125)
    statsFrame.BackgroundTransparency = 1
    statsFrame.Parent = mainFrame
    
    local statsLabel = Instance.new("TextLabel")
    statsLabel.Size = UDim2.new(1, 0, 1, 0)
    statsLabel.BackgroundTransparency = 1
    statsLabel.Text = string.format("Godlies: %s | Ancients: %s | Uniques: %s | Chromas: %s",
        inventoryData.godlyCount,
        inventoryData.ancientCount,
        inventoryData.uniqueCount,
        inventoryData.chromaCount
    )
    statsLabel.TextColor3 = Color3.fromRGB(180, 180, 185)
    statsLabel.TextSize = 12
    statsLabel.Font = Enum.Font.SourceSans
    statsLabel.Parent = statsFrame
    
    local topTitle = Instance.new("TextLabel")
    topTitle.Size = UDim2.new(1, -20, 0, 25)
    topTitle.Position = UDim2.new(0, 10, 0, 160)
    topTitle.BackgroundTransparency = 1
    topTitle.Text = "Top 3 Most Valuable"
    topTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
    topTitle.TextSize = 14
    topTitle.Font = Enum.Font.SourceSans
    topTitle.TextXAlignment = Enum.TextXAlignment.Left
    topTitle.Parent = mainFrame
    
    local topFrame = Instance.new("Frame")
    topFrame.Size = UDim2.new(1, -20, 0, 200)
    topFrame.Position = UDim2.new(0, 10, 0, 190)
    topFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    topFrame.BorderSizePixel = 0
    topFrame.Parent = mainFrame
    
    local topLayout = Instance.new("UIListLayout")
    topLayout.Parent = topFrame
    topLayout.SortOrder = Enum.SortOrder.LayoutOrder
    topLayout.Padding = UDim.new(0, 3)
    
    local topItems = {}
    for _, item in ipairs(inventoryData.items) do
        if item.TotalValue > 0 then
            table.insert(topItems, item)
            if #topItems >= 3 then break end
        end
    end
    
    if #topItems == 0 then
        local emptyLabel = Instance.new("TextLabel")
        emptyLabel.Size = UDim2.new(1, 0, 0, 30)
        emptyLabel.BackgroundTransparency = 1
        emptyLabel.Text = "No valuable items found"
        emptyLabel.TextColor3 = Color3.fromRGB(150, 150, 155)
        emptyLabel.TextSize = 14
        emptyLabel.Font = Enum.Font.SourceSans
        emptyLabel.Parent = topFrame
    else
        for i, item in ipairs(topItems) do
            local itemFrame = Instance.new("Frame")
            itemFrame.Size = UDim2.new(1, 0, 0, 55)
            itemFrame.BackgroundColor3 = Color3.fromRGB(48, 48, 53)
            itemFrame.BorderSizePixel = 0
            itemFrame.Parent = topFrame
            
            local rankLabel = Instance.new("TextLabel")
            rankLabel.Size = UDim2.new(0, 30, 1, 0)
            rankLabel.BackgroundTransparency = 1
            rankLabel.Text = tostring(i)
            rankLabel.TextColor3 = Color3.fromRGB(180, 180, 185)
            rankLabel.TextSize = 16
            rankLabel.Font = Enum.Font.SourceSans
            rankLabel.Parent = itemFrame
            
            local rarityColors = {
                ["Godly"] = Color3.fromRGB(200, 180, 100),
                ["Ancient"] = Color3.fromRGB(180, 130, 200),
                ["Unique"] = Color3.fromRGB(130, 200, 200),
                ["Vintage"] = Color3.fromRGB(200, 150, 150),
                ["Legendary"] = Color3.fromRGB(150, 180, 220),
                ["Rare"] = Color3.fromRGB(180, 200, 180),
                ["Uncommon"] = Color3.fromRGB(160, 180, 160),
                ["Common"] = Color3.fromRGB(180, 180, 180)
            }
            
            local color = rarityColors[item.Rarity] or Color3.fromRGB(180, 180, 180)
            
            local itemLabel = Instance.new("TextLabel")
            itemLabel.Size = UDim2.new(1, -40, 0.6, 0)
            itemLabel.Position = UDim2.new(0, 35, 0, 2)
            itemLabel.BackgroundTransparency = 1
            itemLabel.Text = string.format("%s x%s", item.Name, item.Amount)
            itemLabel.TextColor3 = color
            itemLabel.TextSize = 14
            itemLabel.TextXAlignment = Enum.TextXAlignment.Left
            itemLabel.Font = Enum.Font.SourceSans
            itemLabel.Parent = itemFrame
            
            local valueLabel = Instance.new("TextLabel")
            valueLabel.Size = UDim2.new(1, -40, 0.4, 0)
            valueLabel.Position = UDim2.new(0, 35, 0, 30)
            valueLabel.BackgroundTransparency = 1
            valueLabel.Text = string.format("Value: %s | Rarity: %s", item.TotalValue, item.Rarity)
            valueLabel.TextColor3 = Color3.fromRGB(160, 160, 165)
            valueLabel.TextSize = 11
            valueLabel.TextXAlignment = Enum.TextXAlignment.Left
            valueLabel.Font = Enum.Font.SourceSans
            valueLabel.Parent = itemFrame
        end
    end
    
    return screenGui
end

local function Main()
    local loadingGui, animateLoading = CreateLoadingScreen()
    animateLoading()
    local inventoryData = CalculateInventory()
    loadingGui:Destroy()
    CreateResultGUI(inventoryData)
end

Main()
