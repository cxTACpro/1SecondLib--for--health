repeat wait()
until game.PlaceId==11302865934
local player = game:GetService'Players'.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild('Humanoid')
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "1SecondLib", HidePremium = true, SaveConfig = true, ConfigFolder = "1SecLibRay"})

function allWin()
	local tb = {}
	local winspart = workspace.Wins:GetChildren()
	for i,v in pairs(winspart) do 
		table.insert(tb,v.Name)
	end
	return tb
end
local playert = Window:MakeTab({
	Name = "LocalPlayer",
	Icon = nil,
	PremiumOnly = false
})
local ch = playert:AddSection({
	Name = "Character"
})
local walkspeedenalble = false
local selspeed=16
ch:AddToggle({
	Name = "Toggle Walkspeed",
	Default = false,
	Callback = function(Value)
		walkspeedenalble = Value
	end    
})
game:GetService('RunService').RenderStepped:Connect(function()
	if walkspeedenalble then 
		player.Character:WaitForChild("Humanoid").WalkSpeed=selspeed
	else
		player.Character:WaitForChild("Humanoid").WalkSpeed=16
	end
end)
ch:AddSlider({
	Name = "Walkspeed",
	Min = 13,
	Max = 300,
	Default = 16,
	Color = Color3.fromRGB(45,45,45),
	Increment = 1,
	ValueName = "Walkspeed",
	Callback = function(speedtowalkat)
		selspeed=speedtowalkat
	end
})
local Farm = Window:MakeTab({
	Name = "Farming",	
	Icon = nil,
	PremiumOnly = false
})
local Farm = Farm:AddSection({
	Name = "Farming"
})
local selectarea=nil
Farm:AddDropdown({
	Name = "Area",
	Default = nil,
	Options = allWin(),
	Callback = function(wn)
		selectarea=wn
	end
})
local farmimgasdasd = false
Farm:AddToggle({
	Name = "Toggle Farm",
	Default = false,
	Callback = function(v)
		farmimgasdasd=v
	end
})
game:GetService('RunService').RenderStepped:Connect(function()
	if selectarea and farmimgasdasd then 
		char:PivotTo(workspace:WaitForChild("Wins"):FindFirstChild(selectarea).CFrame)
		wait(0.1)
	end
end)
