@echo off
title Gestion du protocole TLS 1.0

:: --- Verification et demande des droits Administrateur ---
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Demande des privileges administrateur en cours...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:MENU
cls
echo ==================================================
echo        GESTION DU PROTOCOLE TLS 1.0 (REGISTRE)
echo ==================================================
echo.
echo   [1] Activer TLS 1.0 (Client et Serveur)
echo   [2] Desactiver TLS 1.0 (Client et Serveur)
echo   [3] Quitter
echo.
set /p choix="Votre choix (1, 2 ou 3) : "

if "%choix%"=="1" goto ACTIVER
if "%choix%"=="2" goto DESACTIVER
if "%choix%"=="3" exit /b
goto MENU

:ACTIVER
echo.
echo Activation de TLS 1.0...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client" /v "Enabled" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client" /v "DisabledByDefault" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server" /v "Enabled" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server" /v "DisabledByDefault" /t REG_DWORD /d 0 /f >nul
echo [OK] TLS 1.0 a ete ACTIVE.
goto FIN

:DESACTIVER
echo.
echo Desactivation de TLS 1.0...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client" /v "Enabled" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client" /v "DisabledByDefault" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server" /v "Enabled" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server" /v "DisabledByDefault" /t REG_DWORD /d 1 /f >nul
echo [OK] TLS 1.0 a ete DESACTIVE.
goto FIN

:FIN
echo.
echo IMPORTANT : Un redemarrage du PC est necessaire pour appliquer les changements.
echo.
pause
goto MENU
