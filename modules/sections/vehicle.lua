function fileExists(filename)
    local f=io.open(filename,"r") if (f~=nil) then io.close(f) return true else return false end
end
function getCWD(mod_name)
    if fileExists("bin/x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "bin/x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("mods/"..mod_name.."/init.lua") then return "mods/"..mod_name.."/" elseif  fileExists(mod_name.."/init.lua") then return mod_name.."/" elseif  fileExists("init.lua") then return "" end
end


Str8upVehicle = { 
    description = "Str8up Vehicle Component",
    rootPath =  getCWD("Str8up Menu"),
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

return Str8upVehicle