@ECHO off

::Defines
set CPUtype=xxx

:ARCHcheck
for /f "skip=1 delims=" %%x in ('wmic cpu get addresswidth') do if not defined AddressWidth set AddressWidth=%%x

if %AddressWidth%==64 (
  wget wget -w 3 https://github.com/ViroRepo/teamviewer-deploy/raw/master/Exe-Originals/TeamViewer_Host-idckg6ker6.msi --no-check-certificate --no-proxy
	set CPUtype=x64
	GOTO 64RegClean
)	else	(
	wget wget -w 3 https://github.com/ViroRepo/teamviewer-deploy/raw/master/Exe-Originals/TeamViewer_Host-idckg6ker6.msi --no-check-certificate --no-proxy
	set CPUtype=x86
  GOTO 32RegClean
)
GOTO End


:64RegClean
wget -w 3 https://raw.githubusercontent.com/ViroRepo/teamviewer-deploy/master/Bat-Originals/64clean.bat --no-check-certificate --no-proxy
64clean.exe
wget -w 3 https://raw.githubusercontent.com/ViroRepo/teamviewer-deploy/master/Bat-Originals/32clean.bat --no-check-certificate --no-proxy
32clean.exe
Goto StopServices

:32RegClean
wget -w 3 https://raw.githubusercontent.com/ViroRepo/teamviewer-deploy/master/Bat-Originals/32clean.bat --no-check-certificate --no-proxy
32clean.exe
Goto StopServices

:StopServices
sc stop "TeamViewer" 
net stop "TeamViewer"
Goto Install

:Install
CLS
start /wait MSIEXEC.EXE /i TeamViewer_Host-idckg6ker6.msi /qn
Goto EXIT

:EXIT
pause
exit