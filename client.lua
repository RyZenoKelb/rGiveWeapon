local weapons = {
    {name = "Pistolet", hash = "weapon_pistol"},
    {name = "Fusil à pompe", hash = "weapon_pumpshotgun"},
    {name = "AK-47", hash = "weapon_ak47"},
    {name = "Fusil de précision", hash = "weapon_sniperrifle"},
    {name = "Lance-roquettes", hash = "weapon_rpg"},
    {name = "Mitraillette", hash = "weapon_smg"},
    {name = "Fusil à lunette", hash = "weapon_sniperrifle"},
    {name = "Mitraillette lourde", hash = "weapon_combatmg"},
    {name = "Grenade", hash = "weapon_grenade"},
}

RMenu.Add('menu', 'main', RageUI.CreateMenu("Menu d'armes", "Sélectionnez une arme"))
RMenu:Get('menu', 'main'):SetRectangleBanner(0, 150, 0, 255) -- Couleur verte pour le titre du menu
RMenu:Get('menu', 'main').Closed = function()
    -- Actions à effectuer lorsque le menu est fermé
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, 57) then -- Touche F10
            OpenGiveWeaponMenu()
        end
    end
end)

function OpenGiveWeaponMenu()
    RageUI.Visible(RMenu:Get('menu', 'main'), true)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if RageUI.Visible(RMenu:Get('menu', 'main')) then
            RageUI.Draw2D()
            for k, v in pairs(weapons) do
                RageUI.Button(v.name, nil, {}, true, {
                    onSelected = function()
                        TriggerServerEvent('giveWeapon', v.hash)
                    end
                })
                -- Ajoute des tirets entre chaque arme sauf la dernière
                if k < #weapons then
                    RageUI.Separator()
                end
            end
        end
    end
end)
