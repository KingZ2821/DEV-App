
local vbomb = {}
RegisterServerEvent('vbomb:addbomb')
AddEventHandler('vbomb:addbomb', function(ServerVID)
    vbomb[ServerVID] = source
    TriggerClientEvent('vbomb:updatingvbomb', -1 , vbomb)
end)
RegisterServerEvent('vbomb:removebomb')
AddEventHandler('vbomb:removebomb', function(ServerVID)
    vbomb[ServerVID] = nil
    TriggerClientEvent('vbomb:updatingvbomb', -1 , vbomb)
end)
RegisterServerEvent('getvbombs')
AddEventHandler('getvbombs', function()
    TriggerClientEvent('vbomb:updatingvbomb', source, vbomb)

end)
RegisterServerEvent('vbomb:notify')
AddEventHandler('vbomb:notify', function(Player, Message)
    print("Get It right dickhead")
    TriggerClientEvent('vbomb:notify', Player, Message)
    
end)
