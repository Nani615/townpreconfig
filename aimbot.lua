--[[

	AirHub by Exunys © CC0 1.0 Universal (2023)

	https://github.com/Exunys

]]

--// Cache

local loadstring, getgenv, setclipboard, tablefind, UserInputService = loadstring, getgenv, setclipboard, table.find, game:GetService("UserInputService")

--// Loaded check

if AirHub or AirHubV2Loaded then
    return
end

--// Environment

getgenv().AirHub = {}

--// Load Modules

loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/AirHub/main/Modules/Aimbot.lua"))()

--// Variables

local Library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)() -- Pepsi's UI Library
local Aimbot, WallHack = getgenv().AirHub.Aimbot, getgenv().AirHub.WallHack
local Parts, Fonts, TracersType = {"Head", "HumanoidRootPart", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm", "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg", "UpperTorso", "LeftUpperLeg", "RightFoot", "RightLowerLeg", "LowerTorso", "RightUpperLeg"}, {"UI", "System", "Plex", "Monospace"}, {"Bottom", "Center", "Mouse"}

--// Frame

Library.UnloadCallback = function()
	Aimbot.Functions:Exit()
	WallHack.Functions:Exit()
	getgenv().AirHub = nil
end

local MainFrame = Library:CreateWindow({
	Name = "AirHub",
	Themeable = {
		Image = "7059346386",
		Info = "Made by Exunys\nPowered by Pepsi's UI Library",
		Credit = false
	},
	Background = "",
	Theme = [[{"__Designer.Colors.topGradient":"3F0C64","__Designer.Colors.section":"C259FB","__Designer.Colors.hoveredOptionBottom":"4819B4","__Designer.Background.ImageAssetID":"rbxassetid://4427304036","__Designer.Colors.selectedOption":"4E149C","__Designer.Colors.unselectedOption":"482271","__Designer.Files.WorkspaceFile":"AirHub","__Designer.Colors.unhoveredOptionTop":"310269","__Designer.Colors.outerBorder":"391D57","__Designer.Background.ImageColor":"69009C","__Designer.Colors.tabText":"B9B9B9","__Designer.Colors.elementBorder":"160B24","__Designer.Background.ImageTransparency":100,"__Designer.Colors.background":"1E1237","__Designer.Colors.innerBorder":"531E79","__Designer.Colors.bottomGradient":"361A60","__Designer.Colors.sectionBackground":"21002C","__Designer.Colors.hoveredOptionTop":"6B10F9","__Designer.Colors.otherElementText":"7B44A8","__Designer.Colors.main":"AB26FF","__Designer.Colors.elementText":"9F7DB5","__Designer.Colors.unhoveredOptionBottom":"3E0088","__Designer.Background.UseBackgroundImage":false}]]
})

--// Tabs

local AimbotTab = MainFrame:CreateTab({
	Name = "Aimbot"
})


local CrosshairTab = MainFrame:CreateTab({
	Name = "Crosshair"
})

local FunctionsTab = MainFrame:CreateTab({
	Name = "Functions"
})

--// Aimbot Sections

local Values = AimbotTab:CreateSection({
	Name = "Values"
})

local Checks = AimbotTab:CreateSection({
	Name = "Checks"
})

local ThirdPerson = AimbotTab:CreateSection({
	Name = "Third Person"
})

local FOV_Values = AimbotTab:CreateSection({
	Name = "Field Of View",
	Side = "Right"
})

local FOV_Appearance = AimbotTab:CreateSection({
	Name = "FOV Circle Appearance",
	Side = "Right"
})

--// Crosshair Sections

local CrosshairSettings = CrosshairTab:CreateSection({
	Name = "Settings"
})

local CrosshairSettings_CenterDot = CrosshairTab:CreateSection({
	Name = "Center Dot Settings",
	Side = "Right"
})

--// Functions Sections

local FunctionsSection = FunctionsTab:CreateSection({
	Name = "Functions"
})

--// Aimbot Values

Values:AddToggle({
	Name = "Enabled",
	Value = Aimbot.Settings.Enabled,
	Callback = function(New, Old)
		Aimbot.Settings.Enabled = New
	end
}).Default = Aimbot.Settings.Enabled

Values:AddToggle({
	Name = "Toggle",
	Value = Aimbot.Settings.Toggle,
	Callback = function(New, Old)
		Aimbot.Settings.Toggle = New
	end
}).Default = Aimbot.Settings.Toggle

Aimbot.Settings.LockPart = Parts[1]; Values:AddDropdown({
	Name = "Lock Part",
	Value = Parts[1],
	Callback = function(New, Old)
		Aimbot.Settings.LockPart = New
	end,
	List = Parts,
	Nothing = "Head"
}).Default = Parts[1]

Values:AddTextbox({ -- Using a Textbox instead of a Keybind because the UI Library doesn't support Mouse inputs like Left Click / Right Click...
	Name = "Hotkey",
	Value = Aimbot.Settings.TriggerKey,
	Callback = function(New, Old)
		Aimbot.Settings.TriggerKey = New
	end
}).Default = Aimbot.Settings.TriggerKey

--[[
Values:AddKeybind({
	Name = "Hotkey",
	Value = Aimbot.Settings.TriggerKey,
	Callback = function(New, Old)
		Aimbot.Settings.TriggerKey = stringmatch(tostring(New), "Enum%.[UserInputType]*[KeyCode]*%.(.+)")
	end,
}).Default = Aimbot.Settings.TriggerKey
]]

Values:AddSlider({
	Name = "Sensitivity",
	Value = Aimbot.Settings.Sensitivity,
	Callback = function(New, Old)
		Aimbot.Settings.Sensitivity = New
	end,
	Min = 0,
	Max = 1,
	Decimals = 2
}).Default = Aimbot.Settings.Sensitivity

--// Aimbot Checks

Checks:AddToggle({
	Name = "Team Check",
	Value = Aimbot.Settings.TeamCheck,
	Callback = function(New, Old)
		Aimbot.Settings.TeamCheck = New
	end
}).Default = Aimbot.Settings.TeamCheck

Checks:AddToggle({
	Name = "Wall Check",
	Value = Aimbot.Settings.WallCheck,
	Callback = function(New, Old)
		Aimbot.Settings.WallCheck = New
	end
}).Default = Aimbot.Settings.WallCheck

Checks:AddToggle({
	Name = "Alive Check",
	Value = Aimbot.Settings.AliveCheck,
	Callback = function(New, Old)
		Aimbot.Settings.AliveCheck = New
	end
}).Default = Aimbot.Settings.AliveCheck

--// Aimbot ThirdPerson

ThirdPerson:AddToggle({
	Name = "Enable Third Person",
	Value = Aimbot.Settings.ThirdPerson,
	Callback = function(New, Old)
		Aimbot.Settings.ThirdPerson = New
	end
}).Default = Aimbot.Settings.ThirdPerson

ThirdPerson:AddSlider({
	Name = "Sensitivity",
	Value = Aimbot.Settings.ThirdPersonSensitivity,
	Callback = function(New, Old)
		Aimbot.Settings.ThirdPersonSensitivity = New
	end,
	Min = 0.1,
	Max = 5,
	Decimals = 1
}).Default = Aimbot.Settings.ThirdPersonSensitivity

--// FOV Settings Values

FOV_Values:AddToggle({
	Name = "Enabled",
	Value = Aimbot.FOVSettings.Enabled,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Enabled = New
	end
}).Default = Aimbot.FOVSettings.Enabled

FOV_Values:AddToggle({
	Name = "Visible",
	Value = Aimbot.FOVSettings.Visible,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Visible = New
	end
}).Default = Aimbot.FOVSettings.Visible

FOV_Values:AddSlider({
	Name = "Amount",
	Value = Aimbot.FOVSettings.Amount,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Amount = New
	end,
	Min = 10,
	Max = 300
}).Default = Aimbot.FOVSettings.Amount

--// FOV Settings Appearance

FOV_Appearance:AddToggle({
	Name = "Filled",
	Value = Aimbot.FOVSettings.Filled,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Filled = New
	end
}).Default = Aimbot.FOVSettings.Filled

FOV_Appearance:AddSlider({
	Name = "Transparency",
	Value = Aimbot.FOVSettings.Transparency,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Transparency = New
	end,
	Min = 0,
	Max = 1,
	Decimal = 1
}).Default = Aimbot.FOVSettings.Transparency

FOV_Appearance:AddSlider({
	Name = "Sides",
	Value = Aimbot.FOVSettings.Sides,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Sides = New
	end,
	Min = 3,
	Max = 60
}).Default = Aimbot.FOVSettings.Sides

FOV_Appearance:AddSlider({
	Name = "Thickness",
	Value = Aimbot.FOVSettings.Thickness,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Thickness = New
	end,
	Min = 1,
	Max = 50
}).Default = Aimbot.FOVSettings.Thickness

FOV_Appearance:AddColorpicker({
	Name = "Color",
	Value = Aimbot.FOVSettings.Color,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Color = New
	end
}).Default = Aimbot.FOVSettings.Color

FOV_Appearance:AddColorpicker({
	Name = "Locked Color",
	Value = Aimbot.FOVSettings.LockedColor,
	Callback = function(New, Old)
		Aimbot.FOVSettings.LockedColor = New
	end
}).Default = Aimbot.FOVSettings.LockedColor

--// Crosshair Settings

CrosshairSettings:AddToggle({
	Name = "Mouse Cursor",
	Value = UserInputService.MouseIconEnabled,
	Callback = function(New, Old)
		UserInputService.MouseIconEnabled = New
	end
}).Default = UserInputService.MouseIconEnabled

CrosshairSettings:AddToggle({
	Name = "Enabled",
	Value = WallHack.Crosshair.Settings.Enabled,
	Callback = function(New, Old)
		WallHack.Crosshair.Settings.Enabled = New
	end
}).Default = WallHack.Crosshair.Settings.Enabled

CrosshairSettings:AddColorpicker({
	Name = "Color",
	Value = WallHack.Crosshair.Settings.Color,
	Callback = function(New, Old)
		WallHack.Crosshair.Settings.Color = New
	end
}).Default = WallHack.Crosshair.Settings.Color

CrosshairSettings:AddSlider({
	Name = "Transparency",
	Value = WallHack.Crosshair.Settings.Transparency,
	Callback = function(New, Old)
		WallHack.Crosshair.Settings.Transparency = New
	end,
	Min = 0,
	Max = 1,
	Decimals = 2
}).Default = WallHack.Crosshair.Settings.Transparency

CrosshairSettings:AddSlider({
	Name = "Size",
	Value = WallHack.Crosshair.Settings.Size,
	Callback = function(New, Old)
		WallHack.Crosshair.Settings.Size = New
	end,
	Min = 8,
	Max = 24
}).Default = WallHack.Crosshair.Settings.Size

CrosshairSettings:AddSlider({
	Name = "Thickness",
	Value = WallHack.Crosshair.Settings.Thickness,
	Callback = function(New, Old)
		WallHack.Crosshair.Settings.Thickness = New
	end,
	Min = 1,
	Max = 5
}).Default = WallHack.Crosshair.Settings.Thickness

CrosshairSettings:AddSlider({
	Name = "Gap Size",
	Value = WallHack.Crosshair.Settings.GapSize,
	Callback = function(New, Old)
		WallHack.Crosshair.Settings.GapSize = New
	end,
	Min = 0,
	Max = 20
}).Default = WallHack.Crosshair.Settings.GapSize

CrosshairSettings:AddSlider({
	Name = "Rotation (Degrees)",
	Value = WallHack.Crosshair.Settings.Rotation,
	Callback = function(New, Old)
		WallHack.Crosshair.Settings.Rotation = New
	end,
	Min = -180,
	Max = 180
}).Default = WallHack.Crosshair.Settings.Rotation

CrosshairSettings:AddDropdown({
	Name = "Position",
	Value = WallHack.Crosshair.Settings.Type == 1 and "Mouse" or "Center",
	Callback = function(New, Old)
		WallHack.Crosshair.Settings.Type = New == "Mouse" and 1 or 2
	end,
	List = {"Mouse", "Center"},
	Nothing = "Mouse"
}).Default = WallHack.Crosshair.Settings.Type == 1 and "Mouse" or "Center"

CrosshairSettings_CenterDot:AddToggle({
	Name = "Center Dot",
	Value = WallHack.Crosshair.Settings.CenterDot,
	Callback = function(New, Old)
		WallHack.Crosshair.Settings.CenterDot = New
	end
}).Default = WallHack.Crosshair.Settings.CenterDot

CrosshairSettings_CenterDot:AddColorpicker({
	Name = "Center Dot Color",
	Value = WallHack.Crosshair.Settings.CenterDotColor,
	Callback = function(New, Old)
		WallHack.Crosshair.Settings.CenterDotColor = New
	end
}).Default = WallHack.Crosshair.Settings.CenterDotColor

CrosshairSettings_CenterDot:AddSlider({
	Name = "Center Dot Size",
	Value = WallHack.Crosshair.Settings.CenterDotSize,
	Callback = function(New, Old)
		WallHack.Crosshair.Settings.CenterDotSize = New
	end,
	Min = 1,
	Max = 6
}).Default = WallHack.Crosshair.Settings.CenterDotSize

CrosshairSettings_CenterDot:AddSlider({
	Name = "Center Dot Transparency",
	Value = WallHack.Crosshair.Settings.CenterDotTransparency,
	Callback = function(New, Old)
		WallHack.Crosshair.Settings.CenterDotTransparency = New
	end,
	Min = 0,
	Max = 1,/
	Decimals = 2
}).Default = WallHack.Crosshair.Settings.CenterDotTransparency

CrosshairSettings_CenterDot:AddToggle({
	Name = "Center Dot Filled",
	Value = WallHack.Crosshair.Settings.CenterDotFilled,
	Callback = function(New, Old)
		WallHack.Crosshair.Settings.CenterDotFilled = New
	end
}).Default = WallHack.Crosshair.Settings.CenterDotFilled

--// Functions / Functions

FunctionsSection:AddButton({
	Name = "Reset Settings",
	Callback = function()
		Aimbot.Functions:ResetSettings()
		WallHack.Functions:ResetSettings()
		Library.ResetAll()
	end
})

FunctionsSection:AddButton({
	Name = "Restart",
	Callback = function()
		Aimbot.Functions:Restart()
		WallHack.Functions:Restart()
	end
})

FunctionsSection:AddButton({
	Name = "Exit",
	Callback = Library.Unload,
})

FunctionsSection:AddButton({
	Name = "Copy Script Page",
	Callback = function()
		setclipboard("https://github.com/Exunys/AirHub")
	end
})

--// AirHub V2 Prompt

do
	local Aux = Instance.new("BindableFunction")
    
	Aux.OnInvoke = function(Answer)
		if Answer == "No" then
			return
		end

		Library.Unload()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/AirHub-V2/main/src/Main.lua"))()
	end

	game.StarterGui:SetCore("SendNotification", {
		Title = "🎆  NIGGAHUB V2  🎆",
		Text = "Would you like to use the new AirHub V2 script?",
		Button1 = "NIGGA",
		Button2 = "No",
		Duration = 1 / 0,
		Icon = "rbxassetid://6238537240",
		Callback = Aux
	})
end
