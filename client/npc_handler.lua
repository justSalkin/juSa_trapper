local prompts = GetRandomIntInRange(0, 0xffffff)

local VORPutils = {}
TriggerEvent("getUtils", function(utils)
    VORPutils = utils
end)

Citizen.CreateThread(function()
 TriggerServerEvent('juSa_Trapper:randomlocation')
end)

Citizen.CreateThread(function() --create talk to npc prompt
    Citizen.Wait(5000)
    local press = Config.Language.press
    talktonpc = PromptRegisterBegin()
    PromptSetControlAction(talktonpc, Config.keys["G"])
    press = CreateVarString(10, 'LITERAL_STRING', press)
    PromptSetText(talktonpc, press)
    PromptSetEnabled(talktonpc, 1)
    PromptSetVisible(talktonpc, 1)
    PromptSetStandardMode(talktonpc, 1)
    PromptSetHoldMode(talktonpc, 1)
    PromptSetGroup(talktonpc, prompts)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C, talktonpc, true)
    PromptRegisterEnd(talktonpc)
end) 

RegisterNetEvent('juSa_Trapper:spawnNPC')
AddEventHandler('juSa_Trapper:spawnNPC', function(spawn)
    local model = GetHashKey(Config.TrapperSetup.model)
    if Config.TrapperSetup.blip == true then
        local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, spawn.x, spawn.y, spawn.z)
        SetBlipSprite(blip, Config.TrapperSetup.blipsprite, true)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.TrapperSetup.blipname)
    end
    RequestModel(model) -- requests the varible model
    if not HasModelLoaded(model) then --checks if its loaded
        RequestModel(model)
    end
    while not HasModelLoaded(model) do
        Wait(100)
    end
    local createdped = CreatePed(model, spawn.x, spawn.y, spawn.z - 1, spawn.h, false, true, true, true) 
    Citizen.InvokeNative(0x283978A15512B2FE, createdped, true) -- sets ped into random outfit, stops it being invis
    SetEntityAsMissionEntity(createdped, true, true) -- sets ped as mission entity preventing it from despawning
    SetEntityInvincible(createdped, true) 
    FreezeEntityPosition(createdped, true) 
    SetBlockingOfNonTemporaryEvents(createdped, true)    

    while true do 
        Citizen.Wait(0) 
        local player = GetEntityCoords(PlayerPedId())
        if GetDistanceBetweenCoords(spawn.x, spawn.y, spawn.z, player.x, player.y, player.z, false) < 2 then
            local label = CreateVarString(10, 'LITERAL_STRING', Config.Language.talk)
            PromptSetActiveGroupThisFrame(prompts, label)
            if Citizen.InvokeNative(0xC92AC953F0A982AE, talktonpc) then --if pressing the interaction-key
                WarMenu.OpenMenu('title') --opens the main menu
            end
        end
    end
end)
