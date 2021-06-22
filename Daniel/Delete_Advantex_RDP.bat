chcp 1252
C:
set startup=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
if exist "%startup%\Advantex*.rdp" goto delas
goto suche1
:delas
del "%startup%\Advantex*.rdp"
goto suche1
:suche1
if exist "%userprofile%\OneDrive - salesianer.com\Desktop\Advantex*.rdp" goto del1
goto suche2
:del1
del "%userprofile%\OneDrive - salesianer.com\Desktop\Advantex*.rdp"
goto suche2
:suche2
if exist "%userprofile%\Desktop\Advantex*.rdp" goto del2
goto suche3
:del2
del "%userprofile%\Desktop\Advantex*.rdp"
goto suche3
:suche3
if exist "C:\Users\Public\Desktop\Advantex*.rdp" goto del3
goto suche4
:del3
del "C:\Users\Public\Desktop\Advantex*.rdp"
goto suche4
:suche4
if exist "%userprofile%\OneDrive - Salesianer Miettex GmbH\Desktop\Advantex*.rdp" goto del4
goto ende
:del4
del "%userprofile%\OneDrive - Salesianer Miettex GmbH\Desktop\Advantex*.rdp"
goto ende
:ende