
Str8upTime = {
    description = "Str8up Time Component",
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