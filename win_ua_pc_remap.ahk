; Mykola Zakroishchykov
; Keyboard remap for Windows Ukrainian (PC) layout
; AutoHotKey script
;
; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN
;
; ##############################################################
; Disable LWin key
LWin::Return
;
; ##############################################################
; Enable Win+S as Alt+Space
!Space::Send #s
;
; ##############################################################
; Language = CapsLock
;
SetCapsLockState, AlwaysOff
+CapsLock::CapsLock
CapsLock::Send, {LWin down}{Space down}{Space up}{LWin up}
Return
;
; ##############################################################
; Russian letter "ы" = Alt + s
;
!s::
Send, {U+044B}
Return
; Russian letter "э" = Alt + '
;
$!'::
Send, {U+044D}
Return
; Russian letter "Э" = Alt + Shift + '
;
$+!'::
Send, {U+042D}
Return
; Russian letter "ё" = Alt + t
;
$!t::
Send, {U+0451}
Return
; Russian letter "Ё" = Alt + Shift + t
;
$+!t::
Send, {U+0401}
Return
; Russian letter "ъ" = Alt + ]
;
$!]::
Send, {U+044A}
Return
;
; ##############################################################
; "Home" and "End" = Alt + Up/Down
;
!Up::
Send, {PgUp}
Return
;
!Down::
Send, {PgDn}
Return
;
; ##############################################################
;
; "Delete" = Alt + Backspace
;
!Backspace::
Send, {Delete}
Return
;
; ##############################################################
;
; Shift + Wheel for horizontal scrolling
+WheelDown::WheelRight
+WheelUp::WheelLeft
;
; ##############################################################
; MacOS style functional
;
; Alt + C = copy
!c::Send ^c
;
; Alt + V = paste
!v::Send ^v
;
; Alt + X = cut
!x::Send ^x
;
; Alt + Z = undo
!z::Send ^z
;
; Alt + W = undo
!w::Send ^w
;
; Alt + Q = force quit
!q::Send !{F4}
;
; Alt + A = select all
!a::Send ^a
;
; Alt + R = reload page
!r::Send ^r
;
; ##############################################################
; Note: You can optionally release the ALT key after pressing down the mouse button 
; rather than holding it down the whole time.
 
~Alt & LButton::
    if WinActive("ahk_class MultitaskingViewFrame")
        Click
    CoordMode, Mouse  ; Switch to screen/absolute coordinates.
    MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
    WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
    WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin% 
    if EWD_WinState = 0  ; Only if the window isn't maximized
        SetTimer, EWD_WatchMouse_L, 10 ; Track the mouse as the user drags it.
return
 
~Alt & RButton::
    CoordMode, Mouse  ; Switch to screen/absolute coordinates.
    MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
    WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
    WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin% 
    if EWD_WinState = 0  ; Only if the window isn't maximized
        SetTimer, EWD_WatchMouse_R, 10 ; Track the mouse as the user drags it.
return
 
EWD_WatchMouse_L:
    GetKeyState, EWD_LButtonState, LButton, P
    if EWD_LButtonState = U  ; Button has been released, so drag is complete.
    {
        SetTimer, EWD_WatchMouse_L, off
        return
    }
 
    GetKeyState, EWD_EscapeState, Escape, P
    if EWD_EscapeState = D  ; Escape has been pressed, so drag is cancelled.
    {
        SetTimer, EWD_WatchMouse_L, off
        WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
        return
    }
 
    ; Otherwise, reposition the window to match the change in mouse coordinates
    ; caused by the user having dragged the mouse:
    CoordMode, Mouse
    MouseGetPos, EWD_MouseX, EWD_MouseY
    WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
    SetWinDelay, -1   ; Makes the below move faster/smoother.
    WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
    EWD_MouseStartX := EWD_MouseX  ; Update for the next timer-call to this subroutine.
    EWD_MouseStartY := EWD_MouseY
return
 
EWD_WatchMouse_R:
    GetKeyState, EWD_LButtonState, RButton, P
    if EWD_LButtonState = U  ; Button has been released, so drag is complete.
    {
        SetTimer, EWD_WatchMouse_R, off
        return
    }
 
    GetKeyState, EWD_EscapeState, Escape, P
    if EWD_EscapeState = D  ; Escape has been pressed, so drag is cancelled.
    {
        SetTimer, EWD_WatchMouse_R, off
        WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
        return
    }
 
    ; Otherwise, reposition the window to match the change in mouse coordinates
    ; caused by the user having dragged the mouse:
    CoordMode, Mouse
    MouseGetPos, EWD_MouseX, EWD_MouseY
    WinGetPos, EWD_WinX, EWD_WinY, EWD_WinW, EWD_WinH, ahk_id %EWD_MouseWin%
    SetWinDelay, -1   ; Makes the below move faster/smoother.
    WinMove, ahk_id %EWD_MouseWin%,,,, EWD_WinW + EWD_MouseX - EWD_MouseStartX, EWD_WinH + EWD_MouseY - EWD_MouseStartY
    EWD_MouseStartX := EWD_MouseX  ; Update for the next timer-call to this subroutine.
    EWD_MouseStartY := EWD_MouseY
return
