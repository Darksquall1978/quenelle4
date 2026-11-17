@echo off
Color 0b & Mode con cols=30 lines=7

cd..
@echo Vidage du cache en cours...
timeout /t 2 /nobreak > nul
@echo off



RMDIR /s /q cache\WDB\frFR\
timeout /t 2 /nobreak > nul
@echo Vidage du cache ok...
timeout /t 2 /nobreak > nul