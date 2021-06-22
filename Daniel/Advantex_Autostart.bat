chcp 1252
C:
set startup=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
if exist "%startup%\Advantex.lnk" goto ende
goto suche1
:suche1
if exist "%userprofile%\OneDrive - salesianer.com\Desktop\Advantex.lnk" goto copy1
goto suche2
:copy1
copy "%userprofile%\OneDrive - salesianer.com\Desktop\Advantex.lnk" "%startup%\Advantex.lnk"
goto ende
:suche2
if exist "%userprofile%\Desktop\Advantex.lnk" goto copy2
goto suche3
:copy2
copy "%userprofile%\Desktop\Advantex.lnk" "%startup%\Advantex.lnk"
goto ende
:suche3
if exist "%userprofile%\OneDrive - Salesianer Miettex GmbH\Desktop\Advantex.lnk" goto copy3
goto ende
:copy3
copy "%userprofile%\OneDrive - Salesianer Miettex GmbH\Desktop\Advantex.lnk" "%startup%\Advantex.lnk"
goto ende
:ende