local debugMode = true

-- Fonction utilitaire pour obtenir un nom lisible du modèle
local function getEntityName(entity)
    local model = GetEntityModel(entity)

    if IsEntityAVehicle(entity) then
        return GetDisplayNameFromVehicleModel(model) or ("veh_%s"):format(model)
    else
        return GetEntityArchetypeName(entity) or ("prop_%s"):format(model)
    end
end

-- Interaction sur véhicule
exports.ox_target:addGlobalVehicle({
    {
        name = 'debug_vehicle',
        icon = 'fa-solid fa-car',
        label = 'Debug ce véhicule',
        onSelect = function(data)
            local entity = data.entity
            if debugMode then
                local coords = GetEntityCoords(entity)
                local heading = GetEntityHeading(entity)
                local model = GetEntityModel(entity)
                local name = getEntityName(entity)

                print(('^1[DEBUG] Véhicule détecté: %s | NetID: %s | Model: %s | Name: %s')
                    :format(entity, NetworkGetNetworkIdFromEntity(entity), model, name))

                print(("^2vector3(%.2f, %.2f, %.2f)"):format(coords.x, coords.y, coords.z))
                print(("^2vector4(%.2f, %.2f, %.2f, %.2f)"):format(coords.x, coords.y, coords.z, heading))
                print(("^2x=%.2f, y=%.2f, z=%.2f, h=%.2f"):format(coords.x, coords.y, coords.z, heading))
            end
            TriggerServerEvent('ox_target_debug:serverLog', 'Véhicule', GetEntityModel(entity))
        end
    }
})

-- Interaction sur objet/prop
exports.ox_target:addGlobalObject({
    {
        name = 'debug_object',
        icon = 'fa-solid fa-cube',
        label = 'Inspecter objet',
        onSelect = function(data)
            local entity = data.entity
            if debugMode then
                local coords = GetEntityCoords(entity)
                local heading = GetEntityHeading(entity)
                local model = GetEntityModel(entity)
                local name = getEntityName(entity)

                print(('^1[DEBUG] Objet détecté: %s | NetID: %s | Model: %s | Name: %s')
                    :format(entity, NetworkGetNetworkIdFromEntity(entity), model, name))

                print(("^2vector3(%.2f, %.2f, %.2f)"):format(coords.x, coords.y, coords.z))
                print(("^2vector4(%.2f, %.2f, %.2f, %.2f)"):format(coords.x, coords.y, coords.z, heading))
                print(("^2x=%.2f, y=%.2f, z=%.2f, h=%.2f"):format(coords.x, coords.y, coords.z, heading))
            end
            TriggerServerEvent('ox_target_debug:serverLog', 'Objet', GetEntityModel(entity))
        end
    }
})

