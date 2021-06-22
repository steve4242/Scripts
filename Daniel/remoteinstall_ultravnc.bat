set /p Input=Auf Host installieren:
xcopy C:\INSTALL\ULTRAVNC \\%Input%\C$\INSTALL\ULTRAVNC /Y /S /I
C:\INSTALL\PSTools\psexec \\%Input% "C:\INSTALL\ULTRAVNC\UltraVNC_1_2_22_X64_Setup.exe" /verysilent /loadinf="C:\INSTALL\ULTRAVNC\ultravncconfig.inf"
xcopy /y "\\%Input%\C$\INSTALL\ULTRAVNC\ultravnc.ini" "\\%Input%\C$\Program Files\uvnc bvba\UltraVNC\ultravnc.ini"
C:\INSTALL\PSTools\psexec \\%Input% "C:\Program Files\uvnc bvba\UltraVNC\MSLogonACL.exe" /i /a C:\INSTALL\ULTRAVNC\MSLogonACL.txt
timeout /t 3 /nobreak
C:\INSTALL\PSTools\psservice \\%Input% restart uvnc_service