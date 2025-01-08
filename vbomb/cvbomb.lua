
local vbomb = {}
local activationfast = 50
local vdent = 25
local vbombactivate = false
RegisterNetEvent('vbomb:updatingvbomb')
AddEventHandler('vbomb:updatingvbomb', function(updatingvehbombs)
    vbomb = updatingvehbombs
end)
RegisterNetEvent('vbomb:notify')
AddEventHandler('vbomb:notify', function(Message) 
    TriggerEvent('chatMessage', '', {255, 0, 0}, Message)
end)

RegisterCommand("addbomb", function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle == 0 then
        return TriggerEvent('chatMessage', '', {255, 0, 0}, 'Invalid Vehicle')
    end
    if not vbomb[VehToNet(vehicle)] then
        TriggerServerEvent('vbomb:addbomb',VehToNet(vehicle))
        TriggerEvent('chatMessage', '', {0, 255, 0}, 'Bomb Added')
    else
        TriggerEvent('chatMessage', '', {255, 0, 0}, 'Vehicle Already Has A Bomb')
    end
end, false)
RegisterCommand("removeb", function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle == 0 then
        return TriggerEvent('chatMessage', '', {255, 0, 0}, 'Invalid Vehicle')
    end
    if vbomb[VehToNet(vehicle)] then
        TriggerServerEvent('vbomb:removebomb',VehToNet(vehicle))
        TriggerEvent('chatMessage', '', {0, 255, 0}, 'Bomb Removed')
    else
        TriggerEvent('chatMessage', '', {255, 0, 0}, 'Vehicle Does Not Have A Bomb')
    end
end, false)


CreateThread(function()
    TriggerServerEvent('getvbombs')  
     while true do    
        Citizen.Wait(1000)
        local PlayerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(PlayerPed, false)
        
        if (vehicle ~= 0) then
            if vbomb[VehToNet(vehicle)] then
                local DriverPed =  GetPedInVehicleSeat(vehicle, -1)      
                if (DriverPed == PlayerPed) then      
                    local vspeed = GetEntitySpeed(vehicle) 
                    vspeed = vspeed * 2.236936
                    if (vspeed >  activationfast) then
                        vbombactivate = true
                        TriggerEvent('chatMessage', '', {255, 0, 0}, 'Dont Go Below 25 MPH or Bomb will explode')
                        TriggerServerEvent('vbomb:notify', vbomb[VehToNet(vehicle)], "Your Speed Bomb Has Been Activated")
                        while vbombactivate do
                            Citizen.Wait(1000)  
                            local vspeed = GetEntitySpeed(vehicle) 
                            vspeed = vspeed * 2.236936
                            if (vspeed < vdent) then
                                print("Boom")
                                local cords = GetEntityCoords(vehicle)
                                AddExplosion(cords, 5, 1.0, true, false, true)
                                vbombactivate = false
                            end

                        end
                    end
                end


            end
        
        
        end







     end
    
    
    
    end)  
RegisterCommand("revive", function()
    local playerPos = GetEntityCoords(PlayerPedId(), true)
    NetworkResurrectLocalPlayer(playerPos, true, true, false)
    end)
