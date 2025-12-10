func Main_Minotaur()
    TakeBreak()
    $FirstPause = true
    SplashTextOn('Run info','Total runs: ' & $runs,100, 30, 1100,0 )
    $runs += 1
    $dead = false
    LeaveArea_Minotaur()

    _log( 'going to minotaurs' )
    Sleep( Random( 100, 300 ) )
    Send( '8' )
    Sleep( Random( 6000, 7000 ) )
    Send( 'é' )
    Sleep( Random( 500, 1000 ) ) 
    MouseClick( 'left', 565, 465, 1, 1 ) 
    Sleep( Random( 500, 1000 ) )
    Send('{q down}' )
    Sleep( random( 2000, 3000 ) )
    Send('{q up}')
    Sleep( Random( 100, 300 ) )
    Send('{w down}' )
    Sleep( random( 3700, 4300 ) )
    Send('{w up}')
    Sleep( Random( 100, 300 ) )
    Send('{q down}' )
    Sleep( random( 4500, 5000 ) )
    Send('{q up}')
    Sleep( Random( 100, 300 ) )
    Send('{w down}' )
    Sleep( random( 1500, 3500 ) )
    Send('{w up}')
    _log( 'waiting for mana to replenish' )
    global $AntiDeadLock = 0
    while GetManaPercent() < 100 and $AntiDeadLock < 600
        $AntiDeadLock +=1
        Sleep( 100 )
    WEnd
    $AntiDeadLock = 0
    Sleep( Random( 500, 6000 ) )
    Send( '7' )
    Sleep( Random( 5000, 6000 ) )
    Send('c')
    Sleep(Random( 100, 400 ) )
    Send('{space}')
    for $i = 0 to 5
        Send('c')
        Sleep( Random( 100, 200 ) )
        Send('{space}')
        Sleep( random( 600, 1000 ) )
    Next
    _log( 'Starting attack' )
    #cs
    global $AttackTimer = TimerInit()
    global $AttackRandom = Random ( 1000, 2000 )
    while TimerDiff( $AttackTimer ) < ( $AttackTimeout_Minotaur + $AttackRandom )
        if not Attack_Minotaur() then ExitLoop
        if GetLifePercent() < 10 then 
            $dead = true 
            ExitLoop
        EndIf
    WEnd
    global $Failcount = 0, $PickitTimer = TimerInit(), $PickitTimeout = 10*60*1000
    while not ( TargetMatch( $IgnoreItems[0],GetItemCode( $ItemColor_White ) ) ) and TimerDiff( $PickitTimer ) < $PickitTimeout
        if GetItemCode( $ItemColor_White ) == '' then 
            $Failcount += 1
            if $Failcount > 10 then ExitLoop
        endif
        Send( ';' )
        Sleep( Random(100, 700) )
        Send( '{space}' )
        Sleep( Random( 100, 700 ) )
        if GetLifePercent() < 10 then 
            ExitLoop
        EndIf
    WEnd
    #ce
        local $Failcount, $PickitTimer , $PickitTimeout = 10*60*1000
        local $AttackTimer = TimerInit()
        local $AttackRandom = Random ( 1000, 2000 )
        local $LastLife = GetLifePercent()
        while TimerDiff( $AttackTimer ) < ( $AttackTimeout_Minotaur + $AttackRandom )
            if not Attack_Minotaur() then ExitLoop
            for $i = 0 to 200
                if ScanAggro() then ExitLoop
                Sleep( 100 )
                if $LastLife > GetLifePercent() then ExitLoop
                $LastLife = GetLifePercent()
            Next
            while ScanAggro() or $LastLife > GetLifePercent() or ( $LastLife - GetLifePercent() ) < -2
                if StringInStr( GetItemCode( $ItemColor_White ), 'F6189' ) then 
            ;this iis a boss minotaur lvl 27
                while StringInStr( GetItemCode( $ItemColor_White ), 'F6189' )
                ;98BD9641C9EA9F6189C47A121186A98968A12CA5
                    Send( '2' )
                    Sleep( Random( 500, 1000 ) )
                    if SkillAvailable( 4 ) Then
                        Send( '4' )
                        Sleep( Random( 500, 1600 ) )
                    EndIf
                WEnd
                Send( '1' )
                Sleep( Random( 500,1500 ) )
                EndIf
                _log( 'ScanAggro true attacking minotaur' )
                Attack_Minotaur()
                if GetLifePercent() < 10 then 
                    $dead = true 
                    ExitLoop 2
                EndIf
                $LastLife = GetLifePercent()
            WEnd
            local $Failcount = 0, $PickitTimer = TimerInit(), $PickitTimeout = 10*60*1000
            while not ( TargetMatch( $IgnoreItems[0],GetItemCode( $ItemColor_White ) ) ) and TimerDiff( $PickitTimer ) < $PickitTimeout
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
        while not ( TargetMatch( $IgnoreItems[0],GetItemCode( $ItemColor_White ) ) ) and TimerDiff( $PickitTimer ) < $PickitTimeout
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
    DoRandomStuff()
