func Main_Griffon()
    local $Failcount, $PickitTimer , $PickitTimeout = 10*60*1000
        local $AttackTimer = TimerInit()
        local $AttackRandom = Random ( 1000, 2000 )
        local $LastLife = GetLifePercent()
        while TimerDiff( $AttackTimer ) < ( $AttackTimeout_Griffon + $AttackRandom )
            for $i = 0 to 200
                if ScanAggro() then ExitLoop
                Sleep( 100 )
                if $LastLife > GetLifePercent() then ExitLoop
                $LastLife = GetLifePercent()
            Next
            if not Attack_Griffon() then ExitLoop
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
            EndIf
                _log( 'ScanAggro true attacking minotaur' )
                if not Attack_Griffon() then ExitLoop
                if GetLifePercent() < 10 then 
                    $dead = true 
                    ExitLoop 2
                EndIf
                $LastLife = GetLifePercent()
            WEnd
            local $Failcount = 0, $PickitTimer = TimerInit(), $PickitTimeout = 10*60*1000
            while not ( TargetMatch( $IgnoreItems[4],GetItemCode( $ItemColor_White ) ) ) and not ( TargetMatch( $IgnoreItems[3],GetItemCode( $ItemColor_White ) ) )  and TimerDiff( $PickitTimer ) < $PickitTimeout
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
        while not ( TargetMatch( $IgnoreItems[4],GetItemCode( $ItemColor_White ) ) ) and  not ( TargetMatch( $IgnoreItems[3],GetItemCode( $ItemColor_White ) ) ) and TimerDiff( $PickitTimer ) < $PickitTimeout
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

func Attack_Griffon()
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
    if not TargetMatch( $Monster[4], GetItemCode( $ItemColor_White ) ) then
        Sleep( Random( 300, 500 ) )
        Send( 'c' )
        Sleep( Random ( 50, 150 ) )
        Send( '{space}' )
        if not TargetMatch($Monster[4], GetItemCode( $ItemColor_White ) ) then return false
    EndIf
    return True
EndFunc

;SplashTextOn( 'State',''&$SplashText,200,400,1010,0)
func LeaveArea_Griffon()
    SplashTextOn( 'State','Leaving Destiny gorge. Destination: the scar' &$SplashText,200,400,1010,0)
    Send( ';' )
    Sleep( Random( 1000, 2000 ) )
    if GetItemCode( $ItemColor_White ) <> $IgnoreItems[6] then 
        Send( 'è' )
        Sleep( Random( 1000, 2000 ) )
        if GetItemCode( $ItemColor_White ) <> $IgnoreItems[6] then 
            SplashTextOn( 'State','Failed to find the scar'&$SplashText,200,400,1010,0)
            return false
        EndIf
    EndIf
    Sleep( Random( 500, 1000 ) )
    Send( '{SPACE}' )
    Sleep( Random( 7000, 9000 ) )
    Send( 'u' )
    Sleep( Random( 100, 300 ) )
;180,241
    local $GoOutsideTimer = TimerInit(), $GoOutsideTimeout = 20000
    SplashTextOn( 'State','Searching the right orientation to leave town'&$SplashText,200,400,1010,0)
    while 1
        Sleep( 100 )
        PixelSearch( 178, 239, 183, 244 , 5435218,0,1 )
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
    Sleep( 500 )
    Send('{w down}')
    Sleep( 500 )
    Send('{w down}')
    SplashTextOn( 'State','Going outside'&$SplashText,200,400,1010,0)

    local $GoOutsideTimer = TimerInit(), $GoOutsideTimeout = 20000
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
    Send('{w up}')
    Sleep(Random(500,1000))
    $GoOutsideTimer = TimerInit()
    while PixelGetColor( 200,20 ) == 0x000000 and PixelGetColor( 300,20 ) == 0x000000
        SplashTextOn( 'State','Loading...'&$SplashText,200,400,1010,0)
        Sleep( Random(800, 1000) )
        if TimerDiff( $GoOutsideTimer ) > $GoOutsideTimeout then ExitLoop
    WEnd
    Sleep( random( 1000, 2000 ) )   
    Send( 'u' )
    SplashTextOn( 'State','Casting balthazar aura'&$SplashText,200,400,1010,0)
    Sleep( Random( 500, 1500 ) )
    Send( '8' )
    SplashTextOn( 'State','Moving up'&$SplashText,200,400,1010,0)
    Sleep( Random( 4000,5000 ) )
