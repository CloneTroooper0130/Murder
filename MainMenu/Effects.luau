wait(4.62)
task.synchronize(
	game:GetService("TweenService"):Create(script.Parent.dark, TweenInfo.new(0.99), {ImageTransparency = 1}):Play(),
	game:GetService("TweenService"):Create(script.Parent.LogoFrame.UIScale, TweenInfo.new(0.62), {Scale = 1.28}):Play()
)
wait(.2)
local tweendur = 0.49
task.synchronize(
	game:GetService("TweenService"):Create(script.Parent.Quickplay, TweenInfo.new(tweendur, Enum.EasingStyle.Quad), {Position = UDim2.new(0.011, 0, 0.592, 0)}):Play(),
	game:GetService("TweenService"):Create(script.Parent.Quickplay, TweenInfo.new(tweendur), {ImageTransparency = 0}):Play(),
	game:GetService("TweenService"):Create(script.Parent.Quickplay.TextLabel, TweenInfo.new(tweendur), {TextTransparency = 0, TextStrokeTransparency = 0}):Play(),
	game:GetService("TweenService"):Create(script.Parent.Matchmaking, TweenInfo.new(tweendur, Enum.EasingStyle.Quad), {Position = UDim2.new(0.341, 0, 0.507, 0)}):Play(),
	game:GetService("TweenService"):Create(script.Parent.Matchmaking, TweenInfo.new(tweendur), {ImageTransparency = 0}):Play(),
	game:GetService("TweenService"):Create(script.Parent.Matchmaking.TextLabel, TweenInfo.new(tweendur), {TextTransparency = 0, TextStrokeTransparency = 0}):Play(),
	game:GetService("TweenService"):Create(script.Parent.Badges, TweenInfo.new(tweendur, Enum.EasingStyle.Quad), {Position = UDim2.new(0.681, 0, 0.507, 0)}):Play(),
	game:GetService("TweenService"):Create(script.Parent.Badges, TweenInfo.new(tweendur), {ImageTransparency = 0}):Play(),
	game:GetService("TweenService"):Create(script.Parent.Badges.TextLabel, TweenInfo.new(tweendur), {TextTransparency = 0, TextStrokeTransparency = 0}):Play(),
	game:GetService("TweenService"):Create(script.Parent.Options, TweenInfo.new(tweendur, Enum.EasingStyle.Quad), {Position = UDim2.new(0.119, 0, 0.814, 0)}):Play(),
	game:GetService("TweenService"):Create(script.Parent.Options, TweenInfo.new(tweendur), {ImageTransparency = 0}):Play(),
	game:GetService("TweenService"):Create(script.Parent.Options.TextLabel, TweenInfo.new(tweendur), {TextTransparency = 0, TextStrokeTransparency = 0}):Play(),
	game:GetService("TweenService"):Create(script.Parent.Shop, TweenInfo.new(tweendur, Enum.EasingStyle.Quad), {Position = UDim2.new(0.513, 0, 0.776, 0)}):Play(),
	game:GetService("TweenService"):Create(script.Parent.Shop, TweenInfo.new(tweendur), {ImageTransparency = 0}):Play(),
	game:GetService("TweenService"):Create(script.Parent.Shop.TextLabel, TweenInfo.new(tweendur), {TextTransparency = 0, TextStrokeTransparency = 0}):Play()
)
