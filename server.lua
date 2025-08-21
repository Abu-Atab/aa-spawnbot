-- سباون البوتات عند تشغيل السكربت
AddEventHandler("onResourceStart", function(res)
    if res ~= GetCurrentResourceName() then return end
    for id, bot in pairs(Config.Bots) do
        TriggerClientEvent("aa-spawnbot:client:spawnbot", -1, id, bot)
    end
end)

-- حفظ بوت جديد
RegisterNetEvent("aa-spawnbot:server:savebot", function(botData)
    local id = #Config.Bots + 1
    Config.Bots[id] = botData

    TriggerClientEvent("aa-spawnbot:client:spawnbot", -1, id, botData)

    local content = "Config = {}\n\nConfig.Bots = " .. lib.table.stringify(Config.Bots, {indent = true})
    SaveResourceFile(GetCurrentResourceName(), "config.lua", content, -1)
end)

-- حذف بوت
RegisterNetEvent("aa-spawnbot:server:deletebot", function(id)
    if not Config.Bots[id] then return end
    Config.Bots[id] = nil

    TriggerClientEvent("aa-spawnbot:client:removebot", -1, id)

    local content = "Config = {}\n\nConfig.Bots = " .. lib.table.stringify(Config.Bots, {indent = true})
    SaveResourceFile(GetCurrentResourceName(), "config.lua", content, -1)
end)
