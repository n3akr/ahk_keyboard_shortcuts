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
;
; Language = CapsLock
;
SetCapsLockState, AlwaysOff
+CapsLock::CapsLock
CapsLock::Send, {Ctrl down}{Shift down}{Shift up}{Ctrl up}{Ctrl up}
Return
;
; ##############################################################
;
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
;
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