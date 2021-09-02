--    __     __     __     __         __         __  __       __     __          --
--   /\ \  _ \ \   /\ \   /\ \       /\ \       /\ \_\ \     /\ \   /\ \         --
--   \ \ \/ ".\ \  \ \ \  \ \ \____  \ \ \____  \ \____ \   _\_\ \  \ \ \____    --
--    \ \__/".~\_\  \ \_\  \ \_____\  \ \_____\  \/\_____\ /\_____\  \ \_____\   --
--     \/_/   \/_/   \/_/   \/_____/   \/_____/   \/_____/ \/_____/   \/_____/   --
--  ---------------------------------------------------------------------------  --
--  This mod was made by WillyJL (WillyJL#3633) from the CP2077 Modding Discord  --
--                    https://github.com/Willy-JL/str8up-menu                    --
--  ------------------------------- CONDITIONS --------------------------------  --
--                     You can use use this mod as long as:                      --
--           ~ You don't reupload / repost this without my permission            --
--  ~ You credit me / the original author when you use a code snippet from here  --
--   ~ You don't fork this and make a competing version available for download   --
--  --------------------------------- CREDITS ---------------------------------  --
--        Full credits to Architect for the mod file layout and structure        --
--      Credits to keanuFreeze / keanuWheeze for the original NoClip script      --
--     Credits to Expired for the awesome equipped item iterator base script     --
--                Credits to Ming for the cleaner cwd pathing fix                --
--                Credits to Architect for the Fix Vehicle script                --
--                 Credits to PerfNormBeast for the NoFall logic                 --
--             Credits to fuegovic for the Disable Police functions              --
--         Credits to MaximiliumM for the Undress / Underwear functions          --
--         Credits to the CET Wiki for the Special Teleport coordinates          --
--      Credits to ZeroBiotic (https://github.com/xray) for the warps idea       --
--    Everything else either I made myself or is too commonly known to credit    --
--               Thanks to NonameNonumber for the coding pointers                --
--   Huge thanks to Architect, Expired and WhySoSerious? for their immense help  --
--   Huge thanks to yamashi, WhySoSerious?, all the CET team and the community   --
--  ---------------------------------------------------------------------------  --


function fileExists(filename)
    local f=io.open(filename,"r") if (f~=nil) then io.close(f) return true else return false end
end
function getCWD(mod_name)
    if fileExists("bin/x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "bin/x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("mods/"..mod_name.."/init.lua") then return "mods/"..mod_name.."/" elseif  fileExists(mod_name.."/init.lua") then return mod_name.."/" elseif  fileExists("init.lua") then return "" end
end


Str8upMenu = {
    description = "Str8up Menu",
    version = "2.4h1",
    rootPath =  getCWD("Str8up Menu"),
    drawWindow = false,
    oldDrawWindow = false
}

-- Hack: Multiple string subindexes with . like Str8upMenu["Cheats.noClip"], thanks NonameNonumber !
setmetatable(Str8upMenu, {
    __index = function(the_table, key)
        while key:find("%.") do
            the_table = rawget(the_table, key:sub(1, key:find("%.")-1))
            key = key:sub(key:find("%.")+1)
        end
        return rawget(the_table, key)
    end,
    __newindex = function(the_table, key, value)
        while key:find("%.") do
            the_table = rawget(the_table, key:sub(1, key:find("%.")-1))
            key = key:sub(key:find("%.")+1)
        end
        rawset(the_table, key, value)
    end
})


-- Imports
Str8upMenu.Data      = require(Str8upMenu.rootPath .. "modules/data")
Str8upMenu.Cheats    = require(Str8upMenu.rootPath .. "modules/sections/cheats")
Str8upMenu.Time      = require(Str8upMenu.rootPath .. "modules/sections/time")
Str8upMenu.Vehicle   = require(Str8upMenu.rootPath .. "modules/sections/vehicle")
Str8upMenu.Teleport  = require(Str8upMenu.rootPath .. "modules/sections/teleport")
Str8upMenu.Player    = require(Str8upMenu.rootPath .. "modules/sections/player")
Str8upMenu.Utilities = require(Str8upMenu.rootPath .. "modules/sections/utilities")
Str8upMenu.Dev       = require(Str8upMenu.rootPath .. "modules/sections/dev")
Str8upMenu.UI        = require(Str8upMenu.rootPath .. "modules/ui")
Str8upMenu.OnUpdate  = require(Str8upMenu.rootPath .. "modules/onupdate")
Str8upMenu.Hotkeys   = require(Str8upMenu.rootPath .. "modules/hotkeys")


-- Load Data
Str8upMenu.Data.Load()


-- Hotkeys
Str8upMenu.Hotkeys.SetupHotkeys(Str8upMenu)


-- Events
registerForEvent("onUpdate", function(deltaTime)
    Str8upMenu.OnUpdate.Run(Str8upMenu, deltaTime)
end)

registerForEvent("onOverlayOpen", function()
    Str8upMenu.oldDrawWindow = Str8upMenu.drawWindow
    Str8upMenu.drawWindow = true
    Str8upMenu.UI.overlayOpen = true
end)

registerForEvent("onOverlayClose", function()
    Str8upMenu.drawWindow = Str8upMenu.oldDrawWindow
    Str8upMenu.UI.overlayOpen = false
end)

registerForEvent("onDraw", function()
    if Str8upMenu.drawWindow then
        Str8upMenu.UI.Draw(Str8upMenu)
    end
end)

print("Str8up Menu v" .. Str8upMenu.version .. " loaded! Configure Hotkeys from CET's overlay! ")


return Str8upMenu