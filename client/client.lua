local VORPcore = {}

TriggerEvent("getCore", function(core)
    VORPcore = core
end)

StopAll = false

Citizen.CreateThread(function()
    WarMenu.CreateMenu('title', Config.Language.title) --creates the main menu
    WarMenu.CreateSubMenu('sell', 'title', Config.Language.SubMenu_Head_Sell)
    WarMenu.CreateSubMenu('buy', 'title', Config.Language.SubMenu_Head_Buy)
    repeat
        if WarMenu.IsMenuOpened('title') then --creating shop options
            if WarMenu.Button(Config.Language.Menu_Title_Sell, Config.Language.Menu_SubTitle_Sell) then
                WarMenu.OpenMenu('sell')
            end
            if WarMenu.Button(Config.Language.Menu_Title_Buy, Config.Language.Menu_SubTitle_Buy) then
                WarMenu.OpenMenu('buy')
            end
        elseif WarMenu.IsMenuOpened('sell') then
            for p, u in pairs(Config.Shop.sell) do 
                local sell_item = u.itemdbname 
                local sell_price
                    if Config.Shop.userandomprice == true then
                        sell_price = u.randomprice
                    elseif Config.Shop.userandomprice == false then
                        sell_price = u.price 
                    end
                if WarMenu.Button("" ..Config.Language.Shopmenu_sell.. "" .. u.displayname .. "" ..Config.Language.Shopmenu_for.. "" .. sell_price.. " $", '') then
                    local myInput = {
                        type = "enableinput", -- dont touch
                        inputType = "input", 
                        button = Config.Language.input_button, 
                        placeholder = Config.Language.input_placeholder, 
                        style = "block", --- dont touch
                        attributes = {
                            inputHeader = Config.Language.input_header, 
                            type = "number", 
                            pattern = "[0-9]{1,250}", 
                            title = "input must be a number", 
                            style = "border-radius: 10px; background-color: ; border:none;", 
                        }
                    }
                    TriggerEvent("vorpinputs:advancedInput", json.encode(myInput),function(result)
                        local var = tonumber(result)
                        if var == nil then
                            print('nil val')
                        elseif var > 0 then
                            TriggerServerEvent("juSa_Trapper:catchinputforsell",  sell_item, sell_price, var)
                        else
                            TriggerEvent("vorp:TipRight", "insertamount", 3000)
                        end
                    end)
                    WarMenu.CloseMenu()
                end
            end
        elseif WarMenu.IsMenuOpened('buy') then
            for k, e in pairs(Config.Shop.buy) do
                local buy_item = e.itemdbname
                local buy_price
                if Config.Shop.userandomprice == true then
                    buy_price = e.randomprice
                elseif Config.Shop.userandomprice == false then
                    buy_price = e.price 
                end
                if WarMenu.Button("" ..Config.Language.Menu_Title_Buy .. " " .. e.displayname .. "" ..Config.Language.Shopmenu_for.. "" .. buy_price .. " $") then
                    local myInput = {
                        type = "enableinput", -- dont touch
                        inputType = "input", 
                        button = Config.Language.input_button, 
                        placeholder = Config.Language.input_placeholder, 
                        style = "block", --- dont touch
                        attributes = {
                            inputHeader = Config.Language.input_header, 
                            type = "number", 
                            pattern = "[0-9]{1,250}",
                            title = "input must be a number", 
                            style = "border-radius: 10px; background-color: ; border:none;", 
                        }
                    }
                    TriggerEvent("vorpinputs:advancedInput", json.encode(myInput),function(result)
                        local var = tonumber(result)
                        if var > 0 then
                            TriggerServerEvent("juSa_Trapper:catchinputforbuy", var, buy_item, buy_price) 
                        else
                            TriggerEvent("vorp:TipRight", "insertamount", 3000)
                        end
                    end)
                    WarMenu.CloseMenu() 
                end
            end
        end
        WarMenu.Display() 
        Citizen.Wait(0) 
    until false
end)

RegisterNetEvent('juSa_Trapper:infosenderforbuy')
AddEventHandler('juSa_Trapper:infosenderforbuy', function(var, buy_item, buy_price)
    TriggerServerEvent('juSa_Trapper:buy', var, buy_item, buy_price)
end)

RegisterNetEvent('juSa_Trapper:infosenderforsell')
AddEventHandler('juSa_Trapper:infosenderforsell', function(sell_item, sell_price, var)
    TriggerServerEvent('juSa_Trapper:sell', sell_item, sell_price, var)
end)