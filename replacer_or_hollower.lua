local partlist = {}
local big = 0
local fatman
function HollowItOut(part)
	partlist[#partlist +1] = part
	local u5 = {part.Size.X,part.Size.Y,part.Size.Z}
	local u6 = (u5[1]*u5[3]*u5[2])
	if part.CanCollide == false then
		part.CanCollide = true
	end
	if u6 > big then
		big = u6
		fatman = part
	end
end

for _, u1 in pairs(game.Workspace:FindFirstChild("Object"):GetDescendants()) do 
	if u1:IsA("Part") then 
		if u1.Material == Enum.Material.Concrete or u1.Material == Enum.Material.Brick then 
			HollowItOut(u1)
		end 
	end 
end

print(partlist,fatman)
