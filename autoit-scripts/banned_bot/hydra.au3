func TravelTo_Hydra()
    Send('m')
    Sleep( Random( 1000, 1500 ) )
    MouseClick( 'Left',500,500,2,1)
    Sleep( Random( 1000, 1500 ) )
    MouseClick( 'Left',802,580)
    Sleep( Random( 1000, 1500 ) )
    MouseClick( 'Left', 560,470,2,1)
    Sleep( Random( 7000, 10000 ) )
EndFunc

Func Main_Hydra()
;global $AttackTimer = TimerInit()
;global $AttackRandom = Random ( 1000, 2000 )
;while TimerDiff( $AttackTimer ) < ( $AttackTimeout_Hydra + $AttackRandom )
;   if not Attack_Hydra() then ExitLoop
;   if GetLifePercent() < 10 then 
;       $dead = true 
;       ExitLoop
;   EndIf
;WEnd
;local $Failcount = 0, $PickitTimer = TimerInit(), $PickitTimeout = 10*60*1000
;while not ( TargetMatch( $IgnoreItems[2],GetItemCode( $ItemColor_White ) ) ) and TimerDiff( $PickitTimer ) < $PickitTimeout
;   if GetItemCode( $ItemColor_White ) == '' then 
;       $Failcount += 1
;       if $Failcount > 10 then ExitLoop
;   endif
;   Send( ';' )
;   Sleep( Random(100, 700) )
;   Send( '{space}' )
;   Sleep( Random( 1000, 7000 ) )
;   if GetLifePercent() < 10 then 
;       ExitLoop
;   EndIf
;WEnd

    local $Failcount, $PickitTimer , $PickitTimeout = 10*60*1000
        local $AttackTimer = TimerInit()
        local $AttackRandom = Random ( 1000, 2000 )
        local $LastLife = GetLifePercent()
        while TimerDiff( $AttackTimer ) < ( $AttackTimeout_Hydra + $AttackRandom )
            if not Attack_Hydra() then ExitLoop
            for $i = 0 to 300
                if ScanAggro() then ExitLoop
                Sleep( 100 )
                if $LastLife > GetLifePercent() then ExitLoop
                $LastLife = GetLifePercent()
            Next
            while ScanAggro() or $LastLife > GetLifePercent() or ( $LastLife - GetLifePercent() ) < -2
                _log( 'ScanAggro true attacking minotaur' )
                Attack_Hydra()
                if GetLifePercent() < 10 then 
                    $dead = true 
                    ExitLoop 2
                EndIf
                $LastLife = GetLifePercent()
            WEnd
            local $Failcount = 0, $PickitTimer = TimerInit(), $PickitTimeout = 10*60*1000
            while not ( TargetMatch( $IgnoreItems[2],GetItemCode( $ItemColor_White ) ) ) and TimerDiff( $PickitTimer ) < $PickitTimeout
                if GetItemCode( $ItemColor_White ) == '' then 
                    $Failcount += 1
                    if $Failcount > 5 then ExitLoop
                endif
                Send( ';' )
                Sleep( Random(100, 700) )
                Send( '{space}' )
                Sleep( Random( 100, 700 ) )
                if GetLifePercent() < 10 then 
                    ExitLoop
                EndIf
            WEnd
        WEnd
        local $Failcount = 0, $PickitTimer = TimerInit(), $PickitTimeout = 10*60*1000
        while not ( TargetMatch( $IgnoreItems[2],GetItemCode( $ItemColor_White ) ) ) and TimerDiff( $PickitTimer ) < $PickitTimeout
                if GetItemCode( $ItemColor_White ) == '' then 
                    $Failcount += 1
                    if $Failcount > 5 then ExitLoop
                endif
                Send( ';' )
                Sleep( Random(100, 700) )
                Send( '{space}' )
                Sleep( Random( 100, 700 ) )
                if GetLifePercent() < 10 then 
                    ExitLoop
                EndIf
        WEnd
        
        
EndFunc

Func Attack_Hydra()
;check dolyak signet first always
    if SkillAvailable( 5 ) then 
        _log( 'casting dolyak signet' )
            Send( '5' )
            Sleep( Random(100,300) )
;check vigorous spirit (30% mana atleast on 20mana)
    elseIf $VigorousTimer == -1 or TimerDiff( $VigorousTimer ) > 29000 then 
    _log( 'casting vigorous spirit' )
    ;well we gota cast it
        $VigorousTimer = -1
        Send( '6' )
        Sleep( Random(500,800) )
        if not SkillAvailable(6) THEN $VigorousTimer = TimerInit()
;defy pain here also very important
    elseif ($DefyTimer = -1 or TimerDiff( $DefyTimer ) > 10 ) and SkillAvailable( 4 )  Then
            Send( '4' )
            Sleep( Random( 100, 300 ))
;riposte
    elseif SkillAvailable( 2 ) then 
            Send( '2' )
            Sleep( Random( 100,300 ) )
;flurry
    ElseIf SkillAvailable(1)  and GetManaPercent() > 25 Then
            Send( '1' )
            Sleep( Random( 100, 300 ) )
