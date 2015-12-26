    @echo off
    title Limpiar DBSRV
    color 2F
    echo -------------------------------------------------
    echo ---- Script para limpiar el directorio DBSRV ----
    echo ----         Amir Torres   -  Torzap         ----
    echo -------------------------------------------------
    @echo.
    echo Estas completamente seguro? [si/no]
    set/p acc= ?:
    @echo.
    if "%acc%"=="si" goto del
    if "%acc%"=="no" goto exit
    :del
    echo Eliminando cuentas y personajes ...
    cd DBSRV
    forfiles /s /m *.tad /c "cmd /c del *.tad"
    forfiles /s /m *.tcd /c "cmd /c del *.tcd"
    cd ../MSGSRV
    forfiles /s /m *.tmd /c "cmd /c del *.tmd"
    cd ../
    @echo.
    echo Limpieza Completada!!  
    @echo.
    goto exit
    :exit
    pause
