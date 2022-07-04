title Nom du profil UT3
@echo off
Color 0b & Mode con cols=80 lines=4

::Color 0b & Mode con cols=80 lines=50

set /p Pseudo=Quel est ton nom d'utilisateur ? 


del *.ue3profile

timeout /t 1 /nobreak > nul

copy sav\Joueur.ue3profile Joueur.ue3profile
copy sav\Joueur.ue3profile .ue3profile

timeout /t 1 /nobreak > nul

ren Joueur.ue3profile %Pseudo%.ue3profile

timeout /t 1 /nobreak > nul

cd..
cd..
cd..
cd..

xcopy "pseudo" "%USERPROFILE%\Documents\My Games\" /e /i /y

echo Ok, ton pseudo est %Pseudo%.
echo Au lancement du jeu entre %Pseudo% dans Nom d'Utilisateur
echo Et clique sur JOUER HORS LIGNE

pause>nul
