
// Script by lazyink. Please request permission for use!	
[] spawn {
    
    private ["_time","_finish_time_minutes","_finish_time_seconds"];
	
	
    while {ELAPSED_TIME < END_TIME} do  {
        
        _time = END_TIME - ELAPSED_TIME;
        _finish_time_minutes = floor(_time / 60);
        _finish_time_seconds = (floor(_time)) - (60 * _finish_time_minutes);
		
        if((_finish_time_minutes == 74) && (_finish_time_seconds < 55)) then {
                                         
            
                                                    
            
            [nil,nil,rTitleText,"WELCOME TO DAYZ BATTLE ROYALE EMITA!", "PLAIN",10] call RE;

            sleep 5;

			[nil,nil,rTitleText,"TEN!", "PLAIN",1] call RE;
            sleep 1;
            
            [nil,nil,rTitleText,"NINE!", "PLAIN",1] call RE;
            sleep 1;
            
            [nil,nil,rTitleText,"EIGHT!", "PLAIN",1] call RE;
            sleep 1;
            
            [nil,nil,rTitleText,"SEVEN!", "PLAIN",1] call RE;
            sleep 1;
            
            [nil,nil,rTitleText,"SIX!", "PLAIN",1] call RE;
            sleep 1;
            
            [nil,nil,rTitleText,"FIVE!", "PLAIN",1] call RE;
            sleep 1;
            
            [nil,nil,rTitleText,"FOUR!", "PLAIN",1] call RE;
            sleep 1;
            
            [nil,nil,rTitleText,"THREE!", "PLAIN",1] call RE;
            sleep 1;
            
            [nil,nil,rTitleText,"TWO!", "PLAIN",1] call RE;
            sleep 1;
            
            [nil,nil,rTitleText,"ONE!", "PLAIN",1] call RE;
            sleep 1; 
            
            [nil,nil,rTitleText,"RUN WABBITS, RUN!", "PLAIN",10] call RE;
            br_game_started = true;
            
            publicVariable "br_game_started";
			
            sleep 60;
            
            
            
        };
        
        
        if((_finish_time_minutes == 70) && (_finish_time_seconds < 1)) then
        {
            [nil,nil,rTitleText,"RANDOM CARPET BOMBING WILL BEGIN IN 5 MINUTES!", "PLAIN",10] call RE;

        };  
        
        if((_finish_time_minutes == 68) && (_finish_time_seconds < 1)) then
        {
            [nil,nil,rTitleText,"RANDOM CARPET BOMBING WILL BEGIN IN 3 MINUTES!", "PLAIN",10] call RE;
        };  
        
        if((_finish_time_minutes == 67) && (_finish_time_seconds < 1)) then
        {
            [nil,nil,rTitleText,"RANDOM CARPET BOMBING WILL BEGIN IN 2 MINUTES!", "PLAIN",10] call RE;
        };  
        
        if((_finish_time_minutes == 66) && (_finish_time_seconds < 1)) then
        {
            [nil,nil,rTitleText,"RANDOM CARPET BOMBING WILL BEGIN IN 1 MINUTE!", "PLAIN",10] call RE;
        };
        
        if((_finish_time_minutes == 65) && (_finish_time_seconds < 1)) then
        {
            [nil,nil,rTitleText,"THE RANDOM CARPET BOMBING HAS STARTED! TARGET ZONES ARE MARKED IN RED ON THE MAP!", "PLAIN",10] call RE;
        };  
        
        if((_finish_time_minutes == 51) && (_finish_time_seconds < 50)) then
        {
			
			if (br_totalplayers >= 11) then {
				
					[] execVM "\z\addons\dayz_server\zones\emita_fn_addmarker.sqf";
				
				} else {
				
					[] execVM "\z\addons\dayz_server\zones\emita_fn_addmarkerShort75.sqf";
					
			};
			sleep 60;
            
        };  
        
        
        if((_finish_time_minutes == 1) && (_finish_time_seconds < 1)) then
        {                  
            
            [nil,nil,rTitleText,"1 MINUTE! NO GUTS, NO GLORY!", "PLAIN",10] call RE;                
        };
        
        if((_finish_time_minutes == 0) && (_finish_time_seconds < 1)) then {
            [nil,nil,rTitleText,"30 SECONDS!", "PLAIN",10] call RE;
            sleep 20;
            [nil,nil,rTitleText,"TEN!", "PLAIN",10] call RE;
            sleep 1;
            [nil,nil,rTitleText,"NINE!", "PLAIN",10] call RE;
            sleep 1;
            [nil,nil,rTitleText,"EIGHT!", "PLAIN",10] call RE;
            sleep 1;
            [nil,nil,rTitleText,"SEVEN!", "PLAIN",10] call RE;
            sleep 1;
            [nil,nil,rTitleText,"SIX!", "PLAIN",10] call RE;
            sleep 1;
            [nil,nil,rTitleText,"FIVE!", "PLAIN",10] call RE;
            sleep 1;
            [nil,nil,rTitleText,"FOUR!", "PLAIN",10] call RE;
            sleep 1;
            [nil,nil,rTitleText,"THREE!", "PLAIN",10] call RE;
            sleep 1;
            [nil,nil,rTitleText,"TWO!", "PLAIN",10] call RE;
            sleep 1;
            [nil,nil,rTitleText,"ONE!", "PLAIN",10] call RE;
            sleep 1;
            [nil,nil,rTitleText,"CHECKING PLAYER COUNT!", "PLAIN",10] call RE;
            
            
            
            br_winner_check = true;
            
            publicVariable "br_winner_check";

            
        };
		
        br_totalplayers = {((alive _x) && (str(side _x) != "CIV"))} count playableUnits;
        publicVariable "br_totalplayers";
        sleep 1;
 
    };
};