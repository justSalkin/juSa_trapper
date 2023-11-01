Config = {}

--webhook, place your webhook url here
ShopWebhook = ''

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
        { itemdbname = 'meat', displayname = 'Fleisch', price = 0.16, randomprice = math.random(14, 18)/100 }, --math.random(25, 55)/100 will cost the player a price between 0,25 and 0,55$
        { itemdbname = 'poultry', displayname = 'Geflügel', price = 0.2, randomprice = math.random(18, 22)/100 },
        { itemdbname = 'feather', displayname = 'Federn', price = 0.15, randomprice = math.random(13, 17)/100 },
        { itemdbname = 'small_leather', displayname = 'Lederstück', price = 1, randomprice = math.random(80, 120)/100 },
        { itemdbname = 'animal_tendon', displayname = 'Tiersehne', price = 0.6, randomprice = math.random(55, 65)/100 },
        { itemdbname = 'big_leather', displayname = 'Großes Leder', price = 2, randomprice = math.random(180, 220)/100 },
        { itemdbname = 'snake_poison', displayname = 'Schlangengift', price = 1.2, randomprice = math.random(100, 140)/100 },
    },

    sell = {-- This is what players can sell
        { itemdbname = 'meat', displayname = 'Fleisch', price = 0.07, randomprice = math.random(5, 9)/100 }, --math.random(25, 55)/100 will cost the player a price between 0,25 and 0,55$
        { itemdbname = 'poultry', displayname = 'Geflügel', price = 0.08, randomprice = math.random(6, 10)/100 },
        { itemdbname = 'feather', displayname = 'Federn', price = 0.04, randomprice = math.random(3, 5)/100 },
        { itemdbname = 'crab_meat', displayname = 'Krabbenfleisch', price = 0.1, randomprice = math.random(8, 12)/100 },
        { itemdbname = 'small_leather', displayname = 'Lederstück', price = 0.4, randomprice = math.random(35, 45)/100 },
        { itemdbname = 'frog_leg_meat', displayname = 'Froschschenkel', price = 0.2, randomprice = math.random(16, 24)/100 },
        { itemdbname = 'gamey_meat', displayname = 'Wildfleisch', price = 0.12, randomprice = math.random(10, 14)/100 },
        { itemdbname = 'fat', displayname = 'Tierfett', price = 0.15, randomprice = math.random(12, 18)/100 },
        { itemdbname = 'bison_meat', displayname = 'Bison Fleisch', price = 0.9, randomprice = math.random(80, 100)/100 },
        { itemdbname = 'animal_tendon', displayname = 'Tiersehne', price = 0.26, randomprice = math.random(22, 30)/100 },
        { itemdbname = 'big_leather', displayname = 'Großes Leder', price = 1, randomprice = math.random(90, 110)/100 },
        { itemdbname = 'snake_poison', displayname = 'Schlangengift', price = 0.45, randomprice = math.random(40, 50)/100 },
        { itemdbname = 'animal_bone', displayname = 'Tierknochen', price = 0.1, randomprice = math.random(8, 12)/100 },
    },
}

------------------- TRANSLATE HERE --------------
Config.Language = {

    press = "Drücke",
    talk = "Trapper ansprechen",
    title = "Trapper",
    Menu_Title_Sell = 'Verkaufen',
    Menu_Title_Buy = 'Kaufen',
    Menu_SubTitle_Sell = '',
    Menu_SubTitle_Buy = 'e',
    SubMenu_Head_Sell = "Verkaufe Gegenstände",
    SubMenu_Head_Buy = "Kaufe Gegenstände",
    Shopmenu_sell = "Verkaufe ",
    Shopmenu_for = " für ",
    Shopmenu_buy = "Kaufe ",
    input_button = "bestätigen",
    input_placeholder = "Ganzzahlige Eingabe",
    input_header = "Anzahl",

    NoItem = "Du hast nicht genügend Gegenstände.",
    NoMoney = "Du hast nicht genügend Bargeld.",
}

Config.keys = {
    G = 0x760A9C6F, -- talk/interact
}