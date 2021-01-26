function fileExists(filename)
    local f=io.open(filename,"r") if (f~=nil) then io.close(f) return true else return false end
end
function getCWD(mod_name)
    if fileExists("bin/x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "bin/x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("mods/"..mod_name.."/init.lua") then return "mods/"..mod_name.."/" elseif  fileExists(mod_name.."/init.lua") then return mod_name.."/" elseif  fileExists("init.lua") then return "" end
end


Str8upUI = { 
    description = "Str8up UI Component",
    rootPath =  getCWD("Str8up Menu"),
    devMode = false
}

Str8upUI.Theme = require(Str8upUI.rootPath .. "modules/theme")

function Str8upUI.Draw(Str8upMenu)

    Str8upUI.Theme.ApplyTheme()

    if ImGui.Begin("Str8up Menu") then
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
                Str8upMenu.Cheats.componentToAdd = ImGui.Combo("##Component Name", Str8upMenu.Cheats.componentToAdd, Str8upMenu.Cheats.componentNames, 12)
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

                Str8upMenu.Cheats.infStamina, infStaminaChanged = ImGui.Checkbox("Infinite Stamina", Str8upMenu.Cheats.infStamina)
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

            if ImGui.BeginTabItem("Time Warp") then
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

                if ImGui.Button("Fix Vehicle", 120, 19) then
                    Str8upMenu.Vehicle.fixVehicle()
                end
                ImGui.SameLine()
                Str8upMenu.Vehicle.autoFixVehicle = ImGui.Checkbox("Auto Fix Vehicle (Loop)", Str8upMenu.Vehicle.autoFixVehicle)

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
                Str8upMenu.Teleport.specialTpSelection = ImGui.Combo("##Special Teleport", Str8upMenu.Teleport.specialTpSelection, Str8upMenu.Teleport.specialTpNames, 39)
                ImGui.SameLine(268)
                if ImGui.Button("Teleport") then
                    Str8upMenu.Teleport.specialTp()
                end

                ImGui.Text("Fast Travel Spots")
                ImGui.PushItemWidth(154)
                Str8upMenu.Teleport.fastTravelAreaSelection = ImGui.Combo("##Fast Travel Area", Str8upMenu.Teleport.fastTravelAreaSelection, Str8upMenu.Teleport.fastTravelAreaNames, 20)
                ImGui.SameLine(166)
                ImGui.PushItemWidth(210)
                Str8upMenu.Teleport.fastTravelDestinationSelection = ImGui.Combo("##Fast Travel Destination", Str8upMenu.Teleport.fastTravelDestinationSelection, Str8upMenu.Teleport.fastTravelDestinationNames[Str8upMenu.Teleport.fastTravelAreaSelection+1], 19)
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

            if ImGui.BeginTabItem("Utilities") then
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

            if Str8upUI.devMode then
                if ImGui.BeginTabItem("Dev") then
                    ImGui.Spacing()



                    ImGui.EndTabItem()
                end
            end

        end
        ImGui.EndTabBar()
    end
    ImGui.End()

    Str8upUI.Theme.RevertTheme()

end

return Str8upUI