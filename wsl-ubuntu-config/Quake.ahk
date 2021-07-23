; Recommended for performance and compatibility with future AutoHotkey releases.
#NoEnv
#SingleInstance, Force

; Recommended for new scripts due to its superior speed and reliability.
SendMode Input
; Ensures a consistent starting directory.
SetWorkingDir %A_ScriptDir%

; =====================================================================================================================================================

TermID := 0
IDFileName := "ID.txt"

ReadTerminalID()

ReadTerminalID()
{
    global TermID, IDFileName

    If FileExist(IDFileName)
    {
        IDFile := FileOpen(IDFileName, "r")
        FID := IDFile.Read()

        DetectHiddenWindows, On
        if WinExist("ahk_ID " + FID)
            TermID := FID

        DetectHiddenWindows, Off

        IDFile.close()
    }
}

; =====================================================================================================================================================

; OnWinActiveChange(hWinEventHook, vEvent, hWnd)
; {
;     global TermID
;     static _ := DllCall("user32\SetWinEventHook", UInt, 0x3, UInt, 0x3, Ptr, 0, Ptr, RegisterCallback("OnWinActiveChange"), UInt, 0, UInt, 0, UInt, 0, Ptr)

;     TermMatcher := "ahk_id " . TermID

;     ; Hide terminal on lost focus
;     If WinExist(TermMatcher) And Not WinActive(TermMatcher)
;         WinHide, %TermMatcher%

;     Return
; }

LostFocusListener()

LostFocusListener()
{
    global TermID

    Loop
    {
        TermMatcher := "ahk_id " . TermID
        ; Hide terminal on lost focus
        If WinExist(TermMatcher) And Not WinActive(TermMatcher)
            WinHide, %TermMatcher%
    }
}

; ===================================================================================================================================================

#Space::

ToggleTerminal()

ActivateTerminal()
{
    global TermID

    TermMatcher := "ahk_id " . TermID

    ; Set always on top
    DetectHiddenWindows, On
    WinSet, AlwaysOnTop, On, %TermMatcher%
    DetectHiddenWindows, Off

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
    global TermID, IDFileName
    static PrevActiveID := 0

    TermMatcher := "ahk_id " . TermID

    ; Update PrevActiveID If the current window is not terminal
    WinGet, CurrentID, ID, A
    If Not (CurrentID == TermID)
        PrevActiveID := CurrentID

    ; Check if terminal exists
    DetectHiddenWindows, On
    ; ToolTip % WinExist(TermMatcher)
    If WinExist(TermMatcher)
    {
        DetectHiddenWindows, Off

        ; Show terminal If it's hidden
        If Not WinExist(TermMatcher) Or Not WinActive(TermMatcher)
        {
            ActivateTerminal()
        }

        ; Otherwise activate previously active window
        else If WinExist(TermMatcher)
        {
            WinHide, %TermMatcher%
            WinActivate, ahk_id %PrevActiveID%
        }
    }

    ; Otherwise create a new terminal
    Else
    {
        TermTitle := "_quake_terminal"
        Run, wt.exe -f --title %TermTitle%, , , TestPID

        ; Wait until terminal exists
        While Not WinExist(TermTitle)
        {}

        ; Fetch terminal ID
        WinGet, TermID, ID, %TermTitle%

        ; Write terminal ID into file
        IDFile := FileOpen(IDFileName, "w")
        FID := IDFile.Write(TermID)
        IDFile.close()

        ActivateTerminal()
    }

    Return
}



