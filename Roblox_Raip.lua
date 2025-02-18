local Info = [[This ROBLOX Script Is Made By The Respected Owners. R6 FOR BOTH CHARACTERS ONLY.
--Script Hidden For Privacy Of The Users. Script Hidden For Privacy Of The Users.
--Username Input Is Required At The Bottom.

--Instructions Copy and paste into script builder,
--Put two names into "YOURNAME", and "THE VICTIM" (One of them doesn't have to be you)

--This Script Makes two players in your game.. Well.. I think its in the title ;D

----------------------------------------------------------------------------------------]]
local inheritBodyColor = false
local bodyColorDefault = BrickColor.new("Pastel brown")
local nippelColor = BrickColor.new("Light pink")
local mainBodyColorCatcher = "Head"
function fWeld(zName, zParent, zPart0, zPart1, zCoco, a, b, c, d, e, f)
	local funcw = Instance.new("Weld")
	funcw.Name = zName
	funcw.Parent = zParent
	funcw.Part0 = zPart0
	funcw.Part1 = zPart1
	if (zCoco == true) then
		funcw.C0 = CFrame.new(a, b, c) * CFrame.fromEulerAnglesXYZ(d, e, f)
	else
		funcw.C1 = CFrame.new(a, b, c) * CFrame.fromEulerAnglesXYZ(d, e, f)
	end
	return funcw
end
function fun(n1, n2)
	local we
	pcall(function()
		local mainguy = game.Players[n1].Character.Torso
		local victim = game.Players[n2].Character.Torso
		local victimHColor = victim and victim.Parent[mainBodyColorCatcher].BrickColor
		local mainHColor = mainguy and mainguy.Parent[mainBodyColorCatcher].BrickColor
		victim.Parent.Humanoid.PlatformStand = true
		mainguy["Left Shoulder"]:Remove()
		local ls1 = Instance.new("Weld")
		ls1.Parent = mainguy
		ls1.Part0 = mainguy
		ls1.Part1 = mainguy.Parent["Left Arm"]
		ls1.C0 = CFrame.new(-1.5,0,0)
		ls1.Name = "Left Shoulder"
		mainguy["Right Shoulder"]:Remove()
		local rs1 = Instance.new("Weld")
		rs1.Parent = mainguy
		rs1.Part0 = mainguy
		rs1.Part1 = mainguy.Parent["Right Arm"]
		rs1.C0 = CFrame.new(1.5,0,0)
		rs1.Name = "Right Shoulder"
		victim["Left Shoulder"]:Remove()
		local ls2 = Instance.new("Weld")
		ls2.Parent = victim
		ls2.Part0 = victim
		ls2.Part1 = victim.Parent["Left Arm"]
		ls2.C0 = CFrame.new(-1.5,0,0)
		ls2.Name = "Left Shoulder"
		victim["Right Shoulder"]:Remove()
		local rs2 = Instance.new("Weld")
		rs2.Parent = victim
		rs2.Part0 = victim
		rs2.Part1 = victim.Parent["Right Arm"]
		rs2.C0 = CFrame.new(1.5,0,0)
		rs2.Name = "Right Shoulder"
		victim["Left Hip"]:Remove()
		local lh2 = Instance.new("Weld")
		lh2.Parent = victim
		lh2.Part0 = victim
		lh2.Part1 = victim.Parent["Left Leg"]
		lh2.C0 = CFrame.new(-0.5,-2,0)
		lh2.Name = "Left Hip"
		victim["Right Hip"]:Remove()
		local rh2 = Instance.new("Weld")
		rh2.Parent = victim
		rh2.Part0 = victim
		rh2.Part1 = victim.Parent["Right Leg"]
		rh2.C0 = CFrame.new(0.5,-2,0)
		rh2.Name = "Right Hip"
		local d = Instance.new("Part")--[[ballleft]]
		d.TopSurface = 0
		d.BottomSurface = 0
		d.BrickColor = inheritBodyColor and mainHColor or bodyColorDefault
		d.Shape = "Ball"
		d.Parent = mainguy
		d.Size = Vector3.new(1,1,1)
		d.Name = "PART1"
		local dm = Instance.new("SpecialMesh")
		dm.MeshType = "Sphere"
		dm.Parent = d
		dm.Scale = Vector3.new(0.4,0.4,0.4)
		fWeld("weld",mainguy,mainguy,d,true,-0.2,-1.3,-0.6,0,0,0)
		local d2 = d:Clone()--[[ballright]]
		d2.Parent = mainguy
		d2.BrickColor = inheritBodyColor and mainHColor or bodyColorDefault
		d2.Name = "PART2"
		fWeld("weld",mainguy,mainguy,d2,true,0.2,-1.3,-0.6,0,0,0)
		local c = Instance.new("Part")--[[shaft]]
		c.TopSurface = 0
		c.BottomSurface = 0
		c.CanCollide = false
		c.BrickColor = inheritBodyColor and mainHColor or bodyColorDefault
		c.Parent = mainguy
		c.formFactor = "Custom"
		c.Size = Vector3.new(0.4,1.3,0.4)
		c.Name = "PART3"
		local cm = Instance.new("CylinderMesh")
		cm.Parent = c
		local a = fWeld("weld",mainguy,mainguy,c,true,0,-1,-0.52+(-c.Size.y/2),math.rad(-80),0,0)
		local c2 = d:Clone() --[[tippart]]
		c2.BrickColor = BrickColor.new("Light pink")
		c2.Name = "PART4"
		c2.Mesh.Scale = Vector3.new(0.4,0.62,0.4)
		c2.Parent = mainguy
		fWeld("weld",c,c,c2,true,0,0+(c.Size.y/2),0,math.rad(-10),0,0)
		local bl = Instance.new("Part")--[[leftoboba]]
		bl.TopSurface = 0
		bl.BottomSurface = 0
		bl.CanCollide = false
		bl.BrickColor = inheritBodyColor and victimHColor or bodyColorDefault
		bl.Shape = "Ball"
		bl.Parent = victim
		bl.Size = Vector3.new(1,1,1)
		bl.Name = "PART5"
		local dm = Instance.new("SpecialMesh")
		dm.MeshType = "Sphere"
		dm.Parent = bl
		dm.Scale = Vector3.new(1.2,1.2,1.2)
		fWeld("weld",victim,victim,bl,true,-0.5,0.5,-0.6,0,0,0)
		local br = Instance.new("Part") --[[leftoboba]]
		br.TopSurface = 0
		br.BottomSurface = 0
		br.CanCollide = false
		br.BrickColor = inheritBodyColor and victimHColor or bodyColorDefault
		br.Shape = "Ball"
		br.Parent = victim
		br.Size = Vector3.new(1,1,1)
		br.Name = "PART6"
		local dm = Instance.new("SpecialMesh")
		dm.MeshType = "Sphere"
		dm.Parent = br
		dm.Scale = Vector3.new(1.2,1.2,1.2)
		fWeld("weld",victim,victim,br,true,0.5,0.5,-0.6,0,0,0)
		local bln = Instance.new("Part") --[[rightnipal]]
		bln.TopSurface = 0
		bln.BottomSurface = 0
		bln.CanCollide = false
		bln.Shape = "Ball"
		bln.Parent = victim
		bln.Size = Vector3.new(1,1,1)
		bln.Name = "PART7"
		bln.BrickColor = nippelColor
		local dm = Instance.new("SpecialMesh")
		dm.MeshType = "Sphere"
		dm.Parent = bln
		dm.Scale = Vector3.new(0.2,0.2,0.2)
		fWeld("weld",victim,victim,bln,true,-0.5,0.5,-1.2,0,0,0)
		local brn = Instance.new("Part") --[[leftnipal]]
		brn.TopSurface = 0
		brn.BottomSurface = 0
		brn.CanCollide = false
		brn.Shape = "Ball"
		brn.Parent = victim
		brn.Size = Vector3.new(1,1,1)
		brn.Name = "PART8"
		brn.BrickColor = nippelColor
		local dm = Instance.new("SpecialMesh")
		dm.MeshType = "Sphere"
		dm.Parent = brn
		dm.Scale = Vector3.new(0.2,0.2,0.2)
		fWeld("weld",victim,victim,brn,true,0.5,0.5,-1.2,0,0,0)
		lh2.C1 = CFrame.new(0,-1.5,-0.5) * CFrame.Angles(0.9,-0.4,0)
		rh2.C1 = CFrame.new(0,-1.5,-0.5) * CFrame.Angles(0.9,0.4,0)
		ls2.C1 = CFrame.new(-0.5,-1.3,-0.5) * CFrame.Angles(0.9,-0.4,0)
		rs2.C1 = CFrame.new(0.5,-1.3,-0.5) * CFrame.Angles(0.9,0.4,0)
		ls1.C1 = CFrame.new(-0.5,0.7,0) * CFrame.Angles(-0.9,-0.4,0)
		rs1.C1 = CFrame.new(0.5,0.7,0) * CFrame.Angles(-0.9,0.4,0)
		if mainguy:findFirstChild("weldx") ~= nil then
			mainguy.weldx:Remove()
		end
		we = fWeld("weldx", mainguy, mainguy, victim, true, 0, -0.9, -1.3, math.rad(-90), 0, 0)
		local n = victim.Neck
		n.C0 = CFrame.new(0, 1.5, 0) * CFrame.Angles(math.rad(-210), math.rad(180), 0)
	end)
	coroutine.resume(coroutine.create(function()
		while wait() do
			for i = 1,6 do
				we.C1 = we.C1 * CFrame.new(0,-0.3,0)
				wait()
			end

			for i = 1,6 do
				we.C1 = we.C1 * CFrame.new(0,0.3,0)
				wait()
			end
		end
	end))
end
--[[MAIN, VICTIM]]
fun("Player1", "Player2")
