sc stop "TeamViewer" 
net stop "TeamViewer"
regedit /s TeamViewer_Settings.reg
REG ADD HKCU\Software\TeamViewer /v HostInfoDialog /t REG_DWORD /d 0 /f
REG ADD HKU\.DEFAULT\Software\TeamViewer /v HostInfoDialog /t REG_DWORD /d 0 /f
start /wait MSIEXEC.EXE /i TeamViewer_Host-idckg6ker6.msi /qn
regedit /s TeamViewer_Settings.reg
del "%Public%\Desktop\TeamViewer*.lnk"