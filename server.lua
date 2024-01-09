local VorpInv = {} 
VorpInv = exports.vorp_inventory:vorp_inventoryApi()

local VORPcore = {} 
TriggerEvent("getCore", function(core)
  VORPcore = core
end)

local randomizedcoords = 0
local spawn = 0
local d = 0
RegisterServerEvent('juSa_Trapper:randomlocation')
AddEventHandler('juSa_Trapper:randomlocation', function()
  if randomizedcoords == 0 then
    d = math.random(1, #Config.TrapperSetup.spawns)
    spawn = Config.TrapperSetup.spawns[d]
    randomizedcoords = randomizedcoords + 1
  end
  TriggerClientEvent('juSa_Trapper:spawnNPC', source, spawn)
end)

RegisterServerEvent('juSa_Trapper:catchinputforsell')
AddEventHandler('juSa_Trapper:catchinputforsell', function(sell_item, sell_price, var)
  TriggerClientEvent('juSa_Trapper:infosenderforsell', source, sell_item, sell_price, var)
end)

RegisterServerEvent('juSa_Trapper:sell') 
AddEventHandler('juSa_Trapper:sell', function(sell_item, sell_price, var) 
  local amountcatch = 0
  local price2 = tonumber(sell_price) 
  local Character = VORPcore.getUser(source).getUsedCharacter 
  local itemcount = VorpInv.getItemCount(source, sell_item)
  if itemcount >= tonumber(var) then 
    VorpInv.subItem(source, sell_item, var) 
    repeat
      Citizen.Wait(0)
      Character.addCurrency(0, price2) 
      amountcatch = amountcatch + 1
    until amountcatch >= var
  elseif itemcount < tonumber(var) then
    VORPcore.NotifyBottomRight(source, Config.Language.NoItem, 4000) 
  end
end)

RegisterServerEvent('juSa_Trapper:catchinputforbuy')
AddEventHandler('juSa_Trapper:catchinputforbuy', function( var, buy_item, buy_price)
  TriggerClientEvent('juSa_Trapper:infosenderforbuy', source,  var, buy_item, buy_price)
end)

RegisterServerEvent('juSa_Trapper:buy')
AddEventHandler('juSa_Trapper:buy', function(var, buy_item, buy_price) 
  local totalamountmultiplied = 	var * buy_price
  local Character = VORPcore.getUser(source).getUsedCharacter 
  local currcash = Character.money
  if currcash >= totalamountmultiplied then
    VorpInv.addItem(source, buy_item, var)
    Character.removeCurrency(0, totalamountmultiplied)
  elseif currcash < totalamountmultiplied then
    VORPcore.NotifyBottomRight(source, Config.Language.NoMoney, 4000) 
  end
end)

RegisterServerEvent('juSa_Trapper:discord')
AddEventHandler("juSa_Trapper:discord", function(type, var, item, price)
  local User = VORPcore.getUser(source)
  local Character = User.getUsedCharacter
  local CharName
  local title
  if Character ~= nil then
    if Character.lastname ~= nil then
      CharName = Character.firstname .. ' ' .. Character.lastname
    else
      CharName = Character.firstname
    end
  end
  local DiscordWebhook = Config.DiscordWebHook
  if type == sell then
    title = Config.Language.discord_sold
  elseif type == buy then
    title = Config.Language.discord_bought
  end
  local Content = {
      username = Config.DiscordBotName,
      content = Config.Language.discord_title,
      embeds = {{
          title = title,
          description = CharName .. " " .. title .. " " .. tostring(var) .. "x " .. item .. Config.Language.discord_price .. tostring(price),
          color = 16711680 -- embed color
      }}
  }
  
  PerformHttpRequest(DiscordWebhook, function(err, text, headers)
      if err == 200 then
          print("message send: " .. text)
      else
          print("error trying to send message: " .. err)
      end
  end, "POST", json.encode(Content), {["Content-Type"] = "application/json"})
end)