;-+=+-+=+-+=+-+=+-+=+-+=+-+=+-;
;Dock System Script
;By JoshDB
;Use with credit
;-+=+-+=+-+=+-+=+-+=+-+=+-+=+-;
;Picks up any loot designated to the player.

$TimesToRun = 1;Set this to how many times you want the macro to search for loot
$Found = 0
    
While $Found < $TimesToRun
    $Coord = PixelSearch(250, 215, 750, 500, 0xFFFFFF)
    If NOT @Error Then
        MouseClick("Left", $Coord[0], $Coord[1])
    EndIf
    $Found = $Found + 1
wEnd