local inPositions = {
	["Quickplay"] = UDim2.new(0.011, 0, 0.592, 0),
	["Matchmaking"] = UDim2.new(0.341, 0, 0.507, 0),
	["Badges"] = UDim2.new(0.681, 0, 0.507, 0),
	["Options"] = UDim2.new(0.119, 0, 0.814, 0),
	["Shop"] = UDim2.new(0.513, 0, 0.776, 0),
	["Logo"] = UDim2.new(0.181, 0, 0.047, 0)
}
local BackPosIn = UDim2.new(-0.014, 0, 0.487, 0)
local BackPosOut = UDim2.new(-0.614, 0, 0.487, 0)
local mainbackdrop = script.Parent.MainFrame.MainBackdrop

local outPositions = {
	["Quickplay"] = UDim2.new(0.011, 0, 1, 0),
	["Matchmaking"] = UDim2.new(0.341, 0, 1.5, 0),
	["Badges"] = UDim2.new(0.681, 0, 1.5, 0),
	["Options"] = UDim2.new(0.119, 0, 1.5, 0),
	["Shop"] = UDim2.new(0.513, 0, 1.5, 0),
	["Logo"] = UDim2.new(0.181, 0, -3, 0)
}
local defaultcol = script.Parent.MainFrame.vignettesarecool.ImageColor3 --Too lazy to see the rgb code :/

local tweendur = 0.65

function TweenInOrOut(img, txt, pos, transp)
	task.synchronize(
		script.Parent.MouseClick:Play(),
		game:GetService("TweenService"):Create(img, TweenInfo.new(tweendur, Enum.EasingStyle.Quad), {Position = pos}):Play(),
		game:GetService("TweenService"):Create(img, TweenInfo.new(tweendur), {ImageTransparency = transp}):Play(),
		game:GetService("TweenService"):Create(txt, TweenInfo.new(tweendur), {TextTransparency = transp, TextStrokeTransparency = transp}):Play()
	)
end

function tweenAllout()
	task.synchronize(
		script.Parent.MouseClick:Play(),
		game:GetService("TweenService"):Create(script.Parent.MainFrame.vignettesarecool, TweenInfo.new(tweendur), {ImageTransparency = 0, BackgroundTransparency = 1}):Play(),
		TweenInOrOut(script.Parent.Quickplay, script.Parent.Quickplay.TextLabel, outPositions.Quickplay, 1),
		TweenInOrOut(script.Parent.Matchmaking, script.Parent.Matchmaking.TextLabel, outPositions.Matchmaking, 1),
		TweenInOrOut(script.Parent.Badges, script.Parent.Badges.TextLabel, outPositions.Badges, 1),
		TweenInOrOut(script.Parent.Options, script.Parent.Options.TextLabel, outPositions.Options, 1),
		TweenInOrOut(script.Parent.Shop, script.Parent.Shop.TextLabel, outPositions.Shop, 1),
		TweenInOrOut(script.Parent.Back, script.Parent.Back.TextLabel, BackPosIn, 0),
		game:GetService("TweenService"):Create(script.Parent.LogoFrame, TweenInfo.new(tweendur, Enum.EasingStyle.Quad), {Position = outPositions.Logo}):Play(),
		game:GetService("TweenService"):Create(script.Parent.LogoFrame.mainlogo, TweenInfo.new(tweendur), {ImageTransparency = 1}):Play(),
		game:GetService("TweenService"):Create(script.Parent.LogoFrame.glow, TweenInfo.new(tweendur), {ImageTransparency = 1}):Play()
	)
end


