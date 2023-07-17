@echo off

:menu
cls
echo 1. Montirovat disk
echo 2. Udalit smontirovannii disk
set /p choice=Viberite punkt (1 ili 2): 

if "%choice%"=="1" (
    call :mountDisk
) else if "%choice%"=="2" (
    call :unmountDisk
) else (
    echo Nekorrektnii vibor. Pojaluista viberite 1 ili 2.
    pause
    goto menu
)

exit /b

:mountDisk
set /p diskName=Vvedite nazvanie diska (bukva bez dvoetochiya):
set /p directory=Vvedite put k direktorii, kotoruyu nujno montirovat (naprimer C:/SCP):

subst %diskName%: %directory%
echo Disk uspeshno sozdan i montirovan!
pause
goto :eof

:unmountDisk
set /p diskName=Vvedite nazvanie smontirovannogo diska kotorii udalit (bukva bez dvoetochiya): 

subst %diskName%: /d
echo Smontirovannii disk uspeshno udalen!
pause
goto :eof
