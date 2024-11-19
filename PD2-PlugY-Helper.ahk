; Script:    PD2 PlugY Helper.ahk
; License:   MIT License
; Author:    Synpoo
; Github:    https://github.com/synpoox/PD2-PlugY-Helper
; Date:      Nov 16 2024
; Version:   0.2.1

#Requires AutoHotkey v2.0.18+
#HotIf WinActive("ahk_class Diablo II")

UpdateScalingFactors() {
    WinGetPos(&WinX, &WinY, &WinWidth, &WinHeight, "A")
    
    ; Base resolution (2560x1440)
    BaseWidth := 2560
    BaseHeight := 1440
    
    ; Calculate scaling factors
    Global ScaleX := WinWidth / BaseWidth
    Global ScaleY := WinHeight / BaseHeight
}

IsStashOpen() {
    UpdateScalingFactors()

    StartX := Floor(685 * ScaleX)
    StartY := Floor(1150 * ScaleY)
    EndX := Ceil(745 * ScaleX)
    EndY := Ceil(1202 * ScaleY)

    return PixelSearch(&StashGoldx, &StashGoldy, StartX, StartY, EndX, EndY, 0xDCD5B0, 20)
}

StashClick(x, y) {
    UpdateScalingFactors()
    MouseGetPos &xpos, &ypos
    MouseClick "left", Round(x * ScaleX), Round(y * ScaleY)
    MouseMove xpos, ypos
}

; Individual pages
WheelUp:: {
    if IsStashOpen()
        StashClick(930, 75)
}
WheelDown:: {
    if IsStashOpen()
        StashClick(860, 75)
}

; Last not empty page/first page
+WheelUp:: {
    if IsStashOpen()
        StashClick(930, 75)
}
+WheelDown:: {
    if IsStashOpen()
        StashClick(860, 75)
}

; Next/previous index
!WheelUp:: {
    if IsStashOpen()
        StashClick(1000, 75)
}
!WheelDown:: {
    if IsStashOpen()
        StashClick(780, 75)
}

; Next/previous main index
!+WheelUp:: {
    if IsStashOpen()
        StashClick(1000, 75)
}
!+WheelDown:: {
    if IsStashOpen()
        StashClick(780, 75)
}
