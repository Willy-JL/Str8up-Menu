
Str8upUtilities = {
    description = "Str8up Utilities Component"
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


function Str8upUtilities.stopFall()

    Game.GetTeleportationFacility():Teleport(Game.GetPlayer(), Game.GetPlayer():GetWorldPosition() , EulerAngles.new(0,0,Game.GetPlayer():GetWorldYaw()))

end

return Str8upUtilities