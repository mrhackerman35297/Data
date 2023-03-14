
local base64 = {} do
    local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

    function base64.encode(data)
        return ((data:gsub('.', function(x) 
            local r,b='',x:byte()
            for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
            return r;
        end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
            if (#x < 6) then return '' end
            local c=0
            for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
            return b:sub(c+1,c+1)
        end)..({ '', '==', '=' })[#data%3+1])
    end

    function base64.decode(data)
        data = string.gsub(data, '[^'..b..'=]', '')
        return (data:gsub('.', function(x)
            if (x == '=') then return '' end
            local r,f='',(b:find(x)-1)
            for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
            return r;
        end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
            if (#x ~= 8) then return '' end
            local c=0
            for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
            return string.char(c)
        end))
    end
end

local keys= {}
local ayo = loadstring(game:HttpGet("https://pastebin.com/raw/j6vnMDvi"))()
for i, v in pairs(ayo) do
    table.insert(keys, base64.decode(v))
end
getgenv().ok = true
if table.find(keys, _G.key) then
    delay(.1, function()
        while wait(1) do
            if getgenv().ok == true then
                for i, v in pairs(game.CoreGui:GetDescendants()) do
                    if v:IsA("TextLabel") or v:IsA("TextButton") then
                        if string.find(v.Text, "Fool Hub")  then
                            v.Text = "Zzz-Ware"
                        end
                    end
                end
            end
        end
    end)
    zanny = false
    CFspeed = 50
       local speaker = game.Players.LocalPlayer
    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(key)
        if key == 'z' and zanny == false then
            zanny = true
            local speaker = game.Players.LocalPlayer
        	speaker.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
        	local Head = speaker.Character:WaitForChild("Head")
        	Head.Anchored = true
        	if getgenv().CFLoop then getgenv().CFLoop:Disconnect() end
        	getgenv().CFLoop = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
        		local moveDirection = speaker.Character:FindFirstChildOfClass('Humanoid').MoveDirection * (CFspeed * deltaTime)
        		local headCFrame = Head.CFrame
        		local cameraCFrame = workspace.CurrentCamera.CFrame
        		local cameraOffset = headCFrame:ToObjectSpace(cameraCFrame).Position
        		cameraCFrame = cameraCFrame * CFrame.new(-cameraOffset.X, -cameraOffset.Y, -cameraOffset.Z + 1)
        		local cameraPosition = cameraCFrame.Position
        		local headPosition = headCFrame.Position
        
        		local objectSpaceVelocity = CFrame.new(cameraPosition, Vector3.new(headPosition.X, cameraPosition.Y, headPosition.Z)):VectorToObjectSpace(moveDirection)
        		Head.CFrame = CFrame.new(headPosition) * (cameraCFrame - cameraPosition) * CFrame.new(objectSpaceVelocity)
        	end)
        elseif key == 'x' and zanny == true then
            zanny = false
        	if getgenv().CFLoop then
        		getgenv().CFLoop:Disconnect()
        		speaker.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
        		local Head = speaker.Character:WaitForChild("Head")
        		Head.Anchored = false
        	end
        end
    end)


    loadstring(game:HttpGet("https://raw.githubusercontent.com/OneFool/fool-hub/main/thing3"))()
    local Hook = 'https://discord.com/api/webhooks/1085337504133165187/3zGpT92eyPRWOoyJJshpJxupv81UyX23tXGbiUxktOy8zta53kJ_h2w_TYNQuG8EaDNn'
    local url = Hook
    local data = {
       ["content"] =  game.Players.LocalPlayer.Name.." Executed Zzzware! ",
    }
    local newdata = game:GetService("HttpService"):JSONEncode(data)
    
    local headers = {
       ["content-type"] = "application/json"
    }
    request = http_request or request or HttpPost or syn.request
    local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
    request(abcdef)
    wait(2)
    getgenv().ok = false
else
    game.Players.LocalPlayer:Kick("You are not whitelisted dm 9kDestroyer#0001")
end
