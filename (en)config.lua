Config = {}
Config.DiscordIntegration = true
Config.DiscordWebHook = ""
Config.DiscordBotName= "juSa Trapper"
Config.Debug = false

Config.TrapperSetup = {
    blip = true,
    blipname = "Trapper",
    blipsprite = -1406874050, -- https://filmcrz.github.io/blips/
    model = "u_m_m_sdtrapper_01",
    spawns = { 
        {x = 1983.09, y = 1191.26, z = 171.4, h = 2.42}, --Grizzlies East
        {x = -71.9, y = -387.2, z = 72.24, h = 187.21}, --Flatneck Station
        {x = -1977.93, y = -1649.79, z = 117.13, h = -4.69}, --Mantanita Post
    },
}

Config.Shop = {

    userandomprice = true, -- set to true, if you want random prices 

    buy = {--This is what players can buy
        { itemdbname = 'meat', displayname = 'meat', price = 0.16, randomprice = math.random(14, 18)/100 }, --math.random(25, 55)/100 will cost the player a price between 0,25 and 0,55$
    },

    sell = {-- This is what players can sell
        { itemdbname = 'meat', displayname = 'meat', price = 0.07, randomprice = math.random(5, 9)/100 }, --math.random(25, 55)/100 will cost the player a price between 0,25 and 0,55$
    },
}

------------------- TRANSLATE HERE --------------
Config.Language = {

    press = "press",
    talk = "talk to npc",
    title = "Trapper",
    Menu_Title_Sell = 'Sell',
    Menu_Title_Buy = 'Buy',
    Menu_SubTitle_Sell = 'Sell Items',
    Menu_SubTitle_Buy = 'Buy Items',
    SubMenu_Head_Sell = "Sell Items",
    SubMenu_Head_Buy = "Buy Items",
    Shopmenu_sell = "Sell ",
    Shopmenu_for = " for ",
    Shopmenu_buy = "Buy ",
    input_button = "confirm",
    input_placeholder = "insert amount",
    input_header = "amount",

    NoItem = "You do not have this item.",
    NoMoney = "You do not have enough cash.",

    discord_title = "Something happend in your juSa_trapper Script.",
    discord_bought = " bought ",
    discord_sold = " sold ",
    discord_price = " for ",
}

Config.keys = {
    G = 0x760A9C6F, -- talk/interact
}