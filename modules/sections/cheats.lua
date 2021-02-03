
Str8upCheats = { 
    description = "Str8up Cheats Component",
    moneyToAdd = 0,
    componentAmount = 0,
    componentToAdd = 0,
    componentNames = { "Crafting Legendary", "Crafting Epic", "Crafting Rare", "Crafting Uncommon", "Crafting Common", "Upgrade Legendary", "Upgrade Epic", "Upgrade Rare", "QHack Legendary", "Qhack Epic", "QHack Rare", "QHack Uncommon" },
    componentIDs = { "Items.LegendaryMaterial1", "Items.EpicMaterial1", "Items.RareMaterial1", "Items.UncommonMaterial1", "Items.CommonMaterial1", "Items.LegendaryMaterial2", "Items.EpicMaterial2", "Items.RareMaterial2", "Items.QuickHackLegendaryMaterial1", "Items.QuickHackEpicMaterial1", "Items.QuickHackRareMaterial1", "Items.QuickHackUncommonMaterial1" },
    itemToAdd = "Items.",
    itemAmount = 1,
    infStamina = false,
    disablePolice = false,
    noFall = false,
    noClip = false,
    noClipSpeed = 1
}


function Str8upCheats.addMoney()

    Game.AddToInventory("Items.money", Str8upCheats.moneyToAdd)

end


function Str8upCheats.addComponents()

    Game.AddToInventory(Str8upCheats.componentIDs[Str8upCheats.componentToAdd+1], Str8upCheats.componentAmount)

end


function Str8upCheats.addItems()

    Str8upCheats.itemToAdd = Str8upCheats.itemToAdd:gsub("Items.", "")
    Str8upCheats.itemToAdd = Str8upCheats.itemToAdd:gsub("Game.AddToInventory[(]\"", "")
    Str8upCheats.itemToAdd = Str8upCheats.itemToAdd:gsub("\",1[)]", "")
    Game.AddToInventory("Items." .. Str8upCheats.itemToAdd, Str8upCheats.itemAmount)

end


function Str8upCheats.updateInfStamina()

    Game.InfiniteStamina(Str8upCheats.infStamina)

end


function Str8upCheats.updateDisablePolice()

    if Str8upCheats.disablePolice then
        Game.PrevSys_off()
    else
        Game.PrevSys_on()
    end

end


function Str8upCheats.updateNoClip()

    if Str8upCheats.noClip then
        times = Game.GetTimeSystem()
        times:SetIgnoreTimeDilationOnLocalPlayerZero(false)
        Game.SetTimeDilation(0.0000000000001)
    else
        Game.SetTimeDilation(0)
    end

end


function Str8upCheats.noClipTp(direction)

    if Str8upCheats.noClip then
        if direction == "forward" or direction == "backward" then
            dir = Game.GetCameraSystem():GetActiveCameraForward()
        elseif direction == "right" or direction == "left" then
            dir = Game.GetCameraSystem():GetActiveCameraRight()
        end
        pos = Game.GetPlayer():GetWorldPosition()
        if direction == "forward" or direction == "right" then
            xNew = pos.x + (dir.x * Str8upCheats.noClipSpeed)
            yNew = pos.y + (dir.y * Str8upCheats.noClipSpeed)
            zNew = pos.z + (dir.z * Str8upCheats.noClipSpeed)
        elseif direction == "backward" or direction == "left" then
            xNew = pos.x - (dir.x * Str8upCheats.noClipSpeed)
            yNew = pos.y - (dir.y * Str8upCheats.noClipSpeed)
            zNew = pos.z - (dir.z * Str8upCheats.noClipSpeed)
        elseif direction == "up" then
            xNew = pos.x
            yNew = pos.y
            zNew = pos.z + (0.5 * Str8upCheats.noClipSpeed)
        elseif direction == "down" then
            xNew = pos.x
            yNew = pos.y
            zNew = pos.z - (0.5 * Str8upCheats.noClipSpeed)
        end
        tpTo = Vector4.new(xNew,yNew,zNew,pos.w)
        Game.GetTeleportationFacility():Teleport(Game.GetPlayer(), tpTo , EulerAngles.new(0,0,Game.GetPlayer():GetWorldYaw()))
        Game.Heal("100000", "0")
    end

end

return Str8upCheats