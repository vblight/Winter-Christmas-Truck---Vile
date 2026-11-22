local model = joaat('rune_pirogm3x')

local function openBarnDoors(vehicle)
    local deadline = GetGameTimer() + 500
    while DoesEntityExist(vehicle) and not NetworkHasControlOfEntity(vehicle) and GetGameTimer() < deadline do
        NetworkRequestControlOfEntity(vehicle)
        Wait(0)
    end
    if not DoesEntityExist(vehicle) or not NetworkHasControlOfEntity(vehicle) then return false end

    SetVehicleDoorOpen(vehicle, 2, false, false)
    SetVehicleDoorOpen(vehicle, 3, false, false)
    return true
end

RegisterNetEvent('qb-inventory:client:openInventory', function(_, inventory)
    if GetResourceState('qb-inventory') ~= 'started' or not inventory
        or type(inventory.name) ~= 'string' or inventory.name:sub(1, 6) ~= 'trunk-' then return end

    local player = PlayerPedId()
    if IsPedInAnyVehicle(player, false) then return end
    local position = GetEntityCoords(player)
    local vehicle, closest = 0, 2.0
    local bounds = GetModelDimensions(model)
    for _, candidate in ipairs(GetGamePool('CVehicle')) do
        if GetEntityModel(candidate) == model and NetworkGetEntityIsNetworked(candidate)
            and 'trunk-' .. GetVehicleNumberPlateText(candidate) == inventory.name then
            local rear = GetOffsetFromEntityInWorldCoords(candidate, 0.0, bounds.y, 0.0)
            local distance = #(position - rear)
            if distance < closest then
                vehicle, closest = candidate, distance
            end
        end
    end
    if vehicle == 0 then return end

    local wasOpen = {
        [2] = GetVehicleDoorAngleRatio(vehicle, 2) > 0.05,
        [3] = GetVehicleDoorAngleRatio(vehicle, 3) > 0.05
    }
    if not openBarnDoors(vehicle) then return end

    local deadline = GetGameTimer() + 1000
    while not IsNuiFocused() and GetGameTimer() < deadline do Wait(25) end
    while DoesEntityExist(vehicle) and IsNuiFocused() do Wait(100) end
    if not DoesEntityExist(vehicle) or not NetworkHasControlOfEntity(vehicle) then return end
    for door = 2, 3 do
        if not wasOpen[door] then SetVehicleDoorShut(vehicle, door, false) end
    end
end)
