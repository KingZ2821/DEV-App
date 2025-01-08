
AddRelationshipGroup('King')
local areas = {
    [1] = {['x'] = 1728.3610839844,['y']  =  3294.9025878906,['z'] = 41.223556518555},
    [2] = {['x'] = 1742.6683349609, ['y'] = 3298.2229003906, ['z'] = 41.22354888916 },
    [3] = {['x'] = 1735.5465087891, ['y'] = 3297.2575683594, ['z'] = 41.223545074463},
    [4] = {['x'] = 1712.5902099609,['y']  =  3288.1235351562,['z'] = 41.153171539307},
    [5] = {['x'] = 1689.5885009766, ['y'] = 3276.0407714844, ['z'] = 41.049247741699},
    [6] = {['x'] = 1684.4262695312, ['y'] = 3288.0251464844, ['z'] = 41.146560668945},
    [7] = {['x'] = 1698.5922851562, ['y'] = 3295.2333984375, ['z'] = 41.14762878418 },
    [8] = {['x'] = 1703.5887451172, ['y'] = 3309.2570800781, ['z'] = 41.199394226074},
    [9] = {['x'] = 1689.1677246094, ['y'] = 3300.8557128906, ['z'] = 41.146808624268},
    [10] = {['x'] =1711.8425292969, ['y'] = 3273.4431152344, ['z'] = 41.152164459229}
}

local guards = {}


function blip (positionx, postiony, positionz)
    blipRobbery = AddBlipForCoord(positionx, postiony, positionz)

    SetBlipSprite(blipRobbery, 429)
    SetBlipScale(blipRobbery, 1.0)
    SetBlipColour(blipRobbery, 3)

    PulseBlip(blipRobbery)
end

function killBlip()
    RemoveBlip(blipRobbery)
end

RegisterCommand('king', function ()

    local playerCoords = GetEntityCoords(PlayerPedId())
    local modelhash = `ig_djgeneric_01`

    -- Notification Works
    startendnotification('This Starts Mission', 'King', 'Get My Coke', 'CHAR_RON', 2, true, 130)
    -- This loop works
    blip(1734.4371337891,3291.1047363281,41.145851135254)
    RequestModel(modelhash)
    while not HasModelLoaded(modelhash) do 
        Wait(5)
    end
    for i  = 1, 10 do
        guards[#guards+1] = CreatePed(2, modelhash, areas[i]["x"],areas[i]["y"],areas[i]["z"], 90.0, true, false)
     end
     for i  = 1, #guards do
        SetGuardAttributes(guards[i])
     end

   

end)




function SetGuardAttributes(zombie)
	    SetPedRelationshipGroupHash(zombie, `king`)
        GiveWeaponToPed(zombie, `weapon_advancedrifle`, 100, false, true)
        SetCurrentPedWeapon(zombie, `weapon_advancedrifle`, true)
        SetPedCombatAttributes(zombie, 0, true) --[[ BF_CanUseCover ]]
        SetPedCombatAttributes(zombie, 5, true) --[[ BF_CanFightArmedPedsWhenNotArmed ]]
        SetPedCombatAttributes(zombie, 46, true) --[[ BF_AlwaysFight ]]    
  
end





local function getpedsAlive()
    local alive = 0
    for a = 1, #guards do
        if not IsEntityDead(guards[a]) then
            alive = alive + 1
           
        end
    end
    return alive
end


function missionguide(message, duration)
    BeginTextCommandPrint('STRING')
    AddTextComponentString(message)
    EndTextCommandPrint(duration, true)
    
end

-- This is the start the mission notification on what to do and what it is. 
-- Link for textureDict pastebin.com/XdpJVbHz, 
function startendnotification (message, sender, subject, textureDict, icontype, saveToBrief, color)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(message)
    ThefeedNextPostBackgroundColor(color)
    EndTextCommandThefeedPostMessagetext(textureDict, textureDict, false, iconType, sender, subject)
    EndTextCommandThefeedPostTicker(flash, saveToBrief)
end





-- Cleanup Zombies
local function cleanupped()
    for a = 1, #guards do
        DeleteEntity(guards[a])
    end
end


-- Player Failed Mission Thread

Citizen.CreateThread(function ()
    local oldHealth     = 0
    local currentHealth = 0
    local playerPed     = nil
    
    while true do
        Wait(500)
       local playerped = PlayerPedId()
       local currentHealth = GetEntityHealth(playerped)
        if (currentHealth == 0)  then
            startendnotification('Get Patched Up, See Me Again, When Your Better, We will try again.', 'Your In The Hospital', 'Get Some Help.', 'CHAR_RON', 2, true, 130)
            cleanupped()
            killBlip()
        end




    end
    
end)

-- Players Start Mission Thread

Citizen.CreateThread(function()
    while true do
        Wait(500)
        local playerped = PlayerPedId()
        local currentHealth = GetEntityHealth(playerped)
        local aliveped = getpedsAlive()
       if aliveped == 0 and currentHealth > 0 then
        startendnotification('Great You sucuessful, killed them, get my coke now.', 'King', 'End Of Mission ', 'CHAR_RON', 2, true, 130)
        cleanupped()
        killBlip()
       end
       

    end
end)


