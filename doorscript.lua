local door = script.Parent
local replicatedStorage = game:GetService("ReplicatedStorage")
local promptAttachment = Instance.new("Attachment")
promptAttachment.Name = "PromptAttachment"
promptAttachment.Parent = door
promptAttachment.Position = Vector3.new(0, -door.Size.Y / 2, 0)

-- Setup ProximityPrompt
local prompt1 = Instance.new("ProximityPrompt")
prompt1.Parent = promptAttachment
prompt1.ActionText = "Open"
prompt1.HoldDuration = 0.5
prompt1.MaxActivationDistance = 40
prompt1.KeyboardKeyCode = Enum.KeyCode.F
prompt1.RequiresLineOfSight = false

-- Where to move the door (example: up by 100 studs)
local endPos = door.CFrame * CFrame.new(0, 100, 0)

local function openDoor()
	for i = 1, 4 do
		door.CFrame = door.CFrame:Lerp(endPos, 0.5)
		task.wait(0.25)
	end
end

prompt1.Triggered:Connect(function(player)
	prompt1.Enabled = false
	local teachingGui = replicatedStorage:FindFirstChild("TeachingGui2")
	if teachingGui then
		local clonedGui = teachingGui:Clone()
		clonedGui.Parent = player:WaitForChild("PlayerGui")
	end
	task.wait(5)  
	openDoor()
end)