ClientConfig = {}

ClientConfig.DrawDistance = 2.5

ClientConfig.Markers = { -- puoi creare più marker in più posizioni
    ArmeriaUno = {
        Pos = {x = -1087.46, y = -2666.09, z = 19.63},
        Size = {x = 0.65, y = 0.65, z = 0.65},
        Color = {r = 14, g = 121, b = 245},
        Type = 20
    },
    ArmeriaDue = {
        Pos = {x = 1087.46, y = -2666.09, z = 19.63},
        Size = {x = 0.65, y = 0.65, z = 0.65},
        Color = {r = 14, g = 121, b = 245},
        Type = 20
    },
}

ClientConfig.Menus = { -- label: nome che apparirà nel menù, prezzo: prezzo del giubbotto, refill: quanto giubbotto da (da 0 a 100)
    { label = "Giubbotto Leggero", prezzo = 1500, refill = 50 },
    { label = "Giubbotto Pesante", prezzo = 3000, refill = 100 },
}