
Str8upOnUpdate = {
    description = "Str8up OnUpdate Component",
    timers = {
        t0125s = 0,
        t2s = 0
    }
}


function Str8upOnUpdate.Run(Str8upMenu, deltaTime)

    if Str8upMenu.UI.popupTimeout ~= 0 then
        Str8upMenu.UI.popupTimeout = Str8upMenu.UI.popupTimeout - deltaTime
        if Str8upMenu.UI.popupTimeout < 0 then
            Str8upMenu.UI.popupTimeout = 0
        end
    end

    Str8upOnUpdate.timers.t0125s = Str8upOnUpdate.timers.t0125s + deltaTime
    if Str8upOnUpdate.timers.t0125s > 0.125 then
        Str8upOnUpdate.timers.t0125s = Str8upOnUpdate.timers.t0125s - 0.125
        if Str8upMenu.Time.stopTime then
            times = Game.GetTimeSystem()
            times:SetGameTimeBySeconds(Str8upMenu.Time.stopTimeValue)
        elseif Str8upMenu.Time.timeMultiplier ~= 1 then
            times = Game.GetTimeSystem()
            if not times:IsPausedState() then
                times:SetGameTimeBySeconds(math.floor(times:GetGameTimeStamp())+((Str8upMenu.Time.timeMultiplier-1)))
            end
        end
    end

    Str8upOnUpdate.timers.t2s = Str8upOnUpdate.timers.t2s + deltaTime
    if Str8upOnUpdate.timers.t2s > 2 then
        Str8upOnUpdate.timers.t2s = Str8upOnUpdate.timers.t2s - 2
        if Str8upMenu.Vehicle.autoFixVehicle then
            Str8upMenu.Vehicle.fixVehicle()
        end
        if Str8upMenu.Cheats.godMode then
            Str8upMenu.Cheats.updateGodMode()
        end
    end

    if Str8upMenu.Cheats.noFall then
        vel = Game.GetPlayer():GetVelocity().z
        if vel < -15 then
            pos = Game.GetPlayer():GetWorldPosition()
            closeToGround = not Game.GetSenseManager():IsPositionVisible(pos, Vector4.new(pos.x, pos.y, pos.z + (vel * deltaTime) - 1, pos.w))
            if closeToGround then
                Str8upMenu.Utilities.stopFall()
            end
        end
    end

    if Str8upMenu.Cheats.noClip then
        if Str8upMenu.Cheats.noClipControls.forward then
            Str8upMenu.Cheats.noClipTp("forward")
        end
        if Str8upMenu.Cheats.noClipControls.backward then
            Str8upMenu.Cheats.noClipTp("backward")
        end
        if Str8upMenu.Cheats.noClipControls.left then
            Str8upMenu.Cheats.noClipTp("left")
        end
        if Str8upMenu.Cheats.noClipControls.right then
            Str8upMenu.Cheats.noClipTp("right")
        end
        if Str8upMenu.Cheats.noClipControls.up then
            Str8upMenu.Cheats.noClipTp("up")
        end
        if Str8upMenu.Cheats.noClipControls.down then
            Str8upMenu.Cheats.noClipTp("down")
        end
    end

end

return Str8upOnUpdate