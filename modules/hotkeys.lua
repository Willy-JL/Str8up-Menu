function fileExists(filename)
    local f=io.open(filename,"r") if (f~=nil) then io.close(f) return true else return false end
end
function getCWD(mod_name)
    if fileExists("bin/x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "bin/x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("mods/"..mod_name.."/init.lua") then return "mods/"..mod_name.."/" elseif  fileExists(mod_name.."/init.lua") then return mod_name.."/" elseif  fileExists("init.lua") then return "" end
end


Str8upHotkeys = { 
    description = "Str8up Hotkeys Component",
    rootPath =  getCWD("Str8up Menu")
}


function Str8upHotkeys.SetupHotkeys(Str8upMenu, registerHotkey)

    registerHotkey("Str8up_Menu_Toggle_GUI", "Toggle GUI", function()
        Str8upMenu.drawWindow = not Str8upMenu.drawWindow
    end)

    registerHotkey("Str8up_Menu_Toggle_Infinite_Stamina", "Toggle Infinite Stamina", function()
        Str8upMenu.Cheats.infStamina = not Str8upMenu.Cheats.infStamina
        Str8upMenu.Cheats.updateInfStamina()
    end)

    registerHotkey("Str8up_Menu_Toggle_Disable_Police", "Toggle Disable Police", function()
        Str8upMenu.Cheats.disablePolice = not Str8upMenu.Cheats.disablePolice
        Str8upMenu.Cheats.updateDisablePolice()
    end)

    registerHotkey("Str8up_Menu_Toggle_NoClip", "Toggle Noclip", function()
        Str8upMenu.Cheats.noClip = not Str8upMenu.Cheats.noClip
        if Str8upMenu.Cheats.noClip and Str8upMenu.Time.superHot then
            Str8upMenu.Time.superHot = not Str8upMenu.Time.superHot
            Str8upMenu.Time.updateSuperHot()
        end
        Str8upMenu.Cheats.updateNoClip()
    end)

    registerHotkey("Str8up_Menu_NoClip_Speed_Up", "Noclip Speed Up", function()
        if Str8upMenu.Cheats.noClipSpeed < 20 then
            Str8upMenu.Cheats.noClipSpeed = Str8upMenu.Cheats.noClipSpeed + 1
        end
    end)

    registerHotkey("Str8up_Menu_NoClip_Speed_Down", "Noclip Speed Down", function()
        if Str8upMenu.Cheats.noClipSpeed > 1 then
            Str8upMenu.Cheats.noClipSpeed = Str8upMenu.Cheats.noClipSpeed - 1
        end
    end)

    registerHotkey("Str8up_Menu_NoClip_Forward", "Noclip Forward (W)", function()
        Str8upMenu.Cheats.noClipTp("forward")
    end)

    registerHotkey("Str8up_Menu_NoClip_Backward", "Noclip Backward (S)", function()
        Str8upMenu.Cheats.noClipTp("backward")
    end)

    registerHotkey("Str8up_Menu_NoClip_Left", "Noclip Left (A)", function()
        Str8upMenu.Cheats.noClipTp("left")
    end)

    registerHotkey("Str8up_Menu_NoClip_Right", "Noclip Right (D)", function()
        Str8upMenu.Cheats.noClipTp("right")
    end)

    registerHotkey("Str8up_Menu_NoClip_Up", "Noclip Up (Space)", function()
        Str8upMenu.Cheats.noClipTp("up")
    end)

    registerHotkey("Str8up_Menu_NoClip_Down", "Noclip Down (Shift)", function()
        Str8upMenu.Cheats.noClipTp("down")
    end)

    registerHotkey("Str8up_Menu_Toggle_Stop_Time", "Toggle Stop Time", function()
        Str8upMenu.Time.stopTime = not Str8upMenu.Time.stopTime
        Str8upMenu.Time.updateStopTime()
    end)

    registerHotkey("Str8up_Menu_Toggle_SuperHot_Mode", "Toggle SuperHot Mode", function()
        Str8upMenu.Time.superHot = not Str8upMenu.Time.superHot
        if Str8upMenu.Time.superHot and Str8upMenu.Cheats.noClip then
            Str8upMenu.Cheats.noClip = not Str8upMenu.Cheats.noClip
            Str8upMenu.Cheats.updateNoClip()
        end
        Str8upMenu.Time.updateSuperHot()
    end)

    registerHotkey("Str8up_Menu_Fix_Vehicle", "Fix Vehicle", function()
        Str8upMenu.Vehicle.fixVehicle()
    end)

    registerHotkey("Str8up_Menu_TP_to_Quest", "TP to Quest", function()
        Str8upMenu.Teleport.tpToQuest()
    end)

    registerHotkey("Str8up_Menu_Toggle_Quest_Items", "Toggle Quest Items", function()
        Str8upMenu.Utilities.toggleQuestItems()
    end)

    registerHotkey("Str8up_Menu_Untrack_Quest", "Untrack Quest", function()
        Str8upMenu.Utilities.untrackQuest()
    end)

    registerHotkey("Str8up_Menu_Cancel_Fall_Dmg", "Cancel Fall Dmg", function()
        Str8upMenu.Utilities.cancelFallDamage()
    end)

end

return Str8upHotkeys