;REQUIREMENTS: Max zoom out (must be the fartest from char). The biggest icons and french language. window mode

;TODO add timeouts

;set coorsd relative to client window
Opt ( "CaretCoordMode" , 2 )
opt ( "MouseCoordMode" , 2 )
opt ( "PixelCoordMode" , 2 )

global $TurnDelay = 500;time to wait befor each turn operation (turn left, right)
;HotKeySet( '9', 'left' );uncomment for testing
;HotKeySet( '0', 'right' )
WinActivate( 'Guild Wars' )
Sleep( 1000 )

global  $ItemColor_White = 16777215, $ItemColor_Blue = 0x99EEFF;item colors definition

;main bot loop
while 1
    GoOutsideAscalon()
    Sleep( 7000 )
    GoToBigBull()
    Sleep( 15000 )
    AttackBigBull()
    Sleep( 1000 )
    pickit()
    BackToAscalon()
WEnd

func GoOutsideAscalon()
    mouseclick( 'left', 586, 44, 1, 0 )
;1=near fence
;2=near stairs
    local $StartingPoint
    
;find wwhere we started
    $Sum = 0
    for $x = 891 To 918
        for $y = 189 to 216
            if PixelGetColor( $x, $y ) == 0xFFFFFF then $Sum += 1
        Next
    Next
    $StartingPoint = 2
    if $sum > 5 then $StartingPoint = 1
    
;act depending on the starting point and head outside
    Switch( $StartingPoint )
        case 1
        ;MsgBox(0,'','Starting point 1' )
            send( 'x' )
            Sleep( 2000 )
            Send( '{w down}' )
            for $i = 1 to 7
                Sleep( 1000 )
            Next
            send( '{w up}' )
            Sleep( 1000 )
            turn( 'left', 10 )
            Send( '{w down}' )
            While 1
                $pix1 = PixelGetColor( 200,20 )
                $pix2 = PixelGetColor( 220,20 )
                $pix3 = PixelGetColor( 240,20 )
                $pix4 = PixelGetColor( 260,20 )
                $pix5 = PixelGetColor( 280,20 )
                $pix6 = PixelGetColor( 300,20 )
                if $pix1 == 0x000000 and $pix1 == $pix2 and $pix1 == $pix3 and $pix1 == $pix4 and $pix1 == $pix5 and $pix1 == $pix6 then ExitLoop
            WEnd
            send( '{w up}' )
        case 2
        ;MsgBox(0,'','Starting point 2' )
            Send( '{w down}' )
            Sleep( 100 )
            Send( '{w down}' )
            While 1
                $pix1 = PixelGetColor( 200,20 )
                $pix2 = PixelGetColor( 220,20 )
                $pix3 = PixelGetColor( 240,20 )
                $pix4 = PixelGetColor( 260,20 )
                $pix5 = PixelGetColor( 280,20 )
                $pix6 = PixelGetColor( 300,20 )
                if $pix1 == 0x000000 and $pix1 == $pix2 and $pix1 == $pix3 and $pix1 == $pix4 and $pix1 == $pix5 and $pix1 == $pix6 then ExitLoop
            WEnd
            send( '{w up}' )
    EndSwitch
EndFunc

func GoToBigBull()
;go to the bull on the lake
    for $i = 1 to 12
        turn( 'right', 1 )
        Sleep( 100 )
    Next
    Sleep( 1000 )
    Send('{w down}')
    Sleep( 100 )
    Send('{w down}')
    for $i = 1 to 17
        Sleep( 1000 )
    Next
    Send('{w up}')
    Sleep( 100 )
    Send('{w up}')
    Sleep( 1000 )
    turn( 'left', 6 )
    Sleep( 1000 )
    Send('{w down}')
    while 1
        Send('{TAB}')
        Sleep( 100 )
        if PixelChecksum(370,29,586,44) == 993448726 then ExitLoop
        Sleep( 100 )
    WEnd
    Send('{w up}')
    Send('{SPACE}')
EndFunc

func AttackBigBull()
    while 1
    ;EDIT YOUR ATTACK ROUTINE HERE.
        Send( '1' )
        Sleep( 4000 )
        Send( '2' )
        Sleep( 4000 )
    ;0xD83D3D
        PixelSearch(282,7,686,111,0xD83D3D,10,2)
        if @error then ExitLoop
    WEnd
EndFunc

func Pickit()
;TODO Scan more pixels maby because some monsters have white graphics (bandits is an example)
;TODO find a way that it dsent try to pickup the sky... lol
;TODO: Scan multiple time using different start value to speed up, so if u dont find on first scan, start again with the same xstart value + offset.
    $Item_MinimumPixel = 10;the number of pixel that must match an item color in order to be considered an item
    $X_ScanStep = 10;step used in scanning the whole screen
    $Y_ScanStep = 5;same but for y axis
    $X_ScanStart = 272;next 4 vars are start*stop values of scan
    $Y_ScanStart = 3
    $X_ScanStop = 738
    $Y_ScanStop = 631
    $Item_XMax = 300; maximum x size of an item name (used to search)
    $Item_YMax = 20; same as above
    local $PixelsMatched = 1, $ItemFound[3];func vars dont edit
;start scanning
    for $y = $Y_ScanStart to $Y_ScanStop step $Y_ScanStep
        for $x = $X_ScanStart to $X_ScanStop step $X_ScanStep
        ;Sleep( 1 )
        ;check if we have a pixel that match an item color
            local $currPixel = PixelGetColor( $x, $y )
            if  $currPixel == $ItemColor_White or  $currPixel == $ItemColor_Blue  then 
                MouseMove( $x, $y, 0 )
            ;scan around to find more pixels of the same color
                for $iX = $x - $Item_XMax / 2 to $x + $Item_XMax / 2
                    for $iY = $y - $Item_YMax / 2 to $y +$Item_YMax / 2
                        $currPixel = PixelGetColor( $iX , $iY )
                        if  $currPixel ==  $ItemColor_White or  $currPixel == $ItemColor_Blue  Then
                        $PixelsMatched += 1
                        if $PixelsMatched == $Item_MinimumPixel Then
                            $ItemFound[0] = true 
                            $ItemFound[1] = $x
                            $ItemFound[2] = $y 
                            ExitLoop 4
                        EndIf
                    EndIf
                    Next
                Next
            EndIf
        Next
    Next
    if $ItemFound[0] == true Then
    ;we found an item
        MouseMove( $ItemFound[1], $ItemFound[2] )
        mouseclick('left')
        Sleep( 1000 )
    EndIf
;exit
EndFunc

func BackToAscalon()
    send('m')
    Sleep( 4000 )
    MouseClickDrag( 'left', 25,20,833,626 )
    Sleep( 1000 )
    MouseClick( 'left', 929, 591 )
    Sleep( 5000 )
    MouseClick( 'left', 657, 516 )
    Sleep( 15000 )
EndFunc

func left()
    turn( 'left', 1 )
EndFunc

func right()
    turn( 'right', 1 )
EndFunc

func Turn( $Direction, $Repeat )
;GAY ASS BUGGY FUNCTION
;direction = left or right
;repeat = 1 for 1 click, 2 for 2 click, etc...
    for $i = 1 to $Repeat
        Switch( StringLower( $Direction ) )
            case 'left'
                Send("{a down}")
                sleep ( 50 )
                Send("{a up}")
            case 'right'
                Send("{d down}")
                sleep ( 50 )
                Send("{d up}")
        EndSwitch
        Sleep( $TurnDelay )
    Next
EndFunc