local Ws = game:GetService("Workspace") --[[Create a folder called Built to place all the parts inside.]]
local Xblock = Ws:FindFirstChild("BlockSizeExpected")
local Xsize = Xblock and Xblock.Size or Vector3.new(0.2,0.2,0.2)
local Sizes = (((Xsize.X > Xsize.Y) and (Xsize.X > Xsize.Z) and Xsize.X) or ((Xsize.Y > Xsize.X) and (Xsize.Y > Xsize.Z) and Xsize.Y) or ((Xsize.Z > Xsize.Y) and (Xsize.Z > Xsize.X) and  Xsize.Z)) or Xsize.Y
local Xpos = (Xblock and Xblock.Position or Vector3.new(50,100,50)) + Vector3.new(0,1 * Sizes,0)
local Material = "SmoothPlastic"
local SBit = {
	[1] = Color3.fromRGB(200,76,12),
	[2] = Color3.fromRGB(0,0,0),
	[3] = Color3.fromRGB(252,152,62),
	[4] = Color3.fromRGB(200,76,12),
	[5] = Color3.fromRGB(252,188,176),
}
local BrickBlockDat = {
	[1] = 	{1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,2},
	[2] = 	{1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,2},
	[3] = 	{1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,2},
	[4] = 	{2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2},
	[5] = 	{1,1,1,2,1,1,1,1,1,1,1,2,1,1,1,1},
	[6] = 	{1,1,1,2,1,1,1,1,1,1,1,2,1,1,1,1},
	[7] = 	{1,1,1,2,1,1,1,1,1,1,1,2,1,1,1,1},
	[8] = 	{2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2},
	[9] = 	{1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,2},
	[10] = 	{1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,2},
	[11] = 	{1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,2},
	[12] = 	{2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2},
	[13] = 	{1,1,1,2,1,1,1,1,1,1,1,2,1,1,1,1},
	[14] = 	{1,1,1,2,1,1,1,1,1,1,1,2,1,1,1,1},
	[15] = 	{1,1,1,2,1,1,1,1,1,1,1,2,1,1,1,1},
	[16] = 	{2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2},
}
local QuestionBlockDat = {
	[1] = 	{0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0},
	[2] = 	{1,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2},
	[3] = 	{1,3,2,3,3,3,3,3,3,3,3,3,3,2,3,2},
	[4] = 	{1,3,3,3,3,1,1,1,1,1,3,3,3,3,3,2},
	[5] = 	{1,3,3,3,1,1,2,2,2,1,1,3,3,3,3,2},
	[6] = 	{1,3,3,3,1,1,2,3,3,1,1,2,3,3,3,2},
	[7] = 	{1,3,3,3,1,1,2,3,3,1,1,2,3,3,3,2},
	[8] = 	{1,3,3,3,3,2,2,3,1,1,1,2,3,3,3,2},
	[9] = 	{1,3,3,3,3,3,3,1,1,2,2,2,3,3,3,2},
	[10] = 	{1,3,3,3,3,3,3,1,1,2,3,3,3,3,3,2},
	[11] = 	{1,3,3,3,3,3,3,3,2,2,3,3,3,3,3,2},
	[12] = 	{1,3,3,3,3,3,3,1,1,3,3,3,3,3,3,2},
	[13] = 	{1,3,3,3,3,3,3,1,1,2,3,3,3,3,3,2},
	[14] = 	{1,3,2,3,3,3,3,3,2,2,3,3,3,2,3,2},
	[15] = 	{1,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2},
	[16] = 	{2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2},
}

