#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Space::ToggleTerminal()

ShowAndPositionTerminal()
{
    WinTitle := "_quake_ubuntu"
    
    WinShow, %WinTitle%
    WinActivate, %WinTitle%

    SysGet, WorkArea, MonitorWorkArea
    TerminalWidth := A_ScreenWidth * 0.8
    TerminalHeight := (WorkAreaBottom - WorkAreaTop) * 0.8

    WinMove, %WinTitle%,, (A_ScreenWidth - TerminalWidth) / 2, WorkAreaBottom - TerminalHeight, TerminalWidth, TerminalHeight,

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
        Run "c:\Users\angel\AppData\Local\Microsoft\WindowsApps\wt.exe" -w _quake -p "Ubuntu" --title "_quake_ubuntu"
        Sleep, 1000

        WinSet, AlwaysOnTop, On, %WinTitle%
        ShowAndPositionTerminal()
    }
}

;=====================================================================================================================================================

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
