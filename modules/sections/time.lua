function fileExists(filename)
    local f=io.open(filename,"r") if (f~=nil) then io.close(f) return true else return false end
end
function getCWD(mod_name)
    if fileExists("bin/x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "bin/x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("mods/"..mod_name.."/init.lua") then return "mods/"..mod_name.."/" elseif  fileExists(mod_name.."/init.lua") then return mod_name.."/" elseif  fileExists("init.lua") then return "" end
end


Str8upTime = { 
    description = "Str8up Time Component",
    rootPath =  getCWD("Str8up Menu"),
    h = 0,
    m = 0,
    s = 0,
    stopTime = false,
    superHot = false,
    timeMultiplier = 1
}


function Str8upTime.setTime()

    Game.GetTimeSystem():SetGameTimeByHMS(Str8upTime.h, Str8upTime.m, Str8upTime.s)

end


function Str8upTime.updateStopTime()

    if Str8upTime.stopTime then
        Game.GetTimeSystem():SetPausedState(true, CName.new("Str8upMenu"))
      else
        Game.GetTimeSystem():SetPausedState(false, CName.new("Str8upMenu"))
      end

end


function Str8upTime.updateSuperHot()

    if Str8upTime.superHot then
        Game.GetTimeSystem():SetIgnoreTimeDilationOnLocalPlayerZero(true)
        Game.SetTimeDilation(0.0000000000001)
      else
        Game.GetTimeSystem():SetIgnoreTimeDilationOnLocalPlayerZero(false)
        Game.SetTimeDilation(0)
      end

end

return Str8upTime