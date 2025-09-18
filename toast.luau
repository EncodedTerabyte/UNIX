local module = {}

function GenerateToastInstance() 
	local Toast = Instance.new('ImageLabel')
	local IconBuffer = Instance.new('Frame')
	local DEBUG = Instance.new('TextLabel')
	local Icon = Instance.new('ImageLabel')
	local TextBuffer = Instance.new('Frame')
	local Upper = Instance.new('TextLabel')
	local Lower = Instance.new('TextLabel')
	local UICorner = Instance.new('UICorner')
	Toast.AnchorPoint = Vector2.new(0.5, 0)
	Toast.BackgroundColor3 = Color3.new(0.125490, 0.125490, 0.125490)
	Toast.BackgroundTransparency = 0.100000
	Toast.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
	Toast.BorderSizePixel = 0.000000
	Toast.Name = "Toast"
	Toast.Position = UDim2.new(0.500000, 0, 0.000000, 8)
	Toast.Size = UDim2.new(0.000000, 80, 0.000000, 58)
	Toast.ZIndex = 2.000000
	Toast.ClipsDescendants = true
	Toast.ImageColor3 = Color3.new(0.125490, 0.125490, 0.125490)
	Toast.ImageTransparency = 1.000000
	Toast.ScaleType = Enum.ScaleType.Slice
	Toast.SliceCenter = Rect.new(3, 3, 3, 3)
	Toast.ImageRectSize = Vector2.new(6, 6)
	IconBuffer.BackgroundTransparency = 1.000000
	IconBuffer.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
	IconBuffer.BorderSizePixel = 0.000000
	IconBuffer.Name = "IconBuffer"
	IconBuffer.Size = UDim2.new(0.000000, 80, 1.000000, 0)
	IconBuffer.ZIndex = 2.000000
	IconBuffer.Parent = Toast
	DEBUG.AnchorPoint = Vector2.new(0.5, 0.5)
	DEBUG.BackgroundColor3 = Color3.new(1.000000, 1.000000, 1.000000)
	DEBUG.BackgroundTransparency = 1.000000
	DEBUG.BorderColor3 = Color3.new(0.000000, 0.000000, 0.000000)
	DEBUG.BorderSizePixel = 0.000000
	DEBUG.Name = "DEBUG"
	DEBUG.Position = UDim2.new(0.500000, 0, 0.500000, 0)
	DEBUG.Size = UDim2.new(0.000000, 48, 0.000000, 48)
	DEBUG.Visible = true
	DEBUG.Font = Enum.Font.SourceSans
	DEBUG.Text = "🛠️"
	DEBUG.TextColor3 = Color3.new(1.000000, 1.000000, 1.000000)
	DEBUG.TextSize = 35.000000
	DEBUG.TextWrapped = true
	DEBUG.Parent = IconBuffer
	DEBUG.TextTransparency = 1
	Icon.AnchorPoint = Vector2.new(0.5, 0.5)
	Icon.BackgroundTransparency = 1.000000
	Icon.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
	Icon.Name = "Icon"
	Icon.Position = UDim2.new(0.500000, 0, 0.500000, 0)
	Icon.Size = UDim2.new(0.000000, 48, 0.000000, 48)
	Icon.ZIndex = 3.000000
	Icon.Image = "rbxasset://textures/ui/Camera/CameraToastIcon.png"
	Icon.ImageColor3 = Color3.new(0.784314, 0.784314, 0.784314)
	Icon.ImageTransparency = 1.000000
	Icon.Parent = IconBuffer
	TextBuffer.BackgroundTransparency = 1.000000
	TextBuffer.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
	TextBuffer.BorderSizePixel = 0.000000
	TextBuffer.Name = "TextBuffer"
	TextBuffer.Position = UDim2.new(0.000000, 80, 0.000000, 0)
	TextBuffer.Size = UDim2.new(1.000000, -80, 1.000000, 0)
	TextBuffer.ZIndex = 2.000000
	TextBuffer.ClipsDescendants = true
	TextBuffer.Parent = Toast
	Upper.AnchorPoint = Vector2.new(0, 1)
	Upper.BackgroundTransparency = 1.000000
	Upper.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
	Upper.Name = "Upper"
	Upper.Position = UDim2.new(0.000000, 0, 0.500000, 0)
	Upper.Size = UDim2.new(1.000000, 0, 0.000000, 19)
	Upper.ZIndex = 3.000000
	Upper.Font = Enum.Font.GothamMedium
	Upper.Text = "Upper text"
	Upper.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
	Upper.TextSize = 19.000000
	Upper.TextTransparency = 1.000000
	Upper.TextXAlignment = Enum.TextXAlignment.Left
	Upper.Parent = TextBuffer
	Lower.BackgroundTransparency = 1.000000
	Lower.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
	Lower.Name = "Lower"
	Lower.Position = UDim2.new(0.000000, 0, 0.500000, 3)
	Lower.Size = UDim2.new(1.000000, 0, 0.000000, 15)
	Lower.ZIndex = 3.000000
	Lower.Font = Enum.Font.Gotham
	Lower.Text = "Lower text"
	Lower.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
	Lower.TextSize = 15.000000
	Lower.TextTransparency = 1.000000
	Lower.TextXAlignment = Enum.TextXAlignment.Left
	Lower.Parent = TextBuffer
	UICorner.CornerRadius = UDim.new(0.250000, 0)
	UICorner.Parent = Toast
	
	return Toast
