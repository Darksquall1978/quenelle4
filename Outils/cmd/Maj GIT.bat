@echo off
Color 0e & Mode con cols=100 lines=40



git pull


timeout /t 3 /nobreak > nul



modif.bat

cd..
cd..

::RMDIR /s /q Git

UT3.exe


pause


