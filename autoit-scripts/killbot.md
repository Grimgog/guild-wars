; ----------------------------------------------------------------------------
;
; AutoIt Version: 3.1.0
; Author:djomen      
; Name:Killbot
; Script Function:For afk killing with Guild Wars.
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
GuiCreate("Killbot", 100, 50,(@DesktopWidth-100)/2, (@DesktopHeight-50)/2, $WS_DLGFRAME)
WinSetOnTop("Killbot", "", 1)
;~~~~~~~~~~~~~~~
$startKB = GuiCtrlCreateCheckbox("Start", 4, 1, 50, 20)
$Button_1 = GuiCtrlCreateButton("X", 95, 3, 18, 18)
$Buttonhelp = GUICtrlCreateButton("Help", 60, 3, 35, 18)
GuiSetState()
;~~~~~~~~~~~~~~~
While 1
$msg = GuiGetMsg()
;~~~~~~~~~~~~~~~
Select 
   Case GUICtrlRead($startKB) <> 4 
        While GUICtrlRead($startKB) <> 4 
          Kill() 
        WEnd 
   Case GUICtrlRead($startKB) = -15 
        ExitLoop 
 EndSelect
;~~~~~~~~~~~~~~~
Select 
Case $msg = $Buttonhelp 
msgbox(0, "Help", "Press (Pause) to pause, press (End) to hide the window and press (Home) to show the window.Killbot was created for educational purposes only.") 
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
ToolTip('GWit is currently paused.',0,0) 
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
;Funtion Kil 
Func Kill() 
; 
Sleep(100) 
    $CoordsA = PixelSearch(400, 300, 700, 550, 0xE3C243) ; Gold items 
    $CoordsB = PixelSearch(400, 300, 700, 550, 0xBB88EE) ; Purple items 
    $CoordsC = PixelSearch(400, 300, 700, 550, 0x99EEFF) ; Blue items 
  ; 
   ; 
    If IsArray($CoordsA) Then
        Sleep(500)                        ; The colour A was found 
        MouseClick('Left', $CoordsA[0], $CoordsA[1], 1, 0) 
        Sleep(500) 
    Else          ; The color A was not found 
    EndIf 
   ; 
    If IsArray($CoordsB) Then
        Sleep(500)                        ; The color B was found 
        MouseClick('Left', $CoordsB[0], $CoordsB[1], 1, 0) 
        Sleep(500) 
    Else           ; The color B was not found 
    EndIf 
   ; 
    If IsArray($CoordsC) Then
        Sleep(500)                        ; The color C was found 
        MouseClick('Left', $CoordsC[0], $CoordsC[1], 1, 0) 
        Sleep(500) 
    Else           ; The color C was not found 
    EndIf 
   ; 
    Sleep(100) 
   ; 
Send("{Alt down}") ;; hold (alt)        
        Sleep(100) 
        Send("{c down}") 
        Sleep(15) 
        Send("{c up}") 
        Sleep(25)     ;;   This is the attack sequence. ;; 
        Send("{SPACE down}") 
        Sleep(15) 
        Send("{SPACE up}") 
        Sleep(15) 
                     Send("{2  down}") 
                     Sleep(15) 
                     Send("{2 up}")  
                     Sleep(15) 
                     Send("{3 down}") 
                     Sleep(15)                      ;; Skills sequence. ;; 
                     Send("{3 up}") 
                     Sleep(15) 
                     Send("{4  down}") 
                     Sleep(15)                          
                     Send("{4 up}")  
                     Sleep(15) 
Send("{Alt up}") 
Sleep(100) 
EndFunc