end

function AnimateToast(toast,anim)
	local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local open = anim == "open"

	local imgParams = {ImageTransparency = open and 0 or 1}
	local txtParams = {TextTransparency = open and 0 or 1}

	game.TweenService:Create(toast, tweenInfo, {
		Size = open and UDim2.new(0, 326, 0, 58) or UDim2.new(0, 80, 0, 58), BackgroundTransparency = open and 0.1 or 1
	}):Play()

	game.TweenService:Create(toast.IconBuffer.Icon, tweenInfo, imgParams):Play()
	game.TweenService:Create(toast.IconBuffer.DEBUG, tweenInfo, txtParams):Play()
	game.TweenService:Create(toast.TextBuffer.Upper, tweenInfo, txtParams):Play()
	game.TweenService:Create(toast.TextBuffer.Lower, tweenInfo, txtParams):Play()

	toast = not open and game.Debris:AddItem(toast,0.25)
end

local function ToastHandle(toast)
	return {
		CancelToast = function()
			AnimateToast(toast,"cancel")
		end;
		DestroyToast = function(delaytime : 'optional')
			game.Debris:AddItem(toast,delaytime or 0)
		end;
		HideToast = function()
			toast.Visible = false
		end;
		ShowToast = function()
			toast.Visible = true
		end;
	}
end

function GetGui()
	local Player = game.Players.LocalPlayer
	local gui = Player.PlayerGui:FindFirstChild("Toasts") or Instance.new("ScreenGui",Player.PlayerGui)
	gui.DisplayOrder = Player.UserId
	gui.Name = "Toasts"
	
	return gui
end

module.CreateToast = function(ToastId,TopText,BottomText,IconId,DisplayTime,ISDEBUG)	
	local newToast = GenerateToastInstance()
	newToast.TextBuffer.Upper.Text = TopText
	newToast.TextBuffer.Lower.Text = BottomText
	newToast.IconBuffer.Icon.Image = IconId
	newToast.Name = ToastId
	
	local oldToast = GetGui():FindFirstChild(ToastId)
	local run = false 
	
	if oldToast then
		run = oldToast.BackgroundTransparency < 0.1
	end
	
	if ISDEBUG then
		newToast.IconBuffer.DEBUG.TextTransparency = 0
	end
	
	if not run then
		game.Debris:AddItem(newToast,DisplayTime or math.huge)
		AnimateToast(newToast,"open")
		newToast.Parent = GetGui()
		
		return ToastHandle(newToast)
	else
		return {CancelToast = empty(),DestroyToast = empty(),HideToast = empty(),ShowToast = empty()}
	end
end

function empty()
	return function() end
end

module.GetToast = function(id)
	local gui = GetGui()
	local toast = gui:FindFirstChild(id)
	
	if toast then
		return ToastHandle(toast)
	else
		return {CancelToast = empty(),DestroyToast = empty(),HideToast = empty(),ShowToast = empty()}
	end
end

module.CancelAllToasts = function()
	for i,toast in pairs(GetGui():GetChildren()) do
		AnimateToast(toast,"cancel")
	end
end

return module
