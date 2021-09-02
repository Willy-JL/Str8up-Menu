
Str8upUtilities = {
    description = "Str8up Utilities Component",
    newLoadoutName = "New Loadout",
    loadoutSelection = 0
}


function Str8upUtilities.toggleQuestItems()

    player = Game.GetPlayer()
    ssc = Game.GetScriptableSystemsContainer()
    ts = Game.GetTransactionSystem()
    es = ssc:Get(CName.new('EquipmentSystem'))
    espd = es:GetPlayerData(player)
    espd['GetItemInEquipSlot2'] = espd['GetItemInEquipSlot;gamedataEquipmentAreaInt32']
    local slots = {
        Face = 1,
        Feet = 1,
        Head = 1,
        InnerChest = 1,
        Legs = 1,
        OuterChest = 1,
        Weapon = 3
    }
    for k,v in pairs(slots) do
        for i=1,v do
            itemid = espd:GetItemInEquipSlot2(k, i - 1)
            if itemid.tdbid.hash ~= 0 then
                itemdata = ts:GetItemData(player, itemid)
                if itemdata:HasTag("Quest") then
                    itemdata:RemoveDynamicTag("Quest")
                else
                    itemdata:SetDynamicTag("Quest")
                end
            end
        end
    end

end


function Str8upUtilities.untrackQuest()

    Game.untrack()

end


function Str8upUtilities.cancelFallDamage()

    Game.GetTeleportationFacility():Teleport(Game.GetPlayer(), Game.GetPlayer():GetWorldPosition() , EulerAngles.new(0,0,Game.GetPlayer():GetWorldYaw()))

end


function Str8upUtilities.addLoadout(Str8upMenu)

    if Str8upUtilities.newLoadoutName:find("\0", 1, true) then
        addLoadoutName = Str8upUtilities.newLoadoutName:sub(1, Str8upUtilities.newLoadoutName:find("\0", 1, true)-1)
    else
        addLoadoutName = Str8upUtilities.newLoadoutName
    end
    if addLoadoutName == "" then
        addLoadoutName = "New Loadout"
    end
    addLoadoutName = addLoadoutName:gsub("%.", " ")
    addLoadoutFinalName = addLoadoutName
    i = 0
    while Str8upMenu.Data.json.loadouts[addLoadoutFinalName] do
        i = i + 1
        addLoadoutFinalName = addLoadoutName .. " (" .. i .. ")"
    end
    player = Game.GetPlayer()
    ssc = Game.GetScriptableSystemsContainer()
    ts = Game.GetTransactionSystem()
    es = ssc:Get(CName.new('EquipmentSystem'))
    espd = es:GetPlayerData(player)
    espd['GetItemInEquipSlot2'] = espd['GetItemInEquipSlot;gamedataEquipmentAreaInt32']
    local slots = {
        Face = 1,
        Feet = 1,
        Head = 1,
        InnerChest = 1,
        Legs = 1,
        OuterChest = 1,
        Weapon = 3
    }
    Str8upMenu.Data.json.loadouts[addLoadoutFinalName] = {}
    for k,v in pairs(slots) do
        for i=1,v do
            itemid = espd:GetItemInEquipSlot2(k, i - 1)
            if itemid.tdbid.hash ~= 0 then
                if not Str8upMenu.Data.json.loadouts[addLoadoutFinalName][k] then
                    Str8upMenu.Data.json.loadouts[addLoadoutFinalName][k] = {}
                end
                hash = tonumber(itemid.tdbid.hash)
                length = tonumber(itemid.tdbid.length)
                seed = tonumber(itemid.rng_seed)
                Str8upMenu.Data.json.loadouts[addLoadoutFinalName][k][tostring(i-1)] = { hash = hash, length = length, seed = seed }
            end
        end
    end
    Str8upMenu.Data.Save()
    table.insert(Str8upMenu.Data.loadoutNames, addLoadoutFinalName)
    Str8upUtilities.loadoutSelection = #Str8upMenu.Data.loadoutNames - 1

end


function Str8upUtilities.removeLoadout(Str8upMenu)

    if #Str8upMenu.Data.loadoutNames == 0 then
        return
    end
    Str8upMenu.Data.json.loadouts[Str8upMenu.Data.loadoutNames[Str8upUtilities.loadoutSelection+1]] = nil
    Str8upMenu.Data.Save()
    table.remove(Str8upMenu.Data.loadoutNames, Str8upUtilities.loadoutSelection+1)
    if Str8upUtilities.loadoutSelection+1 > #Str8upMenu.Data.loadoutNames then
        Str8upUtilities.loadoutSelection = math.max(#Str8upMenu.Data.loadoutNames - 1, 0)
    end

end


function Str8upUtilities.loadLoadout(Str8upMenu)

    if #Str8upMenu.Data.loadoutNames == 0 then
        return
    end
    player = Game.GetPlayer()
    ssc = Game.GetScriptableSystemsContainer()
    ts = Game.GetTransactionSystem()
    es = ssc:Get(CName.new('EquipmentSystem'))
    espd = es:GetPlayerData(player)
    espd['GetItemInEquipSlot2'] = espd['GetItemInEquipSlot;gamedataEquipmentAreaInt32']
    espd['EquipItem2'] = espd['EquipItem;ItemIDInt32BoolBoolBool']
    espd['UnequipItem2'] = espd['UnequipItem;ItemID']
    local slots = {
        Face = 1,
        Feet = 1,
        Head = 1,
        InnerChest = 1,
        Legs = 1,
        OuterChest = 1,
        Weapon = 3
    }
    for k,v in pairs(slots) do
        for i=1,v do
            itemid = espd:GetItemInEquipSlot2(k, i - 1)
            espd:UnequipItem2(itemid)
            if Str8upMenu.Data.json.loadouts[Str8upMenu.Data.loadoutNames[Str8upUtilities.loadoutSelection+1]][k] then
                if Str8upMenu.Data.json.loadouts[Str8upMenu.Data.loadoutNames[Str8upUtilities.loadoutSelection+1]][k][tostring(i-1)] then
                    item = Str8upMenu.Data.json.loadouts[Str8upMenu.Data.loadoutNames[Str8upUtilities.loadoutSelection+1]][k][tostring(i-1)]
                    itemid = ItemID.new(TweakDBID.new(item.hash, item.length), item.seed)
                    espd:EquipItem2(itemid, i-1, false, false, true)
                end
            end
        end
    end

end

return Str8upUtilities