local module = {}
local userAgent = game:GetService("Players").LocalPlayer
local camera = workspace.CurrentCamera
local guiBasic = userAgent.PlayerGui:WaitForChild("Freecam")
local mouse = userAgent:GetMouse()
local device = game:GetService("UserInputService")
local policy = game:GetService("PolicyService")
local localization = game:GetService("LocalizationService")

function module:getDevice()
    if game:GetService("GuiService"):IsTenFootInterface() then
        return "Console"
    end
    if device.TouchEnabled and not device.MouseEnabled then
        return guiBasic.AbsoluteSize.Y <650 and "Mobile" or "Tablet"
    end
    return "Computer"
end

function module:getScreenSize()
    return {X=camera.ViewportSize.X,Y=camera.ViewportSize.Y}
end

function module:getDeviceTime()
    return os.date()
end

function module:getPolicy()
    return policy:GetPolicyInfoForPlayerAsync(userAgent)
end

function module:isAgeVerified()
    return game:GetService("VoiceChatService"):IsVoiceEnabledForUserIdAsync(userAgent.UserId)
end

function module:countryRegion()
    return localization:GetCountryRegionForPlayerAsync(userAgent)
end

function module:getAllInfo()
    return {
        Device = self:getDevice(),
        ScreenSize = self:getScreenSize(),
        DeviceTime = self:getDeviceTime(),
        CountryName = self:countryRegion(),
        AgeVCAccess = self:isAgeVerified(),
        PolicyCountry = (self:countryRegion()=="US") and "Not Needed" or self:getPolicy(),
    }
end

return module
