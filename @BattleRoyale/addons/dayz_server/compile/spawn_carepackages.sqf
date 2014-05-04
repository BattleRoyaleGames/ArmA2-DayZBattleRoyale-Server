//_chutetype, _boxtype, _helistart, _crashwreck
private ["_chutetype","_boxtype","_helistart","_crashwreck","_randomizedLoot","_guaranteedLoot","_chute","_box","_num","_weights","_index","_itemType","_lootRadius","_lootPos","_pos","_bam","_i","_nearby","_smoke","_itemTypes","_cntWeights","_lootTable"];

_chutetype = _this select 0;
_boxtype = _this select 1;
_helistart	= _this select 2;
_crashwreck	= _this select 3;
_randomizedLoot = _this select 4;
_guaranteedLoot = _this select 5;

_lootRadius = 1;
_lootTable = ["HeliCrash","MilitarySpecial"] call BIS_fnc_selectRandom;

	_chute = createVehicle [_chutetype,_helistart,[],0,"CAN_COLLIDE"];
	_chute setVariable["Sarge",1];
	_chute setPos [(getpos _crashwreck select 0), (getPos _crashwreck select 1), (getPos _crashwreck select 2)-10];
	
	_box = createVehicle [_boxtype,_helistart,[],0,"CAN_COLLIDE"];
	_box setVariable["Sarge",1];
	_box setPos [(getpos _crashwreck select 0), (getPos _crashwreck select 1), (getPos _crashwreck select 2)-10];
	
	_box attachto [_chute, [0, 0, 0]];
	
	_i = 0;


	while {_i < 45} do {
	scopeName "loop1";
    if (((getPos _box) select 2) < 1) then {breakOut "loop1"};

    sleep 1;
    _i=_i+1;
	};  


	switch (true) do {
	  case not (alive _box): {detach _box;_box setpos [(getpos _box select 0), (getpos _box select 1), 0];};
	  case alive _box: {detach _box;_box setpos [(getpos _box select 0), (getpos _box select 1), 0];_bam = _boxtype createVehicle [(getpos _box select 0),(getpos _box select 1),(getpos _box select 2)+0];deletevehicle _box;};
	};
	_bam setVariable["Sarge",1];
	deletevehicle _chute;
	
	sleep 2;
	
	_pos = [getpos _bam select 0, getpos _bam select 1,0];
	
	
	_smoke = createVehicle ["SmokeShellred",_pos,[],0,"CAN_COLLIDE"];
	_smoke setVariable["Sarge",1];

	
    _num		= (round(random _randomizedLoot)) + _guaranteedLoot;

		
		_itemTypes =	[] + getArray (configFile >> "CfgBuildingLoot" >> _lootTable >> "lootType");	
		_index =        dayz_CBLBase  find _lootTable;
		_weights =		dayz_CBLChances select _index;
		_cntWeights = count _weights;   

		//Creating the Lootpiles outside of the _crashModel
		for "_x" from 1 to _num do {
			//Create loot
			_index = floor(random _cntWeights);
			_index = _weights select _index;
			_itemType = _itemTypes select _index;
		
			
			//Let the Loot spawn in a non-perfect circle around _crashModel
			_lootPos = [_pos, ((random 2) + (sizeOf(_boxtype) * _lootRadius)), random 360] call BIS_fnc_relPos;
			[_itemType select 0, _itemType select 1, _lootPos, 0] call spawn_loot;

			diag_log(format["CAREPACKAGE: Loot spawn at '%1' with loot %2", _lootPos, _itemType]); 

			// ReammoBox is preferred parent class here, as WeaponHolder wouldn't match MedBox0 and other such items.
			_nearby = _pos nearObjects ["ReammoBox", (sizeOf(_boxtype)+3)];
			{
				_x setVariable ["permaLoot",true];
			} forEach _nearBy;
		};