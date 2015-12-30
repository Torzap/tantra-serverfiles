@echo off
title Encender servidor v0.2
color 2F
echo -------------------------------------------------
echo ----        Encender servidor Tantra         ----
echo ----         Amir Torrez   -  Torzap         ----
echo -------------------------------------------------
@rem Tiempo en segundos entre cada ejecucion:
set optm=5
@rem Tiempo en segundos para cerrar al finalizar:
set cstm=5

@echo.
echo Creando particiones...
SUBST Q: C:\Share
subst G: C:\DBSRV\guild
subst R: C:\current_user
SUBST K: C:\SQLDAEMON\Rank
@echo.
timeout>nul /t %optm%
@echo.
echo Encendiendo motores...
start DBSRV\DBSRV.exe
timeout>nul /t %optm%
start MSGSRV\MSGSRV.exe
timeout>nul /t %optm%
start Itemserver\Itmsrv.exe
@echo.
echo Encendiendo todas las zonas...
for /L %%i in (1,1,50) do ( timeout>nul /t %optm% && if exist Zone%%i\Zone%%i.exe start Zone%%i\Zone%%i.exe )
timeout>nul /t %optm%
start SQLDAEMON\SQLDAEMON.exe
@echo.
echo Servidor listo, esta ventana se cerrara en %cstm% segundos
timeout>nul /t %optm%
