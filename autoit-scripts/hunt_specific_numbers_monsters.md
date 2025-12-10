;-+=+-+=+-+=+-+=+-+=+-+=+-+=+-;
;Dock System Script
;By JoshDB
;Use with credit
;-+=+-+=+-+=+-+=+-+=+-+=+-+=+-;
;Hunts the specified number of monsters

$TimesToRun = 3;Set this to how many times you want the macro to search for and kill a monster
$Temp0 = 0
$Temp1 = 0

While $Temp0 < $TimesToRun
    Sleep(1500)
    Send("C")
    Sleep(500)
    Send("{Space}")
    Sleep(5000)
    While $Temp1 = 0
        $Color = PixelGetColor (415, 32)
        If Hex($Color, 6) = "D7000D" Then
            Sleep(2000)
        Else
            $Temp1 = 1
        Endif
    wEnd
    Sleep(1000)
    $Temp0 = $Temp0 + 1
wEnd