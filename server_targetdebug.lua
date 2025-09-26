RegisterNetEvent('ox_target_debug:serverLog', function(type, model)
    local src = source
    local name = GetPlayerName(src)
    print(('[SERVER DEBUG] %s a inspecté un %s | Model: %s'):format(name, type, model))
end)
