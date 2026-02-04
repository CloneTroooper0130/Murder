game:GetService("UserInputService").InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.F then
		script.Sound:Play()
		if game.Players.LocalPlayer.Character:FindFirstChild("Head"):FindFirstChildOfClass("SpotLight") then
			game.Players.LocalPlayer.Character:FindFirstChild("Head"):FindFirstChildOfClass("SpotLight"):Destroy()
		else
			local Light = Instance.new("SpotLight", game.Players.LocalPlayer.Character.Head)
			Light.Angle = 45
			Light.Brightness = 36
			Light.Color = Color3.new(0.992157, 1, 0.545098)
			Light.Range = 30
			Light.Shadows = true
		end
	end
end)
