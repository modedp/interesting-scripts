local L = game:GetService("Workspace").Games["Whac-A-Noob Deluxe"]["2"].Noobs
local TIME = 5
local YKIndex = {}
local FUNCS = {}
local Started = false
function Timer()
	spawn(function()
		print("HOW")
		while true do
			TIME = TIME - 0.5
			task.wait(0.5)
			if TIME < 1 then
				I = 4
				for c,x in ipairs(FUNCS) do
					x:Disconnect()
					table.remove(FUNCS,c)
				end
				repeat 
					I = I-1
					Started = false
					task.wait(0.3)
				until I>0
				TIME = 30
				break
			end
		end
	end)
end
function Active(CI,Y,Color,Clicker)
	YKIndex[CI] = tonumber(Y)
	if tonumber(Y)>36.2 then
		if Started ~= true then
			Timer()
			Started = true
		end
		if Color~="Bright Red" then
			spawn(function() 
				while YKIndex[CI] > 36.2 and Started == false do
					fireclickdetector(Clicker)
					task.wait(0.33)
				end
			end)
		end
	end
end
print("WHAT NOW")
for _,x in ipairs(L:GetChildren()) do
	local H = x.Head
	local F;F=H:GetPropertyChangedSignal("Position"):Connect(function() 
		local ye,stuff= pcall(Active,x.Name,H.Position.Y,H.BrickColor.Name,H.ClickDetector) 
		print(ye,stuff) 
	end)
	table.insert(FUNCS,F)
	print("bro")
end
