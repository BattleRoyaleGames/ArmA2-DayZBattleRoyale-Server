// Script by lazyink & infiSTAR. Please request permission for use!

[] spawn {
	private ["_PLAYERSALIVE","_STARTTOTAL","_txt","_result","_dif","_done"];
	sleep 120;
	_STARTTOTAL = {((alive _x) && (str(side _x) != "CIV"))} count playableUnits;
	_PLAYERSALIVE = {((alive _x) && (str(side _x) != "CIV"))} count playableUnits;
	_done = [];
	PV_PLAYERSALIVE = _PLAYERSALIVE;
	while {ELAPSED_TIME < END_TIME} do
	{
		_PLAYERSALIVE = {((alive _x) && (str(side _x) != "CIV"))} count playableUnits;
		PV_PLAYERSALIVE = _PLAYERSALIVE;
		
		_dif = (_STARTTOTAL - _PLAYERSALIVE);
		if ((_STARTTOTAL > _PLAYERSALIVE) && !(_dif in _done)) then
		{
			_done = _done + [_dif];
			_txt = format["\n%1 DEAD, %2 TO GO!",_dif,_PLAYERSALIVE];
			[nil, nil, rTitleText, _txt, "PLAIN"] call RE;
		};
		if ((_PLAYERSALIVE <= 1) && (isNil "WinnerShown")) then
		{
			_winners = [];
			{
				if ((!isNull _x) && (alive _x) && (str(side _x) != "CIV") && ((_x getVariable['humanKills', 0]) > 0)) then
				{
					_winners = _winners + [name _x];
				};
			} forEach playableUnits;
			
			{	
				br_winner_check = true;
				publicVariable "br_winner_check";
				_txt = format["\n%1 - WINNER, WINNER, CHICKEN DINNER!",_x];
				[nil, nil, rTitleText, _txt, "PLAIN"] call RE;
				sleep 1;
			} forEach _winners;
			
			WinnerShown = true;
			sleep 1;
		};
		sleep 2;
	};
};