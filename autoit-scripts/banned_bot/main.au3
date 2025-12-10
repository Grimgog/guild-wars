Opt ( "CaretCoordMode" , 2 )
opt ( "MouseCoordMode" , 2 )
opt ( "PixelCoordMode" , 2 )
;WINSIZE: 1009 763
WinMinimizeAll()
WinActivate( 'Guild Wars' )
WinWaitActive( 'Guild Wars' )
$file = FileOpen( 'log.txt',2)
WinMove('Guild Wars','',0,0)
MouseClick( 'left', 50, -10 );;è
Sleep( 2000 )

;511/38
_log( '==================================================================================' )
HotKeySet( '9','TooglePause' )

;configs
global $SkillChecksum1 = 629865937 , _
        $SkillChecksum2 = 1432347367 , _
        $SkillChecksum3 = 548153391 , _
        $SkillChecksum4 =  3353687470, _
        $SkillChecksum5 = 1037325805, _
        $SkillChecksum6 = 789173279, _
        $SkillChecksum7 = 0, _
        $SkillChecksum8 = 0
global $AttackTimeout_Minotaur = 8*60*1000 , $AttackTimeout_Hydra=20*60*1000, $AttackTimeout_Griffon=10*60*1000
global const $ItemColor_White = 16777215, $ItemColor_Blue = 0x99EEFF, $MonsterColor_Red = 15663104;item colors definition
global $SplashText = ''
global $SellRun = 5;ID each x runs
;private vars
global $VigorousTimer = -1, $DefyTimer = -1, $GladTimer = 11000,$way = 1, $Dead = false, $coretimer = TimerInit(), $paused = false
global $FirstBrake = Random( 1*60*60*1000,2*60*60*1000) , $SecondBrake = Random( 2*60*60*1000,4*60*60*1000), $ThirdBrake=Random(4*60*60*1000,6*60*60*1000), $FourthBrake= Random( 6*60*60*1000,9*60*60*1000 )
global $runs = 0, $hours, $mins, $Secs
func TooglePause()
    $paused = not $paused
EndFunc
#region reference arrays
global $Monster[255]
$Monster[0] = '98BD9641C9EA99C47A121186A98968A12CA5';level 24 minotaure
             ;98BD9641C9EA9F6189C47A121186A98968A12CA5;F6189
$Monster[1] = '98BD99896BCF4249C47A121186A98968A12CA5';level 10 minotaure
$Monster[2] = '271A99BBAF4DF9F42423D4271F4241';lvl 22 hydra
$Monster[3] = '271A99BBAC8F42423D4271F4241';lvl 26 hydra
$Monster[4] = '3E9F4DF9643E93D49959D2DC6C186A98968C356498968F4628186A2715';lvl 21 griffon
$Monster[5] = '3E8292888F4381312D141312D1E848C8A7D1312D14C81';gordok merchant in ICS
$Monster[6] = '98BD9641C9EA9F6189C47A121186A98968A12CA5';level 27 minotaur 98BD9641C9EA9F6189C47A121186A98968A12CA5
$Monster[7] = '18743D998968AF424186A1E186A271A1E84817A123E864989683ED';whiptail devourer
$monster[8] =  '989681F41271A3E8186A98968138864989683E8A98968F4241';carrion devourer
;$Monster[5] = ''; lvl 26 griffon

global $IgnoreItems[255]
$IgnoreItems[0] = '3E864F424186A2713E81F4283E8493E1';ice tooth cave
$IgnoreItems[1] = '2FB179F4243E84E232FAF8F4241312DF42464271F4241'; skyward reach
$IgnoreItems[2] = '4C4DB1F424C83E85F424164F4241';augury rock
$IgnoreItems[3] = '3E864271F4244C63C327113882714C4B41874131C941642715';teleport switch
$IgnoreItems[4] = '98BDA43ED12C13881998968BB8192713E8141';destinys gorge 98BDA43ED12C13881998968BB8192713E8141 64989683E812C271A5C81312DF4A198BD93E8186A4D99A3ED
$IgnoreItems[5] = '6498E4AA3ED64A7A122713E898BD93E8186A98968A4C4B43';bleached bones (grif)
$IgnoreItems[6] = 'A7A122713E93D4989683E9'; the scar
$IgnoreItems[7] = '271AC8C3564F551F462964F4628186A3264AF4241';captn calaan
                 ;271AC8C3564F551F462964F4628186A3264AF4241

