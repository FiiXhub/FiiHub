-- [[ UNIVERSAL SCRIPT HUB OPTIMIZATION ]]

-- 1. Pemuatan Library dengan Fallback (Mencegah Gagal Load)
local success, OrionLib = pcall(function()
    return loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
end)

if not success then
    -- Jika Orion gagal, script akan memberi tahu di Console
    warn("Orion Library gagal dimuat. Pastikan koneksi internet stabil.")
    return
end

local Window = OrionLib:MakeWindow({
    Name = "FIIHUB - ALL EXECUTOR SUPPORT", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "FiihubConfig"
})

-- [[ ANTI-AFK UNIVERSAL ]]
-- Berjalan di semua executor untuk mencegah Kick/Disconnect
spawn(function()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end)
end)

-- [[ FISHING TAB ]]
local FishTab = Window:MakeTab({
    Name = "FISHING",
    Icon = "rbxassetid://4483345998"
})

_G.AutoFish = false
FishTab:AddToggle({
    Name = "AUTO FISH (UNIVERSAL)",
    Default = false,
    Callback = function(Value)
        _G.AutoFish = Value
        while _G.AutoFish do
            -- Menggunakan pcall agar script tidak mati jika karakter reset
            pcall(function()
                local player = game.Players.LocalPlayer
                local tool = player.Character and player.Character:FindFirstChildOfClass("Tool")
                if tool then
                    tool:Activate()
                end
            end)
            task.wait(0.5) -- Delay aman agar tidak lag di executor mobile
        end
    end
})

-- [[ PLAYER TAB ]]
local PlayerTab = Window:MakeTab({
    Name = "PLAYER",
    Icon = "rbxassetid://4483345998"
})

PlayerTab:AddSlider({
    Name = "WalkSpeed",
    Min = 16, Max = 250, Default = 16,
    Callback = function(Value)
        pcall(function()
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end)
    end    
})

PlayerTab:AddButton({
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
})

OrionLib:Init()
