
Str8upData = { 
    description = "Str8up Data Component"
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