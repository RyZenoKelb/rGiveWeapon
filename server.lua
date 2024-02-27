RegisterNetEvent('giveWeapon')
AddEventHandler('giveWeapon', function(weaponHash)
    local source = source
    local player = ESX.GetPlayerFromId(source)

    if player then
        player.addWeapon(weaponHash, 1000) -- Ajoute l'arme au joueur
    end
end)
