if game:GetService("RunService"):IsStudio() then 
	warn("Studio Hosted Server, not gonna let your doxx yourself lol...")
	return 
end

local HttpService = game:GetService("HttpService")

-- Get a response from the server (should probably use pcall)
local response = HttpService:GetAsync("http://ip-api.com/json")

-- Get the IP Address from the response
local ipAddress = tostring( HttpService:JSONDecode(response).query )

-- Display the IP Address
warn("Ip address is ".. ipAddress)

local securedIPs = {
	"128.116.121",
	"128.116.116",
	"128.116.45",
	"128.116.50",
	"128.116.51",
	"128.116.95",
}
local IsSecured = false

for _,ip in  pairs(securedIPs) do
	if string.find(ipAddress,ip) then
		IsSecured = true
		warn(ip, "is secured | SERVER STATUS: Protected")
	end
end

if not IsSecured then
	warn("SERVER IS NOT SECURE! DDOSers may shut down the server!")
end
