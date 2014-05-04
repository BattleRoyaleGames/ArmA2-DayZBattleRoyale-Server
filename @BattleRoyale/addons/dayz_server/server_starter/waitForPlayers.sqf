//Code by lazyink and w4ago @ zombiesspain.es

private ["_continue","_numPlayers","_timeCount","_numberOfPlayersToStart","_maxPlayers","_result","_map","_tempMaxSpawns","_hordespawns","_weatherType"];
_continue = true;
_numberOfPlayersToStart = 20;
_maxPlayers = 42;

_map = worldName;


fnc_br_numberOfPlayers = {
    private ["_count"];
    _count = 0;
    {
        if(isplayer _x && alive _x) then {

            _count =_count + 1;
        };
    } foreach playableUnits;
    _count;
};


//Wait for players
_timeCount = 0;
while{_continue} do {
    _numPlayers = [] call fnc_br_numberOfPlayers;
    if(_numPlayers >= _numberOfPlayersToStart ) then {
        _continue = false;
    };
    if(_timeCount == 30) then {
    
        [nil,nil,rTitleText,format["WAITING FOR %1 PLAYERS TO START THE ROUND! VOIP/VOICE COMMS IN THE START AREA MAY CAUSE THE SERVER TO LAG OUT OR CRASH SO PLEASE DON'T ABUSE IT!",_numberOfPlayersToStart], "PLAIN",10] call RE;
        _timeCount = 0;
    };
    
    _timeCount = _timeCount +1;
    sleep 1;
};

[nil,nil,rTitleText,"MIN PLAYER COUNT REACHED. ROUND STARTING!", "PLAIN",10] call RE;
diag_log("BR Tools: Player minimum reached.");
_continue = true;
_timeCount = 0;
while{_continue} do {

    _numPlayers = [] call fnc_br_numberOfPlayers;
	
    if(_timeCount == 10) then {
		
		[nil,nil,rTitleText,"LOADING CARE-PACKAGES...", "PLAIN",10] call RE;
		
		//Load Care Packages

		server_spawnC130 = compile preprocessFileLineNumbers format ["\z\addons\dayz_server\compile\%1_spawn_C130.sqf",_map];

		server_carepackagedrop = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\spawn_carepackages.sqf";
			
		nul =    [
			5,        //Number of the guaranteed Loot-Piles at the Crashside
			3,        //Number of the random Loot-Piles at the Crashside 3+(1,2,3 or 4)
			(5*60),    //Fixed-Time (in seconds) between each start of a new Chopper
			(1*60),      //Random time (in seconds) added between each start of a new Chopper
			1,        //Spawnchance of the Heli (1 will spawn all possible Choppers, 0.5 only 50% of them)
			'center', //'center' Center-Marker for the Random-Crashpoints, for Chernarus this is a point near Stary
			3000,    // [106,[960.577,3480.34,0.002]]Radius in Meters from the Center-Marker in which the Choppers can crash and get waypoints
			true,    //Should the spawned crashsite burn (at night) & have smoke?
			false,    //Should the flames & smoke fade after a while?
			1,    //RANDOM WP
			1,        //GUARANTEED WP
			1        //Amount of Damage the Heli has to get while in-air to explode before the POC. (0.0001 = Insta-Explode when any damage//bullethit, 1 = Only Explode when completly damaged)
		] spawn server_spawnC130;
			
	};
	
    if(_timeCount == 20) then {
		
		[nil,nil,rTitleText,"LOADING BACKPACKS...", "PLAIN",10] call RE;
		
		//Spawn backpacks
		call compile preProcessFileLineNumbers format ["\z\addons\dayz_server\backpacks\%1_placebackpacks.sqf",_map];
			
	};
    if(_timeCount == 30) then {
	
		[nil,nil,rTitleText,"LOADING THE HOARD...", "PLAIN",10] call RE;

		zombie_findTargetAgent = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\zombie_findTargetAgent.sqf";
		zombie_loiter = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\zombie_loiter.sqf";		
		dayz_areaAffect = 3.5;		
		dayz_zombiehordeMinSpawns = 0; //Lower limit of Zombie hordes that are allowed to spawn
		dayz_zombiehordeMaxSpawns = 1; //Upper limit of Zombie hordes that are allowed to spawn
		dayz_zombiehordeSpawned = 0; // zombie horde spawn variable
		dayz_zombiehordeMinimum = 20; //minimum amount of zombie spawns per horde 
		dayz_zombiehordeMaximum = 40; // maximum amount of zombie spawns per horde
		dayz_zombiehorde = 0; //current hordes
		dayz_zombiehordeData = []; //current hordes
		dayz_zombiehordes = []; 
			
		_tempMaxSpawns = dayz_zombiehordeMaxSpawns - dayz_zombiehordeMinSpawns;
		_hordespawns = ((floor(random (_tempMaxSpawns))) + dayz_zombiehordeMinSpawns);

		for "_x" from 0 to _hordespawns do {
			[] execVM "\z\addons\dayz_server\hoard\fn_hoard.sqf";
		}; //Spawn hordes!!!
		
	};
	
    if(_timeCount == 40) then {
	
		[nil,nil,rTitleText,"LOADING BOMBING SCRIPTS...", "PLAIN",10] call RE;
		
	};
	
    if(_timeCount == 50) then {
		
		[nil,nil,rTitleText,"SETTING WEATHER...", "PLAIN",10] call RE;
		
	};
	
    if(_timeCount == 60 or _numPlayers == _maxPlayers) then {
	
		[nil,nil,rTitleText,"STARTING THE ROUND...", "PLAIN",10] call RE;
        _continue = false;
    };
    _timeCount = _timeCount +1;
    sleep 1;
};


sleep 1;