function fileExists(filename)
    local f=io.open(filename,"r") if (f~=nil) then io.close(f) return true else return false end
end
function getCWD(mod_name)
    if fileExists("bin/x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "bin/x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("mods/"..mod_name.."/init.lua") then return "mods/"..mod_name.."/" elseif  fileExists(mod_name.."/init.lua") then return mod_name.."/" elseif  fileExists("init.lua") then return "" end
end


Str8upUI = { 
    description = "Str8up UI Component",
    rootPath = getCWD("Str8up Menu"),
    devMode = false,
    cursor = {
        submenu = "Str8up Menu",
        selected = "Cheats"
    },
    overlayOpen = false,
    x = nil,
    y = nil,
    pendingPopup = { alive = false },
    popupTimeout = 0,
    menu = {
        ["Str8up Menu"] = {
            type = "section",
            maxIndex = 7,
            ["Cheats"] = {
                index = 1,
                type = "section",
                maxIndex = 9,
                ["Money"] = {
                    index = 1,
                    type = "section",
                    maxIndex = 2,
                    ["Amount"] = {
                        index = 1,
                        type = "int",
                        var = "Cheats.moneyToAdd",
                        min = 0,
                        max = 999999999
                    },
                    ["Add"] = {
                        index = 2,
                        type = "button",
                        callback = "Cheats.addMoney"
                    }
                },
                ["Components"] = {
                    index = 2,
                    type = "section",
                    maxIndex = 3,
                    ["Type"] = {
                        index = 1,
                        type = "combo",
                        var = "Cheats.componentToAdd",
                        items = "Cheats.componentNames"
                    },
                    ["Amount"] = {
                        index = 2,
                        type = "int",
                        var = "Cheats.componentAmount",
                        min = 0,
                        max = 999999999
                    },
                    ["Add"] = {
                        index = 3,
                        type = "button",
                        callback = "Cheats.addComponents"
                    }
                },
                ["Items"] = {
                    index = 3,
                    type = "section",
                    maxIndex = 3,
                    ["Name"] = {
                        index = 1,
                        type = "text",
                        var = "Cheats.itemToAdd"
                    },
                    ["Amount"] = {
                        index = 2,
                        type = "int",
                        var = "Cheats.itemAmount",
                        min = 0,
                        max = 999999999
                    },
                    ["Add"] = {
                        index = 3,
                        type = "button",
                        callback = "Cheats.addItems"
                    }
                },
                ["GodMode"] = {
                    index = 4,
                    type = "toggle",
                    var = "Cheats.godMode",
                    callback = "Cheats.updateGodMode"
                },
                ["Infinite Stamina"] = {
                    index = 5,
                    type = "toggle",
                    var = "Cheats.infStamina",
                    callback = "Cheats.updateInfStamina"
                },
                ["Disable Police"] = {
                    index = 6,
                    type = "toggle",
                    var = "Cheats.disablePolice",
                    callback = "Cheats.updateDisablePolice"
                },
                ["No Fall"] = {
                    index = 7,
                    type = "toggle",
                    var = "Cheats.noFall"
                },
                ["NoClip"] = {
                    index = 8,
                    type = "toggle",
                    var = "Cheats.noClip",
                    callback = "Cheats.updateNoClip"
                },
                ["NoClip Speed"] = {
                    index = 9,
                    type = "int",
                    var = "Cheats.noClipSpeed",
                    min = 1,
                    max = 20
                }
            },
            ["Time Warp"] = {
                index = 2,
                type = "section",
                maxIndex = 7,
                ["Hours"] = {
                    index = 1,
                    type = "int",
                    var = "Time.h",
                    callback = "Time.setTime",
                    min = 0,
                    max = 23
                },
                ["Minutes"] = {
                    index = 2,
                    type = "int",
                    var = "Time.m",
                    callback = "Time.setTime",
                    min = 0,
                    max = 59
                },
                ["Seconds"] = {
                    index = 3,
                    type = "int",
                    var = "Time.s",
                    callback = "Time.setTime",
                    min = 0,
                    max = 59
                },
                ["Set Time"] = {
                    index = 4,
                    type = "button",
                    callback = "Time.setTime"
                },
                ["Stop Time Cycle"] = {
                    index = 5,
                    type = "toggle",
                    var = "Time.stopTime",
                    callback = "Time.updateStopTime"
                },
                ["SuperHot Mode"] = {
                    index = 6,
                    type = "toggle",
                    var = "Time.superHot",
                    callback = "Time.updateSuperHot"
                },
                ["Time Multiplier"] = {
                    index = 7,
                    type = "int",
                    var = "Time.timeMultiplier",
                    min = 1,
                    max = 100
                }
            },
            ["Vehicle"] = {
                index = 3,
                type = "section",
                maxIndex = 3,
                ["Auto Fix Vehicle"] = {
                    index = 1,
                    type = "toggle",
                    var = "Vehicle.autoFixVehicle",
                    callback = "Vehicle.fixVehicle"
                },
                ["Fix Vehicle"] = {
                    index = 2,
                    type = "button",
                    callback = "Vehicle.fixVehicle"
                },
                ["Toggle Summon Mode"] = {
                    index = 3,
                    type = "button",
                    callback = "Vehicle.toggleSummonMode"
                }
            },
            ["Teleport"] = {
                index = 4,
                type = "section",
                maxIndex = 4,
                ["TP to Quest"] = {
                    index = 1,
                    type = "button",
                    callback = "Teleport.tpToQuest"
                },
                ["Special"] = {
                    index = 2,
                    type = "section",
                    maxIndex = 2,
                    ["Dest"] = {
                        index = 1,
                        type = "combo",
                        var = "Teleport.specialTpSelection",
                        items = "Teleport.specialTpNames"
                    },
                    ["Teleport"] = {
                        index = 2,
                        type = "button",
                        callback = "Teleport.specialTp"
                    }
                },
                ["Fast Travel"] = {
                    index = 3,
                    type = "section",
                    maxIndex = 3,
                    ["Area"] = {
                        index = 1,
                        type = "combo",
                        var = "Teleport.fastTravelAreaSelection",
                        items = "Teleport.fastTravelAreaNames"
                    },
                    ["Dest"] = {
                        index = 2,
                        type = "combo",
                        var = "Teleport.fastTravelDestinationSelection",
                        items = "Teleport.fastTravelDestinationNames",
                        itemsSubVar = "Teleport.fastTravelAreaSelection",
                        itemsSubVarMod = "+1"
                    },
                    ["Teleport"] = {
                        index = 3,
                        type = "button",
                        callback = "Teleport.fastTravelTp"
                    }
                },
                ["Warps"] = {
                    index = 4,
                    type = "section",
                    maxIndex = 5,
                    ["Warp"] = {
                        index = 1,
                        type = "combo",
                        var = "Teleport.warpSelection",
                        items = "Data.warpsNames"
                    },
                    ["Warp To"] = {
                        index = 2,
                        type = "button",
                        objCallback = "Teleport.tpToWarp"
                    },
                    ["Remove"] = {
                        index = 3,
                        type = "button",
                        objCallback = "Teleport.removeWarp"
                    },
                    ["New Name"] = {
                        index = 4,
                        type = "text",
                        var = "Teleport.newWarpName"
                    },
                    ["Add Warp"] = {
                        index = 5,
                        type = "button",
                        objCallback = "Teleport.addWarp"
                    }
                }
            },
            ["Player"] = {
                index = 5,
                type = "section",
                maxIndex = 3,
                ["Undress"] = {
                    index = 1,
                    type = "button",
                    callback = "Player.undress"
                },
                ["Toggle Bra"] = {
                    index = 2,
                    type = "button",
                    callback = "Player.toggleBra"
                },
                ["Toggle Panties"] = {
                    index = 3,
                    type = "button",
                    callback = "Player.togglePanties"
                }
            },
            ["Utilities"] = {
                index = 6,
                type = "section",
                maxIndex = 4,
                ["Toggle Quest for Equip Items "] = {
                    index = 1,
                    type = "button",
                    callback = "Utilities.toggleQuestItems"
                },
                ["Untrack Quest"] = {
                    index = 2,
                    type = "button",
                    callback = "Utilities.untrackQuest"
                },
                ["Cancel Fall Dmg"] = {
                    index = 3,
                    type = "button",
                    callback = "Utilities.cancelFallDamage"
                },
                ["Loadouts"] = {
                    index = 4,
                    type = "section",
                    maxIndex = 5,
                    ["Loadout"] = {
                        index = 1,
                        type = "combo",
                        var = "Utilities.loadoutSelection",
                        items = "Data.loadoutNames"
                    },
                    ["Load"] = {
                        index = 2,
                        type = "button",
                        objCallback = "Utilities.loadLoadout"
                    },
                    ["Remove"] = {
                        index = 3,
                        type = "button",
                        objCallback = "Utilities.removeLoadout"
                    },
                    ["New Name"] = {
                        index = 4,
                        type = "text",
                        var = "Utilities.newLoadoutName"
                    },
                    ["Add Loadout"] = {
                        index = 5,
                        type = "button",
                        objCallback = "Utilities.addLoadout"
                    }
                }
            },
            ["Settings"] = {
                index = 7,
                type = "section",
                maxIndex = 1,
                ["ClickGUI"] = {
                    index = 1,
                    type = "toggle",
                    var = "Data.json.clickGUI",
                    callback = "Data.Save"
                }
            }
        }
    }
}

-- Hack: Multiple string subindexes with . like Str8upMenu["Cheats.noClip"], thanks NonameNonumber !
setmetatable(Str8upUI.menu, {
    __index = function(table, key)
        while key:find("%.") do
            table = table[key:sub(1, key:find("%.")-1)]
            key = key:sub(key:find("%.")+1)
        end
        return table[key]
    end,
    __newindex = function(table, key, value)
        while key:find("%.") do
            table = table[key:sub(1, key:find("%.")-1)]
            key = key:sub(key:find("%.")+1)
        end
        rawset(table, key, value)
    end
})

Str8upUI.Theme = require(Str8upUI.rootPath .. "modules/theme")

function Str8upUI.ListMenuInteractions(Str8upMenu, action)

    if not Str8upMenu.Data.clickGUI and Str8upMenu.drawWindow and not Str8upUI.pendingPopup.alive and Str8upUI.popupTimeout == 0 then
        item = Str8upUI.menu[Str8upUI.cursor.submenu .. "." .. Str8upUI.cursor.selected]
        submenu = Str8upUI.menu[Str8upUI.cursor.submenu]
        if action == "select" then
            if submenu.type == "combo" then
                if submenu.itemsSubVar then
                    Str8upMenu[submenu.var] = Str8upUI.GetIndexFromName(Str8upMenu[submenu.items][Str8upMenu[submenu.itemsSubVar] + tonumber(submenu.itemsSubVarMod)], Str8upUI.cursor.selected) - 1
                else
                    Str8upMenu[submenu.var] = Str8upUI.GetIndexFromName(Str8upMenu[submenu.items], Str8upUI.cursor.selected) - 1
                end
                Str8upUI.cursor.selected = Str8upUI.cursor.submenu:sub(#Str8upUI.cursor.submenu - Str8upUI.cursor.submenu:reverse():find("%.")+2)
                Str8upUI.cursor.submenu = Str8upUI.cursor.submenu:sub(1, #Str8upUI.cursor.submenu - Str8upUI.cursor.submenu:reverse():find("%."))
            elseif item.type == "section" then
                Str8upUI.cursor.submenu = Str8upUI.cursor.submenu .. "." .. Str8upUI.cursor.selected
                Str8upUI.cursor.selected = Str8upUI.GetNameFromIndex(Str8upUI.menu[Str8upUI.cursor.submenu], 1)
            elseif item.type == "combo" then
                Str8upUI.cursor.submenu = Str8upUI.cursor.submenu .. "." .. Str8upUI.cursor.selected
                if item.itemsSubVar then
                    Str8upUI.cursor.selected = Str8upMenu[item.items][Str8upMenu[item.itemsSubVar] + tonumber(item.itemsSubVarMod)][Str8upMenu[item.var]+1]
                else
                    Str8upUI.cursor.selected = Str8upMenu[item.items][Str8upMenu[item.var]+1]
                end
            elseif item.type == "button" then
                if item.callback then
                    Str8upMenu[item.callback]()
                end
                if item.objCallback then
                    Str8upMenu[item.objCallback](Str8upMenu)
                end
            elseif item.type == "toggle" then
                Str8upMenu[item.var] = not Str8upMenu[item.var]
                if item.callback then
                    Str8upMenu[item.callback]()
                end
            elseif item.type == "int" then
                Str8upUI.pendingPopup = {
                    alive = true,
                    type = "int",
                    name = Str8upUI.cursor.selected,
                    var = item.var,
                    callback = item.callback,
                    min = item.min,
                    max = item.max
                }
            elseif item.type == "text" then
                Str8upUI.pendingPopup = {
                    alive = true,
                    type = "text",
                    name = Str8upUI.cursor.selected,
                    var = item.var
                }
            end
        elseif action == "back" then
            if Str8upUI.cursor.submenu:find("%.") then
                Str8upUI.cursor.selected = Str8upUI.cursor.submenu:sub(#Str8upUI.cursor.submenu - Str8upUI.cursor.submenu:reverse():find("%.")+2)
                Str8upUI.cursor.submenu = Str8upUI.cursor.submenu:sub(1, #Str8upUI.cursor.submenu - Str8upUI.cursor.submenu:reverse():find("%."))
            end
        elseif action == "up" then
            if submenu.type == "section" then
                curIndex = item.index
                maxIndex = submenu.maxIndex
                if curIndex > 1 then
                    Str8upUI.cursor.selected = Str8upUI.GetNameFromIndex(submenu, curIndex - 1)
                else
                    Str8upUI.cursor.selected = Str8upUI.GetNameFromIndex(submenu, maxIndex)
                end
            elseif submenu.type == "combo" then
                if submenu.itemsSubVar then
                    curIndex = Str8upUI.GetIndexFromName(Str8upMenu[submenu.items][Str8upMenu[submenu.itemsSubVar] + tonumber(submenu.itemsSubVarMod)], Str8upUI.cursor.selected)
                    maxIndex = #Str8upMenu[submenu.items][Str8upMenu[submenu.itemsSubVar] + tonumber(submenu.itemsSubVarMod)]
                    if curIndex > 1 then
                        Str8upUI.cursor.selected = Str8upMenu[submenu.items][Str8upMenu[submenu.itemsSubVar] + tonumber(submenu.itemsSubVarMod)][curIndex-1]
                    else
                        Str8upUI.cursor.selected = Str8upMenu[submenu.items][Str8upMenu[submenu.itemsSubVar] + tonumber(submenu.itemsSubVarMod)][maxIndex]
                    end
                else
                    curIndex = Str8upUI.GetIndexFromName(Str8upMenu[submenu.items], Str8upUI.cursor.selected)
                    maxIndex = #Str8upMenu[submenu.items]
                    if curIndex > 1 then
                        Str8upUI.cursor.selected = Str8upMenu[submenu.items][curIndex-1]
                    else
                        Str8upUI.cursor.selected = Str8upMenu[submenu.items][maxIndex]
                    end
                end
            end
        elseif action == "down" then
            if submenu.type == "section" then
                curIndex = item.index
                maxIndex = submenu.maxIndex
                if curIndex < maxIndex then
                    Str8upUI.cursor.selected = Str8upUI.GetNameFromIndex(submenu, curIndex + 1)
                else
                    Str8upUI.cursor.selected = Str8upUI.GetNameFromIndex(submenu, 1)
                end
            elseif submenu.type == "combo" then
                if submenu.itemsSubVar then
                    curIndex = Str8upUI.GetIndexFromName(Str8upMenu[submenu.items][Str8upMenu[submenu.itemsSubVar] + tonumber(submenu.itemsSubVarMod)], Str8upUI.cursor.selected)
                    maxIndex = #Str8upMenu[submenu.items][Str8upMenu[submenu.itemsSubVar] + tonumber(submenu.itemsSubVarMod)]
                    if curIndex < maxIndex then
                        Str8upUI.cursor.selected = Str8upMenu[submenu.items][Str8upMenu[submenu.itemsSubVar] + tonumber(submenu.itemsSubVarMod)][curIndex+1]
                    else
                        Str8upUI.cursor.selected = Str8upMenu[submenu.items][Str8upMenu[submenu.itemsSubVar] + tonumber(submenu.itemsSubVarMod)][1]
                    end
                else
                    curIndex = Str8upUI.GetIndexFromName(Str8upMenu[submenu.items], Str8upUI.cursor.selected)
                    maxIndex = #Str8upMenu[submenu.items]
                    if curIndex < maxIndex then
                        Str8upUI.cursor.selected = Str8upMenu[submenu.items][curIndex+1]
                    else
                        Str8upUI.cursor.selected = Str8upMenu[submenu.items][1]
                    end
                end
            end
        elseif action == "left" then
            if item.type == "int" then
                if Str8upMenu[item.var] > item.min then
                    Str8upMenu[item.var] = Str8upMenu[item.var] - 1
                else
                    Str8upMenu[item.var] = item.max
                end
                if item.callback then
                    Str8upMenu[item.callback]()
                end
            elseif item.type == "combo" then
                if Str8upMenu[item.var] > 0 then
                    Str8upMenu[item.var] = Str8upMenu[item.var] - 1
                else
                    if item.itemsSubVar then
                        Str8upMenu[item.var] = #Str8upMenu[item.items][Str8upMenu[item.itemsSubVar] + tonumber(item.itemsSubVarMod)] - 1
                    else
                        Str8upMenu[item.var] = #Str8upMenu[item.items] - 1
                    end
                end
                if item.callback then
                    Str8upMenu[item.callback]()
                end
            end
        elseif action == "right" then
            if item.type == "int" then
                if Str8upMenu[item.var] < item.max then
                    Str8upMenu[item.var] = Str8upMenu[item.var] + 1
                else
                    Str8upMenu[item.var] = item.min
                end
                if item.callback then
                    Str8upMenu[item.callback]()
                end
            elseif item.type == "combo" then
                if item.itemsSubVar then
                    if Str8upMenu[item.var] < (#Str8upMenu[item.items][Str8upMenu[item.itemsSubVar] + tonumber(item.itemsSubVarMod)] - 1) then
                        Str8upMenu[item.var] = Str8upMenu[item.var] + 1
                    else
                        Str8upMenu[item.var] = 0
                    end
                    if item.callback then
                        Str8upMenu[item.callback]()
                    end
                else
                    if Str8upMenu[item.var] < (#Str8upMenu[item.items] - 1) then
                        Str8upMenu[item.var] = Str8upMenu[item.var] + 1
                    else
                        Str8upMenu[item.var] = 0
                    end
                    if item.callback then
                        Str8upMenu[item.callback]()
                    end
                end
            end
        end
    end

end


function Str8upUI.ColoredText(text, color)

    ImGui.TextColored(color[1], color[2], color[3], color[4], text)

end


function Str8upUI.DrawCursorRect(name)

    _, cursorY = ImGui.GetCursorScreenPos()
    windowX, _ = ImGui.GetWindowPos()
    windowW, _ = ImGui.GetWindowSize()
    _, textY = ImGui.CalcTextSize("I")
    ImGui.PushStyleColor(ImGuiCol.WindowBg, 0.00, 0.94, 1.00, 0.26)
    ImGui.PushStyleColor(ImGuiCol.Border, 0.00, 0.00, 0.00, 0.00)
    ImGui.SetNextWindowPos(windowX + 1, cursorY - 1)
    ImGui.SetNextWindowSize(windowW - 2, textY + 5)
    -- if not Str8upUI.overlayOpen and not Str8upUI.pendingPopup.alive and Str8upUI.popupTimeout == 0 then
    --     ImGui.SetNextWindowFocus()
    -- end
    ImGui.Begin(name .. ".Cursor", true, ImGuiWindowFlags.NoTitleBar | ImGuiWindowFlags.NoMove | ImGuiWindowFlags.NoScrollbar | ImGuiWindowFlags.AlwaysAutoResize | ImGuiWindowFlags.NoResize)
    ImGui.End()
    ImGui.PopStyleColor(2)

end


function Str8upUI.Section(name)

    if Str8upUI.cursor.selected == name then
        color = { 0.00, 0.90, 1.00, 1 }
        Str8upUI.DrawCursorRect(name)
    else
        color = { 0.69, 0.69, 0.69, 1 }
    end
    Str8upUI.ColoredText(" " .. name, color)
    xOffset = ImGui.GetWindowWidth() - ImGui.CalcTextSize(">  ")
    ImGui.SameLine(xOffset)
    Str8upUI.ColoredText(">", color)

end


function Str8upUI.ComboItem(name)

    if Str8upUI.cursor.selected == name then
        color = { 0.00, 0.90, 1.00, 1 }
        Str8upUI.DrawCursorRect(name)
    else
        color = { 0.69, 0.69, 0.69, 1 }
    end
    Str8upUI.ColoredText(" " .. name, color)

end


function Str8upUI.Toggle(name, status)

    if Str8upUI.cursor.selected == name then
        color = { 0.00, 0.90, 1.00, 1 }
        Str8upUI.DrawCursorRect(name)
    else
        color = { 0.69, 0.69, 0.69, 1 }
    end
    Str8upUI.ColoredText(" " .. name, color)
    if status == true then
        xOffset = ImGui.GetWindowWidth() - ImGui.CalcTextSize("ON  ")
        ImGui.SameLine(xOffset)
        Str8upUI.ColoredText("ON", { 0.00, 1.00, 0.00, 1.00 })
    else
        xOffset = ImGui.GetWindowWidth() - ImGui.CalcTextSize("OFF  ")
        ImGui.SameLine(xOffset)
        Str8upUI.ColoredText("OFF", { 1.00, 0.00, 0.00, 1.00 })
    end

end


function Str8upUI.Int(name, value)

    if Str8upUI.cursor.selected == name then
        color = { 0.00, 0.90, 1.00, 1 }
        Str8upUI.DrawCursorRect(name)
        Str8upUI.ColoredText(" " .. name, color)
        xOffset = ImGui.GetWindowWidth() - ImGui.CalcTextSize("<" .. tostring(value) .. ">  ")
        ImGui.SameLine(xOffset)
        Str8upUI.ColoredText("<" .. tostring(value) .. ">", color)
    else
        color = { 0.69, 0.69, 0.69, 1 }
        Str8upUI.ColoredText(" " .. name, color)
        xOffset = ImGui.GetWindowWidth() - ImGui.CalcTextSize(tostring(value) .. "  ")
        ImGui.SameLine(xOffset)
        Str8upUI.ColoredText(tostring(value), color)
    end

end


function Str8upUI.Combo(Str8upMenu, item)

    if Str8upUI.cursor.selected == item[1] then
        color = { 0.00, 0.90, 1.00, 1 }
        Str8upUI.DrawCursorRect(item[1])
        Str8upUI.ColoredText(" " .. item[1], color)  -- fix index higher than max
        if item[2].itemsSubVar then
            if ( Str8upMenu[item[2].var] + 1) > #Str8upMenu[item[2].items][Str8upMenu[item[2].itemsSubVar] + tonumber(item[2].itemsSubVarMod)] then
                Str8upMenu[item[2].var] = #Str8upMenu[item[2].items][Str8upMenu[item[2].itemsSubVar] + tonumber(item[2].itemsSubVarMod)] -1
            end
            value = Str8upMenu[item[2].items][Str8upMenu[item[2].itemsSubVar] + tonumber(item[2].itemsSubVarMod)][Str8upMenu[item[2].var]+1]
        else
            if ( Str8upMenu[item[2].var] + 1) > #Str8upMenu[item[2].items] then
                Str8upMenu[item[2].var] = #Str8upMenu[item[2].items] -1
            end
            value = Str8upMenu[item[2].items][Str8upMenu[item[2].var]+1]
        end
        if #value > 11 then
            value = value:sub(1, 8) .. "..."
        end
        xOffset = ImGui.GetWindowWidth() - ImGui.CalcTextSize("<" .. value .. ">  ")
        ImGui.SameLine(xOffset)
        Str8upUI.ColoredText("<" .. value .. ">", color)
    else
        color = { 0.69, 0.69, 0.69, 1 }
        Str8upUI.ColoredText(" " .. item[1], color)
        if item[2].itemsSubVar then
            if ( Str8upMenu[item[2].var] + 1) > #Str8upMenu[item[2].items][Str8upMenu[item[2].itemsSubVar] + tonumber(item[2].itemsSubVarMod)] then
                Str8upMenu[item[2].var] = #Str8upMenu[item[2].items][Str8upMenu[item[2].itemsSubVar] + tonumber(item[2].itemsSubVarMod)] -1
            end
            value = Str8upMenu[item[2].items][Str8upMenu[item[2].itemsSubVar] + tonumber(item[2].itemsSubVarMod)][Str8upMenu[item[2].var]+1]
        else
            if ( Str8upMenu[item[2].var] + 1) > #Str8upMenu[item[2].items] then
                Str8upMenu[item[2].var] = #Str8upMenu[item[2].items] -1
            end
            value = Str8upMenu[item[2].items][Str8upMenu[item[2].var]+1]
        end
        if #value > 13 then
            value = value:sub(1, 10) .. "..."
        end
        xOffset = ImGui.GetWindowWidth() - ImGui.CalcTextSize(value .. "  ")
        ImGui.SameLine(xOffset)
        Str8upUI.ColoredText(value, color)
    end

end


function Str8upUI.Text(name, value)

    if Str8upUI.cursor.selected == name then
        color = { 0.00, 0.90, 1.00, 1 }
        Str8upUI.DrawCursorRect(name)
    else
        color = { 0.69, 0.69, 0.69, 1 }
    end
    if #value > 13 then
        value = value:sub(1, 10) .. "..."
    end
    Str8upUI.ColoredText(" " .. name, color)
    xOffset = ImGui.GetWindowWidth() - ImGui.CalcTextSize(value .. "  ")
    ImGui.SameLine(xOffset)
    Str8upUI.ColoredText(value, color)

end


function Str8upUI.Button(name)

    if Str8upUI.cursor.selected == name then
        color = { 0.00, 0.90, 1.00, 1 }
        Str8upUI.DrawCursorRect(name)
    else
        color = { 0.69, 0.69, 0.69, 1 }
    end
    Str8upUI.ColoredText(" " .. name, color)

end


function Str8upUI.CheckIgnoreValue(name)

    local ignored = { "index", "type", "maxIndex", "var", "vallback", "min", "max" }
    for _, v in pairs(ignored) do
        if v == name then
            return true
        end
    end
    return false

end


function Str8upUI.SortItems(input)

    local items = {}
    for item, content in pairs(input) do
        if not Str8upUI.CheckIgnoreValue(item) then
            table.insert(items, {item, content})
        end
    end
    table.sort(items, function(left, right)
        return left[2].index < right[2].index
    end)
    return items

end


function Str8upUI.GetNameFromIndex(submenu, index)

    for name, content in pairs(submenu) do
        if not Str8upUI.CheckIgnoreValue(name) then
            if content.index == index then
                return name
            end
        end
    end
    return nil

end


function Str8upUI.GetIndexFromName(submenu, name)

    if submenu.type == "section" then
        for index, item in pairs(submenu) do
            if not Str8upUI.CheckIgnoreValue(name) then
                if item == name then
                    return index
                end
            end
        end
    elseif type(submenu) == "table" then
        for index, item in pairs(submenu) do
            if item == name then
                return index
            end
        end
    end
    return nil

end


function Str8upUI.Draw(Str8upMenu)

    Str8upUI.Theme.ApplyTheme()
    
    listThemeApplied = false
    if not Str8upMenu.Data.json.clickGUI then
        listThemeApplied = true
        ImGui.PushStyleColor(ImGuiCol.Border, 0.99, 0.93, 0.04, 0.69)
        ImGui.PushStyleColor(ImGuiCol.TitleBg, 0.99, 0.93, 0.04, 0.69)
    end

    if Str8upUI.devMode and not Str8upUI.menu["Str8up Menu"]["Developer"] then
        Str8upUI.menu["Str8up Menu"].maxIndex = Str8upUI.menu["Str8up Menu"].maxIndex + 1
        Str8upUI.menu["Str8up Menu"]["Developer"] = {
            index = Str8upUI.menu["Str8up Menu"].maxIndex,
            type = "section",
            maxIndex = 1,
            ["Run Dev Script"] = {
                index = 1,
                type = "button",
                objCallback = "Dev.Run"
            }
        }
    elseif not Str8upUI.devMode and Str8upUI.menu["Str8up Menu"]["Developer"] then
        Str8upUI.menu["Str8up Menu"].maxIndex = Str8upUI.menu["Str8up Menu"].maxIndex - 1
        Str8upUI.menu["Str8up Menu"]["Developer"] = nil
    end

    -- Hack: catch errors in gui to ensure theme vars bleeding is avoided
    pcall(function()

        if Str8upUI.pendingPopup.alive then
            ImGui.OpenPopup("Set Value")
            if ImGui.BeginPopupModal("Set Value", ImGuiWindowFlags.NoResize | ImGuiWindowFlags.NoScrollbar | ImGuiWindowFlags.NoScrollWithMouse | ImGuiWindowFlags.NoCollapse) then
                ImGui.SetWindowFontScale(1.0)
                screenX, screenY = GetDisplayResolution()
                ImGui.SetWindowSize(260, 76)
                ImGui.SetWindowPos((screenX-260)/2, (screenY-76)/2)
                xOffset = ( ImGui.GetWindowWidth() - ImGui.CalcTextSize(Str8upUI.pendingPopup.name) ) / 2
                ImGui.SameLine(xOffset)
                ImGui.Text(Str8upUI.pendingPopup.name)
                ImGui.Spacing()
                ImGui.PushItemWidth(244)
                ImGui.SetKeyboardFocusHere()
                if Str8upUI.pendingPopup.type == "text" then
                    Str8upMenu[Str8upUI.pendingPopup.var], popupConfirmed = ImGui.InputText("", Str8upMenu[Str8upUI.pendingPopup.var], 100, ImGuiInputTextFlags.EnterReturnsTrue)
                elseif Str8upUI.pendingPopup.type == "int" then
                    popupOutput, popupConfirmed = ImGui.InputText("", tostring(Str8upMenu[Str8upUI.pendingPopup.var]), 100, ImGuiInputTextFlags.EnterReturnsTrue | ImGuiInputTextFlags.CharsDecimal)
                    if popupOutput == "" then
                        popupOutput = Str8upUI.pendingPopup.min
                    end
                    popupOutput = tonumber(popupOutput)
                    if popupOutput > Str8upUI.pendingPopup.max then
                        popupOutput = Str8upUI.pendingPopup.max
                    elseif popupOutput < Str8upUI.pendingPopup.min then
                        popupOutput = Str8upUI.pendingPopup.min
                    end
                    Str8upMenu[Str8upUI.pendingPopup.var] = popupOutput
                end
                if popupConfirmed then
                    ImGui.CloseCurrentPopup()
                    Str8upUI.pendingPopup.alive = false
                    Str8upUI.popupTimeout = 0.2
                end
            end
            ImGui.EndPopup()
        end

        if not Str8upMenu.Data.json.clickGUI then
            title = Str8upUI.cursor.submenu
            if title:find("%.") then
                title = title:gsub("%.", "/")
                title = title:gsub("Str8up Menu/", "")
            end
            if ImGui.Begin(title, ImGuiWindowFlags.NoResize | ImGuiWindowFlags.NoScrollbar | ImGuiWindowFlags.NoScrollWithMouse | ImGuiWindowFlags.NoCollapse | ImGuiWindowFlags.AlwaysAutoResize) then
                ImGui.SetWindowSize(10, 10)
                if Str8upUI.x and Str8upUI.y and not Str8upUI.overlayOpen then
                    ImGui.SetWindowPos(Str8upUI.x, Str8upUI.y)
                end
                ImGui.SetWindowFontScale(1.2)
                ImGui.SetCursorPosY(12)
                ImGui.Text("                        ")  -- set minimum menu width
                if Str8upUI.menu[Str8upUI.cursor.submenu].type == "section" then
                    items = Str8upUI.SortItems(Str8upUI.menu[Str8upUI.cursor.submenu])
                    for _, item in pairs(items) do
                        if item[2].type == "section" then
                            Str8upUI.Section(item[1])
                        elseif item[2].type == "combo" then
                            Str8upUI.Combo(Str8upMenu, item)
                        elseif item[2].type == "toggle" then
                            Str8upUI.Toggle(item[1], Str8upMenu[item[2].var])
                        elseif item[2].type == "int" then
                            Str8upUI.Int(item[1], Str8upMenu[item[2].var])
                        elseif item[2].type == "text" then
                            Str8upUI.Text(item[1], Str8upMenu[item[2].var])
                        elseif item[2].type == "button" then
                            Str8upUI.Button(item[1])
                        end
                    end
                elseif Str8upUI.menu[Str8upUI.cursor.submenu].type == "combo" then
                    if Str8upUI.menu[Str8upUI.cursor.submenu].itemsSubVar then
                        items = Str8upMenu[Str8upUI.menu[Str8upUI.cursor.submenu].items][Str8upMenu[Str8upUI.menu[Str8upUI.cursor.submenu].itemsSubVar] + tonumber(Str8upUI.menu[Str8upUI.cursor.submenu].itemsSubVarMod)]
                    else
                        items = Str8upMenu[Str8upUI.menu[Str8upUI.cursor.submenu].items]
                    end
                    for _, name in pairs(items) do
                        Str8upUI.ComboItem(name)
                    end
                end
                ImGui.Spacing()
                Str8upUI.x, Str8upUI.y = ImGui.GetWindowPos()
            end
            ImGui.End()
        else
            if ImGui.Begin("Str8up Menu") then
                ImGui.SetWindowFontScale(1.0)
                if ImGui.BeginTabBar("Tabs") then
        
                    if ImGui.BeginTabItem("Cheats") then
                        ImGui.SetWindowSize(430, 173)
                        ImGui.Spacing()
        
                        ImGui.PushItemWidth(150)
                        Str8upMenu.Cheats.moneyToAdd = ImGui.InputInt("##Money Amount", Str8upMenu.Cheats.moneyToAdd, 1000, 10000)
                        ImGui.SameLine(162)
                        if ImGui.Button("Add Money", 75, 19) then
                            Str8upMenu.Cheats.addMoney()
                        end
        
                        ImGui.PushItemWidth(104)
                        Str8upMenu.Cheats.componentAmount = ImGui.InputInt("##Component Amount", Str8upMenu.Cheats.componentAmount, 10, 100)
                        ImGui.SameLine(116)
                        ImGui.PushItemWidth(154)
                        Str8upMenu.Cheats.componentToAdd = ImGui.Combo("##Component Name", Str8upMenu.Cheats.componentToAdd, Str8upMenu.Cheats.componentNames, #Str8upMenu.Cheats.componentNames, #Str8upMenu.Cheats.componentNames)
                        ImGui.SameLine(274)
                        if ImGui.Button("Add Components") then
                            Str8upMenu.Cheats.addComponents()
                        end
        
                        ImGui.PushItemWidth(229)
                        Str8upMenu.Cheats.itemToAdd = ImGui.InputText("##Item Code", Str8upMenu.Cheats.itemToAdd, 100)
                        ImGui.PushItemWidth(75)
                        ImGui.SameLine(241)
                        Str8upMenu.Cheats.itemAmount = ImGui.InputInt("##Item Amount", Str8upMenu.Cheats.itemAmount, 1, 10)
                        ImGui.SameLine(320)
                        if ImGui.Button("Add Items") then
                            Str8upMenu.Cheats.addItems()
                        end
        
                        Str8upMenu.Cheats.godMode, godModeChanged = ImGui.Checkbox("GodMode", Str8upMenu.Cheats.godMode)
                        if godModeChanged then
                            Str8upMenu.Cheats.updateGodMode()
                        end
        
                        ImGui.SameLine()
                        Str8upMenu.Cheats.infStamina, infStaminaChanged = ImGui.Checkbox("Inf Stamina", Str8upMenu.Cheats.infStamina)
                        if infStaminaChanged then
                            Str8upMenu.Cheats.updateInfStamina()
                        end
        
                        ImGui.SameLine()
                        Str8upMenu.Cheats.disablePolice, disablePoliceChanged = ImGui.Checkbox("Disable Police", Str8upMenu.Cheats.disablePolice)
                        if disablePoliceChanged then
                            Str8upMenu.Cheats.updateDisablePolice()
                        end
        
                        ImGui.SameLine()
                        Str8upMenu.Cheats.noFall, noFallChanged = ImGui.Checkbox("No Fall", Str8upMenu.Cheats.noFall)
        
                        Str8upMenu.Cheats.noClip, noClipChanged = ImGui.Checkbox("NoClip - Speed", Str8upMenu.Cheats.noClip)
                        if noClipChanged then
                            if Str8upMenu.Cheats.noClip and Str8upMenu.Time.superHot then
                                Str8upMenu.Time.superHot = not Str8upMenu.Time.superHot
                                Str8upMenu.Time.updateSuperHot()
                            end
                            Str8upMenu.Cheats.updateNoClip()
                        end
                        ImGui.SameLine()
                        ImGui.PushItemWidth(255)
                        Str8upMenu.Cheats.noClipSpeed = ImGui.SliderInt("##NoClip Speed", Str8upMenu.Cheats.noClipSpeed, 1, 20, "%dx")
        
                        ImGui.EndTabItem()
                    end
        
                    if ImGui.BeginTabItem("Time") then
                        ImGui.SetWindowSize(430, 150)
                        ImGui.Spacing()
        
                        ImGui.PushItemWidth(50)
                        Str8upMenu.Time.h, hChanged = ImGui.DragInt("##Hours", Str8upMenu.Time.h, 0.1, 0, 23, "H: %d")
                        ImGui.SameLine(62)
                        Str8upMenu.Time.m, mChanged = ImGui.DragInt("##Minutes", Str8upMenu.Time.m, 0.1, 0, 59, "M: %d")
                        ImGui.SameLine(116)
                        Str8upMenu.Time.s, sChanged = ImGui.DragInt("##Seconds", Str8upMenu.Time.s, 0.1, 0, 59, "S: %d")
                        ImGui.SameLine(170)
                        if ImGui.Button("Set Time") or hChanged or mChanged or sChanged then
                            Str8upMenu.Time.setTime()
                        end
        
                        Str8upMenu.Time.stopTime, stopTimeChanged = ImGui.Checkbox("Stop Time Cycle", Str8upMenu.Time.stopTime)
                        if stopTimeChanged then
                            Str8upMenu.Time.updateStopTime()
                        end
        
                        Str8upMenu.Time.superHot, superHotChanged = ImGui.Checkbox("SuperHot Mode (Time Freeze)", Str8upMenu.Time.superHot)
                        if superHotChanged then
                            if Str8upMenu.Time.superHot and Str8upMenu.Cheats.noClip then
                                Str8upMenu.Cheats.noClip = not Str8upMenu.Cheats.noClip
                                Str8upMenu.Cheats.updateNoClip()
                            end
                            Str8upMenu.Time.updateSuperHot()
                        end
        
                        ImGui.PushItemWidth(250)
                        Str8upMenu.Time.timeMultiplier = ImGui.SliderInt("Time Multiplier", Str8upMenu.Time.timeMultiplier, 1, 100, "%dx")
        
                        ImGui.EndTabItem()
                    end
        
                    if ImGui.BeginTabItem("Vehicle") then
                        ImGui.SetWindowSize(430, 81)
                        ImGui.Spacing()
        
                        if ImGui.Button("Fix Vehicle", 115, 19) then
                            Str8upMenu.Vehicle.fixVehicle()
                        end
                        ImGui.SameLine()
                        Str8upMenu.Vehicle.autoFixVehicle = ImGui.Checkbox("Auto Fix Vehicle", Str8upMenu.Vehicle.autoFixVehicle)
                        ImGui.SameLine()
                        if ImGui.Button("Toggle Summon Mode", 148, 19) then
                            Str8upMenu.Vehicle.toggleSummonMode()
                        end
        
                        ImGui.EndTabItem()
                    end
        
                    if ImGui.BeginTabItem("Teleport") then
                        ImGui.SetWindowSize(430, 219)
                        ImGui.Spacing()
        
                        if ImGui.Button("TP to Quest", 202, 19) then
                            Str8upMenu.Teleport.tpToQuest()
                        end
                        ImGui.SameLine(214)
                        if ImGui.Button("TP to Waipoint (Coming Soon)", 202, 19) then
                            print("Not yet choom")
                        end
        
                        ImGui.Spacing()
                        ImGui.Text("Special")
                        ImGui.PushItemWidth(256)
                        Str8upMenu.Teleport.specialTpSelection = ImGui.Combo("##Special Teleport", Str8upMenu.Teleport.specialTpSelection, Str8upMenu.Teleport.specialTpNames, #Str8upMenu.Teleport.specialTpNames, #Str8upMenu.Teleport.specialTpNames)
                        ImGui.SameLine(268)
                        if ImGui.Button("Teleport") then
                            Str8upMenu.Teleport.specialTp()
                        end
        
                        ImGui.Text("Fast Travel Spots")
                        ImGui.PushItemWidth(154)
                        Str8upMenu.Teleport.fastTravelAreaSelection = ImGui.Combo("##Fast Travel Area", Str8upMenu.Teleport.fastTravelAreaSelection, Str8upMenu.Teleport.fastTravelAreaNames, #Str8upMenu.Teleport.fastTravelAreaNames, #Str8upMenu.Teleport.fastTravelAreaNames)
                        ImGui.SameLine(166)
                        ImGui.PushItemWidth(210)
                        Str8upMenu.Teleport.fastTravelDestinationSelection = ImGui.Combo("##Fast Travel Destination", Str8upMenu.Teleport.fastTravelDestinationSelection, Str8upMenu.Teleport.fastTravelDestinationNames[Str8upMenu.Teleport.fastTravelAreaSelection+1], #Str8upMenu.Teleport.fastTravelDestinationNames[Str8upMenu.Teleport.fastTravelAreaSelection+1], #Str8upMenu.Teleport.fastTravelDestinationNames[Str8upMenu.Teleport.fastTravelAreaSelection+1])
                        ImGui.SameLine(380)
                        if ImGui.Button(" Go ") then
                            Str8upMenu.Teleport.fastTravelTp()
                        end
        
                        ImGui.Spacing()
                        ImGui.Spacing()
                        ImGui.Text("Custom Warps")
                        ImGui.SameLine(166)
                        ImGui.PushItemWidth(210)
                        Str8upMenu.Teleport.newWarpName = ImGui.InputText("##New Warp Name", Str8upMenu.Teleport.newWarpName, 100)
                        ImGui.SameLine(380)
                        if ImGui.Button("Add##Warp", 36, 19) then
                            Str8upMenu.Teleport.addWarp(Str8upMenu)
                        end
                        if ImGui.Button("Remove##Warp") then
                            Str8upMenu.Teleport.removeWarp(Str8upMenu)
                        end
                        ImGui.SameLine(62)
                        ImGui.PushItemWidth(250)
                        Str8upMenu.Teleport.warpSelection = ImGui.Combo("##Custom Warp Selection", Str8upMenu.Teleport.warpSelection, Str8upMenu.Data.warpsNames, #Str8upMenu.Data.warpsNames)
                        ImGui.SameLine(316)
                        if ImGui.Button("Warp To", 100, 19) then
                            Str8upMenu.Teleport.tpToWarp(Str8upMenu)
                        end
        
                        ImGui.EndTabItem()
                    end

                    if ImGui.BeginTabItem("Player") then
                        ImGui.SetWindowSize(430, 81)
                        ImGui.Spacing()

                        if ImGui.Button("Undress", 133, 19) then
                            Str8upMenu.Player.undress()
                        end
                        ImGui.SameLine()
                        if ImGui.Button("Toggle Bra", 133, 19) then
                            Str8upMenu.Player.toggleBra()
                        end
                        ImGui.SameLine()
                        if ImGui.Button("Toggle Panties", 133, 19) then
                            Str8upMenu.Player.togglePanties()
                        end

                        ImGui.EndTabItem()
                    end
        
                    if ImGui.BeginTabItem("Utils") then
                        ImGui.SetWindowSize(430, 154)
                        ImGui.Spacing()
        
                        if ImGui.Button("Toggle Quest Item (No Sell / Dismantle) for Equipped Items") then
                            Str8upMenu.Utilities.toggleQuestItems()
                        end
                
                        if ImGui.Button("Untrack Quest", 205, 19) then
                            Str8upMenu.Utilities.untrackQuest()
                        end
                
                        ImGui.SameLine(217)
                        if ImGui.Button("Cancel Fall Dmg", 205, 19) then
                            Str8upMenu.Utilities.cancelFallDamage()
                        end
                
                        ImGui.Spacing()
                        ImGui.Text("Custom Loadouts")
                        ImGui.SameLine(166)
                        ImGui.PushItemWidth(210)
                        Str8upMenu.Utilities.newLoadoutName = ImGui.InputText("##New Loadout Name", Str8upMenu.Utilities.newLoadoutName, 100)
                        ImGui.SameLine(380)
                        if ImGui.Button("Add##Loadout", 42, 19) then
                            Str8upMenu.Utilities.addLoadout(Str8upMenu)
                        end
                        if ImGui.Button("Remove##Loadout") then
                            Str8upMenu.Utilities.removeLoadout(Str8upMenu)
                        end
                        ImGui.SameLine(62)
                        ImGui.PushItemWidth(250)
                        Str8upMenu.Utilities.loadoutSelection = ImGui.Combo("##Custom Loadout Selection", Str8upMenu.Utilities.loadoutSelection, Str8upMenu.Data.loadoutNames, #Str8upMenu.Data.loadoutNames)
                        ImGui.SameLine(316)
                        if ImGui.Button("Load", 106, 19) then
                            Str8upMenu.Utilities.loadLoadout(Str8upMenu)
                        end
        
                        ImGui.EndTabItem()
                    end

                    if ImGui.BeginTabItem("Settings") then
                        ImGui.SetWindowSize(430, 81)
                        ImGui.Spacing()

                        Str8upMenu.Data.json.clickGUI, clickGUIChanged = ImGui.Checkbox("ClickGUI", Str8upMenu.Data.json.clickGUI)
                        if clickGUIChanged then
                            Str8upMenu.Data.Save()
                        end

                        ImGui.EndTabItem()
                    end
        
                    if Str8upUI.devMode then
                        if ImGui.BeginTabItem("Dev") then
                            ImGui.SetWindowSize(430, 81)
                            ImGui.Spacing()

                            if ImGui.Button("Run Dev Script", 415, 19) then
                                Str8upMenu.Dev.Run(Str8upMenu)
                            end

                            ImGui.EndTabItem()
                        end
                    end
        
                end
                ImGui.EndTabBar()
            end
            ImGui.End()
        end

    end)

    Str8upUI.Theme.RevertTheme()

    if listThemeApplied then
        ImGui.PopStyleColor(2)
    end

end

return Str8upUI