local World = setmetatable({},{__index=function(self,name) 
	name = L.s.up(L.s.su(name,1,1)) .. L.s.su(name,2)
	local pass,service = pcall(game.GetService,game,name)
	if pass then
		self[name] = service
		return service
	end
end})
local GameSources = {
	WhackANoob = {
		src={World.workspace.Games["Whac A Noob"]["WhacANoob 1"],
			World.workspace.Games["Whac A Noob"]["WhacANoob 2"],
			World.workspace.Games["Whac A Noob"]["WhacANoob 3"],},
		settings={t=30},
	},
	WhackANoobDeluxe = {
		src={World.workspace.Games["Whac-A-Noob Deluxe"]["1"],
			World.workspace.Games["Whac-A-Noob Deluxe"]["2"],},
		settings={t=30},
	}
}
local L = {
	s={su=string.sub,gs=string.gsub,sp=string.split,lo=string.lower,up=string.upper},
	m={ml=math.floor,mc=math.ceil,r=math.random,},
	t={ts=table.insert},
	g=function(p)
		World.debris:AddItem(p,0)
	end,
	c=function(inp) 
		local HTTP = World.httpService
		return (type(inp) == "table" and HTTP:JSONEncode(inp)) or 
			(type(inp) == "string" and HTTP:JSONDecode(inp)) or inp
	end,
	i=function(I)
		local x,v =pcall(Instance.new,I)
		if x then
			return (function(i2)
				for x1,x2 in pairs(i2) do
					if v[x1] then
						v[x1] = x2
					end
				end
				return v
			end)
		end
	end,
}
local GameWorker = {
	WhackANoobDeluxe = function(ACTParent,ACTFace) 
		local CPart = ACTParent["Noobs"][ACTFace]["Head"]
		local CPartC = CPart.BrickColor.Name
		local ColorActive = CPartC~="Bright Red"
		if ColorActive then
			local Clicker = CPart:WaitForChild("ClickDetector")
			local ClickedScore = {["New Yeller"]=10,["Camo"]=20,["Cyan"]=30,["Alder"]=40,["Institutional White"]=50,}
			fireclickdetector(Clicker) --[[Cheat Code]]
			GameActivation.UpdateStats("Score",ClickedScore[CPartC])
		end
	end,
	WhackANoob = function(ACTParent,ACTFace) 
		local CPart = ACTParent["NoobFaces"][ACTFace]
		local ColorActive = CPart.BrickColor.Name~="Bright Red"
		if ColorActive then
			local Clicker = CPart:WaitForChild("ClickDetector")
			fireclickdetector(Clicker)
			GameActivation.UpdateStats("Score",1000)
		end
	end,
}
local MainWorker = setmetatable({},{__index=function(self,Key) 
	local function WorkStation(WK2)
		self[WK2]=self[WK2] or {}; 
		return self[WK2];
	end
	local WorkKey = L.s.sp(Key,"|");Key=WorkKey[1]
	local WorkS = WorkStation(WorkKey[2])
	if WorkKey == "I" then
		local NewBE = L.i("BindableEvent")(WorkKey[3])
		local NewWE = {
			NewBE.Event:Connect(GameWorker[WorkKey[2]]),
			NewBE,
		}
		L.t.s(WorkS,NewWE)
		return NewWE
	elseif WorkKey == "A" then
		for _,ind in ipairs(WorkS) do
			ind[2]:Fire(unpack(L.c(WorkKey[3])))
		end
	elseif WorkKey == "CA" then
		for idi,ind in ipairs(WorkS) do
			ind[1]:Disconnect()
			L.g(ind[2])
			table.remove(WorkS,idi)
		end
	end
end})
function WorkerWatcher(GameName)
	local Machine = GameSources[GameName]
	local function MachineIdentification(Current)
		local plrFind = Machine:GetDescendants()
		for _,u1 in ipairs(plrFind) do
			
		end
	end
end
local GameActivation = {
	CurrentGameStats = {},
	CurrentlyPlaying = {},
}
function GameActivation:StatGet(GameID)
	local StatisticsData = {Score=0,GameTimer=0,}
	function StatisticsData.UpdateStats(Set,Value)
		if StatisticsData[Set] then
			if not Value then
				return StatisticsData[Set]
			end
			StatisticsData[Set] = StatisticsData[Set]+Value
		end
	end
	function GameActivation.LockData()
		StatisticsData.UpdateStats = nil
	end
	function GameActivation.ActivateTimer()
		
	end
	self.CurrentGameStats[GameID] = StatisticsData
end
function GameActivation.WhackANoob(AMN)
	local SRC = GameSources
end
