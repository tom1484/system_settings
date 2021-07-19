; Recommended for performance and compatibility with future AutoHotkey releases.
#NoEnv  

; Recommended for new scripts due to its superior speed and reliability.
SendMode Input
; Ensures a consistent starting directory.
SetWorkingDir %A_ScriptDir%

; =====================================================================================================================================================

TermHwnd := 0x0

; Debugging
DetectHiddenWindows, On
TermHwnd := WinExist("_quake_terminal")
DetectHiddenWindows, Off

; =====================================================================================================================================================

OnWinActiveChange(hWinEventHook, vEvent, hWnd)
{
    static _ := DllCall("user32\SetWinEventHook", UInt, 0x3, UInt, 0x3, Ptr, 0, Ptr, RegisterCallback("OnWinActiveChange"), UInt, 0, UInt, 0, UInt, 0, Ptr)

    global TermHwnd
    TermMatcher := "ahk_id " . TermHwnd

    ; Hide terminal on lost focus
    If WinExist(TermMatcher) And Not WinActive(TermMatcher)
        WinHide, %TermMatcher%

    Return
}

; ===================================================================================================================================================

#Space::

ToggleTerminal()

ActivateTerminal()
{
    global TermHwnd
    TermMatcher := "ahk_id " . TermHwnd

    ; Show and activate terminal
    WinShow, %TermMatcher%
    WinActivate, %TermMatcher%

    ; Fetch GUI information
    WinGetPos, TermX, TermY, TermW, TermH, %TermMatcher%
    SysGet, WorkArea, MonitorWorkArea
    SysGet, MonitorArea, Monitor

    CharWidth := 10
    CharHeight := 20
    MarginSize := 4

    WCharNum := 160
    HCharNum := 45

    ; Set terminal position If not fullscreen
    If (MonitorAreaRight - MonitorAreaLeft) != TermW Or (MonitorAreaBottom - MonitorAreaTop) != TermH
    {
        TargetTermW := WCharNum * CharWidth + MarginSize * 2 + 16
        TargetTermH := HCharNum * CharHeight + MarginSize * 2 + 9

        WinMove, %TermMatcher%, , (A_ScreenWidth - TargetTermW) / 2, WorkAreaBottom - TargetTermH, TargetTermW, TargetTermH
    }

    Return
}

ToggleTerminal()
{
    global TermHwnd
    TermMatcher := "ahk_id " . TermHwnd
    
    static PreviousActive := 0x0

    ; Fetch current window's ID
    CurrentHwnd := WinExist("A")

    ; Update PreviousActive If the current window is not terminal
    If CurrentHwnd != TermHwnd
        PreviousActive := CurrentHwnd

    ; Check if terminal exists
    DetectHiddenWindows, On
    If WinExist(TermMatcher)
    {
        DetectHiddenWindows, Off

        ; Show terminal If it's hidden
        If Not WinExist(TermMatcher) Or Not WinActive(TermMatcher)
            ActivateTerminal()

        ; Otherwise activate previously active window
        else If WinExist(TermMatcher)
        {
            WinHide, %TermMatcher%
            WinActivate, ahk_id %PreviousActive%
        }
    }

    ; Otherwise create a new terminal
    Else
    {
        TermTitle := "_quake_terminal"
        ; Run "c:\Users\angel\AppData\Local\Microsoft\WindowsApps\wt.exe" -f -p "Ubuntu" --title %TermTitle%
        Run, "c:\Users\angel\AppData\Local\Microsoft\WindowsApps\wt.exe" -f --title %TermTitle%

        Loop
        {
            ; Activate terminal after it's created
            TermHwnd := WinExist(TermTitle)
            If TermHwnd
            {
                WinSet, AlwaysOnTop, On, ahk_id %TermHwnd%
                ActivateTerminal()
                break
            }
        }
    }

    Return
}