EndFunc

func TravelTo_Minotaur()
    WinActivate( 'Guild Wars', '' )
    WinWaitActive( 'Guild Wars','',10)
    Send( 'm' )
    Sleep( random ( 2000, 3000 ) )
    MouseClick( 'left',400,400,1,1 )
    Sleep( Random( 1000, 2000 ) )
    MouseClick( 'left', 577,52 )
    Sleep( Random( 500, 2000 ) )
    MouseClick( 'left', 475,349,2,1)
    Sleep( Random( 4000, 6000 ) )
EndFunc

Func LeaveArea_Minotaur()
    Send( 'u' )
    Sleep( Random( 500, 1500 ) )
;DoRandomStuff()
    send( ';' )
    Sleep( 200 )
    Send( '{space}' )
    Sleep( Random( 5000, 7000 ) )
;140 232
;MsgBox(0,'',PixelGetColor(143,232))
;5435218
    local $GoOutsideTimer = TimerInit(), $GoOutsideTimeout = 60000
    while 1
        Sleep( 100 )
        PixelSearch( 139, 225, 142, 250 , 5435218,0,1 )
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
    send( '{w down}' )
    $GoOutsideTimer = TimerInit()
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
    send( '{w up}' )
    
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

func Attack_Minotaur()
;check health to stop ... blablabla
    local $skip = False
;check dolyak signet first always
    if SkillAvailable( 5 ) then 
        
        _log( 'casting dolyak' )
            Send( '5' )
            Sleep( Random(100,300) )
            Send( '6' )
            Sleep( Random( 300, 400 ) )
            if not SkillAvailable(6) THEN $VigorousTimer = TimerInit()
;check vigorous spirit (30% mana atleast on 20mana)
    elseIf $VigorousTimer == -1 or TimerDiff( $VigorousTimer ) > Random( 15000, 20000 )  then 
        _log( 'casting vigorous spirit' )
    ;well we gota cast it
        $VigorousTimer = -1
        for $i = 0 to Random( 1, 3 )
            Send( '6' )
            Sleep( Random(100,300) )
        Next
        Sleep( Random( 300, 400 ) )
        if not SkillAvailable(6) THEN $VigorousTimer = TimerInit()
;glad defence
    elseif SkillAvailable( 4 ) Then
        _log( 'casting glad defence' )
        Send( '4' )
        Sleep( Random( 100, 300 ))
        $GladTimer = TimerInit()
;riposte
    elseif SkillAvailable( 2 ) then 
            _log( 'casting riposte' )
            Send( '2' )
            Sleep( Random( 100,300 ) )
;flurry
    ElseIf SkillAvailable(1)  and GetManaPercent() > 24 and TimerDiff($GladTimer) >  10000 Then
            _log( 'casting flurry' )
            Send( '1' )
            Sleep( Random( 100, 300 ) )
;watch urself
    elseif SkillAvailable(3) and GetManaPercent() > 24 then 
            _log( 'casting watch urself' )
            Send( '3' )
            Sleep( Random( 100, 300 ) )
    EndIf
    Send( 'c' )
    Sleep( Random ( 50, 150 ) )
    Send( '{space}' )
    Sleep( random( 50, 150) )
    if not TargetMatch( $Monster[0], GetItemCode( $ItemColor_White ) ) then
        Sleep( Random( 300, 500 ) )
        Send( 'c' )
        Sleep( Random ( 50, 150 ) )
        Send( '{space}' )
        if not TargetMatch($Monster[0], GetItemCode( $ItemColor_White ) ) then return false
    EndIf
    return True
EndFunc