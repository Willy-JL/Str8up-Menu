
Str8upVehicle = {
    description = "Str8up Vehicle Component",
    autoFixVehicle = false
}


function Str8upVehicle.fixVehicle()

    if Game.GetWorkspotSystem():IsActorInWorkspot(Game.GetPlayer()) then
        veh = Game['GetMountedVehicle;GameObject'](Game.GetPlayer())
        if veh then
            vehPS = veh:GetVehiclePS()
            vehVC = veh:GetVehicleComponent()
            veh:DestructionResetGrid()
            veh:DestructionResetGlass()
            vehVC:RepairVehicle()
            vehPS:ForcePersistentStateChanged()
        end
    end

end


function Str8upVehicle.toggleSummonMode()

    Game.GetVehicleSystem():ToggleSummonMode()

end

return Str8upVehicle