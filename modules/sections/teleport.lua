function fileExists(filename)
    local f=io.open(filename,"r") if (f~=nil) then io.close(f) return true else return false end
end
function getCWD(mod_name)
    if fileExists("bin/x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "bin/x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "x64/plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("plugins/cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "plugins/cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("cyber_engine_tweaks/mods/"..mod_name.."/init.lua") then return "cyber_engine_tweaks/mods/"..mod_name.."/" elseif fileExists("mods/"..mod_name.."/init.lua") then return "mods/"..mod_name.."/" elseif  fileExists(mod_name.."/init.lua") then return mod_name.."/" elseif  fileExists("init.lua") then return "" end
end


Str8upTeleport = { 
    description = "Str8up Teleport Component",
    rootPath =  getCWD("Str8up Menu"),
    specialTpSelection = 0,
    specialTpNames = "Akulov penthouse\0Peralezes Apt\0Gutierrez Apt\0Time Machine Guitar room\0Denny's Estate Inside\0Hanako Estate bedroom\0Voodoo Boys Subway\0Slayton Apt\0NCPD Conference room\0JigJig St. hotel room\0Dark Matter hotel room\0Megatower H8 penthouse\0Outside the city (Nomad starting)\0V's Mansion\0Grand Imperial Plaza Mall\0Unfinished Casino\0VB Data Fortress\0River BD School\0Monorail Tunnel\0Konpeki Tower\0Konpeki Tower - V Suite\0Clouds\0Embers\0Badlands Tunnel\0Badlands Tunnel Entrance\0Petrochem Off-limits area\0Arasaka Tower Abandoned area\0Arasaka Tower Jungle\0Arasaka Tower Upper Atrium\0Arasaka Tower CEO level\0Arasaka Tower CEO office\0Arasaka Tower Unlisted levels\0Arasaka Tower Unlisted temple\0Arasaka Tower Counter-intel\0Arasaka Tower Underground\0Arasaka Tower Boring Machine\0Arasaka Mikoshi Mainframe\0Arasaka Orbital Station\0Johnny interrogation room\0\0",
    specialTpCoords = { {-1218.135986, 1409.635010, 113.524445}, {-75.815399, -113.607819, 111.161728}, {20.760391, 5.750076, 138.900955}, {-1843.676392, -575.336243, 7.754036}, {486.977325, 1291.791016, 234.458664}, {290.197662, 1022.468079, 229.920425}, {-1662.758545, -1867.002563, 54.982040}, {-1450.692139, -1038.510742, 77.555298}, {-1761.547729, -1010.821655, 94.300003}, {-664.977112, 847.753113, 28.499626}, {-372.268982, 271.240143, 215.515579}, {-701.484680, 849.270264, 322.252228}, {-3235.881592, -6146.751465, 96.834175}, {-1341.383545, 1242.970337, 111.100006}, {-2278.209473, -1992.328613, 20.570023}, {934.451233, 1458.630981, 242.120010}, {-1661.448242, -1869.755859, 54.992889}, {-6491.909180, -3167.271240, 57.558006}, {-1663.618774, -1867.443726, 54.990150}, {-2229.413818, 1769.449707, 21.000000}, {-2202.186035, 1783.184204, 163.000000}, {-625.404236, 794.564392, 132.252228}, {-1795.816162, -526.988647, 74.241196}, {-1255.622437, 126.991272, -43.753677}, {185.345749, 2365.449707, 67.081177}, {-118.046112, -486.535583, 7.296860}, {-1475.830200, 161.548401, 208.637604}, {-1449.256470, 118.300171, 321.639038}, {-1390.497559, 162.406921, 388.347961}, {-1437.788208, 157.247620, 565.346008}, {-1447.286621, 73.579651, 568.946045}, {-1428.207520, 95.437912, 543.348022}, {-1383.655518, 118.832474, 542.696289}, {-1442.981689, 139.817459, 141.996506}, {-1376.191528, 143.706009, -26.648010}, {-1447.010010, 40.182648, -36.814171}, {-1448.108398, 149.156219, -27.652016}, {4743.650879, -1091.755127, 1310.439575}, {-1389.446533, 141.266556, -139.361572} },
    fastTravelAreaSelection = 0,
    fastTravelAreaNames = "Metro\0Arasaka Waterfront\0Arroyo\0Charter Hill\0Coastview\0Corpo Plaza\0Downtown\0Japantown\0Kabuki\0Little China\0North Oak\0Northern Badlands\0Northside\0Rancho Coronado\0Southern Badlands\0The Glen\0Vista Del Rey\0Watson\0Wellsprings\0West Wind Estate\0",
    fastTravelDestinationSelection = 0,
    fastTravelDestinationNames = { "Charter Hill\0Congress MLK\0Downtown Alexander St\0Ebunike\0Eisenhower St\0Ellison St\0Farrier St\0Glen North\0Glen South\0Japantown South\0Market St\0Med Center\0Megabuilding H7\0Memorial Park\0Monroe St\0Republic Way\0Stadium\0Wolleson St\0Zocalo\0", "Arasaka Waterfront North\0California & Pershing\0", "Arasaka Industrial Park\0Hargreaves St\0Megabuilding H4\0Megabuilding H6\0MLK & Brandon\0Red Dirt Bar\0Republic East\0San Amaro St\0", "Dynalar\0Gold Niwaki Plaza\0Lele Park\0Longshore South\0Luxury Apartments\0", "Batty's Hotel\0Chapel\0Grand Imperial Mall\0Pacifica Pier\0Stadium Parking\0", "Arasaka Tower\0Reconciliation Park\0Ring Road\0", "Berkley & Bruce Skiv\0Downtown Central\0Downtown North\0Gold Beach Marina\0Halsey & MLK\0Skyline & Republic\0", "Capitola St\0Cherry Blossom Market\0Crescent & Broad\0Dark Matter\0Fourth Wall Studios\0Japantown West\0Megabuilding H8\0Redwood Market\0Sagan & Diamond\0Silk Road West\0Skyline & Salinas\0", "Allen St South\0Bellevue Overwalk\0Charter St\0Creek Loop\0Kabuki Central\0Kabuki Market\0Kennedy North\0Pinewood St South\0Sutter St\0", "Afterlife\0Bradbury & Buran\0California & Cartwright\0Clarendon St\0Drake Ave\0Goldsmith St\0Megabuilding H10 Atrium\0Megabuilding H10\0Riot\0", "Arasaka Estate\0Columbarium\0DriveIn Theater\0Kerry Eurodyne's Residence\0North Oak Sign\0", "101 North\0Big Rock\0Dam\0Desert Film Set\0Edgewood Farm\0Far Ridge\0I9 East\0Lake Farm\0Medeski Fuel Station\0Mobile Camp\0Nomad Camp\0Oil Fields\0Old Turbines\0Rocky Ridge\0Sunset Motel\0Sunshine Motel\0Wraith Camp\0", "All Foods Plant\0Docks\0East\0Ebunike Docks\0Longshore North\0Offshore St\0Pershing St\0", "Almunecar & Jerez\0Kendal Park\0Mallagra & Manzanita\0Piez\0Rancho Coronado East\0Rancho Coronado North\0Rancho Coronado South\0Tama Viewpoint\0Trailer Park\0", "Abandoned Fuel Station\0Abandoned Parking Lot\0Autowerks\0Border Checkpoint\0Fuel Station\0Las Palapas Motel\0Protein Farm\0Regional Airport\0Solar Arrays\0Solar Power Station\0Tango Tors Motel\0", "El Coyote Cojo\0Embers\0Hanford Overpass\0Megabuilding H3\0Palms View Way\0Senate Market\0Valentino Alley\0Ventura & Skyline\0", "College St\0Congress & Madison\0Delamain HQ\0Petrel St\0Republic & Vine\0Shooting Range\0Skyline East\0", "Martin St\0", "Berkeley & Bay\0Cannery Plaza\0Corporation St\0Megabuilding H2\0Palms View Plaza\0Parque del Mar\0Pumping Station\0", "West Wind Apartments\0" },
    fastTravelDestinationCoords = { { { -116.675049, 119.875946, 12.400810 }, { -1023.747253, -346.752930, 5.747658 }, { -2066.939941, 481.599426, 8.052666 }, { -1364.738647, -657.802734, 5.862694 }, { -1769.854980, 1867.438721, 18.266228 }, { -1387.395752, 1031.253052, 27.120079 }, { -1605.152466, 1475.684814, 18.213150 }, { -1550.820068, -645.377808, 5.644722 }, { -1589.916626, -1303.983398, 47.983864 }, { -565.596558, 208.287003, 22.278320 }, { -2119.529785, -697.364868, 6.807755 }, { -1419.682251, 1759.183472, 16.267494 }, { 131.369156, -1134.585693, 31.604141 }, { -1326.254639, -38.584312, -3.849998 }, { -527.089355, 1130.915649, 34.693810 }, { -1476.540527, 461.430115, 5.816879 }, { -1544.985840, -1949.305542, 62.844879 }, { -1065.882202, -1428.346924, 30.800568 }, { -1457.519043, 1180.812988, 45.969971 } }, { { -2249.422607, 2790.595703, 6.998512 }, { -2158.543945, 1992.921631, 18.179993 } }, { { -187.235092, -1498.562744, 7.651115 }, { -681.783813, -1253.090088, 8.917519 }, { -966.621643, -1772.664063, 11.139526 }, { -210.115601, -851.740540, 7.636658 }, { -506.188141, -760.183350, 7.425468 }, { -735.576233, -978.767334, 7.871933 }, { 121.172760, -631.823364, 7.586708 }, { 683.641724, -593.125793, 9.958153 } }, { { 191.919556, -281.097382, 6.850464 }, { -230.333893, 306.175964, 29.550003 }, { -176.279922, -82.963379, 7.199997 }, { 3.551506, -343.570831, 8.247482 }, { -57.159065, -49.195641, 7.179688 } }, { { -1861.534058, -1936.552734, 48.520454 }, { -1771.104004, -1947.012085, 57.196289 }, { -2187.653320, -2206.135498, 11.872383 }, { -1879.028564, -1626.882690, 18.023087 }, { -1306.253662, -1670.670898, 44.026413 } }, { { -1447.876465, 43.759552, 16.133087 }, { -1624.481689, -333.415283, -13.775887 }, { -1148.354980, 135.841690, 7.351761 } }, { { -1859.911255, 674.854797, 10.721786 }, { -2115.055420, 260.345886, 7.899048 }, { -1520.733521, 693.010620, 8.889977 }, { -2393.063965, 88.819763, 12.252205 }, { -1755.175659, 185.812897, 16.682281 }, { -2354.598389, 432.451263, 7.852264 } }, { { -519.242798, 1608.657349, 32.846870 }, { -701.197021, 952.707153, 12.000000 }, { -418.835938, 484.581635, 30.162666 }, { -304.737213, 222.058502, 28.793533 }, { -301.440247, 1088.926147, 65.659531 }, { -882.735962, 1313.359497, 22.410698 }, { -704.121216, 762.288940, 32.709610 }, { -388.168396, 702.382019, 115.000351 }, { -714.925049, 1277.999023, 29.565125 }, { -695.519409, 403.685699, 19.427155 }, { -456.937866, 1402.395508, 37.288055 } }, { { -1087.368286, 1312.513672, 5.374847 }, { -1129.874268, 1486.755005, 30.247276 }, { -846.116577, 1835.391968, 36.191414 }, { -1054.526245, 1572.820190, 2.538277 }, { -1183.310181, 1365.121094, 20.305519 }, { -1158.939819, 2014.353149, 12.077278 }, { -1213.705200, 1880.890137, 22.503624 }, { -1154.623413, 1160.797974, 17.336678 }, { -1202.710083, 1616.870239, 22.913216 } }, { { -1470.313232, 1062.898682, 22.690002 }, { -1555.838379, 1246.163086, 19.060921 }, { -2022.412109, 1641.620239, 9.099998 }, { -1974.476318, 1180.099487, 12.140587 }, { -1608.029541, 1772.902588, 18.380005 }, { -1520.434082, 1551.927002, 18.200005 }, { -1397.080200, 1277.981689, 123.082413 }, { -1381.996826, 1970.703613, 23.303986 }, { -1658.803955, 997.907043, 23.842079 } }, { { 485.876160, 1223.923828, 229.253220 }, { 153.372620, 576.671753, 117.253189 }, { -72.395996, 1988.022339, 100.879242 }, { 222.213425, 1077.246216, 200.585983 }, { 282.900299, 800.548462, 146.618530 } }, { { -2495.746094, 3583.858643, 12.938057 }, { 4347.493164, -721.745300, 147.884262 }, { 880.091492, -2991.241211, 204.616104 }, { 3202.316406, 620.702759, 104.465958 }, { 2458.574951, -1280.171875, 63.646767 }, { 4539.604492, -2132.445801, 183.254547 }, { 4963.110352, -740.377075, 135.504868 }, { 911.966309, -3497.900146, 184.137390 }, { 1443.871338, -1370.475952, 51.342392 }, { 3427.984863, -361.161224, 134.111588 }, { 1802.272705, 2248.458740, 180.203171 }, { -1835.562988, 3718.814941, 7.013145 }, { 3703.128418, -1682.625732, 123.686722 }, { 2534.697266, -95.649689, 81.437546 }, { 1634.063477, -738.236633, 49.895164 }, { 3583.372803, -895.978638, 119.432892 }, { 3079.850586, -2224.270020, 131.526901 } }, { { -715.770325, 2181.695068, 53.083183 }, { -1869.098877, 2701.500977, 7.186920 }, { -541.817627, 1855.663330, 36.308365 }, { -1480.964111, 2956.828857, 7.167450 }, { -600.727417, 2582.864014, 53.788757 }, { -1256.198730, 2913.805420, 7.186905 }, { -1731.432617, 2308.383789, 18.153419 } }, { { 60.003670, -1926.943848, 2.488144 }, { 365.050415, -1688.970215, 9.478279 }, { 312.330292, -1420.690552, 15.142372 }, { -152.257568, -2016.054443, 6.166382 }, { 436.093536, -2147.283691, 14.606949 }, { 703.166870, -980.638489, 28.830177 }, { -498.026093, -1850.947876, 7.427170 }, { 772.541748, -2111.575928, 172.688416 }, { 1193.787354, -592.487732, 32.642372 } }, { { -1121.068726, -5584.205566, 92.351715 }, { -765.010620, -2437.524658, 14.164856 }, { -85.442413, -4357.510742, 58.925934 }, { -2810.448486, -5434.768555, 96.817169 }, { -1795.271851, -4324.356445, 74.362686 }, { -1355.061646, -3701.890625, 55.518593 }, { -3479.191162, -4183.936523, 68.088974 }, { -1514.275391, -5080.505371, 83.015884 }, { -661.301819, -3836.813477, 72.034531 }, { -176.182175, -2612.593018, 28.585411 }, { -201.967300, -4915.733887, 77.367416 } }, { { -1327.961792, -1003.418335, 12.345001 }, { -1774.093262, -510.787659, 10.144997 }, { -1219.670898, -1208.430176, 32.824081 }, { -1177.690674, -916.811401, 12.874184 }, { -1719.818115, -885.937805, 8.586227 }, { -1888.541870, -574.476196, 7.874062 }, { -1610.918823, -1180.415405, 24.885757 }, { -1860.286377, -1206.148193, 20.227318 } }, { { -982.161499, -597.758911, 8.199997 }, { -1222.185913, -447.833893, 8.147102 }, { -890.029236, -83.328903, 7.229996 }, { -923.600098, 105.552841, 7.315536 }, { -597.018066, -121.825409, 7.680000 }, { -1048.470947, -914.859741, 8.182121 }, { -657.839233, -434.428345, 8.199997 } }, { { -1419.294434, 2225.762451, 18.200005 } }, { { -2232.568604, -364.378632, 17.328758 }, { -2439.859863, -537.561523, 6.900009 }, { -2402.859863, -71.859482, 8.101974 }, { -2121.614258, -1120.571533, 32.737091 }, { -2357.700684, -810.109253, 12.903328 }, { -2302.093018, -1108.038696, 14.000122 }, { -2410.070801, -961.201172, 8.134583 } }, { { -2658.558350, -2487.677979, 18.039314 } } },
    newWarpName = "New Warp",
    warpSelection = 0
}


function Str8upTeleport.tpToQuest()

    jm = Game.GetJournalManager()
    ms = Game.GetMappinSystem()
    quest = jm:GetTrackedEntry()
    if quest then
        quest_hash = jm:GetEntryHash(quest)
        none, locs = ms:GetQuestMappinPositionsByObjective(quest_hash)
        if locs[1] then
            Game.TeleportPlayerToPosition(locs[1].x, locs[1].y, locs[1].z)
        end
    end

end


function Str8upTeleport.specialTp()

    dest = Str8upTeleport.specialTpCoords[Str8upTeleport.specialTpSelection+1]
    Game.TeleportPlayerToPosition(dest[1], dest[2], dest[3])

end


function Str8upTeleport.fastTravelTp()

    if Str8upTeleport.fastTravelDestinationCoords[Str8upTeleport.fastTravelAreaSelection+1][Str8upTeleport.fastTravelDestinationSelection+1] then
        dest = Str8upTeleport.fastTravelDestinationCoords[Str8upTeleport.fastTravelAreaSelection+1][Str8upTeleport.fastTravelDestinationSelection+1]
        Game.TeleportPlayerToPosition(dest[1], dest[2], dest[3])
    end

end


function Str8upTeleport.addWarp(Str8upMenu)

    if Str8upTeleport.newWarpName:find("\0", 1, true) then
        addWarpName = Str8upTeleport.newWarpName:sub(1, Str8upTeleport.newWarpName:find("\0", 1, true)-1)
    else
        addWarpName = Str8upTeleport.newWarpName
    end
    if addWarpName == "" then
        addWarpName = "New Warp"
    end
    addWarpFinalName = addWarpName
    i = 0
    while Str8upMenu.Data.json.warps[addWarpFinalName] do
        i = i + 1
        addWarpFinalName = addWarpName .. " (" .. i .. ")"
    end
    pos = Game.GetPlayer():GetWorldPosition()
    Str8upMenu.Data.json.warps[addWarpFinalName] = { x = pos.x, y = pos.y, z = pos.z, w = pos.w, yaw = Game.GetPlayer():GetWorldYaw() }
    Str8upMenu.Data.Save()
    table.insert(Str8upMenu.Data.warpsNames, addWarpFinalName)
    Str8upTeleport.warpSelection = #Str8upMenu.Data.warpsNames - 1

end


function Str8upTeleport.removeWarp(Str8upMenu)

    Str8upMenu.Data.json.warps[Str8upMenu.Data.warpsNames[Str8upTeleport.warpSelection+1]] = nil
    Str8upMenu.Data.Save()
    table.remove(Str8upMenu.Data.warpsNames, Str8upTeleport.warpSelection+1)
    if Str8upTeleport.warpSelection+1 > #Str8upMenu.Data.warpsNames then
        Str8upTeleport.warpSelection = #Str8upMenu.Data.warpsNames - 1
    end

end


function Str8upTeleport.tpToWarp(Str8upMenu)

    tpTo = Str8upMenu.Data.json.warps[Str8upMenu.Data.warpsNames[Str8upTeleport.warpSelection+1]]
    Game.GetTeleportationFacility():Teleport(Game.GetPlayer(), Vector4.new(tpTo.x, tpTo.y, tpTo.z, tpTo.w) , EulerAngles.new(0,0,tpTo.yaw))

end

return Str8upTeleport