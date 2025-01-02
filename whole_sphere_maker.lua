local Size = 8
local Place = workspace:FindFirstChild("Sphere") or workspace
local Location = Vector3.new(20, 11, 4)
local EndVert = 180
local Increments = 6
local OSizes = 0.5
local M = "SmoothPlastic"

function Create(p1)
	local u1 = Instance.new("Part",Place) 
	u1.Size = Vector3.new(Size,OSizes,OSizes)
	u1.Position = Location
	u1.Orientation = p1
	local u2 = Instance.new("Attachment",u1)
	u2.Position = Vector3.new(Size/2,0,0)
	local u3 = Instance.new("Attachment",u1)
	u3.Position = Vector3.new((Size/2)/-1,0,0)
	wait()
	local u4 = Instance.new("Part",Place)
	u4.Size = Vector3.new(OSizes,OSizes,OSizes)
	u4.Position = u2.WorldPosition
	u4.Orientation = u1.Orientation
	local u5 = Instance.new("Part",Place)
	u5.Size = Vector3.new(OSizes,OSizes,OSizes)
	u5.Position = u3.WorldPosition
	u5.Orientation = u1.Orientation
	wait(0)
	u4.BottomSurface = "Smooth"
	u4.TopSurface = "Smooth"
	u5.BottomSurface = "Smooth"
	u5.TopSurface = "Smooth"
	u1:Destroy()
end

for Z = 0,EndVert,Increments do
	for Y = 0,EndVert,Increments do
		Create(Vector3.new(0,Y,Z))
	end
end
