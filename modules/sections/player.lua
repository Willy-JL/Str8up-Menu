
Str8upPlayer = {
    description = "Str8up Player Component"
}


function Str8upPlayer.undress()

    if not Game.GetPlayer():IsNaked() then
        Game.UnequipItem('Face', 0)
        Game.UnequipItem('Feet', 0)
        Game.UnequipItem('Head', 0)
        Game.UnequipItem('Legs', 0)
        Game.UnequipItem('OuterChest', 0)
        Game.UnequipItem('Outfit', 0)
        Game.UnequipItem('InnerChest', 0)
    end

end


function Str8upPlayer.toggleBra()

    ssc = Game.GetScriptableSystemsContainer()
    es = ssc:Get(CName.new('EquipmentSystem'))
    espd = es:GetPlayerData(Game.GetPlayer())
    espd['GetItemInEquipSlot2'] = espd['GetItemInEquipSlot;gamedataEquipmentAreaInt32']
    itemid = espd:GetItemInEquipSlot2("UnderwearTop", 0)
    if itemid.tdbid.hash == 0 then
        Game.EquipItem('Items.Underwear_Basic_01_Top')
    else
        Game.UnequipItem('UnderwearTop', 0)
    end

end


function Str8upPlayer.togglePanties()

    ssc = Game.GetScriptableSystemsContainer()
    es = ssc:Get(CName.new('EquipmentSystem'))
    espd = es:GetPlayerData(Game.GetPlayer())
    espd['GetItemInEquipSlot2'] = espd['GetItemInEquipSlot;gamedataEquipmentAreaInt32']
    itemid = espd:GetItemInEquipSlot2("UnderwearBottom", 0)
    if itemid.tdbid.hash == 0 then
        Game.EquipItem('Items.Underwear_Basic_01_Bottom')
    else
        Game.UnequipItem('UnderwearBottom', 0)
    end

end

return Str8upPlayer