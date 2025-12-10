@echo off
setlocal

REM Quelle definieren
set SOURCE=C:\Users\Patan\Documents\GUILD WARS\Templates

REM Aktuelles Zielverzeichnis
set TARGET=%cd%

echo Kopiere alle Templates von:
echo   %SOURCE%
echo nach:
echo   %TARGET%
echo.

REM Robustes rekursives Kopieren (alle Dateien + Unterordner)
xcopy "%SOURCE%" "%TARGET%" /E /H /C /I /Y

echo.
echo Fertig! Alle Dateien wurden kopiert.
pause
