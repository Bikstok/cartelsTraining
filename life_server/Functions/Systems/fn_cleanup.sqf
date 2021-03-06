/*
	File: fn_cleanup.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Server-side cleanup script on vehicles.
	Sort of a lame way but whatever.
*/
private "_deleted";
_deleted = false;

// Delete vehicles in spawn
[] spawn
{
	while {true} do {
		sleep (1 * 60);
		_vehiclesInSpawn = nearestObjects [getMarkerPos "car_spawn", ["Car", "Air", "Armormed"], 200];
		if (count _vehiclesInSpawn > 3) then {
			{
				if (count crew _x == 0) then {
					deleteVehicle _x;
				};
			} forEach _vehiclesInSpawn;
		};
	};
};

[] spawn
{
	while {true} do {
		sleep (10 * 60);
		private["_veh","_units"];
		{
			_veh = _x;
			_vehicleClass = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "vehicleClass");
			
			if(_vehicleClass in ["Car","Air","Ship","Armored","Submarine"]) then {
				_dbInfo = _veh getVariable["dbInfo",[]];
				_units = {(_x distance _veh < 300)} count playableUnits;
				if(count crew _x == 0) then {
					switch (true) do {
						case ((_x getHitPointDamage "HitEngine") > 0.7 && _units == 0) : {deleteVehicle _x; _deleted = true;};
						case ((_x getHitPointDamage "HitLFWheel") > 0.98 && _units == 0) : {deleteVehicle _x; _deleted = true;};
						case ((_x getHitPointDamage "HitLF2Wheel") > 0.98 && _units == 0) : {deleteVehicle _x; _deleted = true;};
						case ((_x getHitPointDamage "HitRFWheel") > 0.98 && _units == 0) : {deleteVehicle _x; _deleted = true;};
						case ((_x getHitPointDamage "HitRF2Wheel") > 0.98 && _units == 0) : {deleteVehicle _x; _deleted = true;};
						case (_units == 0): {deleteVehicle _x; _deleted = true;};
					};
				};
				
				if(_deleted) then {
					waitUntil {isNull _veh};
					_deleted = false;
				};
				
				if(isNull _veh) then {
					if(count _dbInfo > 0) then {
						systemChat "Fixing...";
						_uid = _dbInfo select 0;
						_plate = _dbInfo select 1;

						_query = format["UPDATE vehicles SET active='0' WHERE pid='%1' AND plate='%2'",_uid,_plate];
						
						[_query,1] call DB_fnc_asyncCall;
					};
				};
			};
		} foreach vehicles;
		
		{
			if((typeOf _x) in ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F", "Land_Can_V3_F","Land_Money_F","Land_Suitcase_F"]) then {
				deleteVehicle _x;
			};
		} foreach (allMissionObjects "Thing");
		
		{
			deleteVehicle _x;
		} foreach (allMissionObjects "GroundWeaponHolder");
	};
};