
Str8upHotkeys = { 
    description = "Str8up Hotkeys Component"
}


function Str8upHotkeys.SetupHotkeys(Str8upMenu, registerHotkey, registerInput)

    registerHotkey("Str8up_Menu_Toggle_GUI", "Toggle GUI", function()
        Str8upMenu.drawWindow = not Str8upMenu.drawWindow
    end)

    registerHotkey("Str8up_Menu_List_Menu_Select", "List Menu Select (Enter)", function()
        Str8upMenu.UI.ListMenuInteractions(Str8upMenu, "select")
    end)

    registerHotkey("Str8up_Menu_List_Menu_Back", "List Menu Back (Backspace)", function()
        Str8upMenu.UI.ListMenuInteractions(Str8upMenu, "back")
    end)

    registerHotkey("Str8up_Menu_List_Menu_Up", "List Menu Up (Up Arrow)", function()
        Str8upMenu.UI.ListMenuInteractions(Str8upMenu, "up")
    end)

    registerHotkey("Str8up_Menu_List_Menu_Down", "List Menu Down (Down Arrow)", function()
        Str8upMenu.UI.ListMenuInteractions(Str8upMenu, "down")
    end)

    registerHotkey("Str8up_Menu_List_Menu_Left", "List Menu Left (Left Arrow)", function()
        Str8upMenu.UI.ListMenuInteractions(Str8upMenu, "left")
    end)

    registerHotkey("Str8up_Menu_List_Menu_Right", "List Menu Right (Right Arrow)", function()
        Str8upMenu.UI.ListMenuInteractions(Str8upMenu, "right")
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

    registerInput("Str8up_Menu_NoClip_Forward", "Noclip Forward (W)", function(isDown)
        Str8upMenu.Cheats.noClipControls.forward = isDown
    end)

    registerInput("Str8up_Menu_NoClip_Backward", "Noclip Backward (S)", function(isDown)
        Str8upMenu.Cheats.noClipControls.backward = isDown
    end)

    registerInput("Str8up_Menu_NoClip_Left", "Noclip Left (A)", function(isDown)
        Str8upMenu.Cheats.noClipControls.left = isDown
    end)

    registerInput("Str8up_Menu_NoClip_Right", "Noclip Right (D)", function(isDown)
        Str8upMenu.Cheats.noClipControls.right = isDown
    end)

    registerInput("Str8up_Menu_NoClip_Up", "Noclip Up (Space)", function(isDown)
        Str8upMenu.Cheats.noClipControls.up = isDown
    end)

    registerInput("Str8up_Menu_NoClip_Down", "Noclip Down (Shift)", function(isDown)
        Str8upMenu.Cheats.noClipControls.down = isDown
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