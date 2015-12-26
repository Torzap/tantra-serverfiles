    @echo off
    title Encender servidor
    color 2F
    echo -------------------------------------------------
    echo ----        Encender servidor Tantra         ----
    echo ----         Amir Torrez   -  Torzap         ----
    echo -------------------------------------------------
    @echo.
    echo Creando particiones...
    SUBST Q: C:\Share
    subst G: C:\DBSRV\guild
    subst R: C:\current_user
    SUBST K: C:\SQLDAEMON\Rank
    @echo.
    pause
    @echo.
    echo Encendiendo motores...
    start DBSRV\DBSRV.exe
    pause
    start MSGSRV\MSGSRV.exe
    start Itemserver\Itmsrv.exe
    @echo.
    pause
    @echo.
    echo Encendiendo todas las zonas...
    for /L %%i in (1,1,50) do ( if exist Zone%%i\Zone%%i.exe start Zone%%i\Zone%%i.exe )
    start SQLDAEMON\SQLDAEMON.exe
    @echo.
    pause
