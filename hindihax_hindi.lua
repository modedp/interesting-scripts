local hindihax = "Hindi_hax is here."
local welcometo = "Hindi hax. by builderboy256"
local platiformsatnd = "autrootate"
local gui = game:GetObjects("rbxassetid://5293725743")[1]

local psb = gui.ImageLabel.psb
local jb = gui.ImageLabel.jb
local user = gui.ImageLabel.user
local arb = gui.ImageLabel.arb
local _do = gui.ImageLabel["do"]


for i,v in next, gui:GetDescendants() do
v.Name = game:GetService("HttpService"):GenerateGUID()
end
gui.Name = game:GetService("HttpService"):GenerateGUID()

gui.Parent = game:GetService("CoreGui")

local function GetUsers(name)
local plrs = game:GetService("Players"):GetPlayers()
if name:lower() == "all" then
return plrs
elseif name:lower() == "others" then
for i,v in next, plrs do
if v == game:GetService("Players").LocalPlayer then
table.remove(plrs, i)
end
end
return plrs
else
local t = {}
for i,v in next, plrs do
if v.Name:lower():sub(1, #name) == name:lower() then
table.insert(t, v)
end
end
return t
end
end

_do.MouseButton1Click:Connect(function()
local remote
for i,v in next, game:GetDescendants() do
if v:IsA("RemoteEvent") and v.Name == "ConfigHumanoid" and v.Parent.Parent.Parent.Name ~= "StarterGear" then
remote = v
break
end
end
local users = GetUsers(user.Text)
if #users == 0 then return end
for i,v in next, users do
if v.Character and v.Character:FindFirstChildOfClass("Humanoid") then
remote:FireServer(game.Players.LocalPlayer, v.Character:FindFirstChildOfClass("Humanoid"), psb.Text:lower() == "true" and true or false, jb.Text:lower() == "true" and true or false, arb.Text:lower() == "true" and true or false)
end
end
end)

arb.MouseButton1Click:Connect(function()
    arb.Text = arb.Text == "true" and "false" or "true"
end)
psb.MouseButton1Click:Connect(function()
    psb.Text = psb.Text == "true" and "false" or "true"
end)
jb.MouseButton1Click:Connect(function()
    jb.Text = jb.Text == "true" and "false" or "true"
end)
