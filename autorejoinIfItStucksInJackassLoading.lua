-- Auto-Rejoin if visible loading text is still on screen after 25s

local player = game.Players.LocalPlayer
local startTime = tick()
local rejoined = false

-- FUNCTION: CHECK FOR VISIBLE LOADING TEXT
local function hasVisibleLoadingText()
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("TextLabel") or obj:IsA("TextButton") then
            local text = obj.Text:lower() or ""
            if (string.find(text, "loading") or 
                string.find(text, "character") or
                string.find(text, "waiting") or
                string.find(text, "connecting")) then
                if obj.Visible == true and obj.AbsoluteSize.X > 0 and obj.AbsoluteSize.Y > 0 then
                    return true
                end
            end
        end
    end
    return false
end

-- FUNCTION: REJOIN
local function rejoinGame()
    if rejoined then return end
    rejoined = true
    
    print("Loading text still visible after 25s! Rejoining...")
    
    pcall(function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, player)
    end)
end

-- START CHECKING
print("Checking for visible loading text...")

task.spawn(function()
    while task.wait(2) do
        if tick() - startTime >= 25 then
            if hasVisibleLoadingText() then
                rejoinGame()
            else
                print("✅ No loading text visible. You're good!")
            end
            break
        end
    end
end)
