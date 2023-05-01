local module = {}

local HttpService = game:GetService("HttpService")
local request = (syn and syn.request) or (http and http.request) or http_request
local discordInvite = "Rm3RCvnSqv"

function module:PromptDiscordInvite(invite)
    if request then
        request({
            Url = "http://127.0.0.1:6463/rpc?v=1",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json",
                Origin = "https://discord.com"
            },
            Body = HttpService:JSONEncode({
                cmd = "INVITE_BROWSER",
                nonce = HttpService:GenerateGUID(false),
                args = {code = invite}
            })
        })
    end
end

function module:GetDiscordInvite()
    return discordInvite
end

return module
