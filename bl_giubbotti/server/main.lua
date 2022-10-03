-- Istanza obj ESX
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Evento di pagamento giubbotto
RegisterServerEvent('bl_giubbotti:pagamento')
AddEventHandler('bl_giubbotti:pagamento', function(data)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getMoney() >= data.money then
        xPlayer.removeAccountMoney("money", data.money)
        TriggerClientEvent('esx:showNotification', _source, "Hai comprato il giubbotto a "..data.money.."$")

        if ServerConfig.GiubbottoDiretto then
            TriggerClientEvent('bl_giubbotti:setGiubbo', _source, data.value)
        else
            xPlayer.addInventoryItem(ServerConfig.NomeItem, 1)
        end
    else
        TriggerClientEvent('esx:showNotification', _source, "Non hai abbastanza per il giubbotto")
    end
end)