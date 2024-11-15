; Script:    PD2 PlugY Helper.ahk
; License:   MIT License
; Author:    Synpoo
; Github:    https://github.com/synpoox/PD2-PlugY-Helper
; Date:      Nov 15 2024
; Version:   0.1.0

#HotIf WinActive('ahk_class Diablo II')

IsStashOpen() => PixelSearch(&StashGoldx, &StashGoldy, 695, 1170, 740, 1207, 0xDCD5B0, 3)
StashClick(x, y) {
    MouseGetPos &xpos, &ypos
    MouseClick "left", x, y
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
