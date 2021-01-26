function fileExists(filename)
    local f=io.open(filename,"r") if (f~=nil) then io.close(f) return true else return false end
end
function getCWD(mod_name)
    if fileExists("bin/x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "bin/x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("mods/"..mod_name.."/init.lua") then return "mods/"..mod_name.."/" elseif  fileExists(mod_name.."/init.lua") then return mod_name.."/" elseif  fileExists("init.lua") then return "" end
end


Str8upOnUpdate = { 
    description = "Str8up OnUpdate Component",
    rootPath =  getCWD("Str8up Menu"),
    timers = {
        t025s = 0,
        t2s = 0,
        t5s = 0
    }
}


function Str8upOnUpdate.Run(Str8upMenu, deltaTime)

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