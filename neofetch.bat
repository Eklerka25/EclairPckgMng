set os.host.os=unknown

for /f "tokens=1 delims==" %%a in ('ver') do (
    echo %%a | findstr /i "Windows" >nul
    if %errorlevel%==0 set os.host.os=win
)

if "!os.host.os!"=="win" (
    for /f "tokens=2 delims==" %%a in ('wmic cpu get name /value') do set "os.cpu=%%a"
    for /f "tokens=2 delims==" %%a in ('wmic path win32_videocontroller get name /value') do set "os.gpu=%%a"
    for /f "tokens=2 delims==" %%a in ('wmic computersystem get totalphysicalmemory /value') do (
        set ram=%%a
    )
    for /f "tokens=4 delims=[] " %%a in ('ver') do set os.kernel=%%a
    for /f "tokens=2 delims==" %%a in ('wmic computersystem get manufacturer /value') do set os.host=%%a

    for %%a in (C:\root\bin\*) do (
        set /a "os.packages+=1"
    )

    set /a ramMiB=!ram:~0,-6!
    set os.ram=!ramMiB!
    echo.
    echo             [91m.::--==++++=-.                     
    echo            [91m+++====++***####-                                   [94meklerka25[0m@[94mdesktop[0m
    echo           [91m-++=====++***###%%: [32m--.              .                [0m-------------------------
    echo           [91m++=====++***###%%+ [32m:***+=-:......:-=++                [94mOS[0m: BatchLinux 1.0
    echo          [91m=++====+++**####%%. [32m+**+++===------=+*.                [94mHost[0m: !os.host!
    echo         [91m.++=====++***###%%= [32m:***+++===-----==+=                 [94mKernel[0m: ntoskrnl !os.kernel!
    echo         [91m+++====++***###%%#  [32m+**+++===-----==+*                  [94mGUI[0m: none
    echo        [91m:+++===--=+**###%%- [32m-***+++===-----==*:                  [94mPackages[0m: !os.packages!
    echo        [94m....  ....   :-** [32m.***+++===-----==++                   [94mTerminal[0m: CMD
    echo       [94m.:::::::---===-:   [32m=***++====-----==*.                   [94mCPU[0m: !os.cpu!
    echo       [94m=--::::----=++*#+   [32m.-=++===---====-:                    [94mRAM[0m: !os.ram!MiB
    echo      [94m---:::::---==+**#. [33m=+=:.  [32m.........::                     [94mGPU[0m: !os.gpu!
    echo     [94m---:::::---==+***  [33m+*++++===------==+      
    echo    [94m:=--::::---==++*#: [33m-*++++====------=+:      
    echo    [94m=--:::::---==+*#+ [33m.+*++++===------===                       [101m    [102m    [103m    [104m    [105m    [106m    [107m    [0m  
    echo   [94m:=--::....::-=+*#. [33m=*++++===------==+.                       [41m    [42m    [43m    [44m    [45m    [46m    [47m    [0m 
    echo                  [33m   :++++++===------==-        
    echo                     [33m   +++===------=++  
    echo [0m
) else (
    call C:\root\sbin\errorHandler.bat package1 neofetch
)