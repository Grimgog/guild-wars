;-+=+-+=+-+=+-+=+-+=+-+=+-+=+-;
;Dock System Script
;By JoshDB
;Use with credit
;-+=+-+=+-+=+-+=+-+=+-+=+-+=+-;
;Reades the Health Bar for use

$Coord = PixelSearch( 311, 700, 512, 713, 0xD8121E )
If NOT @ERROR Then
    If Hex( PixelGetColor( $Coord[0], $Coord[1] + 1 ), 6 ) = "DA121F" Then
        If Hex( PixelGetColor( $Coord[0], $Coord[1] + 3 ), 6 ) = "D9121F" Then
            $Status_Health_Dead = $Coord[0] & ", " & $Coord[1]
            $Status_Health_Low = $Coord[0] + 47 & ", " & $Coord[1]
            $Status_Health_Medium = $Coord[0] + 94 & ", " & $Coord[1]
            $Status_Health_High = $Coord[0] + 141 & ", " & $Coord[1]
            $Status_Health_Full = $Coord[0] + 188 & ", " & $Coord[1]
        EndIf
    EndIf
EndIF

#cs
EXAMPLE OF HOW TO USE THIS CODE

If Hex( PixelGetColor( $Status_Health_Full ), 6 ) = "D8121E" Then
;Full health - Run code here
Else
    If Hex( PixelGetColor( $Status_Health_High ), 6 ) = "D8121E" Then
    ;High health - Run code here
    Else
        If Hex( PixelGetColor( $Status_Health_Medium), 6 ) = "D8121E" Then
        ;Medium health - Run code here
        Else
            If Hex( PixelGetColor( $Status_Health_Low ), 6 ) = "D8121E" Then
            ;Low health - Run code here
            Else
                If Hex( PixelGetColor( $Status_Health_Dead ), 6 ) = "D8121E" Then
                ;Dead - Run code here
                Else
                    MsgBox(0,"Status,"Dead!")
                EndIf
            EndIf
        EndIf
    EndIf
EndIf
#ce