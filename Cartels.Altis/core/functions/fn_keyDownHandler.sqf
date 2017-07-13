#include <macro.h>
/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_mapKey"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;
_curTarget = cursorTarget;
_mapKey = actionKeys "ShowMap" select 0;

switch (_code) do {

	//Escape
	case 1: {
		if (life_action_in_use) then {
			life_action_in_use = false;
			_handled = true;
		};
	};

	//Map Key
	case _mapKey: {
		switch (playerSide) do {
			case west: {
				if(!visibleMap) then {
					[] spawn life_fnc_copMarkers;
					}
				};
			case independent: {
				if(!visibleMap) then {
					[] spawn life_fnc_medicMarkers;
					}
				};
			case civilian: {
				if(!visibleMap) then {
					[] spawn life_fnc_gangMarkers;
				}
				};
		};
	};

//F
	case 33:
	{
		if(playerSide in [west,independent] && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				life_siren_active = true;
				sleep 4.7;
				life_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
			if((_veh getVariable "siren")) then
			{
				titleText [localize "STR_MISC_SirensOFF","PLAIN"];
				_veh setVariable["siren",false,true];
			}
				else
			{
				titleText [localize "STR_MISC_SirensON","PLAIN"];
				_veh setVariable["siren",true,true];
				if(playerSide == west) then {
					[[_veh],"life_fnc_copSiren",nil,true] spawn life_fnc_MP;
				} else {
					//I do not have a custom sound for this and I really don't want to go digging for one, when you have a sound uncomment this and change medicSiren.sqf in the medical folder.
					//[[_veh],"life_fnc_medicSiren",nil,true] spawn life_fnc_MP;
				};
			};
		};
	};


	//T Key (Trunk)
	case 20:
	{
		if(!_alt && !_ctrlKey) then	{
			if(vehicle player != player && alive vehicle player) then {
				if((vehicle player) in life_vehicles) then	{
					[vehicle player] call life_fnc_openInventory;
				};
			} else {
				if((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship" OR cursorTarget isKindOf "House_F") && player distance cursorTarget < 7 && vehicle player == player && alive cursorTarget) then	{
					if(cursorTarget in life_vehicles OR {!(cursorTarget getVariable ["locked",true])}) then {
						[cursorTarget] call life_fnc_openInventory;
					};
				};
			};
		};
	};


	//L Key?
	case 38:
	{
		//If cop run checks for turning lights on.
		if(_shift && playerSide in [west,independent]) then {
			if(vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F"]) then {
				if(!isNil {vehicle player getVariable "lights"}) then {
					if(playerSide == west) then {
						[vehicle player] call life_fnc_sirenLights;
					} else {
						[vehicle player] call life_fnc_medicSirenLights;
					};
					_handled = true;
				};
			};
		};

		if(!_alt && !_ctrlKey) then { [] call life_fnc_radar; };
	};


	//Y Player Menu
	case 21: {
		if(!_alt && !_ctrlKey && !dialog) then {
			[] call life_fnc_p_openMenu;
		};
	};


	//U Key
	case 22:
	{
		if(!_alt && !_ctrlKey) then {
			if(vehicle player == player) then {
				_veh = cursorTarget;
			} else {
				_veh = vehicle player;
			};

			if(_veh isKindOf "House_F" && playerSide == civilian) then {
				if(_veh in life_vehicles && player distance _veh < 8) then {
					_door = [_veh] call life_fnc_nearestDoor;
					if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then {
						_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat localize "STR_House_Door_Lock";
					} else {
						_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat localize "STR_House_Door_Unlock";
					};
				};
			} else {
				_locked = locked _veh;
				if(_veh in life_vehicles && player distance _veh < 8) then {
					if(_locked == 2) then {
						if(local _veh) then {
							_veh lock 0;
						} else {
							[[_veh,0],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
						};
						systemChat localize "STR_MISC_VehUnlock";
					} else {
						if(local _veh) then {
							_veh lock 2;
						} else {
							[[_veh,2],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
						};
						systemChat localize "STR_MISC_VehLock";
					};
				};
			};
		};
	};



};


if (_code in (actionKeys "TacticalView")) then {
	_handled = true;
};

{ if (_code in actionKeys format["CommandingMenu%1",_x]) exitWith {
	hint "Commander menus are disabled.";
	_handled = true
	}
} forEach [0,1,2,3,4,5,6,7,8,9];

if(_code in actionKeys "NavigateMenu") then {
	_handled = true
};

if (_code in ((actionKeys "Diary") + (actionKeys "NetworkPlayers") + (actionKeys "forceCommandingMode") + (actionKeys "menuBack"))) then {
	_handled = true;
};

if (life_brokenLeg && (_code in (actionKeys "MoveUp") || _code in (actionKeys "MoveDown") || _code in (actionKeys "Stand") || _code in (actionKeys "Crouch"))) then {
	_handled = true;
};

if (_code in (actionKeys "GetOver") && speed player > 10) then {
	[] spawn life_fnc_jump;
	_handled = true;
};

if (_code==41 || _code in (actionKeys "SelectAll") || _code in (actionKeys "SwitchCommand")) then {
	if (!life_targetTag) then {
		life_targetTag = true
	};
	_handled = true;
};


_handled;
