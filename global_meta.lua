local Library = {
	math = math,
	instance = Instance,
	string = string,
	enum = Enum,
	script = script,
	table = table,
	game = setmetatable({},{
	__index = function(self,name)
		local pass,service = pcall(game.GetService,game,string.upper(string.sub(name,1,1)) .. string.sub(name,2))
			if pass then
				self[name] = service
				return service
			end
		end,
	})
}
local Meta = setmetatable({},{
	__index = function(self,name)
		name = string.lower(string.sub(name,1,1)) .. string.sub(name,2)
		local pass,result = pcall(function(key) 
			local indexing = string.split(key,".")
			local Match = nil
			for i=1,#indexing do
				if not Match then
					Match = Library[indexing[i]]
				else
					Match = Match[indexing[i]]
				end
			end
			if Match == nil then
				error(key .. " | This Value Does Not Exist.")
			end
			return Match
		end,name)
		if pass then
			self[name] = result
			return result
		end
	end,
	__call = function(self,name : string,parent : Instance) 
		local l_NewInstance = Instance.new(name,parent)
		return setmetatable({},{__index = function(self,index) 
				if l_NewInstance[index] then
					self[index] = l_NewInstance[index]
					return l_NewInstance[index]
				end
			end,
			__newindex = function(self,name,value) 
				l_NewInstance[name] = value
				return self
			end,
			__call = function(self,arguments)
				for name,value in pairs(arguments) do
					if l_NewInstance[name] then
						l_NewInstance[name] = value
					end
				end
				return l_NewInstance
			end})
		end
})
