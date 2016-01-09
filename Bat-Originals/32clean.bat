REG ADD HKCU\Software\TeamViewer /v HostInfoDialog /t REG_DWORD /d 0 /f
REG ADD HKU\.DEFAULT\Software\TeamViewer /v HostInfoDialog /t REG_DWORD /d 0 /f
regedit /s TeamViewer_Settings.reg