global $KeepItems[7]
$KeepItems[0] = '3D927112714C4B4F424127151';warrior tome
$KeepItems[1] = '6498968A3E9';lockpick
$KeepItems[2] = '138861A8AFA98968F624861DA271D5EDA61A8CD';silver dye
$KeepItems[3] = '3E83D9A9C4FB44C4B7EA28138D23E83D9155CC989681'; GRAY
$KeepItems[4] = '6461A81FA1927A12641312D43F4E261A8A9DD1';black dye
$KeepItems[5] = '2861A82861A862AE8F51E61A8C82626A2CFA2625A1';yellow dye
$KeepItems[6] = '4C4B442713D964A7D1F44C35989682625A451';red dye


#endregion 

;include other files
#include <date.au3>
#include 'Common.au3'
#include 'Minotaur.au3'
#include 'hydra.au3'
#include 'Griffon.au3'
#include 'Griffon_HM.au3'
#include 'ElonaLevel.au3'

;ClipPut( getitemcode( $ItemColor_White) )
;ClipPut( PixelChecksum(576,663,640,716) )
;Exit
;877,79
;ClipPut( PixelGetColor( 877,79 ) )
;SellItems()
;ClearInventory()
;HotKeySet( '9','test' )
;while 1
;   Sleep( 100 )
;   if PixelChecksum(369,68,401,80,1 ) == 1993648085 then 
;       MsgBox( 0,'','HEAL SIG' )
;       Exit
;   EndIf
;WEnd
test()
exit
func test()
    WaitEndOfMove( 250 )
EndFunc


func WaitEndOfMove($Delay)
    local $FirstCheck[101], $index = 0, $MultX = 100, $MultY = 70, $MatchPercent = 0
    
    while 1
        for $x = 0 to 9
            for $y = 0 to 9
                $FirstCheck[$index] = PixelGetColor( $x * $MultX, $Y * $MultY )
                $index += 1
            Next
        Next
        
        Sleep( $Delay )
        
        $MatchPercent = 0
        $index = 0
        for $x = 0 to 9
            for $y = 0 to 9
                if  PixelGetColor( $x * $MultX, $Y * $MultY ) == $FirstCheck[$index] then $MatchPercent += 1
                $index += 1
            Next
        Next
        
        SplashTextOn( 'Testing', $MatchPercent, 200, 100, 1010, 0 )
        $index = 0
    WEnd
EndFunc
func ClearInventory()
    Send('m')
    Sleep( Random( 1000, 1500 ) )
    MouseClick( 'Left',500,500,2,1)
    Sleep( Random( 1000, 1500 ) )
    MouseClick( 'Left',650,380)
    Sleep( Random( 1000, 1500 ) )
    MouseClick( 'Left', 469,535,2,1)
    Sleep( Random( 7000, 10000 ) )
    
    Send( 'v' )
    Sleep( Random( 1000, 2000 ) )
    if getitemcode( $ItemColor_White ) <> $Monster[5] then return 
    Send( '{SPACE}')
    Sleep( Random( 5000, 7000 ) )
    
;ClipPut( SpecificChecksum( 463,123,653, 145, $ItemColor_White  ) )
    if SpecificChecksum( 463,123,653, 145, $ItemColor_White  ) <> 51 then 
        _log( 'Error opening trade screen' )
    ;MsgBox( 0,'','ERROR OPENING TRAde sacreen' )
        return false
    EndIf
    
    
    MouseClick( 'Left',560,106 )
    Sleep( 2000 )
    
    $lastsum = 0
    while 1
        if SellItems() then 
            _log('sellitems return true continue loop')
            continueloop 
        Else
            _log('sellitems return false')
            MouseMove( 769, 351 )
            MouseWheel( 'down', 5 )
            if $lastsum = 0 then 
                _log( 'lastsum=' & $lastsum )
                $lastsum = PixelChecksum( 950,252,962,388, 1 )
                _log( 'lastsum=' & $lastsum )
                ContinueLoop
            EndIf
            _log( 'Lastsum=' & $lastsum & ' Currentsum=' & PixelChecksum( 950,252,962,388, 1 ) )
            Sleep( Random( 50, 100 ) )
            if $lastsum == PixelChecksum( 950,252,962,388, 1 ) then return 
            $lastsum = PixelChecksum( 950,252,962,388, 1 )
        EndIf
    WEnd