function tweenAllIn()
	task.synchronize(
		game:GetService("TweenService"):Create(mainbackdrop.Parent.vignettesarecool, TweenInfo.new(tweendur), {ImageTransparency = 1, BackgroundTransparency = 1}):Play(),
		TweenInOrOut(script.Parent.Quickplay, script.Parent.Quickplay.TextLabel, inPositions.Quickplay, 0),
		TweenInOrOut(script.Parent.Matchmaking, script.Parent.Matchmaking.TextLabel, inPositions.Matchmaking, 0),
		TweenInOrOut(script.Parent.Badges, script.Parent.Badges.TextLabel, inPositions.Badges, 0),
		TweenInOrOut(script.Parent.Options, script.Parent.Options.TextLabel, inPositions.Options, 0),
		TweenInOrOut(script.Parent.Shop, script.Parent.Shop.TextLabel, inPositions.Shop, 0),
		TweenInOrOut(script.Parent.Back, script.Parent.Back.TextLabel, BackPosOut, 1),
		game:GetService("TweenService"):Create(script.Parent.LogoFrame, TweenInfo.new(tweendur, Enum.EasingStyle.Quad), {Position = inPositions.Logo}):Play(),
		game:GetService("TweenService"):Create(script.Parent.LogoFrame.mainlogo, TweenInfo.new(tweendur), {ImageTransparency = 0}):Play(),
		game:GetService("TweenService"):Create(script.Parent.LogoFrame.glow, TweenInfo.new(tweendur), {ImageTransparency = 0}):Play()
	)
end

script.Parent.Quickplay.MouseButton1Down:Connect(function()
	game:GetService("TweenService"):Create(script.Parent.QuickPlayTab, 
		TweenInfo.new(tweendur, Enum.EasingStyle.Quad), 
		{Position = UDim2.new(0.216, 0, 0.137, 0)}
	):Play()
	game:GetService("TweenService"):Create(script.Parent.MainFrame.vignettesarecool, TweenInfo.new(tweendur), {ImageColor3 = Color3.new(0.117647, 0.247059, 0.294118), 
		ImageTransparency = 0}):Play()
	tweenAllout()
end)
script.Parent.Matchmaking.MouseButton1Down:Connect(function()
	task.synchronize(
		tweenAllout(),
		game:GetService("TweenService"):Create(
			script.Parent.MatchmakingFrame, TweenInfo.new(tweendur), 
			{Position = UDim2.new(0, 0, 0, 0)}
		):Play()
	)
end)
script.Parent.Options.MouseButton1Down:Connect(function()
	task.synchronize(
		tweenAllout(),
		game:GetService("TweenService"):Create(
			script.Parent.OptionsFrame, TweenInfo.new(tweendur),
			{Position = UDim2.new(0, 0, 0, 0)}
		):Play()
	)
end)
script.Parent.Badges.MouseButton1Down:Connect(function()
	tweenAllout()
end)
script.Parent.Shop.MouseButton1Down:Connect(function()
	task.synchronize(
		game:GetService("TweenService"):Create(script.Parent.CustomizationFrame, TweenInfo.new(tweendur, Enum.EasingStyle.Quad),
			{Position = UDim2.new(0, 0, 0, 0)}
		):Play(),
		tweenAllout()
	)
end)



script.Parent.Back.MouseButton1Down:Connect(function()
	task.synchronize(
		tweenAllIn(),
		game:GetService("TweenService"):Create(script.Parent.MainFrame.vignettesarecool, TweenInfo.new(tweendur), {ImageColor3 = defaultcol}):Play(),
		game:GetService("TweenService"):Create(script.Parent.QuickPlayTab, TweenInfo.new(tweendur, Enum.EasingStyle.Quad), 
			{Position = UDim2.new(0.216, 0, -5, 0)}
		):Play(),
		game:GetService("TweenService"):Create(script.Parent.CustomizationFrame, TweenInfo.new(tweendur, Enum.EasingStyle.Quad), 
			{Position = UDim2.new(0, 0, 0, 1000)}
		):Play(),
		game:GetService("TweenService"):Create(script.Parent.MatchmakingFrame, TweenInfo.new(tweendur),
			{Position = UDim2.new(0, 0, 0, -1000)}
		):Play(),
		game:GetService("TweenService"):Create(script.Parent.OptionsFrame, TweenInfo.new(tweendur),
			{Position = UDim2.new(0, 0, 0, -1000)}
		):Play()
	)
end)
