@ECHO off

::Defines
set CPUtype=xxx

:ARCHcheck
for /f "skip=1 delims=" %%x in ('wmic cpu get addresswidth') do if not defined AddressWidth set AddressWidth=%%x

if %AddressWidth%==64 (
  wget http://www.r99.com.au/teamviewer/TeamViewer_Host-idckg6ker6.msi
	set CPUtype=x64
	GOTO 64RegClean
)	else	(
	wget http://www.r99.com.au/teamviewer/TeamViewer_Host-idckg6ker6.msi
	set CPUtype=x86
  GOTO 32RegClean
)
GOTO End


:64RegClean
wget http://www.r99.com.au/teamviewer/64clean.exe
64clean.exe
wget http://www.r99.com.au/teamviewer/32clean.exe
32clean.exe
Goto StopServices

:32RegClean
wget http://www.r99.com.au/teamviewer/32clean.exe
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