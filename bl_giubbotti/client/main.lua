ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

-- Setup Menu
function OpenMenu()
    local Elements = {}

    for k,v in pairs(ClientConfig.Menus) do
        Elements[k] = {label = v.label.." "..v.prezzo.."$", id = k}
    end
      
    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "Giubbo_Menu", {
        title = "Menu Giubbotto",
        align = 'top-left',
        elements = Elements
    }, function(data,menu)
        for k,v in pairs(ClientConfig.Menus) do
            if data.current.id == k then
                TriggerServerEvent('bl_giubbotti:pagamento', { money = v.prezzo, value = v.refill })
                menu.close()
            end
        end
    end, function(data, menu)
        menu.close()
    end)
end

-- Set giubbo
RegisterNetEvent('bl_giubbotti:setGiubbo', function(value)
    SetPedArmour(PlayerPedId(), value)
end)

-- Display Marker
Citizen.CreateThread(function()
	while true do
        Citizen.Wait(1)

		local coords = GetEntityCoords(PlayerPedId())

		for k,v in pairs(ClientConfig.Markers) do
			if (v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < ClientConfig.DrawDistance) then
                ESX.ShowHelpNotification('Premi ~INPUT_CONTEXT~ per aprire il menù!')
				DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
			end
		end
	end
end)

-- Press E
RegisterCommand('interagisci_blip', function()
    local coords = GetEntityCoords(PlayerPedId())

    for k,v in pairs(ClientConfig.Markers) do
        if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < ClientConfig.DrawDistance then
            OpenMenu()
        end
    end
end)
RegisterKeyMapping('interagisci_blip', 'Interagisci con un blip', 'keyboard', 'E')