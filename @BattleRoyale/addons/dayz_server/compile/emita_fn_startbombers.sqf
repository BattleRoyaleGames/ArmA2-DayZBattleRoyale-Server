
private ["_espl","_sound","_duration","_loc","_coords","_repeat","_break","_choice","_sounddist","_ray","_useRandChoice","_numbeofBombs","_randomLyn","_bombzone","_time","_finish_time_minutes","_finish_time_seconds"];

sleep 1;

//Initialize

while{ELAPSED_TIME < END_TIME } do
{
    _time = END_TIME - ELAPSED_TIME;
    _finish_time_minutes = floor(_time / 60);
    _finish_time_seconds = (floor(_time)) - (60 * _finish_time_minutes);
    
    if ((_finish_time_minutes == 65) && (_finish_time_seconds < 50))	then {
        
        ////////////////////////////////////////////////////SETUP SETUP SETUP//SETUP SETUP SETUP//SETUP SETUP SETUP//SETUP SETUP SETUP//SETUP SETUP SETUP
        _repeat = 13;                             			//times to repeat//number of times to cycle complete code (pick new place to bomb)
        _break = 1;                             			//time to break between attacks, in seconds (time between cycles)
        _choice = 2;                              			//type of bombing 1 light, 2 medium, 3 heavy
        _randomLyn = true;						  			//true if you want random locations (be sure to set static location otherwise!)
        _useRandChoice = true;					  			//true if you want random choice of type of bomb per bomb
        _numbeofBombs = 50;                       			//how many bombs are dropped assuming 1 per cycle
        _sounddist = 2000;                        			//distance sounds are audible at
        _ray = 500;                               			//ray of bombing
        ////////////////////////////////////////////////////END SETUP//END SETUP//END SETUP//END SETUP//END SETUP//END SETUP//END SETUP//END SETUP
        
        
        //BEGIN LOOP!     
		
        While {_repeat > 0} do {
            _duration = _numbeofBombs;
            
			_coords = [getMarkerPos "center",random 2300,random 360,false] call SHK_pos;

            
			sleep 1;
                        
            _bombzone = createMarker["bombzone", _coords];
            _bombzone setMarkerShape "ELLIPSE";
            "bombzone" setMarkerSize [500,500];
            "bombzone" setMarkerColor "ColorRed";
            "bombzone" setMarkerBrush "Grid";
            
            //CREATE TARGET///////////////
            _loc = createVehicle ["HeliHEmpty", _coords,[], 0, "NONE"];

            sleep 3;
            
            //start bombs loop
            While {_duration > 0} do {
                
                if (_useRandChoice) then {
                    _choice = floor(random 3);
                };
				_sound = createVehicle ["HeliHEmpty",position _loc,[], _ray, "NONE"];
				_sound setPos [getPos _sound select 0, getPos _sound select 1, 50];
                sleep 2;
                If (_choice == 0) then {
                    _espl = createVehicle ["SH_105_HE",position _sound,[], 0, "NONE"];
                };
                If (_choice == 1) then {
                    _espl = createVehicle ["Bo_FAB_250",position _sound,[], 0, "NONE"];
                };
                If (_choice == 2) then {
                    _espl = createVehicle ["Bo_Mk82",position _sound,[], 0, "NONE"];
                };
                If (_choice == 3) then {
                    _espl = createVehicle ["BO_GBU12_LGB",position _sound,[], 0, "NONE"];
                };
                _duration = _duration - 1;
                sleep (random 2);
                deletevehicle _sound;
                
            }; // Close while loop. loop while _duration >1
            ///////////////////////////////////////////////////END SIRENS AND BOMBING, HELI LOWER TO GROUND, (SPAWN AIs), FLY AWAY//////////////////////////////////////////////////////////////
            
            sleep 10;
            
            sleep 0.1;
            deletevehicle _loc;
            sleep 0.1;
            deleteMarker "bombzone";
            
            //diag_log format ["AIRRAID: END CYCLE: Going down for sleep: Repeat:%1 | Sleep:%2",_repeat,_break];
            sleep _break;    
        }; //close while loop. loop -  while _repeat > 1
        exit
        
    };  
};  

