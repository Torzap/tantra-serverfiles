@echo off
color 1F
set v=1.1
:menu
cls
title Menu - Tantra Server Tool v%v%
if not exist Resources md Resources
@echo.
@echo.
echo    ==========================================================================
echo    ==                                ==                                    ==
echo    ==     E = Encender servidor      ==   L = Limpiar logs                 ==
echo    ==     X = Apagar servidor        ==   A = Limpiar cuentas y chars      ==
echo    ==     Z = Ver los mapas          ==   I = Configurar IP                ==
echo    ==     G = Clanes                 ==   R = Copiar recursos              ==
echo    ==     J = Ver oficios            ==                                    ==
echo    ==                                ==                                    ==
echo    ==========================================================================
echo    ==                                                                      ==
echo    ==                             Version %v%                              ==
echo    ==                        Creado por Amir Torrez                        ==
echo    ==                                                                      ==
echo    ==========================================================================
@echo.
echo Introduce una accion
set /p acc=  ?: 
if /I "%acc%"=="z" if /I "%acc%"=="Z" goto mapas
if /I "%acc%"=="g" if /I "%acc%"=="G" goto clanes
if /I "%acc%"=="J" if /I "%acc%"=="J" goto oficios
if /I "%acc%"=="l" if /I "%acc%"=="L" goto borrarlogs
if /I "%acc%"=="i" if /I "%acc%"=="I" goto configurarip
if /I "%acc%"=="a" if /I "%acc%"=="A" goto borrarcuentas
if /I "%acc%"=="r" if /I "%acc%"=="R" goto copiarrecursos
if /I "%acc%"=="x" if /I "%acc%"=="X" goto apagarservidor
if /I "%acc%"=="e" if /I "%acc%"=="E" goto encenderservidor
goto error
:error
cls
title Error - Tantra Server Tool v%v%
@echo.
@echo.
echo    ==========================================================================
echo    ==                                                                      ==
echo    ==                                ERROR                                 ==
echo    ==                                                                      ==
echo    ==========================================================================
echo    ==                                                                      ==
echo    ==           La accion solicitada no existe o no es correcta            ==
echo    ==                                                                      ==
echo    ==========================================================================
@echo.
@echo.
@echo.
echo Presiona una tecla para volver al menu
pause>nul   
goto menu
:mapas
cls
title  Listado de mapas - Tantra Server Tool v%v%
@echo.
@echo.
echo    ==========================================================================
echo    ==                                ==                                    ==
echo    ==     1 = Mandara                ==    15 = Karya Dungeon 3            ==
echo    ==     2 = Shambala               ==    16 = Durga                      ==
echo    ==     3 = Calabozo Mandara 1     ==    17 = Byru                       ==
echo    ==     4 = Calabozo Mandara 2     ==    20 = Anaka Kruma                ==
echo    ==     5 = Calabozo Shambala 1    ==    21 = Mudha                      ==
echo    ==     6 = Calabozo Shambala 2    ==    22 = Forge                      ==
echo    ==     7 = Jina                   ==    24 = Ruins                      ==
echo    ==     8 = Planicie Pamir         ==    25 = Vedi Kruma                 ==
echo    ==     9 = Exilio                 ==    26 = Naga                       ==
echo    ==    10 = Kruma                  ==    28 = Calabozo Naga              ==
echo    ==    11 = Chaturanga             ==    31 = Marana 1                   ==
echo    ==    12 = Tumba del emperador    ==    32 = Marana 2                   ==
echo    ==    13 = Karya Dungeon 1        ==    33 = Paroksya                   ==
echo    ==    14 = Karya Dungeon 2        ==    34 = Dragon Cave                ==
echo    ==                                ==                                    ==
echo    ==========================================================================
@echo.
@echo.
echo Presiona una tecla para volver al menu
pause>nul
goto menu
:oficios
cls
title  Listado de oficios - Tantra Server Tool v%v%
@echo.
@echo.
echo    ==========================================================================
echo    ==                                                                      ==
echo    ==                        Listado de 2do oficios                        ==
echo    ==                                                                      ==
echo    ==========================================================================
echo    ==                                ==                                    ==
echo    ==    2 / 0 = Satya               ==    2 / 1 = Banar                   ==
echo    ==    2 / 2 = Druka               ==    2 / 3 = Karya                   ==
echo    ==    2 / 4 = Nakayuda            ==    2 / 5 = Vidya                   ==
echo    ==    2 / 6 = Abikara             ==    2 / 7 = Samabat                 ==
echo    ==                                ==                                    ==
echo    ==========================================================================
@echo.
@echo.
echo Presiona una tecla para volver al menu
pause>nul
goto menu
:borrarlogs
cls
title  Limpiar logs - Tantra Server Tool v%v%
@echo.
@echo.
echo    ==========================================================================
echo    ==                                ==                                    ==
echo    ==        Y = Borrar logs         ==         N = Volver al menu         ==
echo    ==                                ==                                    ==
echo    ==========================================================================
echo    ==                                                                      ==
echo    ==              ¨Estas seguro que quieres borrar los logs?              ==
echo    ==                                                                      ==
echo    ==========================================================================
@echo.
@echo.
echo Introduce una accion
set /p acc=  ?: 
if /I "%acc%"=="y" if /I "%acc%"=="Y" goto yborrarlogs
if /I "%acc%"=="n" if /I "%acc%"=="N" goto menu
goto error
:yborrarlogs
cls
title  Limpiar logs - Tantra Server Tool v%v%
@echo.
@echo.
echo    ==========================================================================
echo    ==                                                                      ==
echo    ==                           Eliminando logs                            ==
echo    ==                                                                      ==
echo    ==========================================================================
@echo.
if exist DBSRV\Log\**.txt del DBSRV\Log\**.txt
if exist Itemserver\Log\**.txt del Itemserver\Log\**.txt
if exist MSGSRV\Log\**.txt del MSGSRV\Log\**.txt
if exist SQLDAEMON\Log\**.txt del SQLDAEMON\Log\**.txt
for /L %%i in (1,1,50) do ( if exist Zone%%i\Log\**.txt del Zone%%i\Log\**.txt )
for /L %%i in (1,1,50) do ( if exist Zone%%i\Event\**.txt del Zone%%i\Event\**.txt )
for /L %%i in (1,1,50) do ( if exist Zone%%i\monster_log\**.txt del Zone%%i\monster_log\**.txt )
@echo.
echo Tarea terminada, presiona una tecla para volver al menu
pause>nul
goto menu
:borrarcuentas
cls
title  Borrar cuentas y personajes - Tantra Server Tool v%v%
@echo.
@echo.
echo    ==========================================================================
echo    ==                                ==                                    ==
echo    ==       Y = Borrar cuentas       ==         N = Volver al menu         ==
echo    ==                                ==                                    ==
echo    ==========================================================================
echo    ==                                                                      ==
echo    ==            ¨Estas seguro que quieres borrar las cuentas?             ==
echo    ==                                                                      ==
echo    ==========================================================================
@echo.
@echo.
echo Introduce una accion
set /p acc=  ?: 
if /I "%acc%"=="y" if /I "%acc%"=="Y" goto yborrarcuentas
if /I "%acc%"=="n" if /I "%acc%"=="N" goto menu
goto error
:yborrarcuentas
cls
title  Borrar cuentas y personajes - Tantra Server Tool v%v%
@echo.
@echo.
echo    ==========================================================================
echo    ==                                                                      ==
echo    ==                   Eliminando cuentas y personajes                    ==
echo    ==                                                                      ==
echo    ==========================================================================
@echo.
cd DBSRV
forfiles /s /m *.tad /c "cmd /c del *.tad"
forfiles /s /m *.tcd /c "cmd /c del *.tcd"
cd ../MSGSRV
forfiles /s /m *.tmd /c "cmd /c del *.tmd"
cd ../
@echo.
echo Tarea terminada, presiona una tecla para volver al menu
pause>nul
goto menu
:clanes
cls
title  Clanes - Tantra Server Tool v%v%
@echo.
@echo.
echo    ==========================================================================
echo    ==                                ==                                    ==
echo    ==       R = Activar clanes       ==       X = Desactivar clanes        ==
echo    ==                                ==                                    ==
echo    ==========================================================================
echo    ==                                                                      ==
echo    ==                          M = Volver al menu                          ==
echo    ==                                                                      ==
echo    ==========================================================================
@echo.
@echo.
echo Introduce una accion
set /p acc=  ?: 
if /I "%acc%"=="r" if /I "%acc%"=="R" goto rclanes
if /I "%acc%"=="x" if /I "%acc%"=="X" goto xclanes
if /I "%acc%"=="m" if /I "%acc%"=="M" goto menu
goto error
:rclanes
cls
title  Activar clanes - Tantra Server Tool v%v%
@echo.
@echo.
echo    ==========================================================================
echo    ==                                                                      ==
echo    ==                         Activacion de clanes                         ==
echo    ==                                                                      ==
echo    ==========================================================================
@echo.
subst Q: "%~d0%~p0Share"
subst G: "%~d0%~p0DBSRV\guild"
subst R: "%~d0%~p0current_user"
subst K: "%~d0%~p0SQLDAEMON\Rank"
subst S: "%~d0%~p0DBSRV\current_user"
@echo.
echo Tarea terminada, presiona una tecla para volver al menu
pause>nul
goto menu
:xclanes
cls
title  Desactivar clanes - Tantra Server Tool v%v%
@echo.
@echo.
echo    ==========================================================================
echo    ==                                                                      ==
echo    ==                       Desactivacion de clanes                        ==
echo    ==                                                                      ==
echo    ==========================================================================
@echo.
subst Q: /D
subst G: /D
subst R: /D
subst K: /D
subst S: /D
@echo.
echo Tarea terminada, presiona una tecla para volver al menu
pause>nul
goto menu
:encenderservidor
cls
title  Encender Servidor - Tantra Server Tool v%v%
@echo.
@echo.
echo    ==========================================================================
echo    ==                                ==                                    ==
echo    ==       T = Encender todo        ==        W = Encender motores        ==
echo    ==                                ==                                    ==
echo    ==========================================================================
echo    ==                                ==                                    ==
echo    ==     N = Encender por mapa      ==         M = Volver al menu         ==
echo    ==                                ==                                    ==
echo    ==========================================================================
@echo.
@echo.
echo Introduce una accion
set /p acc=  ?: 
if /I "%acc%"=="t" if /I "%acc%"=="T" goto rtodo
if /I "%acc%"=="n" if /I "%acc%"=="N" goto rmapa
if /I "%acc%"=="m" if /I "%acc%"=="M" goto menu
if /I "%acc%"=="w" if /I "%acc%"=="W" (
start DBSRV\DBSRV.exe
timeout>nul /t 2
start MSGSRV\MSGSRV.exe
timeout>nul /t 2
start ITMSRV\ITMSRV.exe
timeout>nul /t 2
start SQLDAEMON\SQLDAEMON.exe
timeout>nul /t 2
echo Motores encendidos, presiona una tecla para volver al menu
pause>nul
goto menu
)
goto error
:rtodo
@rem Tiempo en segundos entre cada ejecucion:
set optm=5
cls
title  Encender todo el servidor - Tantra Server Tool v%v%
@echo.
@echo.
echo    ==========================================================================
echo    ==                                                                      ==
echo    ==                    Encendiendo todo el servidor                      ==
echo    ==                                                                      ==
echo    ==========================================================================
@echo.
echo Presiona una tecla para iniciar
pause>nul
@echo.
echo Creando particiones ...
subst Q: "%~d0%~p0Share"
subst G: "%~d0%~p0DBSRV\guild"
subst R: "%~d0%~p0current_user"
subst K: "%~d0%~p0SQLDAEMON\Rank"
subst S: "%~d0%~p0DBSRV\current_user"
@echo.
timeout>nul /t 2
@echo.
echo Encendiendo motores...
start DBSRV\DBSRV.exe
timeout>nul /t 3
start MSGSRV\MSGSRV.exe
timeout>nul /t 3
start ITMSRV\ITMSRV.exe
@echo.
echo Encendiendo todas las zonas...
for /L %%i in (1,1,50) do ( timeout>nul /t %optm% && if exist Zone%%i\Zone%%i.exe start Zone%%i\Zone%%i.exe )
timeout>nul /t %optm%
start SQLDAEMON\SQLDAEMON.exe
@echo.
echo Tarea terminada, presiona una tecla para volver al menu
pause>nul
goto menu
:rmapa
cls
title  Encender zona - Tantra Server Tool v%v%
@echo.
@echo.
echo    ==========================================================================
echo    ==                                                                      ==
echo    ==                Introduce el numero de zona a encender                ==
echo    ==                                                                      ==
echo    ==========================================================================
echo    ==                                ==                                    ==
echo    ==       Z = Ver los mapas        ==         M = Volver al menu         ==
echo    ==                                ==                                    ==
echo    ==========================================================================
@echo.
set /p acc=  ?: 
set "variable=false"
if /I "%acc%"=="m" if /I "%acc%"=="M" goto menu
if /I "%acc%"=="z" if /I "%acc%"=="Z" goto mapas
for /f "delims=abcdefghijklmnopqrstuvwxyz" %%a in ("%acc%") do set "variable=true"
if "%variable%"=="false" (
goto error
)
start Zone%acc%/Zonesrv%acc%.exe
goto rmapa
:apagarservidor
cls
title  Apagar servidor - Tantra Server Tool v%v%
@echo.
@echo.
echo    ==========================================================================
echo    ==                                ==                                    ==
echo    ==      X = Apagar servidor       ==         N = Volver al menu         ==
echo    ==                                ==                                    ==
echo    ==========================================================================
echo    ==                                                                      ==
echo    ==           ¨Estas seguro que quieres apagar el servidor?              ==
echo    ==                                                                      ==
echo    ==========================================================================
@echo.
@echo.
echo Introduce una accion
set /p acc=  ?: 
if /I "%acc%"=="x" if /I "%acc%"=="X" (
subst Q: /D
subst G: /D
subst R: /D
subst K: /D
subst S: /D
taskkill /f /t /im DBSRV.exe
taskkill /f /t /im GMTool.exe
taskkill /f /t /im MSGSRV.exe
taskkill /f /t /im CHATSRV.exe
taskkill /f /t /im ITMSRV.exe
for /L %%i in (1,1,35) do ( taskkill /f /t /im Zone%%i.exe )
@echo.
echo Tarea terminada, presiona una tecla para volver al menu
pause>nul
goto menu
)
if /I "%acc%"=="n" if /I "%acc%"=="N" goto menu
goto error
:copiarrecursos
cls
title  Copiar recursos - Tantra Server Tool v%v%
@echo.
@echo.
echo    ==========================================================================
echo    ==                                                                      ==
echo    ==              Copiar recursos de servidor, los recursos               ==
echo    ==               deben colocarse en la carpeta Resources                ==
echo    ==                                                                      ==
echo    ==                    ¨Que archivo quieres copiar?                      ==
echo    ==                                                                      ==
echo    ==========================================================================
echo    ==                                ==                                    ==
echo    ==   H = HTSSetting.txl           ==    P = TantraParam.tpa             ==
echo    ==   Q = Quiz.txt                 ==    Z = Zonesrv.exe                 ==
echo    ==   S = HTScrollQuestSystem.txl  ==    N = NameFilter.txt              ==
echo    ==   C = ChatFilter.txt           ==                                    ==
echo    ==                                ==                                    ==
echo    ==========================================================================
echo    ==                                                                      ==
echo    ==                          M = Volver al menu                          ==
echo    ==                                                                      ==
echo    ==========================================================================
@echo.
echo Introduce una accion
set /p acc=  ?: 
if /I "%acc%"=="m" if /I "%acc%"=="M" goto menu
if /I "%acc%"=="p" if /I "%acc%"=="P" (
for /L %%i in (1,1,50) do ( if exist Zone%%i copy Resources\TantraParam.tpa Zone%%i\TantraParam.tpa /Y )
goto cfrecursos
)
if /I "%acc%"=="z" if /I "%acc%"=="Z" (
for /L %%i in (1,1,50) do ( if exist Zone%%i copy Resources\Zonesrv.exe Zone%%i\Zonesrv%%i.exe /Y )
goto cfrecursos
)
if /I "%acc%"=="n" if /I "%acc%"=="N" (
for /L %%i in (1,1,50) do ( if exist Zone%%i copy Resources\NameFilter.txt Zone%%i\NameFilter.txt /Y )
goto cfrecursos
)
if /I "%acc%"=="c" if /I "%acc%"=="C" (
for /L %%i in (1,1,50) do ( if exist Zone%%i copy Resources\ChatFilter.txt Zone%%i\ChatFilter.txt /Y )
goto cfrecursos
)
if /I "%acc%"=="h" if /I "%acc%"=="H" (
for /L %%i in (1,1,50) do ( if exist Zone%%i copy Resources\HTSSetting.txl Zone%%i\HTSSetting.txl /Y )
goto cfrecursos
)
if /I "%acc%"=="s" if /I "%acc%"=="S" (
for /L %%i in (1,1,50) do ( if exist Zone%%i copy Resources\HTScrollQuestSystem.txl Zone%%i\HTScrollQuestSystem.txl /Y )
goto cfrecursos
)
if /I "%acc%"=="q" if /I "%acc%"=="Q" (
for /L %%i in (1,1,50) do ( if exist Zone%%i copy Resources\Quiz.txt  Zone%%i\Data\Quiz.txt  /Y )
goto cfrecursos
)
goto error
:cfrecursos
@echo.
echo Tarea terminada, presiona una tecla para continuar
pause>nul
goto copiarrecursos
:configurarip
cls
title  Configurar IP - Tantra Server Tool v%v%
@echo.
@echo.
echo    ==========================================================================
echo    ==                                ==                                    ==
echo    ==         A = Agregar ip         ==           R = Borrar IP            ==
echo    ==                                ==                                    ==
echo    ==========================================================================
echo    ==                                                                      ==
echo    ==                          M = Volver al menu                          ==
echo    ==                                                                      ==
echo    ==========================================================================
@echo.
echo Introduce una accion
set /p acc=  ?: 
if /I "%acc%"=="m" if /I "%acc%"=="M" goto menu
if /I "%acc%"=="a" if /I "%acc%"=="A" goto nuevaip
if /I "%acc%"=="r" if /I "%acc%"=="R" (
del /f /s /q LocalIP.txt
del /f /s /q itemserver.txt
del /f /s /q Serverlist.txt
del /f /s /q Admin.txt
@echo.
echo Tarea terminada, presiona una tecla para continuar
pause>nul
goto configurarip
)
goto error
:nuevaip
@echo.
echo Intruduce la nueva ip (por ejemplo 192.168.0.1)
set /p ip=  IP: 
echo 0  0 %ip% 1000 >>Resources/Serverlist.txt
echo 0  1 %ip% 3001 >>Resources/Serverlist.txt
echo 0  2 %ip% 3002 >>Resources/Serverlist.txt
echo 0  3 %ip% 3003 >>Resources/Serverlist.txt
echo 0  4 %ip% 3004 >>Resources/Serverlist.txt
echo 0  5 %ip% 3005 >>Resources/Serverlist.txt
echo 0  6 %ip% 3006 >>Resources/Serverlist.txt
echo 0  7 %ip% 3007 >>Resources/Serverlist.txt
echo 0  8 %ip% 3008 >>Resources/Serverlist.txt
echo 0  9 %ip% 3009 >>Resources/Serverlist.txt
echo 0  10 %ip% 3010 >>Resources/Serverlist.txt
echo 0  11 %ip% 3011 >>Resources/Serverlist.txt
echo 0  12 %ip% 3012 >>Resources/Serverlist.txt
echo 0  13 %ip% 3013 >>Resources/Serverlist.txt
echo 0  14 %ip% 3014 >>Resources/Serverlist.txt
echo 0  15 %ip% 3015 >>Resources/Serverlist.txt
echo 0  16 %ip% 3016 >>Resources/Serverlist.txt
echo 0  17 %ip% 3017 >>Resources/Serverlist.txt
echo 0  18 %ip% 3018 >>Resources/Serverlist.txt
echo 0  19 %ip% 3019 >>Resources/Serverlist.txt
echo 0  20 %ip% 3020 >>Resources/Serverlist.txt
echo 0  21 %ip% 3021 >>Resources/Serverlist.txt
echo 0  22 %ip% 3022 >>Resources/Serverlist.txt
echo 0  23 %ip% 3023 >>Resources/Serverlist.txt
echo 0  24 %ip% 3024 >>Resources/Serverlist.txt
echo 0  25 %ip% 3025 >>Resources/Serverlist.txt
echo 0  26 %ip% 3026 >>Resources/Serverlist.txt
echo 0  27 %ip% 3027 >>Resources/Serverlist.txt
echo 0  28 %ip% 3028 >>Resources/Serverlist.txt
echo 0  29 %ip% 3029 >>Resources/Serverlist.txt
echo 0  30 %ip% 3030 >>Resources/Serverlist.txt
echo 0  31 %ip% 3031 >>Resources/Serverlist.txt
echo 0  32 %ip% 3032 >>Resources/Serverlist.txt
echo 0  33 %ip% 3033 >>Resources/Serverlist.txt
echo 0  34 %ip% 3034 >>Resources/Serverlist.txt
echo 0  35 %ip% 3035 >>Resources/Serverlist.txt
echo 0  36 %ip% 3036 >>Resources/Serverlist.txt
echo 0  37 %ip% 3037 >>Resources/Serverlist.txt
echo 0  38 %ip% 3038 >>Resources/Serverlist.txt
echo 0  39 %ip% 3039 >>Resources/Serverlist.txt
echo 0  40 %ip% 3040 >>Resources/Serverlist.txt
echo 0  41 %ip% 3041 >>Resources/Serverlist.txt
echo 0  42 %ip% 3042 >>Resources/Serverlist.txt
echo 0  43 %ip% 3043 >>Resources/Serverlist.txt
echo 0  44 %ip% 3044 >>Resources/Serverlist.txt
echo 0  45 %ip% 3045 >>Resources/Serverlist.txt
echo 0  46 %ip% 3046 >>Resources/Serverlist.txt
echo 0  47 %ip% 3047 >>Resources/Serverlist.txt
echo 0  48 %ip% 3048 >>Resources/Serverlist.txt
echo 0  49 %ip% 3049 >>Resources/Serverlist.txt
echo 0  50 %ip% 3050 >>Resources/Serverlist.txt
echo 0  51 %ip% 5001 >>Resources/Serverlist.txt
echo 0  52 %ip% 5052 >>Resources/Serverlist.txt
echo 0  53 %ip% 5053 >>Resources/Serverlist.txt
for /L %%i in (1,1,50) do ( if exist Zone%%i copy Resources\Serverlist.txt  Zone%%i\Serverlist.txt  /Y )
copy Resources\Serverlist.txt  DBSRV\Serverlist.txt  /Y
copy Resources\Serverlist.txt  MSGSRV\Serverlist.txt  /Y
copy Resources\Serverlist.txt  SQLDAEMON\Serverlist.txt  /Y
copy Resources\Serverlist.txt  CHATSRV\Serverlist.txt  /Y
echo %ip% 5052 >>SQLDAEMON/LocalIP.txt
echo %ip% 5053 >>CHATSRV/LocalIP.txt
echo %ip% 1000 >>DBSRV/LocalIP.txt
echo %ip% 5001 >>MSGSRV/LocalIP.txt
echo 0 %ip%  >>DBSRV/Admin.txt
set n=0
set puerto=3000
:begin
set /A n=%n%+1
set /A puerto= %puerto%+1
if exist Zone%n% echo %ip% %puerto% >>Zone%n%/LocalIP.txt
if "%n%"=="50" goto fin ELSE (
goto begin
)
:fin
pause
@echo.
echo Tarea terminada, presiona una tecla para continuar
pause>nul
goto configurarip
