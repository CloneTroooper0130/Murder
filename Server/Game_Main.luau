local desiredplayers = 2
local ServerTextInfo = script.ServerInfo
local RoundInProgress = script.RoundInProgress
local rs = game:GetService("RunService")
local EndRound = script.EndRound

rs.Stepped:Connect(function()
	if RoundInProgress.Value == false and #game.Players:GetPlayers() >= desiredplayers then
		RoundInProgress.Value = true
		--In case the lever is still toggled--
		for _, lights in pairs(workspace:GetDescendants()) do
			if lights:IsA("PointLight") or lights:IsA("SpotLight") or lights:IsA("SurfaceLight") and lights.Parent.Name ~= "Head" then
				lights.Enabled = true
			end
		end
		script.LeverState.Value = true
		workspace.md_clue.Lever.Orientation = Vector3.new(0, 0, 90) --Subject to change--
		script.ManualStuff.Value = true
		local Names = {"Alfa", "Bravo", "Charlie", "Delta", "Echo", "Foxtrot", "Golf", "Hotel", "India", "Juliett", "Kilo", "Lima", "Miko", "November", 
			"Oscar", "Papa", "Quebec", "Romeo", "Sierra", "Tango", "Uniform", "Victor", "Whiskey", "X-ray", "Yankee", "Zulu"
		}
		local Colors = {Color3.new(1, 0, 0), Color3.new(1, 1, 0), Color3.new(0, 1, 1), Color3.new(0.333333, 0.666667, 0.498039), Color3.new(0.666667, 0, 1), 
			Color3.new(0.458824, 0.666667, 0.588235), Color3.new(1, 1, 1), Color3.new(1, 0.505882, 0.678431), Color3.new(1, 0.666667, 0)
		}
		for i = 1, 2 do
		 wait(.4)
		 ServerTextInfo.Value = "Loading."
		 wait(.4)
		 ServerTextInfo.Value = "Loading.."
		 wait(.4)
		 ServerTextInfo.Value = "Loading..."
		end
		wait(.2)
		script.Audio:Stop()
		ServerTextInfo.Value = ""
		local LootObjects = game.Lighting.Loot:Clone()
		LootObjects.Parent = workspace
		local Players = game.Players:GetPlayers()
          local Murderer = Players[math.random(1, #Players)]
		Murderer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 34
		Murderer.Character:FindFirstChildOfClass("BoolValue").Value = true
		Murderer.PlayerGui.Role.TextLabel.Text = "Murderer"
		Murderer.PlayerGui.Role.TextLabel.TextColor3 = Color3.new(1, 0, 0)
		Murderer.PlayerGui.Role.TextLabel.Visible = true
		for _, bystander in pairs(game.Players:GetPlayers()) do
			bystander.PlayerGui.Role.TextLabel.Visible = true
			local Color = Colors[math.random(1, #Colors)]
			table.remove(Colors, table.find(Colors, Color))
			local Name = Names[math.random(1, #Names)]
			table.remove(Names, table.find(Names, Name))
			if bystander.Character:FindFirstChildOfClass("Accessory") then
				bystander.Character:FindFirstChildOfClass("Accessory"):Destroy()
			end
			local Hairs = game.Lighting.HairVariants:GetChildren()
			local Hair = Hairs[math.random(1, #Hairs)]:Clone()
			local Spawns = workspace.Spawns:GetChildren()
			local Spawnn = Spawns[math.random(1, #Spawns)]
			bystander.Character.Torso.CFrame = Spawnn.CFrame + Vector3.new(0, 6, 0)
			Hair.Parent = bystander.Character
			bystander:FindFirstChildOfClass("IntValue"):FindFirstChildOfClass("IntValue").Value = 0
			bystander.Character:FindFirstChildOfClass("Humanoid").DisplayName = Name
			bystander.PlayerGui.Server.ColorCircle.BackgroundColor3 = Color
			bystander.PlayerGui.Server.BackgroundCircle.NameLabel.Text = Name
			bystander.PlayerGui.Server.BackgroundCircle.Visible = true
			bystander.PlayerGui.Server.ColorCircle.Visible = true
			bystander.PlayerGui.Server.BackgroundCircle.NameLabel.TextColor3 = Color
			for _, bp in pairs(bystander.Character:GetChildren()) do
				if bp:IsA("Part") and bp.Name ~= "Head" then
					bp.Color = Color
				end
			end
			local ClockGui = script.Clock:Clone()
			ClockGui.Parent = bystander.PlayerGui
			if bystander ~= Murderer then
				local BystanderGui = script.IntroGui:Clone()
				BystanderGui.Parent = bystander.PlayerGui
				BystanderGui.LocalScript.Enabled = true
				wait(4)
				local Revolver = game.Lighting.Revolver:Clone()
				Revolver.Parent = bystander.Backpack
			else
				local MurdererGui = script.IntroGui:Clone()
				MurdererGui.Parent = bystander.PlayerGui
				MurdererGui.LocalScript.Enabled = true
				MurdererGui.Image.Image = "rbxassetid://73871725178002"
				wait(4)
				local Knife = game.Lighting.Knife:Clone()
				Knife.Parent = bystander.Backpack
			end
			ClockGui.TextLabel.LocalScript.Enabled = true
		end
		script.Rain:Play()
		Murderer.Character:FindFirstChildOfClass("Humanoid").Died:Connect(function()
			wait(.003)
			script.Rain:Stop()
			script.LeverState.Value = true
			workspace:FindFirstChild("Loot"):Destroy()
			script.ManualStuff.Value = false
			for _, v in pairs(game.Players:GetPlayers()) do
				if v.Character:FindFirstChildOfClass("BoolValue").Value == true then
					v.Character:FindFirstChildOfClass("BoolValue").Value = false
					v.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
				end
				v.PlayerGui.Role.TextLabel.Visible = false
				v.Backpack:ClearAllChildren()
				v.PlayerGui.Server.BackgroundCircle.Visible = false
				v.PlayerGui.Server.ColorCircle.Visible = false
				v.PlayerGui:FindFirstChild("Clock"):Destroy()
				local EndGui = script.EndGui:Clone()
				EndGui.Frame.Winner.Text = "Bystanders win!"
				EndGui.Frame.Winner.TextColor3 = Color3.new(0, 0, 1)
				EndGui.Frame.Leaderboard.LocalScript.Enabled = true
				for _, v in pairs(game.Players:GetPlayers()) do
					if v.Character:FindFirstChildOfClass("BoolValue").Value == true then
						EndGui.Frame.MurdererName.Text = v.Name
						EndGui.Frame.MurdererName.TextColor3 = v.Character.Torso.Color
						wait(.2)
						v.Character:FindFirstChildOfClass("BoolValue").Value = false
					end
				end
				EndGui.Parent = v.PlayerGui
				v:FindFirstChildOfClass("IntValue"):FindFirstChildOfClass("IntValue").Value = 0
				for interm = -5, -1 do
					wait(1)
					ServerTextInfo.Value = "Next round starting in: "..math.abs(interm)
				end
				EndGui:Destroy()
				RoundInProgress.Value = false
			end
		end)
	elseif RoundInProgress.Value == false and #game.Players:GetPlayers() < desiredplayers then
		ServerTextInfo.Value = "Not enough players! (Players needed: "..desiredplayers - #game.Players:GetPlayers()..")"
	end
	EndRound.OnServerEvent:Connect(function()
		wait(.003)
		script.Rain:Stop()
		script.LeverState.Value = true
		workspace:FindFirstChild("Loot"):Destroy()
		script.ManualStuff.Value = false
		for _, v in pairs(game.Players:GetPlayers()) do
			if v.Character:FindFirstChildOfClass("BoolValue").Value == true then
				v.Character:FindFirstChildOfClass("BoolValue").Value = false
				v.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
			end
			v.PlayerGui.Role.TextLabel.Visible = false
			v.Backpack:ClearAllChildren()
			v.PlayerGui.Server.BackgroundCircle.Visible = false
			v.PlayerGui.Server.ColorCircle.Visible = false
			v.PlayerGui:FindFirstChild("Clock"):Destroy()
			local EndGui = script.EndGui:Clone()
			EndGui.Frame.Winner.Text = "Nobody wins!"
			EndGui.Frame.Winner.TextColor3 = Color3.new(1, 1, 1)
			EndGui.Frame.Leaderboard.LocalScript.Enabled = true
			for _, v in pairs(game.Players:GetPlayers()) do
				if v.Character:FindFirstChildOfClass("BoolValue").Value == true then
					EndGui.Frame.MurdererName.Text = v.Name
					EndGui.Frame.MurdererName.TextColor3 = v.Character.Torso.Color
					wait(.2)
					v.Character:FindFirstChildOfClass("BoolValue").Value = false
				end
			end
			EndGui.Parent = v.PlayerGui
			v:FindFirstChildOfClass("IntValue"):FindFirstChildOfClass("IntValue").Value = 0
			for interm = -5, -1 do
				wait(1)
				ServerTextInfo.Value = "Next round starting in: "..math.abs(interm)
			end
			EndGui:Destroy()
			RoundInProgress.Value = false
		end
	end)
end)
