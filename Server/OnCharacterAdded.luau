game.Players.PlayerAdded:Connect(function(Player)
	local leaderstats = Instance.new("IntValue", Player)
	leaderstats.Name = "leaderstats"
	local Loot = Instance.new("IntValue", leaderstats)
	Loot.Name = "Loot"
	Player.CharacterAdded:Connect(function(Char)
		local Spawns = workspace.Spawns:GetChildren()
		local Spawnn = Spawns[math.random(1, #Spawns)]
		local Hairs = game.Lighting.HairVariants:GetChildren()
		local Hair = Hairs[math.random(1, #Hairs)]:Clone()
		Hair.Parent = Char
		Char.Torso.CFrame = Spawnn.CFrame + Vector3.new(0, 6, 0)
		local Names = {"Alfa", "Bravo", "Charlie", "Delta", "Echo", "Foxtrot", "Golf", "Hotel", "India", "Juliett", "Kilo", "Lima",
			"Miko", "November", "Oscar", "Papa", "Quebec", "Romeo", "Sierra", "Tango", "Uniform", "Victor", "Whiskey", "X-ray",
			"Yankee", "Zulu"
		}
		local Colors = {Color3.new(1, 0, 0), Color3.new(1, 1, 0), Color3.new(0, 1, 1), Color3.new(0.333333, 0.666667, 0.498039), Color3.new(0.666667, 0, 1), 
			Color3.new(0.458824, 0.666667, 0.588235), Color3.new(1, 1, 1), Color3.new(1, 0.505882, 0.678431), Color3.new(1, 0.666667, 0)
		}
		local Name = Names[math.random(1, #Names)]
		Char:FindFirstChildOfClass("Humanoid").DisplayName = Name
		local Color = Colors[math.random(1, #Colors)]
		for _, x in pairs(Char:GetChildren()) do
			if x:IsA("Part") and x.Name ~= "Head" then
				x.Color = Color
			end
		end
		for _, s in pairs(Char:WaitForChild("HumanoidRootPart"):GetChildren()) do
			if s:IsA("Sound") then
				s:Destroy()
			end
		end
	end)
end)
