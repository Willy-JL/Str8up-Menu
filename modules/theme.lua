function fileExists(filename)
    local f=io.open(filename,"r") if (f~=nil) then io.close(f) return true else return false end
end
function getCWD(mod_name)
    if fileExists("bin/x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "bin/x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("mods/"..mod_name.."/init.lua") then return "mods/"..mod_name.."/" elseif  fileExists(mod_name.."/init.lua") then return mod_name.."/" elseif  fileExists("init.lua") then return "" end
end


Str8upTheme = { 
    description = "Str8up Theme Component",
    rootPath =  getCWD("Str8up Menu")
}


function Str8upTheme.ApplyTheme()

    ImGui.PushStyleColor(ImGuiCol.Border,                  0.99, 0.93, 0.04, 0.50)
    ImGui.PushStyleColor(ImGuiCol.Button,                  0.99, 0.93, 0.04, 0.50)
    ImGui.PushStyleColor(ImGuiCol.ButtonActive,            0.99, 0.93, 0.04, 1.00)
    ImGui.PushStyleColor(ImGuiCol.ButtonHovered,           0.99, 0.93, 0.04, 0.75)
    ImGui.PushStyleColor(ImGuiCol.CheckMark,               0.99, 0.93, 0.04, 1.00)
    ImGui.PushStyleColor(ImGuiCol.FrameBg,                 0.00, 0.94, 1.00, 0.50)
    ImGui.PushStyleColor(ImGuiCol.FrameBgActive,           0.00, 0.94, 1.00, 0.85)
    ImGui.PushStyleColor(ImGuiCol.FrameBgHovered,          0.00, 0.94, 1.00, 0.65)
    ImGui.PushStyleColor(ImGuiCol.Header,                  0.99, 0.93, 0.04, 0.65)
    ImGui.PushStyleColor(ImGuiCol.HeaderActive,            0.99, 0.93, 0.04, 0.75)
    ImGui.PushStyleColor(ImGuiCol.HeaderHovered,           0.99, 0.93, 0.04, 0.50)
    ImGui.PushStyleColor(ImGuiCol.PopupBg,                 0.00, 0.00, 0.00, 0.75)
    ImGui.PushStyleColor(ImGuiCol.ResizeGrip,              0.00, 0.94, 1.00, 0.60)
    ImGui.PushStyleColor(ImGuiCol.ResizeGripActive,        0.00, 0.94, 1.00, 1.00)
    ImGui.PushStyleColor(ImGuiCol.ResizeGripHovered,       0.00, 0.94, 1.00, 0.75)
    ImGui.PushStyleColor(ImGuiCol.ScrollbarBg,             0.00, 0.00, 0.00, 0.00)
    ImGui.PushStyleColor(ImGuiCol.ScrollbarGrab,           0.00, 0.94, 1.00, 0.50)
    ImGui.PushStyleColor(ImGuiCol.ScrollbarGrabActive,     0.00, 0.94, 1.00, 0.85)
    ImGui.PushStyleColor(ImGuiCol.ScrollbarGrabHovered,    0.00, 0.94, 1.00, 0.65)
    ImGui.PushStyleColor(ImGuiCol.Separator,               0.56, 0.06, 0.03, 0.60)
    ImGui.PushStyleColor(ImGuiCol.SliderGrab,              0.69, 0.53, 0.03, 0.70)
    ImGui.PushStyleColor(ImGuiCol.SliderGrabActive,        0.99, 0.93, 0.04, 0.85)
    ImGui.PushStyleColor(ImGuiCol.Tab,                     0.00, 0.94, 1.00, 0.35)
    ImGui.PushStyleColor(ImGuiCol.TabActive,               0.00, 0.94, 1.00, 0.75)
    ImGui.PushStyleColor(ImGuiCol.TabHovered,              0.00, 0.94, 1.00, 0.65)
    ImGui.PushStyleColor(ImGuiCol.TextSelectedBg,          0.99, 0.93, 0.04, 0.50)
    ImGui.PushStyleColor(ImGuiCol.TitleBg,                 0.99, 0.93, 0.04, 0.35)
    ImGui.PushStyleColor(ImGuiCol.TitleBgActive,           0.99, 0.93, 0.04, 0.50)
    ImGui.PushStyleColor(ImGuiCol.TitleBgCollapsed,        0.99, 0.93, 0.04, 0.25)
    ImGui.PushStyleColor(ImGuiCol.WindowBg,                0.00, 0.00, 0.00, 0.75)

end


function Str8upTheme.RevertTheme()

    ImGui.PopStyleColor(30)

end

return Str8upTheme