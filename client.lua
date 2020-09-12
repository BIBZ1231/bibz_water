local sleeper = 0
local searchedObjects = {}
local buyingWater = false
Citizen.CreateThread(function()
    Citizen.Wait(100)
    while true do
        local sleeper = 1000
        local ped = PlayerPedId()
        local playerCoords = GetEntityCoords(ped, false)
        for a = 1, #DRPWater.Machines do
            local waterMachine = GetClosestObjectOfType(playerCoords, 1.0, GetHashKey(DRPWater.Machines[a]), false, false, false)
            local object = nil
            if DoesEntityExist(waterMachine) then
                sleeper = 5
                DisplayHelpText("Press E For "..DRPWater.Item.." $"..DRPWater.Price)
                if IsControlJustPressed(1, 38) then
                    TriggerServerEvent("DRP_Water:checkAccounts")
                end
                break
            else
                sleeper = 1000
            end
        end
        Citizen.Wait(sleeper)
    end
end)

RegisterNetEvent('DRP_Water:getWater')
AddEventHandler('DRP_Water:getWater', function()
    buyingWater = true
    RequestAnimDict('amb@medic@standing@kneel@base')  
    while not HasAnimDictLoaded('amb@medic@standing@kneel@base') do
        Citizen.Wait(0)
    end
    TaskPlayAnim(PlayerPedId(), 'amb@medic@standing@kneel@base', 'base', 0.7, 0.7, 2000, 0, 1, true, true, true)
    DisplayHelpText("Purchasing a "..DRPWater.Item)
    Citizen.Wait(3000)
    TriggerServerEvent("DRP_Inventory:addInventoryItem", DRPWater.Item, tonumber(1))
    ClearPedTasks(PlayerPedId())
    buyingWater = false
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
