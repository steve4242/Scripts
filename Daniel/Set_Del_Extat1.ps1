﻿Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=ARNO,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=ARNO,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='ARNO';extensionAttribute2='AT'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Benutzer,OU=BAXTER,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Benutzer,OU=BAXTER,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='BAXTER';extensionAttribute2='AT'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=GRAZ,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=GRAZ,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='GRAZ';extensionAttribute2='AT'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Benutzer,OU=IBK,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Benutzer,OU=IBK,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='IBK';extensionAttribute2='AT'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=INZ,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=INZ,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='INZ';extensionAttribute2='AT'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=KRAM,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=KRAM,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='KRAM';extensionAttribute2='AT'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=LEOG,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=LEOG,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='LEOG';extensionAttribute2='AT'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=MATT,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=MATT,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='MATT';extensionAttribute2='AT'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SA14,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SA14,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='HQ22';extensionAttribute2='AT'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=IT,OU=Buero,OU=Benutzer,OU=SA14,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=IT,OU=Buero,OU=Benutzer,OU=SA14,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='HQ22';extensionAttribute2='AT'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SA22,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SA22,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='HQ22';extensionAttribute2='AT'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SAWR,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SAWR,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='SAWR';extensionAttribute2='AT'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SCHI,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SCHI,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='SCHI';extensionAttribute2='AT'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SML,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SML,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='SML';extensionAttribute2='AT'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMLL,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMLL,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='SMLL';extensionAttribute2='AT'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMS,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMS,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='SMS';extensionAttribute2='AT'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMT,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMT,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='SMT';extensionAttribute2='AT'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=UMKL,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=UMKL,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='UMKL';extensionAttribute2='AT'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=WMBH,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=WMBH,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='WMBH';extensionAttribute2='AT'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=WMEN,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=WMEN,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='WMEN';extensionAttribute2='AT'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=WMLE,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=WMLE,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='WMLE';extensionAttribute2='AT'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=WMLI,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=WMLI,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='WMLI';extensionAttribute2='AT'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=WMOWS,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=WMOWS,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='WMOWS';extensionAttribute2='AT'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=WMSB,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=WMSB,OU=AT,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='WMSB';extensionAttribute2='AT'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=OTTO,OU=DE,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=OTTO,OU=DE,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='OTTO';extensionAttribute2='DE'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMHR,OU=HR,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMHR,OU=HR,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='SMHR';extensionAttribute2='HR'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMB,OU=HUN,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMB,OU=HUN,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='SMB';extensionAttribute2='HU'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SZOM,OU=HUN,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SZOM,OU=HUN,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='SZOM';extensionAttribute2='HU'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMSK,OU=SK,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMSK,OU=SK,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='SMSK';extensionAttribute2='SK'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMRS,OU=SRB,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMRS,OU=SRB,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='SMRS';extensionAttribute2='RS'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=BUDW,OU=CZ,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=BUDW,OU=CZ,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='BUDW';extensionAttribute2='CZ'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=CHEM,OU=CZ,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=CHEM,OU=CZ,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='CHEM';extensionAttribute2='CZ'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMP,OU=CZ,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMP,OU=CZ,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='SMP';extensionAttribute2='CZ'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMPL,OU=PL,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMPL,OU=PL,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='SMPL';extensionAttribute2='PL'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMTY,OU=PL,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMTY,OU=PL,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='SMTY';extensionAttribute2='PL'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=ORAD,OU=RO,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=ORAD,OU=RO,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='ORAD';extensionAttribute2='RO'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMKR,OU=RO,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMKR,OU=RO,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='SMKR';extensionAttribute2='RO'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMRO,OU=RO,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMRO,OU=RO,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='SMRO';extensionAttribute2='RO'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=PERI,OU=SLO,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=PERI,OU=SLO,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='PERI';extensionAttribute2='SLO'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=ROGA,OU=SLO,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=ROGA,OU=SLO,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='ROGA';extensionAttribute2='SLO'}
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMSL,OU=SLO,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “false”} | set-aduser -Clear "extensionAttribute1","extensionAttribute2"
Get-ADUser -Filter * -Property Enabled -SearchBase "OU=Buero,OU=Benutzer,OU=SMSL,OU=SLO,DC=sal,DC=co,DC=at" | Where-Object {$_.Enabled -like “true”} | set-aduser -Replace @{extensionAttribute1='SMSL';extensionAttribute2='SLO'}