local TweenDur = 0.27
function TweenButtonTransp(transp)
	for _, v in pairs(script.Parent:GetChildren()) do
		if v:IsA("TextButton") then
			task.synchronize(
				game:GetService("TweenService"):Create(v, TweenInfo.new(TweenDur), 
					{TextTransparency = transp, TextStrokeTransparency = transp }
				):Play(),
				game:GetService("TweenService"):Create(v:FindFirstChildOfClass("TextLabel"), 
					TweenInfo.new(TweenDur), {
						TextTransparency = transp, TextStrokeTransparency = transp
					}
				):Play()
			)
		end
	end
end
function TweenIn()
	task.synchronize(TweenButtonTransp(0),
		game:GetService("TweenService"):Create(script.Parent, TweenInfo.new(TweenDur), 
			{Transparency = 0.05}
		):Play()
	)
end
function TweenOut()
	task.synchronize(TweenButtonTransp(1),
		game:GetService("TweenService"):Create(script.Parent, TweenInfo.new(TweenDur), 
			{Transparency = 1}
		):Play()
	)
end

game:GetService("UserInputService").InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.Q then
		script.Parent.QHolded.Value = true
		game:GetService("UserInputService").InputEnded:Connect(function()
			script.Parent.QHolded.Value = false
		end)
	end
end)

script.Parent.QHolded.Changed:Connect(function()
	if script.Parent.QHolded.Value == true then
		TweenIn()
	else
		TweenOut()
	end
end)
