

-- This script needs be able to spawn bodyguards 4 at a time within a specific location and then know 
-- They're on the same team. They will guard the location that they're set to, and will not attack until
-- attacked by playerped. 

local areas = {
    [1] = {['x'] = 1741.2735595703, ['y'] = 3299.0158691406, ['z'] = 41.223526000977},
    [2] = {['x'] = -1728.0338134766, ['y'] = 3295.0336914062, ['z'] = 41.223526000977},
    [3] = {['x'] = -1723.4683837891, ['y'] = 3287.7573242188, ['z'] = 41.152797698975},
    [4] = {['x'] = 1727.5931396484, ['y'] = 3294.6154785156, ['z'] = 41.223533630371},
    [5] = {['x'] = -1749.2995605469, ['y'] = 3326.6357421875, ['z'] = 40.957866668701},
    [6] = {['x'] = -1756.5179443359, ['y'] = 3328.0554199219, ['z'] = 41.273178100586},
    [7] = {['x'] = -1757.7869873047, ['y'] = 3318.2795410156, ['z'] = 41.148624420166},
    [8] = {['x'] = -1766.1499023438, ['y'] = 3287.509765625,  ['z'] = 41.203346252441},
    [9] = {['x'] = -1716.6268310547, ['y'] = 3320.9719238281, ['z'] = 41.223522186279},
    [10] = {['x'] = 1736.5363769531, ['y'] = 3325.4494628906, ['z'] = 41.223453521729}
}
-- Areas of locations at the Paltao vector3(1727.5931396484,3294.6154785156,41.223533630371)
-- areas[i]["x"],areas[i]["y"],carspawns[i]["z"] ((Cords))
local bodyguards = {
    [1] = CreatePed(2, modelhash, areas[i]["x"],areas[i]["y"],areas[i]["z"], 90.0, true, false)
}


function createbodyguard(modelhash, weaponHash)

    RequestModel(modelhash)
    while not HasModelLoaded(modelhash) do 
        Wait(1000)
    end
    
    for i  = 1, 10 do
        bodyguards[#bodyguards+1] = CreatePed(2, modelhash, areas[i]["x"],areas[i]["y"],areas[i]["z"], 90.0, true, false)
    end
    for i  = 1, #bodyguards do
        local pedgroup = AddRelationshipGroup("pedgroup")  
        GiveWeaponToPed(bodyguards[i], weaponHash, 100, false, true)
        SetCurrentPedWeapon(bodyguards[i], weaponHash, true)
        SetPedCombatAttributes(bodyguards[i], 0, true) --[[ BF_CanUseCover ]]
        SetPedCombatAttributes(bodyguards[i], 5, true) --[[ BF_CanFightArmedPedsWhenNotArmed ]]
        SetPedCombatAttributes(bodyguards[i], 46, true) --[[ BF_AlwaysFight ]]        
        SetRelationshipBetweenGroups(0, pedgroup, pedgroup)
    end
   

end


Citizen.CreateThread(function()
    -- createbodyguard(count, coords, modelhash, weaponHash)
   createbodyguard(`ig_djgeneric_01`, `weapon_advancedrifle`)
    while true do
        Wait(5000)
        for keys, values in pairs(bodyguards) do
            if GetEntityHealth(values) < 100 then
                bodyguards = {}
                createbodyguard(`ig_djgeneric_01`, `weapon_advancedrifle`)
            end
            print(bodyguards)
        end
        
    end
       
    
end)


-- -- What I had before just replace back if need it. 
--      -- for i = #bodyguards, 1, -1 do
--         --          print("king1")
--         --         if GetEntityHealth(bodyguards[i]) < 100 then
--         --              table.remove(bodyguards, i)
--         --         else 
--         --             print("These dickheads alive & Well")            
--         --         end
--         --         if not bodyguards[i] then
--         --             print("King2")
--         --             createbodyguard(`ig_djgeneric_01`, `weapon_advancedrifle`)
--         --         end
--         -- end