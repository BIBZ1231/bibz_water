RegisterServerEvent('DRP_Water:checkAccounts')
AddEventHandler('DRP_Water:checkAccounts', function()
    local src = source
    local charInfo = exports["drp_id"]:GetCharacterData(src)
    TriggerEvent("DRP_Bank:GetCharacterMoney", charInfo.charid, function(characterMoney)
        if tonumber(characterMoney.data[1].cash) >= tonumber(DRPWater.Price) then
            TriggerEvent("DRP_Bank:RemoveCashMoney", charInfo, tonumber(DRPWater.Price))
            TriggerClientEvent("DRP_Water:getWater", src)
        else
            TriggerClientEvent("DRP_Core:Error", src, "Water Machine", tostring("You don't have enough Cash!"), 2500, false, "leftCenter")
        end
    end)
end)
