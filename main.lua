-- [[ FIIHUB MULTI-GAME ]]
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "FIIHUB", HidePremium = false, SaveConfig = true, ConfigFolder = "FiihubConfig"})

-- Anti-AFK (Agar tidak kena kick)
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

-- Tab Utama
local MainTab = Window:MakeTab({
	Name = "FISH IT",
	Icon = "rbxassetid://4483345998"
})

_G.AutoFish = false
MainTab:AddToggle({
	Name = "Auto Fishing",
	Default = false,
	Callback = function(Value)
		_G.AutoFish = Value
		while _G.AutoFish do
			pcall(function()
				local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
				if tool then
					tool:Activate()
				end
			end)
			wait(0.5) -- Delay agar stabil di Bunni
		end
	end
})

-- Tab Player
local PlayerTab = Window:MakeTab({
	Name = "PLAYER",
	Icon = "rbxassetid://4483345998"
})

PlayerTab:AddSlider({
	Name = "Walkspeed",
	Min = 16, Max = 150, Default = 16,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

OrionLib:Init()