;Send( 'é' )
;Sleep( Random( 500, 1000 ) ) 
;MouseClick( 'left', 565, 465, 1, 1 ) 
;Sleep( Random( 500, 1000 ) )
    Send( '{w down}' )
    Sleep( Random( 2000, 3000 ) )
    Send( '{w up}' )
    local $GoOutsideTimer = TimerInit(), $GoOutsideTimeout = 25000
    Sleep( Random( 1000, 2000 ) )
    Send('{q down}')
    while TimerDiff( $GoOutsideTimer ) < $GoOutsideTimeout
        SplashTextOn( 'State','Searching for griffons...'&$SplashText,200,400,1010,0)
        Send( 'c' )
        if  TargetMatch($Monster[4], GetItemCode( $ItemColor_White ) )  then 
            SplashTextOn( 'State','Griffon found'&$SplashText,200,400,1010,0)
            ExitLoop
        EndIf
        Sleep( Random( 100, 5000 ) )
        Send('{q down}')
    WEnd
    Send('{q up}')
    Sleep( Random( 500, 1500 ) )
    SplashTextOn( 'State','Casting Live visomething'&$SplashText,200,400,1010,0)
    Send( '7' )
    Sleep( Random( 3000, 5000 ) )
    if not TargetMatch($Monster[4], GetItemCode( $ItemColor_White ) ) Then
        SplashTextOn( 'State','Failed to find griffons, heading right a little'&$SplashText,200,400,1010,0)
        Send( 'c' )
        Sleep( Random( 1000, 2000 ) )
        Send('{e down}')
        Sleep( Random( 2000, 3000 ) )
        Send('{e up}')
    EndIf
    Sleep( Random( 500, 1500 ) )
    Send( 'c' )
    Sleep( Random( 500, 1000 ) )
    if not TargetMatch($Monster[4], GetItemCode( $ItemColor_White ) ) Then
        SplashTextOn( 'State','Failed to find griffons, heading straight'&$SplashText,200,400,1010,0)
        local $GoOutsideTimer = TimerInit(), $GoOutsideTimeout = 15000
        Send('{w down}')
        Sleep( 500 ) 
        while TimerDiff( $GoOutsideTimer ) < $GoOutsideTimeout
            Send( 'c' )
            if  TargetMatch($Monster[4], GetItemCode( $ItemColor_White ) )  then ExitLoop
            Sleep( Random( 100, 5000 ) )
        WEnd
        Send('{w up}')
    EndIf
    SplashTextOn( 'State','We have now reached griffons'&$SplashText,200,400,1010,0)
    local $GoOutsideTimer = TimerInit(), $GoOutsideTimeout = 10000
    while TimerDiff( $GoOutsideTimer ) < $GoOutsideTimeout
            Send( 'c' )
            Sleep( Random( 200, 300 ) )
            Send( '{SPACE}' )
            Sleep( Random( 200, 300 ) )
            if ScanAggro() then ExitLoop
    WEnd
    return true
EndFunc

Func TravelTo_Griffon()
    Send('m')
    Sleep( Random( 1000, 1500 ) )
    MouseClick( 'Left',500,500,2,1)
    Sleep( Random( 1000, 1500 ) )
    MouseClick( 'Left',863,559)
    Sleep( Random( 1000, 1500 ) )
    MouseClick( 'Left', 417,518,2,1)
    Sleep( Random( 7000, 10000 ) )
EndFunc