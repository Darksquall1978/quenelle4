::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCmDJE2B51YMPBdHHUrScm6iA9U=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
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
