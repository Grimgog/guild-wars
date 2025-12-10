func LeaveArea_ElonaLevel()
    MouseClick( 'Left', Random( 855,895), Random( 650,670 ) , 1, Random( 3, 6 ) )
    Sleep( Random( 1000, 2000 ) )
    MouseClick( 'Left', Random( 495, 520 ), Random( 407, 419 ), 1, Random( 2, 6 ) )
    Sleep( Random( 8000, 13000 ) )
;PRECAST
    Send( '8' )
    Sleep( Random( 5000, 8000 ) )
    Send( '7' ) 
    Sleep( Random( 4000, 7000 ) )
    Send( '6' )
    local $MinimumMana = Random( 50, 99 )
    While $MinimumMana > GetManaPercent()
        Sleep( Random( 5, 1500 ) )
    WEnd
    Send( 'v' )
    Sleep( Random( 400, 2000 ) )
    Send( '{SPACE}' )
    Sleep( Random( 10000, 11000 ) )
    MouseClick( 'Left', Random( 475, 515 ), Random( 550, 570 ), 1, Random( 1, 7 ) )
    Sleep( Random( 500, 1500 ) )
    
    Send( '{w down}' )
    Sleep( Random( 4000, 7000 ) )
    Send( '{w up}' )
EndFunc

func Attack_ElonaLevel()
    Send( 'c' )
    Sleep( Random( 300, 600 ) )
    Send( '{SPACE}' )
    Sleep( Random( 1000, 2000 ) )
    Send( '5' )
    Sleep( Random( 500, 800 ) )
    local $Timer = TimerInit()
    while ScanAggro()   and TimerDiff( $Timer ) < 2*60*1000         
    ;local $SendTarget = Random( 1, 4 )
    ;if $SendTarget == 1 then 
            Send( 'c' )
            Sleep( Random( 300, 900 ) )
    ;EndIf
        Send( '{SPACE}' )
        Sleep( Random( 900, 1300 ) )
        Send( '5' )
        Sleep( Random( 900, 1300 ) )
        Send( '4' )
        Sleep( Random( 900, 1300 ) )
        Send( '2' )
        Sleep( Random( 1200, 1600 ) )
        Send( '1' )
        Sleep( Random( 1000, 1400 ) )
        Send( '3' )
        if not ScanAggro() then ExitLoop
        if getlifepercent() < 10 then return
        Sleep( Random( 6000, 7000 ) )
    WEnd
    Send( 'c' )
    Sleep( Random( 500, 900 ) )
    Send( '{SPACE}' )
    Sleep( Random( 900, 1500 ) )
    $Timer = TimerInit()
    while ScanAggro()       and TimerDiff( $Timer ) < 2*60*1000             
    ;local $SendTarget = Random( 1, 4 )
    ;if $SendTarget == 1 then 
        Sleep( Random( 900, 1300 ) )
        Send( '5' )
        Sleep( Random( 900, 1300 ) )
        Send( '4' )
        Sleep( Random( 900, 1300 ) )
        Send( '2' )
        Sleep( Random( 1200, 1600 ) )
        Send( '1' )
        Sleep( Random( 1000, 1400 ) )
        Send( '3' )
        if not ScanAggro() then ExitLoop
        if getlifepercent() < 10 then return
        Sleep( Random( 6000, 7000 ) )
    WEnd
    if getlifepercent() < 10 then return
    Send( ';' )
    Sleep( Random(100, 700) )
    Send( '{space}' )
    Sleep( Random( 3000, 7000 ) )
    Send( ';' )
    Sleep( Random(300, 700) )
    Send( '{space}' )
    Sleep( Random( 3000, 7000 ) )
EndFunc

func GoBack_ElonaLevel()
    if getlifepercent() > 10 then 
        Send( '{ENTER}' )
        Sleep( Random( 700, 1000 ) )
        Send( '/resign' )
        Sleep( Random( 1000, 2300 ) )
        Send( '{ENTER}' )
        Sleep( Random( 3000, 6000 ) )
    endif 
    MouseClick( 'Left', Random( 460, 530 ), Random( 381, 390 ),1, Random( 1, 9 ) )
    Sleep( Random( 10000, 15000 ) )
EndFunc