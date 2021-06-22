if exist "C:\Program Files (x86)\LANDesk\LDClient" goto vnc_uninstall
if exsit "C:\Program Files\LANDesk\LDClient" goto vnc_uninstall
goto ende
:vnc_uninstall
echo "Landesk installiert"
:ende