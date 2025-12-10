;-+=+-+=+-+=+-+=+-+=+-+=+-+=+-;
;Dock System Script
;By JoshDB
;Use with credit
;-+=+-+=+-+=+-+=+-+=+-+=+-+=+-;
;Aligns the player with the compass.

$Found = 0

While $Found = 0
    Send("{A Down}")
    Sleep(10)
    Send("{A Up}")
    Sleep(25)
    $Coord = PixelSearch( 910, 16, 920, 24, 0x4CED22, 50 )
    If NOT @Error Then
        $Found = 1
    EndIf
wEnd

Sleep(100)

Send("{D Down}")
Sleep(50)
Send("{D Up}")