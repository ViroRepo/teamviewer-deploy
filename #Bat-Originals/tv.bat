sc stop "TeamViewer" 
net stop "TeamViewer"
start /wait MSIEXEC.EXE /i TeamViewer_Host-idckg6ker6.msi /qn
del "%Public%\Desktop\TeamViewer*.lnk"