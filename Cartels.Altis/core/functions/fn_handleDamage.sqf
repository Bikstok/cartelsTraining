/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep","_hitBox","_doBreak"];
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;
_hitBox = _this select 1;

//Internal Debugging.
if(!isNil "TON_Debug") then {
	systemChat format["PART: %1 || DAMAGE: %2 || SOURCE: %3 || PROJECTILE: %4 || FRAME: %5",_part,_damage,_source,_projectile,diag_frameno];
};

//Handle the tazer first (Top-Priority).
if(!isNull _source) then {
	if(_source != _unit) then {
		_curWep = currentWeapon _source;
		if(_projectile in ["B_9x21_Ball","B_556x45_dual"] && _curWep in ["hgun_P07_snds_F","arifle_SDAR_F"]) then {
			if(side _source == west && playerSide != west) then {
				private["_distance","_isVehicle","_isQuad"];
				_distance = if(_projectile == "B_556x45_dual") then {100} else {35};
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};

				_damage = false;
				if(_unit distance _source < _distance) then {
					if(!life_istazed && !(_unit getVariable["restrained",false])) then {
						if(_isVehicle && _isQuad) then {
							player action ["Eject",vehicle player];
							[_unit,_source] spawn life_fnc_tazed;
						} else {
							[_unit,_source] spawn life_fnc_tazed;
						};
					};
				};
			};

			//Temp fix for super tasers on cops.
			if(playerSide == west && side _source == west) then {
				_damage = false;
			};
		};
	};
};

if (player distance (getMarkerPos "safe_zone_identifier") < 350) then {
	_damage = 0;
};

if (vehicle player distance (getMarkerPos "safe_zone_identifier") < 350) then {
	_damage = 0;
};

if ((vehicle _unit) isKindOf "Car" && (isNull _source || _source == _unit)) then {
	if (life_seatbelt) then {
		_damage = _damage / 2
	};
};

if ((vehicle _source isKindOf "LandVehicle") && _source != _unit && driver (vehicle _source) == _source && vehicle _unit == _unit) then {
	if ((((getDammage _unit) + _damage) >= 0.95) || (_damage >= 0.95)) then {
		_damage = 0;
	};
};

if ((((getDammage _unit) + _damage) >= 0.95) || (_damage >= 0.95)) then {
	life_dead_gear = [player] call life_fnc_fetchDeadGear;
};

/*if (_damage > 0.4 && (!isPlayer _source || (vehicle _source isKindOf "LandVehicle"))) then {
	if (_hitBox == "legs") then {
		_doBreak = true;
			if (_doBreak) then {
				[true] spawn life_fnc_brokenLeg;
			};
	};
};*/

[] call life_fnc_hudUpdate;
_damage;
