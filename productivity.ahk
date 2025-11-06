#Requires AutoHotkey v2.0

; === Reload Script in VS Code with Ctrl+S ===
; ~ allows you to trigger a reload with ctrl + s

; #HotIf WinActive(' - Visual Studio Code')
;     ~^s::Reload()
; #HotIf

#Requires AutoHotkey v2.0+

; Permanently turn off the CapsLock state (v2 function)
; SetStoreKeyBehavior(false)

; --- CapsLock as Esc (Tap) / Ctrl (Hold) ---
*CapsLock:: {
    ; Send Ctrl down immediately (v2 function syntax)
    Send("{Ctrl down}")
    
    ; Wait for the physical key to be released (v2 function syntax)
    KeyWait("CapsLock")
    
    ; Send Ctrl up (v2 function syntax)
    Send("{Ctrl up}")
    
    ; This if-statement logic is the same in v1 and v2
    if (A_TimeSinceThisHotkey < 200) {
        ; If it was a tap, send Escape (v2 function syntax)
        Send("{Esc}")
    }
    
    ; No "return" is needed; the closing brace } ends the hotkey.
}

; === Right Ctrl: Hold = Ctrl+Shift+Alt (Tap does nothing) ===
RCtrlTapThreshold := 200  ; Max ms for detecting hold
RCtrlPressedTime := 0
RCtrlIsHeld := false

RControl:: {
    global RCtrlPressedTime, RCtrlIsHeld
    RCtrlPressedTime := A_TickCount
    RCtrlIsHeld := false
    SetTimer(CheckRCtrlHold, -RCtrlTapThreshold)
}

CheckRCtrlHold() {
    global RCtrlIsHeld
    if GetKeyState("RControl", "P") {
        RCtrlIsHeld := true
        Send("{Ctrl Down}{Shift Down}{Alt Down}")
    }
}

RControl Up:: {
    global RCtrlIsHeld
    if RCtrlIsHeld {
        Send("{Ctrl Up}{Shift Up}{Alt Up}")
    }
}

; === Window Management ===

; Minimize all windows with Ctrl+Shift+Alt+M
^+!m:: {
    WinMinimizeAll()
}

; Minimize active window with Ctrl+M
^m:: {
    WinMinimize("A")
}

; === Productivity Apps ===

; Launch or focus Todoist (Ctrl+Shift+Alt+T)
^+!d:: {
    if WinExist("ahk_exe Todoist.exe") {
        WinActivate
    } else {
        Run "C:\Users\hdasari\AppData\Local\Programs\todoist\Todoist.exe"
    }
}

; Launch or focus Obsidian (Ctrl+Shift+Alt+O)
^+!o:: {
    if WinExist("ahk_exe Obsidian.exe") {
        WinActivate
    } else {
        Run "C:\Users\hdasari\AppData\Local\Programs\Obsidian\Obsidian.exe"
    }
}

; Launch or focus Spark Email (Ctrl+Shift+Alt+E)
^+!s:: {
    if WinExist("ahk_exe Spark.exe") {
        WinActivate
    } else {
        Run "C:\Users\hdasari\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Spark Desktop.lnk"
    }
}

; === Web Apps (Chrome Shortcuts) ===

; Launch or focus WhatsApp Web (Ctrl+Shift+Alt+W)
^+!w:: {
    if WinExist("ahk_exe chrome.exe") && WinExist("WhatsApp Web") {
        WinActivate "WhatsApp Web"
    } else {
        Run '"C:\Users\hdasari\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Chrome Apps\WhatsApp Web.lnk"'
    }
}

; Launch or focus Outlook PWA (Ctrl+Shift+Alt+D)
^+!e:: {
    if WinExist("ahk_exe chrome.exe") && WinExist("Outlook (PWA)") {
        WinActivate "Outlook (PWA)"
    } else {
        Run '"C:\Users\hdasari\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Chrome Apps\Outlook (PWA).lnk"'
    }
}

; Launch or focus Personal Chrome profile/app (Ctrl+Shift+Alt+A)
^+!a:: {
    if WinExist("ahk_exe chrome.exe") && WinExist("arc") {
        WinActivate "arc"
    } else {
        Run "chrome.exe"
    }
}

; Launch or focus OpenText in Chrome (Ctrl+Shift+Alt+P)
^+!p:: {
    if WinExist("ahk_exe chrome.exe") && WinExist("opentext") {
        WinActivate "opentext"
    } else {
        Run "chrome.exe"
    }
}

; === OT Tools ===

; Launch or focus NetIQ OTP Tool (Ctrl+Shift+Alt+N)
^+!n:: {
    if WinExist("ahk_exe WindowsOtpTool.exe") && WinExist("NetIQ Advanced Authentication OTP Tool") {
        WinActivate "NetIQ Advanced Authentication OTP Tool"
    } else {
        Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\OTP Desktop Tool\AA OTP Desktop Tool.lnk"
    }
}

; Launch or focus Microsoft Teams (Ctrl+Shift+Alt+F)
^+!t:: {
    if WinExist("ahk_exe ms-teams.exe") {
        WinActivate
    } else {
        Run "ms-teams.exe"
    }
}

; === Development Tools ===

; Launch or focus Visual Studio Code (Ctrl+Shift+Alt+V)
^+!v:: {
    if WinExist("ahk_exe code.exe") {
        WinActivate
    } else {
        Run "C:\Users\hdasari\AppData\Local\Programs\Microsoft VS Code\Code.exe"
    }
}

; Launch or focus ChatGPT Desktop App (Ctrl+Shift+Alt+C)
^+!c:: {
    if WinExist("ahk_exe ChatGPT.exe") {
        WinActivate
    } else {
        Run "ChatGPT.exe"
    }
}

; Launch or focus Windows Terminal (Ctrl+Shift+Alt+G)
^+!g:: {
    if WinExist("ahk_exe WindowsTerminal.exe") {
        WinActivate
    } else {
        Run "wt.exe"
    }
}

; Launch or focus IntelliJ IDEA (Ctrl+Shift+Alt+I)
^+!i:: {
    if WinExist("ahk_exe idea64.exe") {
        WinActivate
    } else {
        Run "idea64.exe"
    }
}