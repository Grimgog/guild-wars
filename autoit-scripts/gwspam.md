; ----------------------------------------------------------------------------
;
; AutoIt Version: 3.1.0
; Author:        djomen
; Script Name: GWspam
; Script Function:a spammer for guild wars
;   
;
; ----------------------------------------------------------------------------
Local $PromoteTimer = TimerInit()

While 1
;
    Sleep(20000)
    If TimerDiff($PromoteTimer) > 10000 Then
        $PromoteTimer = TimerInit()
        Sleep(1000)
        Send('{ENTER}')
        Sleep(1000)
        Send('~THE DARK REBELLION ACT~ recruiting rebels,bandits,and warlords~http://fizban.f2o.org/phpbb2~{ENTER}')
    EndIf
;
    Sleep(30000)

WEnd
    Exit 0
;EndFunc
