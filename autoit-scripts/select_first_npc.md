;-+=+-+=+-+=+-+=+-+=+-+=+-+=+-;
;Dock System Script
;By JoshDB
;Use with credit
;-+=+-+=+-+=+-+=+-+=+-+=+-+=+-;
;Selects the first NPC found.  Starts search at the top left of the screen.

$Found = 0

Send("{Alt Down}")

Sleep(500)

While $Found = 0
    $Coord = PixelSearch( 250, 215, 750, 500, 0x99FF00 )
    If NOT @Error Then
        $Found = 1
    EndIf
wEnd

Send("{Alt Up}")

MouseClick("Left", $Coord[0], $Coord[1])