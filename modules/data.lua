function fileExists(filename)
    local f=io.open(filename,"r") if (f~=nil) then io.close(f) return true else return false end
end
function getCWD(mod_name)
    if fileExists("bin/x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "bin/x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("mods/"..mod_name.."/init.lua") then return "mods/"..mod_name.."/" elseif  fileExists(mod_name.."/init.lua") then return mod_name.."/" elseif  fileExists("init.lua") then return "" end
end


Str8upData = { 
    description = "Str8up Data Component",
    rootPath =  getCWD("Str8up Menu")
}

Str8upData.dataPath = Str8upData.rootPath .. "str8up_data.json"

function Str8upData.Load()

    if fileExists(Str8upData.dataPath) then
        f = io.open(Str8upData.dataPath, "r")
        Str8upData.json = json.decode(f:read("*all"))
        io.close(f)
    else
        f = io.open(Str8upData.dataPath, "w")
        f:write("{\n    \"warps\": {\n    },\n    \"loadouts\": {\n    }\n}")
        io.close(f)
        f = io.open(Str8upData.dataPath, "r")
        Str8upData.json = json.decode(f:read("*all"))
        io.close(f)
    end

    Str8upData.warpsNames = {}
    for warp, _ in pairs(Str8upData.json.warps) do
        table.insert(Str8upData.warpsNames, warp)
    end
    Str8upData.loadoutNames = {}
    for loadout, _ in pairs(Str8upData.json.loadouts) do
        table.insert(Str8upData.loadoutNames, loadout)
    end

end


function Str8upData.Save()

    f = io.open(Str8upData.dataPath, "w+")
    f:write(json.encode(Str8upData.json))
    io.close(f)

end

return Str8upData