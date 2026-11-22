local model = joaat('rune_pirogm3x')
local testVehicle = 0
local loading = false

local function clearTestVehicle()
    if DoesEntityExist(testVehicle) then
        DeleteVehicle(testVehicle)
    end
    testVehicle = 0
end

RegisterCommand('pirogm3xtest', function()
    if loading then
        return
    end

    loading = true
    RequestModel(model)
    local deadline = GetGameTimer() + 5000
    while not HasModelLoaded(model) and GetGameTimer() < deadline do
        Wait(0)
    end
    loading = false

    if not HasModelLoaded(model) then
        SetModelAsNoLongerNeeded(model)
        print('[Pirog] Model load timed out.')
        return
    end

    clearTestVehicle()
    local ped = PlayerPedId()
    local position = GetOffsetFromEntityInWorldCoords(ped, 0.0, 5.0, 0.5)
    testVehicle = CreateVehicle(model, position.x, position.y, position.z, GetEntityHeading(ped), false, true)

    if DoesEntityExist(testVehicle) then
        SetVehicleOnGroundProperly(testVehicle)
        print(('[Pirog] Spawned rune_pirogm3x. Model reports %d total seats (target: 4).'):format(
            GetVehicleModelNumberOfSeats(model)
        ))
    else
        print('[Pirog] Spawn failed. Check client entity restrictions and try your admin spawn menu.')
    end

    SetModelAsNoLongerNeeded(model)
end, false)

RegisterCommand('pirogm3xclear', clearTestVehicle, false)

AddEventHandler('onClientResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        clearTestVehicle()
    end
end)





RegisterCommand('pirogm3xdoors', function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle == 0 then vehicle = testVehicle end
    if not DoesEntityExist(vehicle) or GetEntityModel(vehicle) ~= model then
        print('[Pirog M3 Winter Delivery] Spawn a Pirog M3 Winter Delivery first.')
        return
    end
    if NetworkGetEntityIsNetworked(vehicle) and not NetworkHasControlOfEntity(vehicle) then
        return
    end
    local open = GetVehicleDoorAngleRatio(vehicle, 2) < 0.1 and GetVehicleDoorAngleRatio(vehicle, 3) < 0.1
    for door = 2, 3 do
        if open then SetVehicleDoorOpen(vehicle, door, false, false)
        else SetVehicleDoorShut(vehicle, door, false) end
    end
end, false)

