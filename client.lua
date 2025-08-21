local spawnedBots = {}
local debugMode = false

-- 🔹 الحصول على مظهر اللاعب
local function GetPedAppearance(ped)
    local appearance = {}

    appearance.clothing = {}
    for i = 0, 11 do
        appearance.clothing[i] = {
            drawable = GetPedDrawableVariation(ped, i),
            texture  = GetPedTextureVariation(ped, i),
            palette  = GetPedPaletteVariation(ped, i)
        }
    end

    appearance.props = {}
    for i = 0, 7 do
        appearance.props[i] = {
            prop = GetPedPropIndex(ped, i),
            texture = GetPedPropTextureIndex(ped, i)
        }
    end

    appearance.hairColor1, appearance.hairColor2 = GetPedHairColor(ped)
    appearance.eyeColor = GetPedEyeColor(ped)

    return appearance
end

-- 🔹 تطبيق المظهر
local function SetPedAppearance(ped, appearance)
    for comp, v in pairs(appearance.clothing) do
        SetPedComponentVariation(ped, comp, v.drawable, v.texture, v.palette)
    end
    for prop, v in pairs(appearance.props) do
        if v.prop and v.prop ~= -1 then
            SetPedPropIndex(ped, prop, v.prop, v.texture, true)
        else
            ClearPedProp(ped, prop)
        end
    end
    if appearance.hairColor1 then
        SetPedHairColor(ped, appearance.hairColor1, appearance.hairColor2 or 0)
    end
    if appearance.eyeColor then
        SetPedEyeColor(ped, appearance.eyeColor)
    end
end

-- 🔹 سباون بوت
RegisterNetEvent("aa-spawnbot:client:spawnbot", function(id, data)
    RequestModel(data.pedModel)
    while not HasModelLoaded(data.pedModel) do Wait(0) end

    local _, groundZ = GetGroundZFor_3dCoord(data.coords.x, data.coords.y, data.coords.z, true)
    local ped = CreatePed(4, data.pedModel, data.coords.x, data.coords.y, groundZ, data.coords.w, false, true)

    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)

    SetPedAppearance(ped, data.appearance)
    TaskStartScenarioInPlace(ped, data.emote, 0, true)

    spawnedBots[id] = ped
end)

-- 🔹 حذف بوت
RegisterNetEvent("aa-spawnbot:client:removebot", function(id)
    if spawnedBots[id] and DoesEntityExist(spawnedBots[id]) then
        DeleteEntity(spawnedBots[id])
        spawnedBots[id] = nil
    end
end)

-- 🔹 أمر سباون بوت
RegisterCommand("spawnmybot", function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)

    local _, groundZ = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z, true)
    coords = vector3(coords.x, coords.y, groundZ)

    local model = GetEntityModel(ped)
    local appearance = GetPedAppearance(ped)

    local input = lib.inputDialog("Spawn Bot", {
        {type = "input", label = "Emote (مثال: WORLD_HUMAN_SMOKING)", required = true}
    })
    if not input or not input[1] then return end

    TriggerServerEvent("aa-spawnbot:server:savebot", {
        coords = vec4(coords.x, coords.y, coords.z, heading),
        pedModel = model,
        appearance = appearance,
        emote = input[1]
    })
end, false)

-- 🔹 أمر ديبج
RegisterCommand("botdebug", function(_, args)
    if args[1] == "on" then
        debugMode = true
        lib.notify({title = "Debug", description = "Bot Debug ON", type = "inform"})
        CreateThread(function()
            while debugMode do
                local playerCoords = GetEntityCoords(PlayerPedId())
                for id, ped in pairs(spawnedBots) do
                    if DoesEntityExist(ped) then
                        local pedCoords = GetEntityCoords(ped)
                        local dist = #(playerCoords - pedCoords)
                        if dist < 50.0 then
                            DrawText3D(pedCoords.x, pedCoords.y, pedCoords.z + 1.0, ("Bot ID: %s"):format(id))
                        end
                    end
                end
                Wait(0)
            end
        end)
    elseif args[1] == "off" then
        debugMode = false
        lib.notify({title = "Debug", description = "Bot Debug OFF", type = "inform"})
    end
end)

-- 🔹 دالة رسم نص
function DrawText3D(x, y, z, text)
    SetDrawOrigin(x, y, z, 0)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end