EndFunc
func SellItems()
    dim $ItemsArray[6][2]
    $ItemsArray[0][0] = 0 
    $ItemsArray[1][0] = 0
    $ItemsArray[2][0] = 0
    $ItemsArray[3][0] = 0
    $ItemsArray[4][0] = 0
    $ItemsArray[5][0] = 0
    local $InvLeft = 505, $InvTop = 228, $invRight = 745, $InvBottom = 392;the square to scan for items
    local $numPixelsFound = 0, $ConsecutiveLines = 0, $ItemsArrayIndex = 0
    for $y = $InvTop to $InvBottom;scan top to bottom...
        for $x = $InvLeft to $invRight;... left to right
            if PixelGetColor( $x, $y ) == $ItemColor_White then $numPixelsFound += 1;get the total pixels per lines
        Next
        if $numPixelsFound < 2 then 
        ;this line is empty
        ;_log( $y & ' is empty' )
            if $ConsecutiveLines > 3 then 
            ;this means we found an item and are at the end of it
                _log( 'Item end found, Start =  ' &  $y - $ConsecutiveLines & ' End = ' & ($y - 1) & ' Size = ' & $ConsecutiveLines )           
                _log( 'Item code = ' & SpecificChecksum( $InvLeft, $y - $ConsecutiveLines, $invRight, $y - 1, $ItemColor_White ) )
                $ItemsArray[$ItemsArrayIndex][0] = $y - $ConsecutiveLines
                $ItemsArray[$ItemsArrayIndex][1] = $y - 1
                $ItemsArrayIndex +=1;increase the index
            EndIf
            $ConsecutiveLines = 0
        Else
        ;this line contains white pixels
            _log( $y & ' contains white pixels. Total pixels found: ' & $numPixelsFound )
            $ConsecutiveLines += 1
        EndIf
        $numPixelsFound = 0
    Next
    local $LastItem = 5
    for $i = 0 to 5
        if $ItemsArray[$i][0] == 0 then 
            $LastItem = $i 
            ExitLoop
        EndIf
    Next
    dim $SellItems[6]
    $SellItems[0] = false 
    $SellItems[1] = false 
    $SellItems[2] = false 
    $SellItems[3] = false 
    $SellItems[4] = false 
    $SellItems[5] = false
    local $continueloop
    for $i = 0 to $LastItem;-1
        $continueloop = true
        Switch( $i )
            case 1
                for $x = $InvLeft to $invRight;... left to right
                    if PixelGetColor( $x, $InvTop -1 ) == $ItemColor_White Then
                        $SellItems[0] = False
                        $continueloop = false
                    EndIf 
                Next                
            case 5
                for $x = $InvLeft to $invRight;... left to right
                    if PixelGetColor( $x, $InvBottom + 1 ) == $ItemColor_White then 
                        $SellItems[5] = false 
                        $continueloop = false
                    EndIf
                Next
        EndSwitch
        if not $ContinueLoop then ContinueLoop
        if $i > 5 then ExitLoop
            _log( 'Selling item #' & $i & ' to true' )
        $SellItems[$i] = true
        $ItemCode = SpecificChecksum( $InvLeft,$ItemsArray[$i][0],$invRight,$ItemsArray[$i][1], $ItemColor_White )
        _log($ItemCode)
        for $a = 0 to UBound( $KeepItems ) - 1
            if $ItemCode == $KeepItems[$a] then 
                _log( 'Item is in keep items list. current item: ' & $ItemCode & ' List item: ' & $KeepItems[$a] )
                $SellItems[$i] = false 
                ExitLoop
            EndIf
        Next
    Next
    for $i = 0 to 5
        if $SellItems[$i] == true then 
            if $ItemsArray[$i][0] < $InvTop then ContinueLoop;this is a GAY bug, sometime i click out of inv (I think y = 0) must investigate, this is a temp fix
            _log( 'Selling item #' & $i )
        ;todo sell item 
            MouseClick( 'left', $InvLeft + 50, $ItemsArray[$i][0] + 4 ) 
            Sleep( Random( 1000, 2000 ) )
            MouseClick( 'left',799,597 ) 
            Sleep( Random( 1000, 2000 ) )
            return true
        Else
            _log( 'Dosent selling item #' & $i )
        EndIf
    Next
    return False
;if return false it means no item is sold, so scrool or if at end exit, return true will ONLY sell 1 item.

EndFunc
func SpecificChecksum($left, $top, $right, $bottom, $color)
    local $LastFound, $ConsecutiveFails = 0, $TotalColors = 0

    local $sum2[255];array of bytes
    local $sum = 0, $index = 1, $byteIndex = 0,$started = false
    for $x5 = $right to $left step -3
        for $y5 = $Bottom to $Top - 14 step -3
            if PixelGetColor( $x5, $y5 ) == $color then
                $sum += $index
                $started = true
            EndIf
            if not $started then ContinueLoop
            $index = $index *2
            if $index > 4294967295 then 
            ;add the byte into the array
                $sum2[$byteIndex] =  Hex( $sum ) 
                $sum = 0
                $byteIndex += 1
                $index = 1
            EndIf
        Next
    Next
;built the string off the bytes
    $bytestring = ''
    for $i =  $byteIndex to 0 step -1
        $bytestring &=  Hex( $sum2[$i]  )
    Next
    $bytestring = StringReplace( $bytestring, '0','')
    return $bytestring
