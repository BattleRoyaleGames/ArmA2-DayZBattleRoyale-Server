
##DayZ Battle Royale Community Server Pack.

v0.9.6.3c


The DayZ Battle Royale Community Server Pack works differently to the official servers. There must be an admin logged in to lock and restart the server for every round and the community pack does not include our custom anti-hack or spectator tools. Apart from these differences, you are getting the full Battle Royale experience.

___________________________________________

    Admins can use the following commands via the in-game chat to lock and restart the server:

    #login YOURPASSWORD
    #lock
    #unlock
    #shutdown (used to restart the server)
    

    You can also use the various RCON clients to do this if you wish.


___________________________________________
###Installing:

1. Extract the contents of the downloaded DayZBR_CSP.v0.9.6.3c.zip file into the server Arma 2 OA directory.
2. Create a new database and call it 'battleroyale' and a DB user with username/pass set to 'dayz'
3. Run the BR_SQL.sql query on the 'battleroyale' database. (There will be errors, but you can ignore them)

Files with settings available to change are:

You can change the min players default(10) in this file.

    @BattleRoyale\addons\dayz_server\server_starter\waitForPlayers.sqf  

If you have created your Database with the settings above, you should not have to change anything in these files.

    dayz_1.emita\HiveExt.ini
    dayz_1.isoladecapraia\HiveExt.ini
    dayz_1.fata\HiveExt.ini
    dayz_1.kulima\HiveExt.ini


You MUST set the name of the server in each one of these files.
You must also set your in-game admin password here.

    dayz_1.emita\config_1234.cfg
    dayz_1.isoladecapraia\config_1234.cfg
    dayz_1.fata\config_1234.cfg
    dayz_1.kulima\config_1234.cfg

After you have all this set up, run the BattleRoyale_Server_Start_Script.bat to start the server. 
This will also auto-restart the server when it is shutdown.

Enjoy.

**PLAYERUNKNOWN**

battleroyalegames.com

twitter.com/BattleRoyaleMod


___________________________________________
The DayZ Battle Royale Community Server Pack is released for the express use of clans and gaming communities to hold events and community games via hosting a Battle Royale server on their own hardware. I ask that this pack must not be offered or sold as an addon or mod for Arma 2 OA by any private business/entity.

The DayZ Battle Royale Community Server Pack is released under the DAYZ MOD LICENSE SHARE ALIKE (DML). 

With this licence you are free to adapt (i.e. modify, rework or update) and share (i.e. copy, distribute or transmit) the material under the following conditions:

Attribution - You must attribute the material in the manner specified by the author or licensor (but not in any way that suggests that they endorse you or your use of the material).

Noncommercial - You may not use this material for any commercial purposes.

Arma 2 Only - You may not convert or adapt this material to be used in other games than Arma 2.

Share Alike - If you adapt, or build upon this material, you may distribute the resulting material only under the same license.

http://www.bistudio.com/community/licenses/dayz-mod-license-share-alike


