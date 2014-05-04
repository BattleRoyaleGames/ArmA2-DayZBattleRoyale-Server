:: Arma Server Starter by lazyink (PLAYERUNKNOWN) : modified by @Pwnoz0r

@echo off

:: MAKE SURE TO CHANGE THESE BEFORE STARTING THE SERVER!
:: Directory Settings
:: Example: C:\Users\Administrator\Desktop\ArmA2OA
set ARMADIR=<PATH TO THE ROOT OF YOUR GAME SERVER>
:: Example: C:\Program Files\MySQL\MySQL Server 5.6\bin
set MYSQLDIR=<PATH TO THE BIN FOLDER OF YOUR MYSQL SERVER DIRECTORY>
:: Database Settings
set MYSQLHOST=127.0.0.1
set MYSQLUSER=dayz
set MYSQLPASS=dayz
SET MYSQLDB=battleroyale

cls
title Lazy's DayZ Battle Royale Server Starter

:brstart

"%MYSQLDIR%\mysql.exe" -h %MYSQLHOST% --user=%MYSQLUSER% --password=%MYSQLPASS% --database=%MYSQLDB% --execute="delete from object_data;"
"%MYSQLDIR%\mysql.exe" -h %MYSQLHOST% --user=%MYSQLUSER% --password=%MYSQLPASS% --database=%MYSQLDB% --execute="UPDATE character_data SET Inventory='[[],[]]';"
"%MYSQLDIR%\mysql.exe" -h %MYSQLHOST% --user=%MYSQLUSER% --password=%MYSQLPASS% --database=%MYSQLDB% --execute="UPDATE character_data SET Backpack='["",[],[]]';"
"%MYSQLDIR%\mysql.exe" -h %MYSQLHOST% --user=%MYSQLUSER% --password=%MYSQLPASS% --database=%MYSQLDB% --execute="UPDATE character_data SET Worldspace='[]';"
"%MYSQLDIR%\mysql.exe" -h %MYSQLHOST% --user=%MYSQLUSER% --password=%MYSQLPASS% --database=%MYSQLDB% --execute="UPDATE character_data SET Model='"Survivor2_DZ"';"
"%MYSQLDIR%\mysql.exe" -h %MYSQLHOST% --user=%MYSQLUSER% --password=%MYSQLPASS% --database=%MYSQLDB% --execute="UPDATE character_data SET Humanity='4500';"
"%MYSQLDIR%\mysql.exe" -h %MYSQLHOST% --user=%MYSQLUSER% --password=%MYSQLPASS% --database=%MYSQLDB% --execute="UPDATE character_data SET currentState='[]';"
"%MYSQLDIR%\mysql.exe" -h %MYSQLHOST% --user=%MYSQLUSER% --password=%MYSQLPASS% --database=%MYSQLDB% --execute="UPDATE character_data SET Medical='[]';"
echo (%time%)DayZ Battle Royale Charater Data Reset
timeout 1

set /a brmap=%random% %%4
goto %brmap%

:0

echo (%time%) DayZ Battle Royale Kulima Server was started...
timeout 1
cd "%ARMADIR%"
start /wait /HIGH .\Expansion\beta\arma2oaserver.exe -mod=@DayZBattleRoyale;@BattleRoyale; -name=dayz_1.kulima -config=dayz_1.kulima\config_1234.cfg -cfg=dayz_1.kulima\basic.cfg -profiles=dayz_1.kulima cpuCount=4 -world=kulima -exThreads=1 -bandwidthAlg=2 -maxMem=2047
timeout 1
goto brstart

:1

echo (%time%) DayZ Battle Royale Isola di Capraia Server was started...
timeout 1
cd "%ARMADIR%"
start /wait /HIGH .\Expansion\beta\arma2oaserver.exe -mod=@DayZBattleRoyale;@BattleRoyale; -name=dayz_1.isoladicapraia -config=dayz_1.isoladicapraia\config_1234.cfg -cfg=dayz_1.isoladicapraia\basic.cfg -profiles=dayz_1.isoladicapraia cpuCount=4 -world=isoladicapraia -exThreads=1 -bandwidthAlg=2 -maxMem=2047
timeout 1
goto brstart

:2

echo (%time%) DayZ Battle Royale Emita Server was started...
timeout 1
cd "%ARMADIR%"
start /wait /HIGH .\Expansion\beta\arma2oaserver.exe -mod=@DayZBattleRoyale;@BattleRoyale; -name=dayz_1.emita -config=dayz_1.emita\config_1234.cfg -cfg=dayz_1.emita\basic.cfg -profiles=dayz_1.emita cpuCount=4 -world=emita -exThreads=1 -bandwidthAlg=2 -maxMem=2047
timeout 1
goto brstart


:3

echo (%time%) DayZ Battle Royale F.A.T.A Server was started...
timeout 1
cd "%ARMADIR%"
start /wait /HIGH .\Expansion\beta\arma2oaserver.exe -mod=@DayZBattleRoyale;@BattleRoyale; -name=dayz_1.fata -config=dayz_1.fata\config_1234.cfg -cfg=dayz_1.fata\basic.cfg -profiles=dayz_1.fata cpuCount=4 -world=fata -exThreads=1 -bandwidthAlg=2 -maxMem=2047
timeout 1
goto brstart