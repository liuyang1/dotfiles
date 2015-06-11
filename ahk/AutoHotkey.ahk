; this file need follow dos style, use "\r\n" at end of line

; sgdt, literal string shortcut
; add mail signature with timestamp
::sgdt::
str = Best regards,`nYang`n%A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec%
clipboard = %str%
send ^v
return

; set CapsLock key as Ctrl key
CapsLock:: LCtrl
return

; Win + Ctrl + Alt + Shift + f, to call everything
; this need setting this shortcut in everything
#f:: send #^!+f
return

; Win + Shift + C, close window, awesomeWM style
#+c::
send !{F4}
return

; Win + O, send current window to next screen
#o::
send #+{Left}
return
