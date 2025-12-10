;TODO func
func MissionMap( $Action )
;1 = open 2 = close
;TODO
EndFunc

;detect if a monster is within aggro are, true = monster in aggro, false = no monster in aggro
Func ScanAggro()
;PixelSearch( 826,122,882,172,$MonsterColor_Red,10,1 )
;if @error then 
;   Sleep( 100 )
;   PixelSearch( 826,122,882,172,$MonsterColor_Red,10,1 )
;   if @error then return false
;EndIf
;return True
    PixelSearch( 4,74,755,616,$MonsterColor_Red,10,1 )
    if @error then 
        Sleep( 100 )
        PixelSearch( 4,74,755,616,$MonsterColor_Red,10,1 )
        if @error then return false
    EndIf
    return True
EndFunc

;set difficulty, 0=normal 1=hard
Func SetDiff( $ID )
    Switch( $ID )
        case 0
            MouseClick( 'left',790,352 )
            Sleep( 500 )
        case 1  
            MouseClick( 'left',829,352 )
            Sleep( 500 )
    EndSwitch
EndFunc

;check if the desired skill is available
func SkillAvailable($Location)
;location = 1 to 8
    Switch $location 
        case 1 
            if PixelChecksum(239,663,291,716) == $SkillChecksum1 then return true
        Case 2
            if PixelChecksum(306,663,359,716) == $SkillChecksum2 then return true 
        Case 3
            if PixelChecksum(376,663,424,716) == $SkillChecksum3 then return true
        ;temp fix this is for watch yourself
            if PixelChecksum(376,663,424,716) == 3441050876 then return true
        case 4
            if PixelChecksum(444,663,496,716) == $SkillChecksum4 then return true
        ;temps fix this is for glad defence
            if PixelChecksum(444,663,496,716) == 2655215 then return true
        case 5
            if PixelChecksum(510,663,564,716) == $SkillChecksum5 then return true
        case 6
            if PixelChecksum(576,663,640,716) == $SkillChecksum6 then return true
        case 7
    EndSwitch
    return false        
EndFunc

;return mana %
func GetManaPercent()
    local $LifeIndex = -1
    for $x = 517 to 760
        if PixelGetColor( $x, 644 ) == 7502 then 
            $LifeIndex = $x
            ExitLoop
        EndIf
    Next
    if $LifeIndex = -1 then return 100
    return Round( ( ( $LifeIndex - 517 ) / 243 ) * 100 ) - 6
EndFunc

;return life %
func GetLifePercent()
    local $LifeIndex = -1
    for $x = 246 to 493
        if PixelGetColor( $x, 644 ) == 5711645 then 
            $LifeIndex = $x
            ExitLoop
        EndIf
    Next
    if $LifeIndex = -1 then return 100
    return Round( ( ( $LifeIndex - 246 ) / 247 ) * 100 )
EndFunc

;check if a target match (used on monster because it dosent match 100% due to health bar
func TargetMatch( $Target, $StringReturned )
    local $strLen = StringLen( $Target ), $MatchedChars = 0
    if StringLen( $StringReturned ) < $strLen then $strLen = StringLen( $StringReturned )
    for $i = 1 to $strLen
        if StringMid( $Target, $i, 1 ) == StringMid( $StringReturned, $i, 1 ) then $MatchedChars += 1
    Next
    _log( 'Targetmatch: ' & $MatchedChars / $strLen )
    if $MatchedChars / $strLen > 0.9 then return true 
    return false    
EndFunc

;get the item code off a focused item
func GetItemCode( $color )
    local $Left = 360, $Top = 28, $Right = 653, $Bottom = 49
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

;do some random stuff to avoid detection
func DoRandomStuff()
    $bet = Random( 0, 100 )
    Select
        case $bet > -1 and $bet < 10
            return
        case $bet > 10 and $bet < 20
            Send( '{enter}' )
            Sleep( Random( 1000, 9000 ) )
            Send( '/dance' )
            Sleep( Random( 500, 2000 ) )
            Send( '{enter}' )
            Sleep( Random( 30000, 5*60*1000 ) )
        case $bet > 20 and $bet < 30
            Sleep( Random( 1000,2000 ) )
        case $bet > 30 and $bet < 40
            Sleep( Random( 100,1000 ) )
        case $bet > 40 and $bet < 50
            Sleep( Random( 10 * 1000,20*1000 ) )
        case $bet > 50 and $bet < 60
            Sleep( Random( 5*60*1000, 1*60*1000) ) 
        case $bet > 60 and $bet < 70
            Sleep( Random( 100,120*1000 ) )
        case $bet > 70 and $bet < 80
            Sleep( Random( 10,100 ) )
        case $bet > 80 and $bet < 90
            Send( '{enter}' )
            Sleep( Random( 1000, 9000 ) )
            Send( '/dance' )
            Sleep( Random( 500, 2000 ) )
            Send( '{enter}' )
            Sleep( Random( 100,10000 ) )
        case $bet > 90 and $bet < 101
            Sleep( Random( 10,50 ) )
    EndSelect
EndFunc

func _log( $string )
    FileWriteLine( $file, $String )
EndFunc

func TakeBreak()
    return
    if $FirstBrake > 0 then 
        if TimerDiff( $coretimer ) > $FirstBrake then 
            $FirstBrake = -1
            $sleep = Random( 5, 35 )
            for $i = 0 to $Sleep
                MouseMove( Random( 0, 800 ) ,Random(0,600) )
                Sleep( 60*1000 )
            Next
            endif
        ElseIf $SecondBrake > 0 then 
            
        if TimerDiff( $coretimer ) > $SecondBrake then
            $SecondBrake = -1
            $sleep = Random( 5, 35 )
            for $i = 0 to $Sleep
                MouseMove( Random( 0, 800 ) ,Random(0,600) )
                Sleep( 60*1000 )
            Next
            endif
        ElseIf $ThirdBrake > 0 then 
            
        if TimerDiff( $coretimer ) > $ThirdBrake then 
            $ThirdBrake = -1
            $sleep = Random( 5, 35 )
            for $i = 0 to $Sleep
                MouseMove( Random( 0, 800 ) ,Random(0,600) )
                Sleep( 60*1000 )
            Next
            endif
        ElseIf $FourthBrake > 0 then 
            
        if TimerDiff( $coretimer ) > $FourthBrake then 
            $FourthBrake = -1
            $sleep = Random( 5, 35 )
            for $i = 0 to $Sleep
                MouseMove( Random( 0, 800 ) ,Random(0,600) )
                Sleep( 60*1000 )
            Next
        EndIf
    EndIf
EndFunc

func SetSkillTemplate($ID)
    Send( 'k' )
    Sleep( Random( 2000, 3000 ) )
    mouseclick( 'left', 192,118 )
    Sleep( Random( 400, 800 ) )
    MouseClick( 'left',276,160)
    Sleep( Random( 1000, 2000 ) )
    switch $ID
        case 1
        ;hydras
            MouseClick( 'left' , 274,207, 2, 1 )
            Sleep( Random( 1000, 2000 ) )
        case 2
            Sleep( Random( 1000, 2000 ) )
        case 3      
        ;minotaur griffons      
            MouseClick( 'left',311,255,2,1 )
            Sleep( Random( 1000, 2000 ) )
    EndSwitch
    Send('{escape}')
    Sleep( Random( 1000, 2000 ) )
EndFunc