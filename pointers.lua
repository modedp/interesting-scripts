--!strict

local Pointers = {}
Pointers.__index = Pointers

-- Types
export type genericMeta = {[any?]:any?}
export type PointerValue = boolean | number | string | genericMeta
export type Pointer = {
	Value: PointerValue,
	Name: string,
	OnChange: BindableEvent,
	UpdateValue: (self: Pointer, newValue: PointerValue) -> PointerValue,
	GetValue: (self: Pointer) -> PointerValue
}

-- Services
local ServerStorage = game:GetService("ServerStorage")
local HttpService = game:GetService("HttpService")

-- Pointer storage
local pointers: { [string]: Pointer } = {}

-- Helper to create new Pointer
local function createPointer(name: string, initialValue: PointerValue): Pointer

	-- Allocate Instance in ServerStorage
	local pointerFolder = ServerStorage:FindFirstChild("Pointers")
	if not pointerFolder then
		pointerFolder = Instance.new("Folder")
		pointerFolder.Name = "Pointers"
		pointerFolder.Parent = ServerStorage
	end

	local instance : any
	if typeof(initialValue) == "number" then
		instance = Instance.new("NumberValue",pointerFolder)
	elseif typeof(initialValue) == "boolean" then
		instance = Instance.new("BoolValue",pointerFolder)
	elseif typeof(initialValue) == "string" or typeof(initialValue) == "table" then
		instance = Instance.new("StringValue",pointerFolder)
	end
	instance.Name = name

	local newPointer = {
		Name = name,
		Value = initialValue,
		UpdateValue = function(self, newValue : PointerValue) : PointerValue
			self.Value = newValue
			self.OnChange:Fire(newValue)
			return newValue :: PointerValue
		end,
		GetValue = function(self) : PointerValue
			return self.Value :: PointerValue
		end,
		OnChange = Instance.new("BindableEvent",instance)
	} :: Pointer;

	if typeof(initialValue) == "table" then
		instance.Value = HttpService:JSONEncode(initialValue)
		instance:GetPropertyChangedSignal("Value"):Connect(function() 
			local pass,newValue = pcall(HttpService.JSONDecode,HttpService,instance.Value)
			newPointer:UpdateValue(pass and newValue or newPointer:GetValue())
			instance.Value = HttpService:JSONDecode(newPointer:GetValue())
		end)
		newPointer.UpdateValue = function(self, newValue : PointerValue) : PointerValue
			local pass,value = pcall(HttpService.JSONDecode,HttpService,newValue)
			self.Value = pass and value or type(newValue) == "table" and newValue or self.Value
			return self.Value :: PointerValue
		end
	else
		instance:GetPropertyChangedSignal("Value"):Connect(function() 
			newPointer:UpdateValue(instance.Value)
		end)
		instance.Value = initialValue
	end

	return newPointer
end

-- Public Functions
function Pointers.getPointerFromName(name: string): Pointer?
	return pointers[name]
end

function Pointers.getAllPointers(): { Pointer }
	local result = {}
	for _, pointer in pairs(pointers) do
		table.insert(result, pointer)
	end
	return result
end

function Pointers.getPointersWithValue(value: PointerValue): { Pointer }
	local result = {}
	for _, pointer in pairs(pointers) do
		if pointer.Value == value then
			table.insert(result, pointer)
		end
	end
	return result
end

function Pointers.clearPointers() 
	for name, pointer in pairs(pointers) do
		pointers[name] = nil
		local instance = ServerStorage.Pointers:FindFirstChild(name)
		if instance then
			game:GetService("Debris"):AddItem(instance,0) 
		end
	end
end

function Pointers.newPointer(name: string, initialValue: PointerValue): Pointer
	if pointers[name] then
		error("Pointer with name " .. name .. " already exists!")
	end

	local pointer = createPointer(name, initialValue)
	pointers[name] = pointer
	return pointer
end

return Pointers