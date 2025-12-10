quick update, I made an item identifier, its still very beta like the above script but is very promising.


Ok well this generates an array of data that can be used to detect wich item it is. I tested it on gold, and i can detect if a white item is droped is gold or something else. If it is gold the the $sum2[0] (wich is an array of data read from the game) is 0x421085e1. in order to use this function you must detect an item, find the bottom-most pixel matching the item color you are scanning (white in the case of gold) and pass the x,y coords of that pixel, along with the color you are scanning to the function.

########################################################################################

func GetItemCode( $x, $y, $color )
;find the left side of the item
    local $Left = $x, $Top = $y, $Right = $x, $Bottom = $y, $file = FileOpen( 'Log.txt', 2 )
    local $LastFound, $ConsecutiveFails = 0, $TotalColors = 0

;find left (not accurate but required)
    for $i = $x to $x - 300 step -1
    ;scan horizontal to be sure there is a pixel matching our color or not in the item name
        for $a = $y - 14 to $y + 14
            $tmpColor = PixelGetColor( $i, $a )
        ;FileWriteLine( $file, 'Scanning: ' & $i & ',' & $a & ' ' & PixelGetColor( $i, $a ) )
            if $tmpColor == $color then ExitLoop
            ;$TotalColors +=1
        ;EndIf
        Next
        if $tmpColor == $color then 
    ;if $TotalColors > 3 then 
        ;MsgBox( 0, '', 'found color' )
            $LastFound = $i
            $ConsecutiveFails = 0
        Else
            $ConsecutiveFails += 1
        EndIf
        if $ConsecutiveFails > 30 then 
            $Left = $LastFound 
            ExitLoop
        EndIf
    Next
;find bottom (not accurate but required)
    for $i = $y to $y + 14
    ;scan vertically to be sure there is a pixel matching our color or not in the item name
        for $a = $x - 14 to $x + 14
            $tmpColor = PixelGetColor( $a, $i )
            if $tmpColor == $color then ExitLoop
        Next
        if $tmpColor == $color then 
            $LastFound = $i
            $ConsecutiveFails = 0
        Else
            $ConsecutiveFails += 1
        EndIf
    ;if $ConsecutiveFails > 1 then 
    ;   $Bottom = $LastFound
    ;   ExitLoop
    ;EndIf
    Next
    $bottom = $LastFound

    MouseMove( $left, $bottom + 5 )
    Sleep( 200 )
;find y axis of the white line underneat the text
    local $Yaxis = 0, $found = false
    for $y3 = $bottom to $bottom + 10
        for $x3 = $left to $left + 50
            if PixelGetColor( $x3, $y3 ) <> $color then ExitLoop
            if $x3 >= $left +45 then 
                $found = True
                $Yaxis = $y3
                ExitLoop 2
            EndIf
        Next
    Next
    if $found Then
    ;MsgBox( 0, '', $Yaxis )
    Else
    ;MsgBox( 0, '', 'Not found' )
    EndIf
;find left
    for $x4 = $left + 10 to 0 step -1
        if PixelGetColor( $x4, $Yaxis) <> $color then 
            $left = $x4 + 1
            ExitLoop
        EndIf
    Next
;find right
    for $x4 = $left to 1000 
        if PixelGetColor( $x4, $Yaxis) <> $color then 
            $right = $x4 - 1
            ExitLoop
        EndIf
    Next
;MouseMove( $left, $Yaxis )
;MouseMove( $right, $Yaxis )
    local $sum2[255];array of bytes
    local $sum = 0, $index = 1, $byteIndex = 0
    for $x5 = $right to $left step -3
        for $y5 = $Yaxis to $Yaxis - 14 step -3
            if PixelGetColor( $x5, $y5 ) == $color then
                $sum += $index
            EndIf
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
        $bytestring &= $sum2[$i] & ' '
    Next
    StringReplace( $bytestring, '0','')
    MsgBox( 0, '' , $bytestring )
EndFunc



########################################################################################


Lifewatct (life and mana) accurate to a couple %.


must use LARGER UI display, window mode

########################################################################################

Opt ( "CaretCoordMode" , 2 )
opt ( "MouseCoordMode" , 2 )
opt ( "PixelCoordMode" , 2 )

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