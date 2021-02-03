
Str8upOnUpdate = { 
    description = "Str8up OnUpdate Component",
    timers = {
        t025s = 0,
        t2s = 0,
        t5s = 0
    }
}


function Str8upOnUpdate.Run(Str8upMenu, deltaTime)

    if Str8upMenu.UI.popupTimeout ~= 0 then
        Str8upMenu.UI.popupTimeout = Str8upMenu.UI.popupTimeout - deltaTime
        if Str8upMenu.UI.popupTimeout < 0 then
            Str8upMenu.UI.popupTimeout = 0
        end
    end

    Str8upOnUpdate.timers.t025s = Str8upOnUpdate.timers.t025s + deltaTime
    if Str8upOnUpdate.timers.t025s > 0.25 then
        Str8upOnUpdate.timers.t025s = Str8upOnUpdate.timers.t025s - 0.25
        if Str8upMenu.Time.timeMultiplier ~= 1 then
            times = Game.GetTimeSystem()
            if not times:IsPausedState() then
                times:SetGameTimeBySeconds(math.floor(times:GetGameTimeStamp())+((Str8upMenu.Time.timeMultiplier-1)*2))
            end
        end
    end

    Str8upOnUpdate.timers.t2s = Str8upOnUpdate.timers.t2s + deltaTime
    if Str8upOnUpdate.timers.t2s > 2 then
        Str8upOnUpdate.timers.t2s = Str8upOnUpdate.timers.t2s - 2
        if Str8upMenu.Vehicle.autoFixVehicle then
            Str8upMenu.Vehicle.fixVehicle()
        end
    end

    Str8upOnUpdate.timers.t5s = Str8upOnUpdate.timers.t5s + deltaTime
    if Str8upOnUpdate.timers.t5s > 5 then
        Str8upOnUpdate.timers.t5s = Str8upOnUpdate.timers.t5s - 5
        if Str8upMenu.Time.stopTime then
            Str8upMenu.Time.updateStopTime()
        end
    end

    if Str8upMenu.Cheats.noFall then
        pos = Game.GetPlayer():GetWorldPosition()
        closeToGround = not Game.GetSenseManager():IsPositionVisible(pos, Vector4.new(pos.x, pos.y, pos.z - 20, pos.w))
        vel = Game.GetPlayer():GetVelocity().z
        if closeToGround and vel < -15 then
            Str8upMenu.Utilities.cancelFallDamage()
        end
    end

end

return Str8upOnUpdate