;deadly riposte
    elseif SkillAvailable(3) and GetManaPercent() > 25 then 
            Send( '3' )
            Sleep( Random( 100, 300 ) )
    EndIf
    if not TargetMatch( $Monster[2], GetItemCode( $ItemColor_White ) ) and not TargetMatch( $Monster[3], GetItemCode( $ItemColor_White ) ) then
        Sleep( Random( 300, 500 ) )
        Send( 'c' )
        Sleep( Random ( 50, 150 ) )
        Send( '{space}' )
        if not TargetMatch($Monster[2], GetItemCode( $ItemColor_White ) )  and not TargetMatch( $Monster[3], GetItemCode( $ItemColor_White ) ) then return false
    EndIf
        Send( 'c' )
        Sleep( Random ( 50, 150 ) )
        Send( '{space}' )
    return true
EndFunc

func Reach_Hydra()
    Send( '8' )
    While GetManaPercent() < 90 
        Sleep( 100 )
    WEnd
    Sleep( Random( 2000, 3000 ) )
    Send( '7' )
    Sleep( Random( 3000, 5000 ) )
    ;MouseClick( 'left',713,37,1,1 )
    ;Sleep( Random( 7000, 9000 ) )
    ;for $i = 0 to 5
;       MouseClick( 'left',990,592 )
;       Sleep( Random( 1500, 2500 ) )
;   Next
    #cs
    MouseClick( 'left' ,651,40,1,1 )
    Sleep( Random( 7000, 8000 ) )
    for $i = 0 to 2
        MouseClick( 'Left',989,708,1,1 )
        Sleep( Random( 1500,2500 ) )
        if ScanAggro() then return
    Next
    MouseClick( 'left',987,185,1,1 )
    Sleep( Random( 7000, 9000 ) )
    if ScanAggro() then return
    for $i = 0 to 12
        MouseClick( 'left',688,615 , 1,1 )
        Sleep( Random( 1000, 1500 ) )
        if ScanAggro() then return
    Next
    for $i = 0 to 9
        MouseClick( 'left', 583,609, 1, 1 )
        Sleep( Random( 1000, 1500 ) ) 
        if ScanAggro() then return
    Next
    for $i = 0 to 3
        MouseClick( 'left',990,705,1,1 )
        Sleep( Random( 1000, 1500 ) ) 
        if ScanAggro() then return
    Next
;Sleep( Random( 300, 500 ) )
;if GetItemCode($ItemColor_White) <> $Monster[2] Then
;;do something cuz we too far from hydras...
;;TODO
;EndIf
    #ce
    Send( 'c' )
    Sleep( 2000 )
    Send( '{SPACE}' )
    Sleep( Random( 1000, 2000 ) )
EndFunc

Func LeaveArea_Hydra()
    Send( 'u' )
    Sleep( random( 500, 1500 ) )
    Send(';')
    Sleep( 500 )
    if not ( GetItemCode( $ItemColor_White ) ) == $IgnoreItems[1] then Send( 'è' )
    Sleep( Random( 1500, 3000 ) )
    Send( '{SPACE}' )
    Sleep( random( 11000, 13000 ) )
    
    local $GoOutsideTimer = TimerInit(), $GoOutsideTimeout = 60000
    while 1
        Sleep( 100 )
        PixelSearch( 177, 229, 179, 233 , 5435218,0,1 )
        if not @error then ExitLoop
        Send( '{d down}' )
        Sleep( 50 )
        Send( '{d up}' )
        if TimerDiff( $GoOutsideTimer ) > $GoOutsideTimeout then 
            Send( '{s down}' )
            Sleep( Random(3000,7000) )
            Send( '{s up}' )
            ExitLoop
        EndIf
    WEnd
    
    Send('{w down}')
    Sleep( random( 1000, 2000 ) )
    Send('{w up}')
    Sleep( random( 1000, 2000 ) )
    Send('{q down}')
    local $GoOutsideTimer = TimerInit(), $GoOutsideTimeout = 60000
    While 1
        $pix1 = PixelGetColor( 200,20 )
        $pix2 = PixelGetColor( 220,20 )
        $pix3 = PixelGetColor( 240,20 )
        $pix4 = PixelGetColor( 260,20 )
        $pix5 = PixelGetColor( 280,20 )
        $pix6 = PixelGetColor( 300,20 )
        if $pix1 == 0x000000 and $pix1 == $pix2 and $pix1 == $pix3 and $pix1 == $pix4 and $pix1 == $pix5 and $pix1 == $pix6 then ExitLoop
        if TimerDiff( $GoOutsideTimer ) > $GoOutsideTimeout then ExitLoop
    WEnd
    Send('{q up}')
    Sleep(Random(500,1000))
    $GoOutsideTimer = TimerInit()
    while PixelGetColor( 200,20 ) == 0x000000 and PixelGetColor( 300,20 ) == 0x000000
        Sleep( Random(800, 1000) )
        if TimerDiff( $GoOutsideTimer ) > $GoOutsideTimeout then ExitLoop
    WEnd
    Sleep( random( 1000, 2000 ) )   
    Send( 'u' )
    Sleep( Random( 500, 1500 ) )
EndFunc