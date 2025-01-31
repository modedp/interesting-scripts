-- ceat_ceat

--[[
ceat#6144  2021 - 2024
all scripts in here with my name on top are made by me

the official require is

	require(11126053846).fse(owner.Name) -- main version
	require(11387188264).fse(owner.Name) -- testing version
	
and if someone uses rawset to override the fse index
	
	require(11126053846)(owner.Name) -- main version
	require(11387188264)(owner.Name) -- testing version
	
legacy fse require

	require(6324372525).fse(owner.Name)
	require(6324372525)(owner.Name)
	
my discord userid is

	248973844621033473
	
when contacting me abt fse pls tell me that ur dm is abt fse, or i will ignore u cus
idk u

join this server if u want to contact me more, i check every now and then i think


you can get info abt updates there and any require id changes
you can dm me if youd like :) just pls dont get urself blocked i dont like seeing my blocked
list grow :(
]]

local game = game
local require = require
local newproxy = newproxy
local getmetatable = getmetatable

local runservice = game:GetService("RunService")

local MAIN_REQUIRE_ID = 11126053846
local NIGHTLY_REQUIRE_ID = 11387188264
local REDIRECT_REQUIRE = true
local DIRECT_TO_NIGHTLY = false

local requireid = DIRECT_TO_NIGHTLY and NIGHTLY_REQUIRE_ID or MAIN_REQUIRE_ID
local shouldredirect = if runservice:IsStudio() then false else REDIRECT_REQUIRE
local returntable = newproxy(true)
local fsemodule = script.fse:Clone()

local function donothing() end

local function loadcall(username)
	if shouldredirect then
		if require(requireid) ~= returntable then
			return require(requireid)(username)
		end
	end
	return require(fsemodule)(username)
end


local modulemeta = getmetatable(returntable)

local function protectedloadcall(...)
	return loadcall(...)
end
setfenv(protectedloadcall, {})

modulemeta.__index = { fse = protectedloadcall }
modulemeta.__newindex = donothing
modulemeta.__metatable = {}
modulemeta.__call = function(_, ...)
	return protectedloadcall(...)
end

script.Parent = nil
fsemodule.Parent = nil

table.clear(getfenv())
return returntable
