chcp 1252
set startup=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
if exist "%startup%\sal_start_PCWedge.cmd" goto entfernen
if exist "%startup%\sal_start_PCWedge.cmd.lnk" goto entfernen
if exist "%startup%\sal_start_PCWedge.lnk" goto entfernen
if exist "%startup%\sal_start_PCWedge.cmd - Verknüpfung.lnk" goto entfernen
goto ende
:entfernen
del "%startup%\sal_start_PCWedge.cmd"
del "%startup%\sal_start_PCWedge.cmd.lnk"
del "%startup%\sal_start_PCWedge.lnk"
del "%startup%\sal_start_PCWedge.cmd - Verknüpfung.lnk"
goto start
:start
if exist c:\PCWedge goto root
if exist c:\INSTALL\PCWedge goto install
goto ende
:root
if not exist c:\PCWedge goto ende
copy "\\sal.co.at\daten\Install\PCWedge\PCWedge.lnk" "%startup%\PCWedge.lnk" & goto ende
:install
if not exist c:\INSTALL\PCWedge goto ende
copy "\\sal.co.at\daten\Install\PCWedge\PCWedge - INSTALL.lnk" "%startup%\PCWedge - INSTALL.lnk" & goto ende
:ende