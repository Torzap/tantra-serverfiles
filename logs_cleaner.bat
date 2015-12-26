@echo off
title Limpiar DBSRV
color 2F
echo -------------------------------------------------
echo ----        Script para limpiar logs         ----
echo ----         Amir Torrez  -  Torzap          ----
echo -------------------------------------------------
@echo.
echo Eliminando Logs ...
if exist DBSRV\Log\**.txt del DBSRV\Log\**.txt
if exist Itemserver\Log\**.txt del Itemserver\Log\**.txt
if exist MSGSRV\Log\**.txt del MSGSRV\Log\**.txt
if exist SQLDAEMON\Log\**.txt del SQLDAEMON\Log\**.txt
for /L %%i in (1,1,50) do ( if exist Zone%%i\Log\**.txt del Zone%%i\Log\**.txt )
for /L %%i in (1,1,50) do ( if exist Zone%%i\Event\**.txt del Zone%%i\Event\**.txt )
for /L %%i in (1,1,50) do ( if exist Zone%%i\monster_log\**.txt del Zone%%i\monster_log\**.txt )
@echo.
echo Limpieza Completada!! 
@echo.
pause
