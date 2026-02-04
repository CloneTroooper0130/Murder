game:GetService("UserInputService").InputBegan:Connect(function(inp)
	if game.Players.LocalPlayer.PlayerGui.QMenu.Frame.Transparency ~= 1 then
		if inp.KeyCode == Enum.KeyCode.W then
			workspace.ClientSounds.Help:FireServer()
		end
	end
end)
game:GetService("UserInputService").InputBegan:Connect(function(inp)
	if game.Players.LocalPlayer.PlayerGui.QMenu.Frame.Transparency ~= 1 then
		if inp.KeyCode == Enum.KeyCode.S then
			workspace.ClientSounds.Scream:FireServer()
		end
	end
end)
game:GetService("UserInputService").InputBegan:Connect(function(inp)
	if game.Players.LocalPlayer.PlayerGui.QMenu.Frame.Transparency ~= 1 then
		if inp.KeyCode == Enum.KeyCode.D then
			workspace.ClientSounds.Funny:FireServer()
		end
	end
end)
game:GetService("UserInputService").InputBegan:Connect(function(inp)
	if game.Players.LocalPlayer.PlayerGui.QMenu.Frame.Transparency ~= 1 then
		if inp.KeyCode == Enum.KeyCode.A then
			workspace.ClientSounds.Morose:FireServer()
		end
	end
end)
