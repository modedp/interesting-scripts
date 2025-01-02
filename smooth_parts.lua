local v = {} 
local v1 = game.Workspace
for _,u1 in pairs(v1:GetDescendants()) do 
	if u1:IsA("Part") then
		u1.BottomSurface = "Smooth"
		u1.TopSurface = "Smooth"
		u1.BackSurface = "Smooth"
		u1.RightSurface = "Smooth"
		u1.FrontSurface = "Smooth"
		u1.LeftSurface = "Smooth"
	end
end
