
local Profit = game.Players.LocalPlayer.DataFolder.Currency.Value
local Tick = os.time()



local money = function(Num)
	return tostring(Num):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end
local url = "https://discord.com/api/webhooks/1137541903143948288/ePJDY-d2JIXqywNMIlyHTGuq4sDcC6_rnd6SNc04bw_FNg4kzfY5wqiwWAJq3-cxfKWF"
    local data = {
        ["content"] =  "",
        ["embeds"] = {
            {
                ["title"] = ('Android Farm'),
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
                        ["value"] = '```9kDestroyer | giba niba```',
                        ["inline"] = false,
                    },
                }, 
                ["thumbnail"] = {
                    ["url"] = 'https://media.discordapp.net/attachments/862465771053907999/863897814789259284/unknown_15.png?ex=6591e009&is=657f6b09&hm=4aa6c9bf67afcb31a35bc3429f2c845670f53838dbb4c2d60e86a5ef83d257fb&=&format=webp&quality=lossless',
                }
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