EndFunc

while 1
    global $RunTracker = 0
    while not $paused
        _TicksToTime( TimerDiff( $coretimer ), $hours, $mins,$Secs )
        $SplashText = @CRLF & 'Total runs: ' & $runs & @CRLF & 'Next inv clearance: ' & $SellRun - $RunTracker _
                        & @CRLF & 'Total run time: ' & $hours & ':' & $mins
        SplashTextOn( 'State','Starting a new run'&$SplashText,200,400,1010,0)
        $runs += 1
        LeaveArea_ElonaLevel()
        Attack_ElonaLevel()
        GoBack_ElonaLevel()
        
    ;TravelTo_NorthWall()
    ;LeaveArea_NorthWall()
    ;Send( 'c' )
    ;Sleep( Random( 500, 1000 ) )
    ;$Timer = TimerInit()
    ;while TimerDiff( $Timer ) < Random( 2*60*1000, 4*60*1000 )
    ;   while StringInStr( getitemcode( $ItemColor_White ), '98968' ) and  TimerDiff( $Timer ) < Random( 2*60*1000, 4*60*1000 )
    ;       Sleep( Random( 500, 1000 ) )
    ;       Send( 'c' )
    ;       Sleep( Random( 200, 1000 ) )
    ;       Send( '{SPACE}' )
    ;       Sleep( Random( 500, 1000 ) )
    ;       Send( '1' )
    ;       Sleep( Random( 500, 1000 ) )
    ;       Send( '2' )
    ;       Sleep( Random( 500, 1000 ) )
    ;       if getlifepercent() < 50 then 
    ;           Send( '7' )
    ;           Sleep( Random( 500, 1000 ) )
    ;       EndIf
    ;   WEnd
    ;   Send( 'c' )
    ;   Sleep( Random( 500, 900 ) )
    ;   if not StringInStr( getitemcode( $ItemColor_White ), '98968' ) then ExitLoop
    ;; WEnd
    ;for $i = 
    ;travelto_hydra()
    ;SetDiff(1)
    ;SetSkillTemplate(1)
    ;LeaveArea_Hydra()
    ;Reach_Hydra()
    ;Main_Hydra()
    ;travelto_minotaur()
    ;SetDiff(1)
    ;SetSkillTemplate(3)
    ;main_minotaur()
        
        
    ;travelto_Griffon()
    ;while not LeaveArea_Griffon()
;       travelto_minotaur()
;       travelto_Griffon()
;   WEnd
;   Main_Griffon()
        
    ;travelto_Griffon_HM()
    ;while not LeaveArea_Griffon_HM()
    ;   travelto_minotaur()
    ;   travelto_Griffon_HM()
    ;WEnd
    ;Main_Griffon_HM()
        
    ;if $RunTracker >= $SellRun then 
    ;   $RunTracker = 0
    ;   ClearInventory()
    ;EndIf
    ;$RunTracker += 1
    ;$runs += 1
    WEnd
WEnd
func TravelTo_NorthWall()
    Send( 'm' )
    Sleep( Random( 500, 1000 ) )
    MouseClick( 'left', 291, 425, 2, 5 )
    Sleep( Random( 1000, 2000 ) )
    MouseClick( 'left', 867, 137, 1, 5 )
    Sleep( Random( 1000, 2000 ) )
    MouseClick( 'left', 548, 492, 2, 5 )
    Sleep( Random( 8000, 10000 ) )
EndFunc 
func LeaveArea_NorthWall()
    MouseClick( 'left', 881, 667, 1, 5 )
    Sleep( Random( 1000, 3000 ) )
    MouseClick( 'left', 510, 403, 1, 5 )
    Sleep( Random( 7000, 10000 ) )
;Send( '{w down}' )
;Sleep( 8500 )
;Send( '{w up}' )
;Send( '{}' )
;MouseClick( 'left', 407, 388, 1, 5 )
    Send( '{w down}' )
    Sleep( Random( 100, 500 ) )
    Send( '{w down}' )
    Sleep( Random( 1000, 1500 ) )
    $Timer = TimerInit()
    while not targetmatch( $IgnoreItems[7], getitemcode( $ItemColor_White ) ) and TimerDiff( $Timer ) < Random( 15000, 20000 )
        Send( 'v' )
        Sleep( Random( 500, 700 ) )
    WEnd
    Send( '{w up}' )
    Send( '{SPACE}' )
    Sleep( Random( 7000, 8000 ) )
    Send( '{e down}' )
    Sleep( Random( 3000, 4000 ) )
    Send( '{e up}' )
EndFunc