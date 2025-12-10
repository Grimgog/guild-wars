; ----------------------------------------------------------------------------
;
; AutoIt Version: 3.1.0
; Author:djomen      
; Name:Spambot
; Script Function:For afk spaming with Guild Wars.
;   
;
; ----------------------------------------------------------------------------
;~~~~~~~~~~~~~~~ 
#NoTrayIcon 
#Include<GUIConstants.au3> 
Global $Paused 
;~~~~~~~~~~~~~~~  
HotKeySet("{Pause}", "Pause") 
HotKeySet("{End}", "Hide") 
HotKeySet("{Home}", "Show") 
;~~~~~~~~~~~~~~~
GuiCreate("Spambot", 100, 50,(@DesktopWidth-100)/2, (@DesktopHeight-50)/2, $WS_DLGFRAME)
WinSetOnTop("Spambot", "", 1)
;~~~~~~~~~~~~~~~
$startSB = GuiCtrlCreateCheckbox("Start", 4, 1, 50, 20)
$Button_1 = GuiCtrlCreateButton("X", 95, 3, 18, 18)
$Buttonhelp = GUICtrlCreateButton("Help", 60, 3, 35, 18)
GuiSetState()
;~~~~~~~~~~~~~~~
While 1
$msg = GuiGetMsg()
;~~~~~~~~~~~~~~~
Select 
   Case GUICtrlRead($startSB) <> 4 
        While GUICtrlRead($startSB) <> 4 
          Spam() 
        WEnd 
   Case GUICtrlRead($startSB) = -15 
        ExitLoop 
 EndSelect
;~~~~~~~~~~~~~~~
Select 
Case $msg = $Buttonhelp 
msgbox(0, "Help", "Guild Wars needs to be in windowed mode. To run, check (Start) then click anywhere on the GW window. Press (Pause) to pause, press (End) to hide the window and press (Home) to show the window. Spambot was created for educational purposes only.") 
EndSelect
;~~~~~~~~~~~~~~~   
    Select
   Case $msg = $Button_1
        ExitLoop
    EndSelect
WEnd
;~~~~~~~~~~~~~~~  
Func Pause() 
$Paused = NOT $Paused 
While $Paused 
sleep(100) 
ToolTip('Spambot is currently paused.',0,0) 
WEnd 
ToolTip("") 
EndFunc 
;~~~~~~~~~~~~~~~ 
Func Hide() 
GUISetState(@SW_HIDE) 
EndFunc 
;~~~~~~~~~~~~~~~ 
Func Show() 
GUISetState(@SW_SHOW) 
EndFunc 
;~~~~~~~~~~~~~~~ 
;
;Funtion Spam 
Func Spam()
;Starting your char in pre searing ascalon district 1 
 Sleep(5000)
ToolTip('ENTER')
        Send('{ENTER}')
        Sleep(500)
ToolTip('TYPING')
        Send('~THE DARK REBELLION ACT~ recruiting rebels,bandits,and warlords~Ventrilo,forums,hall and cape http://fizban.f20.org/phbb2{ENTER}')
        MouseClick("left",230,40)
ToolTip('DIS 2')
        Sleep(2000)
        MouseClick("left",220,88);dis 2
        MouseClick("left",615,575)
ToolTip('WAITING')
        Sleep(20000)
;
ToolTip('ENTER')
        Send('{ENTER}')
        Sleep(500)
ToolTip('TYPING')
        Send('~THE DARK REBELLION ACT~ recruiting rebels,bandits,and warlords~Ventrilo,forums,hall and cape http://fizban.f20.org/phbb2{ENTER}')
        MouseClick("left",230,40)
ToolTip('DIS 3')
        Sleep(2000)
        MouseClick("left",220,102);dis 3
        MouseClick("left",615,575)
ToolTip('WAITING')
        Sleep(20000)
;
ToolTip('ENTER')
        Send('{ENTER}')
        Sleep(500)
ToolTip('TYPING')
        Send('~THE DARK REBELLION ACT~ recruiting rebels,bandits,and warlords~Ventrilo,forums,hall and cape http://fizban.f20.org/phbb2{ENTER}')
        MouseClick("left",230,40)
ToolTip('DIS 1')
        Sleep(2000)
        MouseClick("left",220,75);dis 1
        MouseClick("left",615,575)
ToolTip('Uncheck box now to stop the loop. Please wait about 10 seconds to close program.')
        Sleep(20000)
;
Endfunc