if game.GameId == 994732206 then

    if shared.BloxFruitsItzporium then
        return
        error("Blox Fruit script is running, you can't execute it anymore!")
    else
        shared.BloxFruitsItzporium = true
    end

    local LibraryUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local ScriptWindows =  LibraryUI.CreateLib("Prison Life".."", "Sentinel")

     --Tab--
     local ServerModerator = ScriptWindows:NewTab("ServerMod")
     local ExploitTab = ScriptWindows:NewTab("Exploit")
     -------
-- Anti script issue
repeat task.wait() until game.Loaded and game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
     --ControlVar--
    local plr = game:GetService("Players").LocalPlayer
    local char = plr.Character or plr.CharacterAdded
    local Humanoid = char:FindFirstChildWhichIsA("Humanoid")
    local Heartbeat = game:GetService("RunService").Heartbeat
    local Mouse = plr:GetMouse()
    local PlayerInGame = {}
    local UserInputService = game:GetService("UserInputService")
    local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
    local crashserver = nil;
    local annoytrade = nil;
    local annoytradedelay = false
    local autocollectfruit = nil;
    --------------

    plr.OnTeleport:Connect(function(State)
        if State == Enum.TeleportState.Started then
            if queueteleport then
                queueteleport("loadstring(game:HttpGet('https://occipital-garnet-stallion.glitch.me'))()")
            end
        end
    end)

    --ExploitTab--
    local Fruits = ExploitTab:NewSection("Fruits")

    Fruits:NewButton("Collect all Fruit", "Collect all fruit in the game, only in server and the fruit is collectable.", function()
        if not plr and not plr.Character and not plr.Character:FindFirstChildWhichIsA("Humanoid") then return end
        local Human = plr.Character:FindFirstChildWhichIsA("Humanoid")
        for _, v in ipairs(workspace:GetChildren()) do
            if plr.Character and v:IsA("BackpackItem") and v:FindFirstChild("Handle") then
                Human:EquipTool(v)
            end
        end
    end)

    Fruits:NewToggle("Auto Collect Fruit", "Collect all food it detected in the game", function(state)
        if state then
            autocollectfruit = game:GetService("Workspace").ChildAdded:Connect(function(child)
                if not child.ClassName == "Tool" then return end
                
                if not plr and not plr.Character and not plr.Character:FindFirstChildWhichIsA("Humanoid") then return end
                local Human = plr.Character:FindFirstChildWhichIsA("Humanoid")
                for _, v in ipairs(child:GetChildren()) do
                    if plr.Character and child:IsA("BackpackItem") and v:FindFirstChild("Handle") then
                        Human:EquipTool(v)
                    end
                end
            end)
        else
            if autocollectfruit then
                autocollectfruit:Disconnect()
            end
        end
    end)

    local ServerCrasher = ExploitTab:NewSection("ServerCrasher")

    ServerCrasher:NewToggle("Toggle", "Laggin' the server", function(state)
        if state then
            crashserver = game:GetService("RunService").Heartbeat:Connect(function()
                local args = {
                    [1] = tick()
                }
                
                game:GetService("ReplicatedStorage").Remotes.Clock.DelayedRequestFunction:InvokeServer(unpack(args))
                
                    local args = {
                    [1] = "SetTeam",
                    [2] = "Pirates"
                }
                
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                task.wait(.1)
                local args = {
                    [1] = nil;
                }
                
                game:GetService("ReplicatedStorage").Remotes.Location:FireServer(unpack(args))
                local args = {
                    [1] = "unequipWeapon",
                    [2] = "Combat"
                }
                
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer(unpack(args))
                local args = {
                    [1] = math.huge,
                    [2] = math.huge
                }
                
                game:GetService("ReplicatedStorage").Remotes.Validator:FireServer(unpack(args))
                local args = {
                    [1] = "DoubleJump"
                }
                
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer(unpack(args))
                local args = {
                    [1] = "Dodge",
                    [3] = math.huge,
                    [4] = true
                }
                
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer(unpack(args))
            end)
        else
            if crashserver then
                crashserver:Disconnect()
            end
        end
    end)

    local Trade = ExploitTab:NewSection("Trade")

    Trade:NewToggle("AutoTradeRequest", "It can help you annoy everyone.", function(state)
        if state then
            annoytrade = game:GetService("RunService").Heartbeat:Connect(function()
                if annoytradedelay == true then return end
                annoytradedelay = true
                for _, v in pairs(game:GetService("Players"):GetPlayers()) do
                    local args = {
                        [1] = "InviteAlly",
                        [2] = tostring(v.Name)
                    }
                    
                    game:GetService("ReplicatedStorage"):FindFirstChild("Remotes"):FindFirstChild("CommF_"):InvokeServer(unpack(args))
                end
                annoytradedelay = false
            end)
        else
            annoytradedelay = false
            if annoytrade then
                annoytrade:Disconnect()
            end
        end
    end)
    --------------
else
    print("You joined the wrong game, please join Blox Fruits. I set the game link in your clipboard")
    setclipboard("https://web.roblox.com/games/2753915549/Blox-Fruits")
end
