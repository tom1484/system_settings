#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Space::ToggleTerminal()

; ShowTerminal()
; {
;     WinTitle := "_quake_ubuntu"
    
;     WinShow, %WinTitle%
;     WinActivate, %WinTitle%

;     WinGetPos, X, Y, W, H, %WinTitle%
;     WinMove, %WinTitle%, , X, Y, W, H
; }

ShowAndPositionTerminal()
{
    WinTitle := "_quake_ubuntu"

    WinShow, %WinTitle%
    WinActivate, %WinTitle%

    WinGetPos, TermX, TermY, TermW, TermH, %WinTitle%
    SysGet, WorkArea, MonitorWorkArea
    SysGet, MonitorArea, Monitor

    if ((MonitorAreaRight - MonitorAreaLeft) != TermW || (MonitorAreaBottom - MonitorAreaTop) != TermH)
    {
        TargetTermW := A_ScreenWidth * 0.8
        TargetTermH := (WorkAreaBottom - WorkAreaTop) * 0.8

        WinMove, %WinTitle%, , (A_ScreenWidth - TargetTermW) / 2, WorkAreaBottom - TargetTermH, TargetTermW, TargetTermH,
    }
}

ToggleTerminal()
{
    WinTitle := "_quake_ubuntu"

    DetectHiddenWindows, On

    if WinExist(WinTitle)
    {
        DetectHiddenWindows, Off

        if !WinExist(WinTitle) || !WinActive(WinTitle)
        {
            ShowAndPositionTerminal()
        }
        else if WinExist(WinTitle)
        {
            WinHide, %WinTitle%
            Send !{Esc}
        }
    }
    else
    {
        ; Run "c:\Users\angel\AppData\Local\Microsoft\WindowsApps\wt.exe" -f -p "Ubuntu" --title "_quake_ubuntu" --tabColor "#0063B1"
        Run "c:\Users\angel\AppData\Local\Microsoft\WindowsApps\wt.exe" -f -p "Ubuntu" --title "_quake_ubuntu"

        loop
        {
            if (WinExist(WinTitle))
            {
                WinSet, AlwaysOnTop, On, %WinTitle%
                ShowAndPositionTerminal()
                break
            }
        }
    }
}

; =====================================================================================================================================================

#Persistent

OnWinActiveChange(hWinEventHook, vEvent, hWnd)
{
    static _ := DllCall("user32\SetWinEventHook", UInt, 0x3, UInt, 0x3, Ptr, 0, Ptr, RegisterCallback("OnWinActiveChange"), UInt, 0, UInt, 0, UInt, 0, Ptr)

    WinTitle := "_quake_ubuntu"

    if WinExist(WinTitle) && !WinActive(WinTitle)
    {
        WinHide, %WinTitle%
    }
}