local RockBlockDat = {
	[1] = 	{1,5,5,5,5,5,5,5,5,5,5,5,5,5,5,2},
	[2] = 	{5,1,5,5,5,5,5,5,5,5,5,5,5,5,2,2},
	[3] = 	{5,5,1,5,5,5,5,5,5,5,5,5,5,2,2,2},
	[4] = 	{5,5,5,1,5,5,5,5,5,5,5,5,2,2,2,2},
	[5] = 	{5,5,5,5,1,1,1,1,1,1,1,1,2,2,2,2},
	[6] = 	{5,5,5,5,1,1,1,1,1,1,1,1,2,2,2,2},
	[7] = 	{5,5,5,5,1,1,1,1,1,1,1,1,2,2,2,2},
	[8] = 	{5,5,5,5,1,1,1,1,1,1,1,1,2,2,2,2},
	[9] = 	{5,5,5,5,1,1,1,1,1,1,1,1,2,2,2,2},
	[10] = 	{5,5,5,5,1,1,1,1,1,1,1,1,2,2,2,2},
	[11] = 	{5,5,5,5,1,1,1,1,1,1,1,1,2,2,2,2},
	[12] = 	{5,5,5,5,1,1,1,1,1,1,1,1,2,2,2,2},
	[13] = 	{5,5,5,2,2,2,2,2,2,2,2,2,1,2,2,2},
	[14] = 	{5,5,2,2,2,2,2,2,2,2,2,2,2,1,2,2},
	[15] = 	{5,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2},
	[16] = 	{2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1},
}

local GroundBlockDat = {
	[1] = 	{4,5,5,5,5,5,5,5,5,2,4,5,5,5,5,4},
	[2] = 	{5,4,4,4,4,4,4,4,4,2,5,4,4,4,4,2},
	[3] = 	{5,4,4,4,4,4,4,4,4,2,5,4,4,4,4,2},
	[4] = 	{5,4,4,4,4,4,4,4,4,2,5,4,4,4,4,2},
	[5] = 	{5,4,4,4,4,4,4,4,4,2,5,2,4,4,4,2},
	[6] = 	{5,4,4,4,4,4,4,4,4,2,4,2,2,2,2,4},
	[7] = 	{5,4,4,4,4,4,4,4,4,2,5,5,5,5,5,2},
	[8] = 	{5,4,4,4,4,4,4,4,4,2,5,4,4,4,4,2},
	[9] = 	{5,4,4,4,4,4,4,4,4,2,5,4,4,4,4,2},
	[10] = 	{5,4,4,4,4,4,4,4,4,2,5,4,4,4,4,2},
	[11] = 	{2,2,4,4,4,4,4,4,2,5,4,4,4,4,4,2},
	[12] = 	{5,5,2,2,4,4,4,4,2,5,4,4,4,4,4,2},
	[13] = 	{5,4,5,5,2,2,2,2,5,4,4,4,4,4,4,2},
	[14] = 	{5,4,4,4,5,5,5,2,5,4,4,4,4,4,4,2},
	[15] = 	{5,4,4,4,4,4,4,2,5,4,4,4,4,4,2,2},
	[16] = 	{4,2,2,2,2,2,2,4,5,2,2,2,2,2,2,4},
}

function GetBlock(BitCode)
	if BitCode == 0 then
		return nil
	end
	return SBit[BitCode]
end

function GetInverse(X,Y)
	return Xpos + Vector3.new((16*Sizes)-(X*Sizes),(16*Sizes)-(Y*Sizes),0)	
end

function BuildBlock(X,Y,C,D)
	local BB = GetBlock(C)
	if BB then 
		local BBS = BB
		BB = Instance.new("Part")
		BB.Color = BBS
	else
		return
	end
	local BlockPos = GetInverse(X,Y)
	BB.Material = Material
	BB.Parent = Ws:FindFirstChild("Built") or Ws
	BB.Position = BlockPos
	BB.Size = Vector3.new(Sizes,Sizes,Sizes)
	BB.Name = X .. Y
end

function BuildForLine(L,N)
	for u1,u2 in pairs(L) do
		BuildBlock(u1,N,u2)
	end
end

local ToBuild = BrickBlockDat --[[Change To Desired Block]]

for p1 = 1, #ToBuild do
	BuildForLine(ToBuild[p1],p1)
end
