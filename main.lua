local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "FIIHUB - BLATANT", HidePremium = false, SaveConfig = true, ConfigFolder = "FiihubBlatant"})

-- [[ VARIABLES ]]
_G.BlatantAuto = false
_G.WalkSpeed = 16

-- [[ FUNCTIONS ]]
function doBlatant()
    spawn(function()
        while _G.BlatantAuto do
            pcall(function()
                local player = game.Players.LocalPlayer
                local char = player.Character
                local tool = char:FindFirstChildOfClass("Tool")
                
                if tool then
                    -- BLATANT: Tanpa delay, langsung tarik (Sangat Cepat)
                    tool:Activate()
                end
            end)
            -- Kecepatan gila untuk blatant mode
            task.wait(0.05) 
        end
    end)
end

-- [[ MENU FISHING ]]
local FishTab = Window:MakeTab({
	Name = "FISHING",
	Icon = "rbxassetid://4483345998"
})

FishTab:AddSection({ Name = "CHEATS" })

FishTab:AddToggle({
	Name = "BLATANT AUTO FISH",
	Default = false,
	Callback = function(Value)
		_G.BlatantAuto = Value
		if Value then
			doBlatant()
			OrionLib:MakeNotification({
				Name = "FIIHUB",
				Content = "Blatant Mode Aktif! Resiko Banned Tinggi.",
				Time = 5
			})
		end
	end
})

-- [[ MENU PLAYER ]]
local PlayerTab = Window:MakeTab({
	Name = "PLAYER",
	Icon = "rbxassetid://4483345998"
})

PlayerTab:AddSlider({
	Name = "Speed Hack",
	Min = 16,
	Max = 300,
	Default = 16,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

PlayerTab:AddButton({
	Name = "Instant Infinite Jump",
	Callback = function()
		game:GetService("UserInputService").JumpRequest:Connect(function()
			game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
		end)
	end    
})

OrionLib:Init()
